import { defineStore } from 'pinia'
import { ref } from 'vue'

export const useAppStore = defineStore('app', () => {
  const regions = ref([])
  const loading = ref(false)

  return {
    regions,
    loading
  }
})
