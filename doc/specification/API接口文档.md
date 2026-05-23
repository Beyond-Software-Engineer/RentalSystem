# 租房系统API接口文档

## 版本信息

| 版本号 | 日期 | 说明 |
|--------|------|------|
| 1.0.0 | 2026-05-23 | 初始版本 |

---

## 一、接口概述

### 1.1 基础信息

| 项目 | 说明 |
|------|------|
| 基础URL | http://localhost:8080/api |
| 协议 | HTTP/HTTPS |
| 数据格式 | JSON |
| 字符编码 | UTF-8 |

### 1.2 认证方式

除公开接口外，其他接口需要在请求头中携带JWT令牌：

```
Authorization: Bearer {access_token}
```

### 1.3 统一响应格式

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {}
}
```

### 1.4 状态码说明

| 状态码 | 说明 |
|--------|------|
| 200 | 操作成功 |
| 400 | 请求参数错误 |
| 401 | 未认证或令牌过期 |
| 403 | 无权限访问 |
| 404 | 资源不存在 |
| 500 | 服务器内部错误 |

---

## 二、认证模块

### 2.1 发送验证码

**接口地址**：`POST /auth/send-code`

**是否认证**：否

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| mobile | string | 是 | 手机号(11位) |

**请求示例**：

```json
{
  "mobile": "13800138000"
}
```

**响应示例**：

```json
{
  "code": 200,
  "message": "验证码发送成功",
  "data": null
}
```

**错误响应**：

```json
{
  "code": 400,
  "message": "发送过于频繁，请45秒后重试",
  "data": null
}
```

**业务规则**：
- 手机号格式校验：`^1[3-9]\d{9}$`
- 验证码发送间隔：60秒
- 验证码有效期：5分钟
- 验证码长度：6位数字

---

### 2.2 手机号登录

**接口地址**：`POST /auth/login`

**是否认证**：否

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| mobile | string | 是 | 手机号(11位) |
| code | string | 是 | 验证码(6位) |

**请求示例**：

```json
{
  "mobile": "13800138000",
  "code": "123456"
}
```

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expiresIn": 7200,
    "user": {
      "id": 1,
      "phone": "13800138000",
      "username": "用户8000",
      "avatar": null,
      "gender": 0,
      "email": null
    }
  }
}
```

**响应字段说明**：

| 字段名 | 类型 | 说明 |
|--------|------|------|
| accessToken | string | 访问令牌(有效期2小时) |
| refreshToken | string | 刷新令牌(有效期7天) |
| expiresIn | long | 访问令牌有效期(秒) |
| user | object | 用户信息 |

**业务规则**：
- 新用户自动注册
- 登录成功后验证码自动失效

---

### 2.3 刷新令牌

**接口地址**：`POST /auth/refresh`

**是否认证**：否（使用refresh_token）

**请求头**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| Authorization | string | 是 | Bearer {refresh_token} |

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "accessToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "refreshToken": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "expiresIn": 7200,
    "user": {
      "id": 1,
      "phone": "13800138000",
      "username": "用户8000",
      "avatar": null,
      "gender": 0,
      "email": null
    }
  }
}
```

---

## 三、用户模块

### 3.1 获取用户信息

**接口地址**：`GET /user/info`

**是否认证**：是

**请求参数**：无

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "id": 1,
    "phone": "13800138000",
    "username": "张三",
    "avatar": "https://example.com/avatar.jpg",
    "gender": 1,
    "email": "zhangsan@example.com"
  }
}
```

**响应字段说明**：

| 字段名 | 类型 | 说明 |
|--------|------|------|
| id | long | 用户ID |
| phone | string | 手机号 |
| username | string | 用户名 |
| avatar | string | 头像URL |
| gender | integer | 性别：0-未知，1-男，2-女 |
| email | string | 邮箱 |

---

### 3.2 更新用户信息

**接口地址**：`PUT /user/info`

**是否认证**：是

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| username | string | 否 | 用户名(2-20字符) |
| avatar | string | 否 | 头像URL |
| gender | integer | 否 | 性别：0-未知，1-男，2-女 |
| email | string | 否 | 邮箱 |

**请求示例**：

