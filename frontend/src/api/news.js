import request from './index'

export const newsApi = {
  pageNews: (params) => {
    return request.get('/news/page', { params })
  },

  getNewsDetail: (id) => {
    return request.get(`/news/${id}`)
  }
}
