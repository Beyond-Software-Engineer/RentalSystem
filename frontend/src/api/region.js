import request from './index'

export const regionApi = {
  listRegions: () => {
    return request.get('/region/list')
  }
}
