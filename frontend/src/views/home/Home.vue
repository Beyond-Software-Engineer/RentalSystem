<template>
  <div class="home-page">
    <van-search
      v-model="searchText"
      placeholder="搜索房源"
      show-action
      @search="handleSearch"
    >
      <template #action>
        <van-button size="small" type="primary" @click="handleSearch">搜索</van-button>
      </template>
    </van-search>

    <van-swipe :autoplay="3000" indicator-color="white" class="banner">
      <van-swipe-item v-for="(item, index) in banners" :key="index">
        <img :src="item.image" class="banner-image" />
      </van-swipe-item>
    </van-swipe>

    <van-grid class="quick-entrance">
      <van-grid-item v-for="item in quickItems" :key="item.name" :icon="item.icon" @click="handleQuickClick(item)">
        {{ item.name }}
      </van-grid-item>
    </van-grid>

    <div class="section-header">
      <span class="section-title">推荐房源</span>
      <span class="section-more" @click="goHouseList">更多</span>
    </div>
    <div class="house-list">
      <HouseCard v-for="house in recommendList" :key="house.id" :house="house" />
    </div>

    <div class="section-header">
      <span class="section-title">最新资讯</span>
      <span class="section-more" @click="goNews">更多</span>
    </div>
    <div class="news-list">
      <NewsCard v-for="news in newsList" :key="news.id" :news="news" />
    </div>

    <van-loading v-if="loading" class="loading" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { Search, Swipe, SwipeItem, Grid, GridItem, Loading, Button } from 'vant'
import HouseCard from '@/components/HouseCard.vue'
import NewsCard from '@/components/NewsCard.vue'
import { useHouseStore } from '@/stores/house'
import { newsApi } from '@/api/news'

const router = useRouter()
const searchText = ref('')
const loading = ref(true)

const banners = [
  { image: 'https://picsum.photos/800/400?random=1' },
  { image: 'https://picsum.photos/800/400?random=2' },
  { image: 'https://picsum.photos/800/400?random=3' }
]

const quickItems = [
  { name: '整租', icon: 'wap-home-o' },
  { name: '合租', icon: 'search' },
  { name: '筛选', icon: 'filter-o' },
  { name: '地图找房', icon: 'location-o' },
  { name: '收藏', icon: 'like-o' },
  { name: '咨询', icon: 'chat-o' }
]

const houseStore = useHouseStore()
const recommendList = ref([])
const newsList = ref([])

onMounted(async () => {
  await loadData()
})

async function loadData() {
  loading.value = true
  try {
    await houseStore.fetchRecommend()
    recommendList.value = houseStore.recommendList.slice(0, 3)
    
    const { newsApi } = await import('@/api/news')
    const { data } = await newsApi.pageNews({ pageNum: 1, pageSize: 3 })
    newsList.value = data.records
  } catch (error) {
    console.error('加载数据失败', error)
  } finally {
    loading.value = false
  }
}

function handleSearch() {
  router.push({ path: '/house', query: { keyword: searchText.value } })
}

function handleQuickClick(item) {
  if (item.name === '筛选') {
    router.push('/house/filter')
  } else if (item.name === '收藏') {
    router.push('/profile')
  } else {
    router.push('/house')
  }
}

function goHouseList() {
  router.push('/house')
}

function goNews() {
  router.push('/news')
}
</script>

<style lang="scss" scoped>
.home-page {
  padding-bottom: 60px;
}

.banner {
  margin: 12px;
  border-radius: 12px;
  overflow: hidden;

  .banner-image {
    width: 100%;
    height: 180px;
    object-fit: cover;
  }
}

.quick-entrance {
  padding: 0 12px;
  margin-bottom: 12px;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 12px 12px;

  .section-title {
    font-size: 16px;
    font-weight: 600;
    color: #333;
  }

  .section-more {
    font-size: 13px;
    color: #999;
  }
}

.house-list {
  padding: 0 12px;
}

.news-list {
  padding: 0 12px;
}

.loading {
  padding: 20px;
}
</style>
