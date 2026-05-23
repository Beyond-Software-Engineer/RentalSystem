import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import { authApi } from '@/api/auth'
import { userApi } from '@/api/user'
import { setToken, removeToken, getToken, setRefreshToken, removeRefreshToken, setUser, removeUser } from '@/utils/storage'

export const useUserStore = defineStore('user', () => {
  const token = ref(getToken() || '')
  const refreshToken = ref('')
  const userInfo = ref(null)

  const isLoggedIn = computed(() => !!token.value)
  const userId = computed(() => userInfo.value?.id)
  const username = computed(() => userInfo.value?.username || '未登录')

  async function login(loginData) {
    const { data } = await authApi.login(loginData)
    token.value = data.accessToken
    refreshToken.value = data.refreshToken
    setToken(data.accessToken)
    setRefreshToken(data.refreshToken)
    userInfo.value = data.user
    setUser(data.user)
  }

  async function fetchUserInfo() {
    if (!token.value) return
    const { data } = await userApi.getUserInfo()
    userInfo.value = data
    setUser(data)
  }

  async function updateProfile(params) {
    const { data } = await userApi.updateUserInfo(params)
    userInfo.value = data
    setUser(data)
  }

  function logout() {
    token.value = ''
    refreshToken.value = ''
    userInfo.value = null
    removeToken()
    removeRefreshToken()
    removeUser()
  }

  return {
    token,
    refreshToken,
    userInfo,
    isLoggedIn,
    userId,
    username,
    login,
    fetchUserInfo,
    updateProfile,
    logout
  }
})
