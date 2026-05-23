import request from './index'

export const authApi = {
  sendCode: (mobile) => {
    return request.post('/auth/send-code', { mobile })
  },

  login: (data) => {
    return request.post('/auth/login', data)
  },

  refresh: (refreshToken) => {
    return request.post('/auth/refresh', null, {
      headers: { Authorization: `Bearer ${refreshToken}` }
    })
  }
}
