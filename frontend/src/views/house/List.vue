<template>
  <div class="house-list-page" ref="listContainer">
    <van-search
      v-model="searchText"
      placeholder="搜索房源"
      show-action
      @search="handleSearch"
    >
      <template #action>
        <div @click="handleSearch">搜索</div>
      </template>
    </van-search>

    <van-dropdown-menu>
      <van-dropdown-item v-model="filterParams.region" :options="regionOptions" title="区域" @change="handleFilterChange" />
      <van-dropdown-item v-model="filterParams.price" :options="priceOptions" title="价格" @change="handleFilterChange" />
      <van-dropdown-item v-model="filterParams.room" :options="roomOptions" title="房型" @change="handleFilterChange" />
    </van-dropdown-menu>

    <div class="house-content">
      <HouseCard v-for="house in houseList" :key="house.id" :house="house" />
    </div>

    <div v-if="!loading && houseList.length === 0" class="empty">
      <van-empty description="暂无房源" />
    </div>

    <div v-if="finished && houseList.length > 0" class="finished-text">
      没有更多了
    </div>

    <van-loading v-if="loading" class="loading" />
    <van-loading v-if="loadingMore" class="loading-more" />
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from 'vue'
import { Search, Empty, Loading, DropdownMenu, DropdownItem } from 'vant'
import HouseCard from '@/components/HouseCard.vue'
import { houseApi } from '@/api/house'
import { regionApi } from '@/api/region'

const searchText = ref('')
const loading = ref(true)
const loadingMore = ref(false)
const finished = ref(false)
const houseList = ref([])
const pageNum = ref(1)
const total = ref(0)

const filterParams = ref({
  region: '',
  price: '',
  room: ''
})

const priceOptions = [
  { text: '全部', value: '' },
  { text: '2000以下', value: '0-2000' },
  { text: '2000-3000', value: '2000-3000' },
  { text: '3000-5000', value: '3000-5000' },
  { text: '5000以上', value: '5000-99999' }
]

const roomOptions = [
  { text: '全部', value: '' },
  { text: '一居室', value: '1' },
  { text: '两居室', value: '2' },
  { text: '三居室', value: '3' },
  { text: '四居及以上', value: '4+' }
]

const regionOptions = ref([{ text: '全部', value: '' }])

// 滚动容器引用
const listContainer = ref(null)

// 滚动事件处理
function handleScroll() {
  if (!listContainer.value) return
  
  const { scrollTop, scrollHeight, clientHeight } = document.documentElement
  const isNearBottom = scrollTop + clientHeight >= scrollHeight - 100
  
  if (isNearBottom && !loading.value && !loadingMore.value && !finished.value) {
    loadMore()
  }
}

onMounted(async () => {
  await loadRegions()
  await loadHouseList()
  window.addEventListener('scroll', handleScroll)
})

onUnmounted(() => {
  window.removeEventListener('scroll', handleScroll)
})

async function loadRegions() {
  try {
    const { data } = await regionApi.listRegions()
    regionOptions.value = [
      { text: '全部', value: '' },
      ...data.map(r => ({ text: r.name, value: r.id.toString() }))
    ]
  } catch (error) {
    console.error('加载区域失败', error)
  }
}

async function loadHouseList(isLoadMore = false) {
  if (!isLoadMore) {
    loading.value = true
    pageNum.value = 1
    finished.value = false
    houseList.value = []
  } else {
    loadingMore.value = true
  }

  try {
    const params = {
      pageNum: pageNum.value,
      pageSize: 10,
      keyword: searchText.value,
      ...getFilterParams()
    }

    const { data } = await houseApi.pageHouse(params)
    
    if (isLoadMore) {
      houseList.value = [...houseList.value, ...data.records]
    } else {
      houseList.value = data.records
    }
    
    total.value = data.total
    
    if (houseList.value.length >= total.value) {
      finished.value = true
    }
    
    pageNum.value++
  } catch (error) {
    console.error('加载房源失败', error)
  } finally {
    loading.value = false
    loadingMore.value = false
  }
}

function getFilterParams() {
  const params = {}
  
  // 区域筛选
  if (filterParams.value.region) {
    params.regionId = Number(filterParams.value.region)
  }
  
  // 价格筛选
  if (filterParams.value.price) {
    const range = filterParams.value.price.split('-')
    if (range[0]) params.minRent = Number(range[0])
    if (range[1]) params.maxRent = Number(range[1])
  }
  
  // 房型筛选
  if (filterParams.value.room) {
    if (filterParams.value.room === '4+') {
      // 四居及以上：room >= 4
      params.minRoom = 4
    } else {
      params.room = Number(filterParams.value.room)
    }
  }
  
  return params
}

function handleFilterChange() {
  loadHouseList()
}

function handleSearch() {
  loadHouseList()
}

function loadMore() {
  if (!finished.value && !loading.value && !loadingMore.value) {
    loadingMore.value = true
    loadHouseList(true)
  }
}
</script>

<style lang="scss" scoped>
.house-list-page {
  padding-bottom: 60px;
}

.house-content {
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

.empty {
  padding: 60px 0;
}

.finished-text {
  text-align: center;
  padding: 12px;
  color: #999;
  font-size: 12px;
}
</style>
