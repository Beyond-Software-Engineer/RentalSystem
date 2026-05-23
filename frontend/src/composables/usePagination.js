import { ref, computed } from 'vue'

export function usePagination(fetchFn, options = {}) {
  const { pageSize = 10 } = options
  
  const list = ref([])
  const pageNum = ref(1)
  const total = ref(0)
  const loading = ref(false)
  const finished = ref(false)

  const hasMore = computed(() => list.value.length < total.value)

  async function loadMore() {
    if (loading.value || finished.value) return
    
    loading.value = true
    try {
      const params = { pageNum: pageNum.value, pageSize }
      const { data } = await fetchFn(params)
      
      if (pageNum.value === 1) {
        list.value = data.records
      } else {
        list.value = [...list.value, ...data.records]
      }
      
      total.value = data.total
      pageNum.value++
      
      if (list.value.length >= total.value) {
        finished.value = true
      }
    } finally {
      loading.value = false
    }
  }

  async function refresh() {
    pageNum.value = 1
    finished.value = false
    list.value = []
    await loadMore()
  }

  return {
    list,
    total,
    loading,
    finished,
    hasMore,
    loadMore,
    refresh
  }
}