```json
{
  "username": "张三",
  "avatar": "https://example.com/avatar.jpg",
  "gender": 1,
  "email": "zhangsan@example.com"
}
```

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "id": 1,
    "phone": "13800138000",
    "username": "张三",
    "avatar": "https://example.com/avatar.jpg",
    "gender": 1,
    "email": "zhangsan@example.com"
  }
}
```

---

## 四、房源模块

### 4.1 分页查询房源

**接口地址**：`GET /house/page`

**是否认证**：否

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| pageNum | integer | 否 | 页码，默认1 |
| pageSize | integer | 否 | 每页数量，默认10 |
| minRent | decimal | 否 | 最低租金 |
| maxRent | decimal | 否 | 最高租金 |
| regionId | long | 否 | 区域ID |
| room | integer | 否 | 户型-室 |
| hall | integer | 否 | 户型-厅 |
| houseType | integer | 否 | 房屋类型：1-住宅，2-公寓，3-商铺 |
| rentType | integer | 否 | 租赁方式：1-整租，2-合租 |
| decorationType | integer | 否 | 装修类型：1-毛坯，2-简装，3-精装 |
| minArea | decimal | 否 | 最小面积 |
| maxArea | decimal | 否 | 最大面积 |
| minFloor | integer | 否 | 最低楼层 |
| maxFloor | integer | 否 | 最高楼层 |
| sortField | string | 否 | 排序字段：createTime-最新，rent-价格 |
| sortOrder | string | 否 | 排序方向：asc-升序，desc-降序 |

**请求示例**：

```
GET /house/page?pageNum=1&pageSize=10&minRent=1000&maxRent=5000&room=2&sortField=createTime&sortOrder=desc
```

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "total": 100,
    "size": 10,
    "current": 1,
    "pages": 10,
    "records": [
      {
        "id": 1,
        "title": "朝阳公园旁精装修两居室",
        "room": 2,
        "hall": 1,
        "kitchen": 1,
        "toilet": 1,
        "decorationType": 3,
        "rent": 6500.00,
        "deposit": 13000.00,
        "rentType": 1,
        "floor": 15,
        "totalFloor": 28,
        "area": 85.50,
        "regionId": 1,
        "regionName": "朝阳区",
        "houseType": 1,
        "coverImage": "https://example.com/house1.jpg",
        "facilities": "[1,2,3,4,5,8,9,10,14]"
      }
    ]
  }
}
```

**响应字段说明**：

| 字段名 | 类型 | 说明 |
|--------|------|------|
| total | long | 总记录数 |
| size | long | 每页数量 |
| current | long | 当前页码 |
| pages | long | 总页数 |
| records | array | 房源列表 |

---

### 4.2 获取房源详情

**接口地址**：`GET /house/{id}`

**是否认证**：否

**路径参数**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | long | 是 | 房源ID |

**请求示例**：

```
GET /house/1
```

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "id": 1,
    "title": "朝阳公园旁精装修两居室",
    "room": 2,
    "hall": 1,
    "kitchen": 1,
    "toilet": 1,
    "decorationType": 3,
    "rent": 6500.00,
    "deposit": 13000.00,
    "rentType": 1,
    "floor": 15,
    "totalFloor": 28,
    "area": 85.50,
    "regionId": 1,
    "regionName": "朝阳区",
    "address": "朝阳区朝阳公园南路XX号",
    "houseType": 1,
    "facilities": "[1,2,3,4,5,8,9,10,14]",
    "threeDUrl": "https://example.com/3d/house1",
    "coverImage": "https://example.com/house1.jpg",
    "images": [
      "https://example.com/house1-1.jpg",
      "https://example.com/house1-2.jpg",
      "https://example.com/house1-3.jpg"
    ],
    "description": "房屋精装修，采光好，交通便利，周边配套设施齐全。",
    "facilityList": [
      {
        "id": 1,
        "name": "电视",
        "icon": "icon-tv",
        "category": "家电"
      },
      {
        "id": 2,
        "name": "空调",
        "icon": "icon-ac",
        "category": "家电"
      }
    ]
  }
}
```

**枚举值说明**：

| 字段 | 值 | 说明 |
|------|-----|------|
| decorationType | 1 | 毛坯 |
| decorationType | 2 | 简装 |
| decorationType | 3 | 精装 |
| rentType | 1 | 整租 |
| rentType | 2 | 合租 |
| houseType | 1 | 住宅 |
| houseType | 2 | 公寓 |
| houseType | 3 | 商铺 |

---

### 4.3 获取推荐房源

**接口地址**：`GET /house/recommend`

**是否认证**：否

**请求参数**：无

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "total": 6,
    "size": 6,
    "current": 1,
    "pages": 1,
    "records": [
      {
        "id": 1,
        "title": "朝阳公园旁精装修两居室",
        "room": 2,
        "hall": 1,
        "kitchen": 1,
        "toilet": 1,
        "decorationType": 3,
        "rent": 6500.00,
        "deposit": 13000.00,
        "rentType": 1,
        "floor": 15,
        "totalFloor": 28,
        "area": 85.50,
        "regionId": 1,
        "regionName": "朝阳区",
        "houseType": 1,
        "coverImage": "https://example.com/house1.jpg",
        "facilities": "[1,2,3,4,5,8,9,10,14]"
      }
    ]
  }
}
```

