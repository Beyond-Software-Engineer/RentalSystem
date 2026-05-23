# 租房系统CI/CD流程文档

## 版本信息

| 版本号 | 日期 | 作者 | 说明 |
|--------|------|------|------|
| 1.0.0 | 2026-05-23 | - | 初始版本 |

---

## 一、CI/CD概述

### 1.1 流程图

```
┌──────────┐     ┌──────────┐     ┌──────────┐     ┌──────────┐
│  代码    │────▶│  编译    │────▶│  测试    │────▶│  构建    │
│  提交    │     │  构建    │     │  单元    │     │  镜像    │
└──────────┘     └──────────┘     └──────────┘     └──────────┘
                                                             │
     ┌──────────────────────────────────────────────────────┘
     ▼
┌──────────┐     ┌──────────┐     ┌──────────┐     ┌──────────┐
│  推送    │────▶│  部署    │────▶│  验证    │────▶│  通知    │
│  镜像    │     │  测试    │     │  测试    │     │  结果    │
└──────────┘     └──────────┘     └──────────┘     └──────────┘
                                         │
     ┌───────────────────────────────────┘
     ▼
┌──────────┐     ┌──────────┐
│  部署    │────▶│  监控    │
│  生产    │     │  运行    │
└──────────┘     └──────────┘
```

### 1.2 环境划分

| 环境 | 用途 | 触发条件 |
|------|------|----------|
| 开发环境 (dev) | 开发调试 | 代码提交到 `develop` 分支 |
| 测试环境 (test) | 功能测试 | 代码合并到 `develop` 分支 |
| 预发布环境 (pre) | 预生产验证 | 发布候选版本 |
| 生产环境 (prod) | 正式环境 | `main` 分支打标签 |

---

## 二、后端CI/CD配置

### 2.1 Maven构建配置 pom.xml

```xml
<project>
    <!-- 项目配置省略 -->

    <properties>
        <java.version>17</java.version>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>

    <build>
        <finalName>${project.artifactId}-${project.version}</finalName>
        <plugins>
            <!-- 编译插件 -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.11.0</version>
                <configuration>
                    <source>17</source>
                    <target>17</target>
                </configuration>
            </plugin>

            <!-- 打包JAR -->
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <version>3.2.0</version>
                <executions>
                    <execution>
                        <goals>
                            <goal>repackage</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>

            <!-- 单元测试 -->
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>3.1.2</version>
                <configuration>
                    <skipTests>false</skipTests>
                    <includes>
                        <include>**/*Test.java</include>
                    </includes>
                </configuration>
            </plugin>

            <!-- 代码质量检查 -->
            <plugin>
                <groupId>org.sonarsource.scanner.maven</groupId>
                <artifactId>sonar-maven-plugin</artifactId>
                <version>3.9.1.2184</version>
            </plugin>
        </plugins>
    </build>
</project>
```

### 2.2 GitLab CI配置 .gitlab-ci.yml

```yaml
stages:
  - build
  - test
  - deploy

# 全局变量
variables:
  MAVEN_OPTS: "-Dmaven.repo.local=.m2/repository"
  DOCKER_REGISTRY: registry.example.com

# 后端构建
backend-build:
  stage: build
  image: maven:3.9-eclipse-temurin-17
  tags:
    - docker
  before_script:
    - cd backend
  script:
    - mvn clean package -DskipTests=false
    - mv target/*.jar ../dist/
  artifacts:
    paths:
      - dist/
    expire_in: 1 day
  only:
    - develop
    - main
    - merge_requests

# 后端单元测试
backend-test:
  stage: test
  image: maven:3.9-eclipse-temurin-17
  tags:
    - docker
  before_script:
    - cd backend
  script:
    - mvn test
  coverage: '/Total:.*?([0-9]{1,3})%/'
  artifacts:
    reports:
      junit: target/surefire-reports/TEST-*.xml
    expire_in: 1 day
  only:
    - develop
    - main
    - merge_requests

# 后端Docker镜像构建
backend-docker:
  stage: build
  image: docker:latest
  tags:
    - docker
  services:
    - docker:dind
  before_script:
    - cd backend
    - docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $DOCKER_REGISTRY
  script:
    - docker build -t $DOCKER_REGISTRY/rental-backend:$CI_COMMIT_SHORT_SHA .
    - docker build -t $DOCKER_REGISTRY/rental-backend:latest .
    - docker push $DOCKER_REGISTRY/rental-backend:$CI_COMMIT_SHORT_SHA
    - docker push $DOCKER_REGISTRY/rental-backend:latest
  only:
    - develop
    - main

# 部署到测试环境
deploy-test:
  stage: deploy
  image: curlimages/curl:latest
  tags:
    - docker
  script:
    - curl -X POST "http://k8s-api.example.com/deploy"
      -H "Authorization: Bearer $DEPLOY_TOKEN"
      -d '{"app": "rental-backend", "env": "test", "tag": "$CI_COMMIT_SHORT_SHA"}'
  environment:
    name: test
    url: http://test-api.rental.com
  only:
    - develop
  when: manual

# 部署到预发布环境
deploy-pre:
  stage: deploy
  image: curlimages/curl:latest
  tags:
    - docker
  script:
    - curl -X POST "http://k8s-api.example.com/deploy"
      -H "Authorization: Bearer $DEPLOY_TOKEN"
      -d '{"app": "rental-backend", "env": "pre", "tag": "$CI_COMMIT_SHORT_SHA"}'
  environment:
    name: pre
    url: http://pre-api.rental.com
  only:
    - develop
  when: manual

# 部署到生产环境
deploy-prod:
  stage: deploy
  image: curlimages/curl:latest
  tags:
    - docker
  script:
    - curl -X POST "http://k8s-api.example.com/deploy"
      -H "Authorization: Bearer $DEPLOY_TOKEN"
      -d '{"app": "rental-backend", "env": "prod", "tag": "$CI_COMMIT_TAG"}'
  environment:
    name: production
    url: https://api.rental.com
  only:
    - tags
  when: manual
```

