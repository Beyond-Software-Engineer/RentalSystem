import { defineStore } from 'pinia'
import { ref } from 'vue'
import { houseApi } from '@/api/house'

export const useHouseStore = defineStore('house', () => {
  const houseList = ref([])
  const currentHouse = ref(null)
  const recommendList = ref([])
  const queryParams = ref({
    pageNum: 1,
    pageSize: 10,
    sortField: 'createTime',
    sortOrder: 'desc'
  })
  const total = ref(0)
  const loading = ref(false)

  async function fetchHouseList(params = {}) {
    loading.value = true
    try {
      queryParams.value = { ...queryParams.value, ...params }
      const { data } = await houseApi.pageHouse(queryParams.value)
      if (params.pageNum > 1) {
        houseList.value = [...houseList.value, ...data.records]
      } else {
        houseList.value = data.records
      }
      total.value = data.total
    } finally {
      loading.value = false
    }
  }

  async function fetchHouseDetail(id) {
    loading.value = true
    try {
      const { data } = await houseApi.getHouseDetail(id)
      currentHouse.value = data
    } finally {
      loading.value = false
    }
  }

  async function fetchRecommend(cityCode = null) {
    const { data } = await houseApi.getRecommendHouse(cityCode)
    recommendList.value = data.records
  }

  function resetList() {
    houseList.value = []
    queryParams.value.pageNum = 1
    total.value = 0
  }

  return {
    houseList,
    currentHouse,
    recommendList,
    queryParams,
    total,
    loading,
    fetchHouseList,
    fetchHouseDetail,
    fetchRecommend,
    resetList
  }
})