**业务规则**：
- 返回最新上架的6套房源
- 按创建时间倒序排列

---

## 五、新闻模块

### 5.1 分页查询新闻

**接口地址**：`GET /news/page`

**是否认证**：否

**请求参数**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| pageNum | integer | 否 | 页码，默认1 |
| pageSize | integer | 否 | 每页数量，默认10 |

**请求示例**：

```
GET /news/page?pageNum=1&pageSize=10
```

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "total": 50,
    "size": 10,
    "current": 1,
    "pages": 5,
    "records": [
      {
        "id": 1,
        "title": "租房旺季来临，这些注意事项你需要知道",
        "coverImage": "https://example.com/news1.jpg",
        "summary": "随着春季租房旺季的到来...",
        "content": null,
        "author": "房产小助手",
        "source": "租房网",
        "viewCount": 1256,
        "publishTime": "2026-05-20T10:00:00"
      }
    ]
  }
}
```

---

### 5.2 获取新闻详情

**接口地址**：`GET /news/{id}`

**是否认证**：否

**路径参数**：

| 参数名 | 类型 | 必填 | 说明 |
|--------|------|------|------|
| id | long | 是 | 新闻ID |

**请求示例**：

```
GET /news/1
```

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": {
    "id": 1,
    "title": "租房旺季来临，这些注意事项你需要知道",
    "coverImage": "https://example.com/news1.jpg",
    "summary": "随着春季租房旺季的到来...",
    "content": "<p>随着春季租房旺季的到来，越来越多的人开始寻找新的住处...</p>",
    "author": "房产小助手",
    "source": "租房网",
    "viewCount": 1257,
    "publishTime": "2026-05-20T10:00:00"
  }
}
```

**业务规则**：
- 每次访问详情页，浏览量+1

---

## 六、区域模块

### 6.1 获取区域列表

**接口地址**：`GET /region/list`

**是否认证**：否

**请求参数**：无

**响应示例**：

```json
{
  "code": 200,
  "message": "操作成功",
  "data": [
    {
      "id": 1,
      "name": "朝阳区",
      "code": "BJ_CY",
      "city": "北京",
      "sort": 1
    },
    {
      "id": 2,
      "name": "海淀区",
      "code": "BJ_HD",
      "city": "北京",
      "sort": 2
    },
    {
      "id": 3,
      "name": "浦东新区",
      "code": "SH_PD",
      "city": "上海",
      "sort": 1
    }
  ]
}
```

---

## 七、错误码说明

| 错误码 | 说明 |
|--------|------|
| 200 | 操作成功 |
| 400 | 请求参数错误 |
| 400 | 手机号格式不正确 |
| 400 | 验证码错误或已过期 |
| 400 | 发送过于频繁，请X秒后重试 |
| 401 | 未认证或令牌过期 |
| 401 | 无效的刷新令牌 |
| 401 | 用户不存在 |
| 404 | 房源不存在 |
| 404 | 新闻不存在 |
| 500 | 系统繁忙，请稍后重试 |

---

## 八、调用示例

### 8.1 JavaScript (Axios)

```javascript
import axios from 'axios'

const api = axios.create({
  baseURL: 'http://localhost:8080/api',
  timeout: 15000
})

// 请求拦截器
api.interceptors.request.use(config => {
  const token = localStorage.getItem('access_token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

// 发送验证码
async function sendCode(mobile) {
  const res = await api.post('/auth/send-code', { mobile })
  return res.data
}

// 登录
async function login(mobile, code) {
  const res = await api.post('/auth/login', { mobile, code })
  if (res.data.code === 200) {
    localStorage.setItem('access_token', res.data.data.accessToken)
    localStorage.setItem('refresh_token', res.data.data.refreshToken)
  }
  return res.data
}

// 获取房源列表
async function getHouseList(params) {
  const res = await api.get('/house/page', { params })
  return res.data
}
```

### 8.2 curl

```bash
# 发送验证码
curl -X POST http://localhost:8080/api/auth/send-code \
  -H "Content-Type: application/json" \
  -d '{"mobile":"13800138000"}'

# 登录
curl -X POST http://localhost:8080/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"mobile":"13800138000","code":"123456"}'

# 获取房源列表
curl -X GET "http://localhost:8080/api/house/page?pageNum=1&pageSize=10"

# 获取房源详情
curl -X GET http://localhost:8080/api/house/1

# 获取用户信息（需要认证）
curl -X GET http://localhost:8080/api/user/info \
  -H "Authorization: Bearer {access_token}"
```
