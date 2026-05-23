# 租房系统前端项目

## 技术栈

| 类别 | 技术 | 版本 |
|------|------|------|
| 核心框架 | Vue | 3.4+ |
| 构建工具 | Vite | 5.x |
| 路由管理 | Vue Router | 4.x |
| 状态管理 | Pinia | 2.x |
| UI组件库 | Vant | 4.x |
| HTTP客户端 | Axios | 1.x |
| CSS预处理器 | SCSS | - |

## 项目结构

```
frontend/
├── src/
│   ├── api/                    # API请求封装
│   │   ├── index.js            # Axios实例配置
│   │   ├── auth.js             # 认证相关API
│   │   ├── house.js            # 房源相关API
│   │   ├── user.js             # 用户相关API
│   │   ├── news.js             # 新闻相关API
│   │   └── region.js           # 区域相关API
│   ├── assets/                 # 静态资源
│   │   └── styles/             # 全局样式
│   ├── components/             # 公共组件
│   │   ├── HouseCard.vue       # 房源卡片
│   │   └── NewsCard.vue        # 新闻卡片
│   ├── composables/            # 组合式函数
│   ├── layouts/                # 布局组件
│   │   └── MainLayout.vue      # 主布局
│   ├── router/                 # 路由配置
│   ├── stores/                 # 状态管理
│   ├── utils/                  # 工具函数
│   ├── views/                  # 页面组件
│   │   ├── auth/               # 认证模块
│   │   ├── home/               # 首页模块
│   │   ├── house/              # 房源模块
│   │   ├── news/               # 新闻模块
│   │   └── user/               # 用户模块
│   ├── App.vue                 # 根组件
│   └── main.js                 # 入口文件
├── .env.development           # 开发环境配置
├── .env.production            # 生产环境配置
├── index.html                  # HTML模板
├── package.json                # 项目配置
├── vite.config.js              # Vite配置
└── README.md                   # 项目说明
```

## 快速开始

### 安装依赖

```bash
pnpm install
```

### 开发模式

```bash
pnpm run dev
```

访问 http://localhost:3000

### 生产构建

```bash
pnpm run build
```

### 预览构建结果

```bash
pnpm run preview
```

## 页面路由

| 路径 | 页面 | 说明 |
|------|------|------|
| /login | 登录页 | 手机号验证码登录 |
| /home | 首页 | 轮播图、快捷入口、推荐房源、资讯 |
| /house | 房源列表 | 筛选、搜索、分页 |
| /house/:id | 房源详情 | 房源详细信息 |
| /house/filter | 筛选页 | 高级筛选 |
| /news | 资讯列表 | 新闻资讯 |
| /profile | 个人中心 | 用户信息、菜单 |

## API接口

| 模块 | 接口 | 说明 |
|------|------|------|
| 认证 | POST /auth/send-code | 发送验证码 |
| 认证 | POST /auth/login | 登录 |
| 认证 | POST /auth/refresh | 刷新令牌 |
| 用户 | GET /user/info | 获取用户信息 |
| 用户 | PUT /user/info | 更新用户信息 |
| 房源 | GET /house/page | 分页查询房源 |
| 房源 | GET /house/:id | 房源详情 |
| 房源 | GET /house/recommend | 推荐房源 |
| 新闻 | GET /news/page | 分页查询新闻 |
| 新闻 | GET /news/:id | 新闻详情 |
| 区域 | GET /region/list | 区域列表 |

## 状态管理

### 用户状态 (`stores/user.js`)

| 状态 | 说明 |
|------|------|
| token | 访问令牌 |
| refreshToken | 刷新令牌 |
| userInfo | 用户信息 |
| isLoggedIn | 是否登录 |

### 房源状态 (`stores/house.js`)

| 状态 | 说明 |
|------|------|
| houseList | 房源列表 |
| currentHouse | 当前房源 |
| recommendList | 推荐房源 |
| queryParams | 查询参数 |

## 开发规范

### 代码风格

- 使用 Vue 3 Composition API
- 使用 `setup` 语法糖
- 组件命名使用 PascalCase
- 文件命名使用 kebab-case

### 目录结构

- `components/`：可复用的公共组件
- `views/`：页面级组件
- `composables/`：组合式函数
- `stores/`：Pinia 状态管理
- `api/`：API 请求封装
- `utils/`：工具函数

### Git 提交规范

- feat: 新增功能
- fix: 修复 bug
- docs: 更新文档
- style: 代码格式
- refactor: 代码重构
- test: 测试用例

## License

MIT
