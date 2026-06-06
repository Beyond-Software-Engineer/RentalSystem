import request from './index'

export const regionApi = {
  listRegions: () => {
    return request.get('/region/list')
  },
  
  /**
   * 根据城市编码查询区域列表
   *
   * @param {string} cityCode - 城市编码
   * @returns {Promise}
   */
  listRegionsByCity: (cityCode) => {
    return request.get('/region/list-by-city', {
      params: { cityCode }
    })
  }
}
