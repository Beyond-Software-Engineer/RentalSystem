export const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/auth/Login.vue'),
    meta: { title: '登录', requiresAuth: false }
  },
  {
    path: '/',
    component: () => import('@/layouts/MainLayout.vue'),
    redirect: '/home',
    children: [
      {
        path: 'home',
        name: 'Home',
        component: () => import('@/views/home/Home.vue'),
        meta: { title: '首页', tabbar: true, requiresAuth: false }
      },
      {
        path: 'house',
        name: 'HouseList',
        component: () => import('@/views/house/List.vue'),
        meta: { title: '房源', tabbar: true, requiresAuth: false }
      },
      {
        path: 'news',
        name: 'News',
        component: () => import('@/views/news/News.vue'),
        meta: { title: '资讯', tabbar: true, requiresAuth: false }
      },
      {
        path: 'profile',
        name: 'Profile',
        component: () => import('@/views/user/Profile.vue'),
        meta: { title: '我的', tabbar: true }
      }
    ]
  },
  {
    path: '/house/:id',
    name: 'HouseDetail',
    component: () => import('@/views/house/Detail.vue'),
    meta: { title: '房源详情', requiresAuth: false }
  },
  {
    path: '/house/filter',
    name: 'HouseFilter',
    component: () => import('@/views/house/Filter.vue'),
    meta: { title: '筛选', requiresAuth: false }
  },
  {
    path: '/news/:id',
    name: 'NewsDetail',
    component: () => import('@/views/news/Detail.vue'),
    meta: { title: '资讯详情', requiresAuth: false }
  }
]
