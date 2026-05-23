# Rental Backend

租房系统后端服务

## 技术栈

- Spring Boot 3.2.5
- MyBatis Plus 3.5.5
- Spring Security + JWT
- MySQL 8.0
- Redis

## 项目结构

```
src/main/java/com/rental/
├── common/          # 公共组件
├── config/          # 配置类
├── controller/      # 控制器层
├── dto/             # 数据传输对象
├── entity/          # 实体类
├── mapper/          # 数据访问层
├── security/        # 安全认证
├── service/         # 服务层
│   └── impl/        # 服务实现
└── vo/              # 视图对象
```

## 快速开始

### 1. 环境要求

- JDK 17+
- Maven 3.6+
- MySQL 8.0+
- Redis

### 2. 数据库初始化

```bash
mysql -u root -p < ../sql/init.sql
```

### 3. 修改配置

修改 `src/main/resources/application.yml` 中的数据库和Redis配置

### 4. 运行项目

```bash
mvn spring-boot:run
```

### 5. 访问接口

- 基础路径: http://localhost:8080/api
- 发送验证码: POST /auth/send-code
- 登录: POST /auth/login
- 房源列表: GET /house/page
- 新闻列表: GET /news/page

## API文档

### 认证模块

#### 发送验证码
```
POST /auth/send-code
Content-Type: application/json

{
  "mobile": "13800138000"
}
```

#### 登录
```
POST /auth/login
Content-Type: application/json

{
  "mobile": "13800138000",
  "code": "123456"
}
```

### 房源模块

#### 房源列表
```
GET /house/page?pageNum=1&pageSize=10&sortField=createTime&sortOrder=desc
```

#### 房源详情
```
GET /house/{id}
```

### 新闻模块

#### 新闻列表
```
GET /news/page?pageNum=1&pageSize=10
```

## 打包部署

```bash
mvn clean package
java -jar target/rental-backend-1.0.0.jar
```

## Docker部署

```bash
docker build -t rental-backend .
docker run -d -p 8080:8080 rental-backend
```
