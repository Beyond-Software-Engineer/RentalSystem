import { ref } from 'vue'

export function useLoading(initialState = false) {
  const loading = ref(initialState)
  const error = ref(null)

  async function execute(asyncFn) {
    loading.value = true
    error.value = null
    try {
      return await asyncFn()
    } catch (e) {
      error.value = e
      throw e
    } finally {
      loading.value = false
    }
  }

  return {
    loading,
    error,
    execute
  }
}