### 2.3 Dockerfile

```dockerfile
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app

# 添加应用用户
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

# 复制应用包
COPY target/rental-backend-1.0.0.jar app.jar

# 设置文件权限
RUN chown -R appuser:appgroup /app

# 切换到非root用户
USER appuser

# 健康检查
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost:8080/actuator/health || exit 1

# JVM参数优化
ENV JAVA_OPTS="-Xms256m -Xmx512m -XX:+UseG1GC -XX:MaxGCPauseMillis=200"

EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
```

---

## 三、前端CI/CD配置

### 3.1 package.json配置

```json
{
  "name": "rental-frontend",
  "version": "1.0.0",
  "scripts": {
    "dev": "vite",
    "build:dev": "vite build --mode development",
    "build:test": "vite build --mode test",
    "build:pre": "vite build --mode pre",
    "build:prod": "vite build --mode production",
    "preview": "vite preview",
    "lint": "eslint src --ext .vue,.js,.jsx,.cjs,.mjs --fix --cache",
    "test": "vitest",
    "test:coverage": "vitest --coverage"
  },
  "dependencies": {
    "vue": "^3.4.0",
    "vue-router": "^4.2.0",
    "pinia": "^2.1.0",
    "vant": "^4.8.0",
    "axios": "^1.6.0"
  },
  "devDependencies": {
    "@vitejs/plugin-vue": "^5.0.0",
    "vite": "^5.0.0",
    "sass": "^1.69.0",
    "eslint": "^8.55.0",
    "vitest": "^1.0.0"
  }
}
```

### 3.2 环境配置文件

#### .env.development
```bash
VITE_API_BASE_URL=http://localhost:8080/api
VITE_ENV=development
```

#### .env.test
```bash
VITE_API_BASE_URL=http://test-api.rental.com/api
VITE_ENV=test
```

#### .env.pre
```bash
VITE_API_BASE_URL=http://pre-api.rental.com/api
VITE_ENV=pre
```

#### .env.production
```bash
VITE_API_BASE_URL=https://api.rental.com/api
VITE_ENV=production
```

### 3.3 GitLab CI配置

