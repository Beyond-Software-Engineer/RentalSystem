import request from './index'

export const houseApi = {
  pageHouse: (params) => {
    return request.get('/house/page', { params })
  },

  getHouseDetail: (id) => {
    return request.get(`/house/${id}`)
  },

  getRecommendHouse: () => {
    return request.get('/house/recommend')
  }
}
