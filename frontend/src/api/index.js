import axios from 'axios'
import { showToast } from 'vant'
import { getToken, removeToken, removeRefreshToken, removeUser } from '@/utils/storage'
import router from '@/router'

const request = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL,
  timeout: 15000,
  headers: {
    'Content-Type': 'application/json'
  }
})

request.interceptors.request.use(
  (config) => {
    const token = getToken()
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

request.interceptors.response.use(
  (response) => {
    const { code, message, data } = response.data
    
    if (code === 200) {
      return { data, message }
    }
    
    showToast(message || '请求失败')
    return Promise.reject(new Error(message))
  },
  (error) => {
    if (error.response) {
      const { status, data } = error.response
      
      switch (status) {
        case 401:
          showToast('登录已过期，请重新登录')
          removeToken()
          removeRefreshToken()
          removeUser()
          router.push('/login')
          break
        case 403:
          showToast('没有权限访问')
          break
        case 404:
          showToast('请求的资源不存在')
          break
        case 500:
          showToast('服务器错误，请稍后重试')
          break
        default:
          showToast(data.message || '网络错误')
      }
    } else {
      showToast('网络连接失败，请检查网络')
    }
    
    return Promise.reject(error)
  }
)

export default request
