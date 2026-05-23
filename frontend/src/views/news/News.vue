<template>
  <div class="news-page">
    <van-search
      v-model="searchText"
      placeholder="搜索资讯"
      show-action
      @search="handleSearch"
    />

    <div class="news-content">
      <NewsCard v-for="news in newsList" :key="news.id" :news="news" />
    </div>

    <van-loading v-if="loadingMore" class="loading-more" />

    <div v-if="finished && newsList.length > 0" class="finished-text">
      没有更多了
    </div>

    <van-empty v-if="!loading && newsList.length === 0" description="暂无资讯" />

    <van-loading v-if="loading" class="loading" />
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { Search, Empty, Loading } from 'vant'
import NewsCard from '@/components/NewsCard.vue'
import { newsApi } from '@/api/news'

const searchText = ref('')
const loading = ref(true)
const loadingMore = ref(false)
const finished = ref(false)
const newsList = ref([])
const pageNum = ref(1)
const total = ref(0)

function handleScroll() {
  const { scrollTop, scrollHeight, clientHeight } = document.documentElement
  const isNearBottom = scrollTop + clientHeight >= scrollHeight - 100
  
  if (isNearBottom && !loading.value && !loadingMore.value && !finished.value) {
    loadMore()
  }
}

onMounted(async () => {
  await loadNewsList()
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

async function loadNewsList(isLoadMore = false) {
  if (!isLoadMore) {
    loading.value = true
    pageNum.value = 1
    finished.value = false
    newsList.value = []
  } else {
    loadingMore.value = true
  }

  try {
    const params = {
      pageNum: pageNum.value,
      pageSize: 10
    }

    const { data } = await newsApi.pageNews(params)
    
    if (pageNum.value === 1) {
      newsList.value = data.records
    } else {
      newsList.value = [...newsList.value, ...data.records]
    }
    
    total.value = data.total
    
    if (newsList.value.length >= total.value) {
      finished.value = true
    }
    
    pageNum.value++
  } catch (error) {
    console.error('加载资讯失败', error)
  } finally {
    loading.value = false
    loadingMore.value = false
  }
}

function handleSearch() {
  loadNewsList()
}

function loadMore() {
  if (!finished.value && !loadingMore.value) {
    loadNewsList(true)
  }
}
</script>

<style lang="scss" scoped>
.news-page {
  padding-bottom: 60px;
}

.news-content {
  padding: 0 12px;
}

.loading {
  display: block;
  margin: 20px auto;
}

.loading-more {
  display: block;
  margin: 10px auto;
}

.finished-text {
  text-align: center;
  padding: 12px;
  color: #999;
  font-size: 12px;
}
</style>
