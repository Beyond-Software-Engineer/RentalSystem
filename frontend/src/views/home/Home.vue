<template>
  <div class="home-page">
    <!-- 顶部区域 -->
    <div class="home-header">
      <div class="header-content">
        <LocationSelector v-model="location" @change="handleLocationChange" />
        <van-search
          v-model="searchText"
          placeholder="搜索小区、地铁站"
          shape="round"
          background="transparent"
          @search="handleSearch"
        />
      </div>
    </div>

    <!-- 轮播图区域 -->
    <div class="banner-wrapper">
      <van-swipe :autoplay="4000" indicator-color="white" class="banner" :show-indicators="true">
        <van-swipe-item v-for="(item, index) in banners" :key="index">
          <img :src="item.image" class="banner-image" />
        </van-swipe-item>
      </van-swipe>
    </div>

    <!-- 快捷入口 -->
    <div class="quick-entrance">
      <div class="entrance-grid">
        <div
          v-for="item in quickItems"
          :key="item.name"
          class="entrance-item"
          @click="handleQuickClick(item)"
        >
          <div class="entrance-icon" :style="{ backgroundColor: item.bgColor }">
            <van-icon :name="item.icon" size="24" :color="item.iconColor" />
          </div>
          <span class="entrance-name">{{ item.name }}</span>
        </div>
      </div>
    </div>

    <!-- 推荐房源 -->
    <div class="section">
      <div class="section-header">
        <div class="section-title-group">
          <span class="section-title">推荐房源</span>
          <span class="section-subtitle">{{ location.city || '为您精选' }}优质好房</span>
        </div>
        <div class="section-more" @click="goHouseList">
          <span>查看更多</span>
          <van-icon name="arrow" size="14" />
        </div>
      </div>
      
      <!-- 加载状态 -->
      <van-loading v-if="recommendLoading" class="recommend-loading" />
      
      <!-- 空状态 -->
      <div v-else-if="recommendList.length === 0" class="empty-state">
        <van-empty description="该区域暂无房源，为您推荐其他优质房源" />
        <van-button type="primary" size="small" @click="goHouseList">查看全部房源</van-button>
      </div>
      
      <!-- 房源列表 -->
      <div v-else class="house-list">
        <HouseCard v-for="house in recommendList" :key="house.id" :house="house" />
      </div>
    </div>

    <!-- 最新资讯 -->
    <div class="section">
      <div class="section-header">
        <div class="section-title-group">
          <span class="section-title">最新资讯</span>
          <span class="section-subtitle">了解租房最新动态</span>
        </div>
        <div class="section-more" @click="goNews">
          <span>查看更多</span>
          <van-icon name="arrow" size="14" />
        </div>
      </div>
      <div class="news-list">
        <NewsCard v-for="news in newsList" :key="news.id" :news="news" />
      </div>
    </div>

    <!-- 加载状态 -->
    <van-loading v-if="loading" class="loading" />
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { Search, Swipe, SwipeItem, Grid, GridItem, Loading, Button, Icon, Empty } from 'vant'
import HouseCard from '@/components/HouseCard.vue'
import NewsCard from '@/components/NewsCard.vue'
import LocationSelector from '@/components/LocationSelector.vue'
import { useHouseStore } from '@/stores/house'
import { newsApi } from '@/api/news'
import { getLocation, setLocation } from '@/utils/storage'

const router = useRouter()
const searchText = ref('')
const loading = ref(true)
const recommendLoading = ref(false)

// 从本地存储读取位置信息，如果不存在则使用默认值
const storedLocation = getLocation()
const location = ref(storedLocation || {
  province: '北京市',
  city: '北京市',
  district: '',
  provinceCode: '110000',
  cityCode: '110100',
  districtCode: ''
})

const banners = [
  { image: 'https://picsum.photos/800/400?random=1' },
  { image: 'https://picsum.photos/800/400?random=2' },
  { image: 'https://picsum.photos/800/400?random=3' },
  { image: 'https://picsum.photos/800/400?random=4' }
]

const quickItems = [
  { name: '整租', icon: 'wap-home-o', bgColor: '#e8f4ff', iconColor: '#1890ff' },
  { name: '合租', icon: 'friends-o', bgColor: '#fff7e6', iconColor: '#fa8c16' },
  { name: '地图找房', icon: 'location-o', bgColor: '#fff1f0', iconColor: '#ff4d4f' },
  { name: '收藏', icon: 'star-o', bgColor: '#fef0ff', iconColor: '#722ed1' },
  { name: '咨询', icon: 'service-o', bgColor: '#fff2e8', iconColor: '#fa541c' }
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
    await loadRecommendHouse()

    const { data } = await newsApi.pageNews({ pageNum: 1, pageSize: 3 })
    newsList.value = data.records
  } catch (error) {
    console.error('加载数据失败', error)
  } finally {
    loading.value = false
  }
}