```yaml
stages:
  - build
  - test
  - deploy

# 前端构建
frontend-build:
  stage: build
  image: node:20-alpine
  tags:
    - docker
  before_script:
    - cd frontend
    - npm install -g pnpm
    - pnpm install
  script:
    - |
      case $CI_COMMIT_REF_NAME in
        develop)
          pnpm build:dev
          ;;
        main)
          pnpm build:prod
          ;;
        *)
          pnpm build:test
          ;;
      esac
  artifacts:
    paths:
      - frontend/dist/
    expire_in: 1 day
  only:
    - develop
    - main
    - merge_requests

# 前端测试
frontend-test:
  stage: test
  image: node:20-alpine
  tags:
    - docker
  before_script:
    - cd frontend
    - npm install -g pnpm
    - pnpm install
  script:
    - pnpm run test
  coverage: '/All files[^|]*\|[^|]*\s+([0-9]{1,3})/'
  artifacts:
    reports:
      junit: junit.xml
    expire_in: 1 day
  only:
    - develop
    - main
    - merge_requests

# 前端代码检查
frontend-lint:
  stage: test
  image: node:20-alpine
  tags:
    - docker
  before_script:
    - cd frontend
    - npm install -g pnpm
    - pnpm install
  script:
    - pnpm run lint
  only:
    - develop
    - merge_requests

# 部署到测试环境
deploy-frontend-test:
  stage: deploy
  image: alpine:latest
  tags:
    - docker
  before_script:
    - apk add --no-cache rsync openssh
  script:
    - rsync -avz --delete frontend/dist/ user@test-server:/var/www/rental/test/
  environment:
    name: test
    url: http://test.rental.com
  only:
    - develop
  when: manual

# 部署到预发布环境
deploy-frontend-pre:
  stage: deploy
  image: alpine:latest
  tags:
    - docker
  before_script:
    - apk add --no-cache rsync openssh
  script:
    - rsync -avz --delete frontend/dist/ user@pre-server:/var/www/rental/pre/
  environment:
    name: pre
    url: http://pre.rental.com
  only:
    - develop
  when: manual

# 部署到生产环境
deploy-frontend-prod:
  stage: deploy
  image: alpine:latest
  tags:
    - docker
  before_script:
    - apk add --no-cache rsync openssh
  script:
    - rsync -avz --delete frontend/dist/ user@prod-server:/var/www/rental/
  environment:
    name: production
    url: https://rental.com
  only:
    - tags
  when: manual
```

---

## 四、Docker Compose本地开发环境

### 4.1 docker-compose.yml

```yaml
version: '3.8'

services:
  # MySQL数据库
  mysql:
    image: mysql:8.0
    container_name: rental-mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: root123456
      MYSQL_DATABASE: rental_system
      TZ: Asia/Shanghai
    ports:
      - "3306:3306"
    volumes:
      - mysql-data:/var/lib/mysql
      - ./sql/init.sql:/docker-entrypoint-initdb.d/init.sql
    command:
      - --character-set-server=utf8mb4
      - --collation-server=utf8mb4_unicode_ci
      - --default-authentication-plugin=mysql_native_password
    networks:
      - rental-network

  # Redis缓存
  redis:
    image: redis:7-alpine
    container_name: rental-redis
    restart: always
    ports:
      - "6379:6379"
    volumes:
      - redis-data:/data
    command: redis-server --appendonly yes
    networks:
      - rental-network

  # 后端服务
  backend:
    build:
      context: ./backend
      dockerfile: Dockerfile.dev
    container_name: rental-backend
    restart: always
    environment:
      SPRING_PROFILES_ACTIVE: dev
      DB_HOST: mysql
      DB_PORT: 3306
      DB_NAME: rental_system
      DB_USERNAME: root
      DB_PASSWORD: root123456
      REDIS_HOST: redis
      REDIS_PORT: 6379
    ports:
      - "8080:8080"
    depends_on:
      - mysql
      - redis
    volumes:
      - ./backend:/app
      - maven-cache:/root/.m2
    networks:
      - rental-network

  # Nginx反向代理
  nginx:
    image: nginx:alpine
    container_name: rental-nginx
    restart: always
    ports:
      - "80:80"
      - "443:443"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf
      - ./nginx/conf.d:/etc/nginx/conf.d
      - ./frontend/dist:/usr/share/nginx/html
      - nginx-logs:/var/log/nginx
    depends_on:
      - backend
    networks:
      - rental-network

volumes:
  mysql-data:
  redis-data:
  maven-cache:
  nginx-logs:

networks:
  rental-network:
    driver: bridge
```

### 4.2 后端开发Dockerfile Dockerfile.dev

```dockerfile
FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app

# 安装Maven
RUN apk add --no-cache maven

# 复制pom.xml
COPY pom.xml .

# 下载依赖（利用缓存）
RUN mvn dependency:go-offline -B

# 复制源代码
COPY src ./src

# 暴露端口
EXPOSE 8080

# 启动应用（开发模式实时重载）
CMD ["mvn", "spring-boot:run", "-Dspring-boot.run.fork=false"]
```

### 4.3 Nginx配置

#### nginx.conf
```nginx
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log warn;
pid /var/run/nginx.pid;

events {
    worker_connections 1024;
}

http {
    include /etc/nginx/mime.types;
    default_type application/octet-stream;

    log_format main '$remote_addr - $remote_user [$time_local] "$request" '
                    '$status $body_bytes_sent "$http_referer" '
                    '"$http_user_agent" "$http_x_forwarded_for"';

    access_log /var/log/nginx/access.log main;

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;

    gzip on;
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_types text/plain text/css text/xml text/javascript 
               application/json application/javascript application/xml+rss;

    include /etc/nginx/conf.d/*.conf;
}
```

