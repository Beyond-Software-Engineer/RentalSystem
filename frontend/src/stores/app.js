import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useAppStore = defineStore('app', () => {
  const regions = ref([])
  const loading = ref(false)
  
  // 当前位置信息
  const currentLocation = ref({
    province: '北京市',
    city: '北京市',
    district: '',
    provinceCode: '110000',
    cityCode: '110100',
    districtCode: ''
  })

  /**
   * 更新位置信息
   */
  function setLocation(location) {
    currentLocation.value = { ...location }
  }

  /**
   * 获取位置信息
   */
  function getLocation() {
    return currentLocation.value
  }

  return {
    regions,
    loading,
    currentLocation,
    setLocation,
    getLocation
  }
})