async function loadRecommendHouse() {
  recommendLoading.value = true
  try {
    const cityCode = location.value.cityCode
    await houseStore.fetchRecommend(cityCode)
    recommendList.value = houseStore.recommendList.slice(0, 6)
  } catch (error) {
    console.error('加载推荐房源失败', error)
  } finally {
    recommendLoading.value = false
  }
}

function handleSearch() {
  router.push({ path: '/house', query: { keyword: searchText.value } })
}

function handleQuickClick(item) {
  if (item.name === '收藏') {
    router.push('/profile')
  } else if (item.name === '咨询') {
    router.push('/news')
  } else {
    router.push('/house')
  }
}

function handleLocationChange(val) {
  console.log('位置已变更:', val)
  location.value = val
  // 保存位置到本地存储
  setLocation(val)
  // 实时更新推荐房源
  loadRecommendHouse()
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
  min-height: 100vh;
  background: #f5f5f5;
  padding-bottom: 60px;
}

// 顶部区域
.home-header {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 12px 16px;
  padding-top: calc(12px + env(safe-area-inset-top));
  position: sticky;
  top: 0;
  z-index: 10;

  .header-content {
    display: flex;
    align-items: center;
    gap: 12px;

    :deep(.van-search) {
      flex: 1;
      padding: 0;

      .van-search__content {
        background: rgba(255, 255, 255, 0.95);
      }
    }
  }
}

// 轮播图区域
.banner-wrapper {
  padding: 12px 16px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding-bottom: 20px;

  .banner {
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);

    .banner-image {
      width: 100%;
      height: 160px;
      object-fit: cover;
      display: block;
    }

    :deep(.van-swipe__indicators) {
      bottom: 12px;

      .van-swipe__indicator {
        width: 6px;
        height: 6px;
        background: rgba(255, 255, 255, 0.5);
        border-radius: 50%;

        &.van-swipe__indicator--active {
          width: 16px;
          border-radius: 3px;
          background: #fff;
        }
      }
    }
  }
}

// 快捷入口
.quick-entrance {
  background: #fff;
  padding: 20px 16px;
  margin-top: -12px;
  border-radius: 16px 16px 0 0;
  position: relative;
  z-index: 5;

  .entrance-grid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 12px;

    .entrance-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 8px;
      cursor: pointer;
      transition: transform 0.2s;

      &:active {
        transform: scale(0.95);
      }

      .entrance-icon {
        width: 48px;
        height: 48px;
        border-radius: 12px;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: box-shadow 0.2s;

        &:active {
          box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15);
        }
      }

      .entrance-name {
        font-size: 12px;
        color: #333;
      }
    }
  }
}

// 内容区块
.section {
  background: #fff;
  padding: 16px 0;
  margin-top: 12px;

  .section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 16px 12px;
    border-bottom: 1px solid #f5f5f5;

    .section-title-group {
      display: flex;
      flex-direction: column;
      gap: 2px;

      .section-title {
        font-size: 16px;
        font-weight: 600;
        color: #333;
      }

      .section-subtitle {
        font-size: 12px;
        color: #999;
      }
    }

    .section-more {
      display: flex;
      align-items: center;
      gap: 2px;
      color: #667eea;
      font-size: 13px;
      cursor: pointer;
      transition: opacity 0.2s;

      &:active {
        opacity: 0.7;
      }
    }
  }

  .house-list {
    padding: 12px 16px;
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 12px;
  }

  .news-list {
    padding: 12px 16px;
  }

  .recommend-loading {
    display: flex;
    justify-content: center;
    padding: 30px 0;
  }

  .empty-state {
    padding: 30px 16px;
    text-align: center;

    :deep(.van-empty) {
      margin-bottom: 16px;
    }
  }
}

// 加载状态
.loading {
  display: block;
  margin: 20px auto;
  text-align: center;
}

// 响应式适配
@media (min-width: 768px) {
  .home-header {
    .header-content {
      max-width: 720px;
      margin: 0 auto;
    }
  }

  .banner-wrapper {
    .banner {
      max-width: 720px;
      margin: 0 auto;

      .banner-image {
        height: 200px;
      }
    }
  }

  .quick-entrance {
    max-width: 720px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 0 0 16px 16px;
  }

  .section {
    max-width: 720px;
    margin-left: auto;
    margin-right: auto;
  }
}

@media (min-width: 1024px) {
  .home-header {
    .header-content {
      max-width: 960px;
    }
  }

  .banner-wrapper {
    .banner {
      max-width: 960px;

      .banner-image {
        height: 240px;
      }
    }
  }

  .quick-entrance {
    max-width: 960px;

    .entrance-grid {
      gap: 24px;

      .entrance-item {
        .entrance-icon {
          width: 56px;
          height: 56px;
        }

        .entrance-name {
          font-size: 13px;
        }
      }
    }
  }

  .section {
    max-width: 960px;
  }
}
</style>