#### conf.d/default.conf
```nginx
server {
    listen 80;
    server_name localhost;
    root /usr/share/nginx/html;
    index index.html;

    # 前端SPA路由支持
    location / {
        try_files $uri $uri/ /index.html;
    }

    # API代理
    location /api/ {
        proxy_pass http://backend:8080/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        
        # 超时设置
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;
    }

    # 静态资源缓存
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg|woff|woff2)$ {
        expires 1y;
        add_header Cache-Control "public, immutable";
    }
}
```

---

## 五、Kubernetes部署配置

### 5.1 后端Deployment

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rental-backend
  namespace: rental
  labels:
    app: rental-backend
spec:
  replicas: 2
  selector:
    matchLabels:
      app: rental-backend
  template:
    metadata:
      labels:
        app: rental-backend
    spec:
      containers:
        - name: rental-backend
          image: registry.example.com/rental-backend:latest
          ports:
            - containerPort: 8080
          env:
            - name: SPRING_PROFILES_ACTIVE
              value: "prod"
            - name: DB_HOST
              valueFrom:
                secretKeyRef:
                  name: rental-secrets
                  key: db-host
            - name: DB_PASSWORD
              valueFrom:
                secretKeyRef:
                  name: rental-secrets
                  key: db-password
          resources:
            requests:
              memory: "256Mi"
              cpu: "100m"
            limits:
              memory: "512Mi"
              cpu: "500m"
          livenessProbe:
            httpGet:
              path: /actuator/health
              port: 8080
            initialDelaySeconds: 60
            periodSeconds: 10
          readinessProbe:
            httpGet:
              path: /actuator/health
              port: 8080
            initialDelaySeconds: 30
            periodSeconds: 5
```

### 5.2 后端Service

```yaml
apiVersion: v1
kind: Service
metadata:
  name: rental-backend
  namespace: rental
spec:
  selector:
    app: rental-backend
  ports:
    - protocol: TCP
      port: 80
      targetPort: 8080
  type: ClusterIP
```

### 5.3 Ingress配置

```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: rental-ingress
  namespace: rental
  annotations:
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-prod
spec:
  tls:
    - hosts:
        - api.rental.com
      secretName: rental-api-tls
  rules:
    - host: api.rental.com
      http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: rental-backend
                port:
                  number: 80
```

---

## 六、SonarQube代码质量检查

### 6.1 配置

```yaml
# GitLab CI集成SonarQube
sonar-check:
  stage: test
  image: maven:3.9-eclipse-temurin-17
  tags:
    - docker
  before_script:
    - cd backend
  script:
    - mvn sonar:sonar
      -Dsonar.projectKey=rental-backend
      -Dsonar.host.url=http://sonarqube:9000
      -Dsonar.login=$SONAR_TOKEN
  only:
    - develop
    - main
    - merge_requests
```

### 6.2 质量门禁标准

| 指标 | 阈值 |
|------|------|
| 覆盖率 | >= 80% |
| 重复率 | <= 3% |
| 严重级别Bug | 0 |
| 安全性Hotspot | 0 |
| 代码异味 | <= 10 |

---

## 七、监控与告警

### 7.1 Prometheus指标

```yaml
# Prometheus配置
apiVersion: v1
kind: ConfigMap
metadata:
  name: prometheus-config
  namespace: monitoring
data:
  prometheus.yml: |
    global:
      scrape_interval: 15s
    scrape_configs:
      - job_name: 'rental-backend'
        metrics_path: '/actuator/prometheus'
        static_configs:
          - targets: ['rental-backend:8080']
```

### 7.2 Grafana Dashboard

关键监控指标：
- JVM内存使用率
- HTTP请求QPS
- 接口响应时间P99
- 数据库连接池使用率
- 错误率

---

## 八、部署流程

### 8.1 开发环境部署

1. 代码提交到 `develop` 分支
2. GitLab CI自动触发构建
3. 构建成功后自动部署到开发环境

### 8.2 测试环境部署

1. 代码合并到 `develop` 分支
2. 手动触发测试环境部署
3. 进行功能测试和集成测试

### 8.3 生产环境部署

1. `develop` 分支合并到 `main`
2. 创建Git标签 `git tag v1.0.0`
3. 推送标签 `git push origin v1.0.0`
4. GitLab CI自动触发预发布验证
5. 手动确认后部署到生产环境

### 8.4 回滚流程

```bash
# 查看历史版本
kubectl rollout history deployment/rental-backend

# 回滚到上一个版本
kubectl rollout undo deployment/rental-backend

# 回滚到指定版本
kubectl rollout undo deployment/rental-backend --to-revision=2
```
