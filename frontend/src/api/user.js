import request from './index'

export const userApi = {
  getUserInfo: () => {
    return request.get('/user/info')
  },

  updateUserInfo: (data) => {
    return request.put('/user/info', data)
  }
}
