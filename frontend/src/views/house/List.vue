<template>
  <div class="house-list-page" ref="listContainer">
    <!-- 搜索栏 -->
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

    <!-- 筛选栏 -->
    <van-dropdown-menu>
      <van-dropdown-item v-model="filterParams.region" :options="regionOptions" title="区域" @change="handleFilterChange" />
      <van-dropdown-item v-model="filterParams.price" :options="priceOptions" title="价格" @change="handleFilterChange" />
      <van-dropdown-item v-model="filterParams.room" :options="roomOptions" title="房型" @change="handleFilterChange" />
    </van-dropdown-menu>

    <!-- 房源列表 -->
    <div class="house-content">
      <HouseCard v-for="house in houseList" :key="house.id" :house="house" />
    </div>

    <!-- 空状态 -->
    <div v-if="!loading && houseList.length === 0" class="empty">
      <van-empty description="暂无房源" />
    </div>

    <!-- 加载状态 -->
    <van-loading v-if="loading" class="loading" />
    <van-loading v-if="loadingMore" class="loading-more" />

    <!-- 分页导航 -->
    <div v-if="total > 0" class="pagination-container">
      <!-- 分页信息 -->
      <div class="pagination-info">
        <span>显示第 {{ startIndex }}-{{ endIndex }} 条，共 {{ total }} 条</span>
      </div>

      <!-- 分页控制 -->
      <div class="pagination-control">
        <!-- 每页条数选择 -->
        <PageSizeSelector
          v-model="pageSize"
          :options="pageSizeOptions"
          @change="handlePageSizeChange"
        />

        <!-- 分页按钮组 -->
        <div class="pagination-buttons">
          <van-button
            size="small"
            :disabled="pageNum <= 1"
            @click="handlePageChange(pageNum - 1)"
            class="page-btn"
          >
            <van-icon name="arrow-left" />上一页
          </van-button>

          <!-- 页码显示 -->
          <div class="page-numbers">
            <van-button
              v-for="page in visiblePages"
              :key="page"
              size="small"
              :type="page === pageNum ? 'primary' : 'default'"
              :plain="page !== pageNum"
              @click="handlePageChange(page)"
              class="page-number-btn"
            >
              {{ page }}
            </van-button>
          </div>

          <van-button
            size="small"
            :disabled="pageNum >= totalPages"
            @click="handlePageChange(pageNum + 1)"
            class="page-btn"
          >
            下一页<van-icon name="arrow" />
          </van-button>
        </div>

        <!-- 跳转到指定页 -->
        <div class="page-jump">
          <span>跳转到</span>
          <van-field
            v-model="jumpPage"
            type="digit"
            size="small"
            class="jump-input"
            @keyup.enter="handleJump"
          />
          <span>页</span>
          <van-button size="small" type="primary" @click="handleJump" class="jump-btn">确定</van-button>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onUnmounted } from 'vue'
import { Search, Empty, Loading, DropdownMenu, DropdownItem, Button, Icon, Field, showToast } from 'vant'
import HouseCard from '@/components/HouseCard.vue'
import PageSizeSelector from '@/components/PageSizeSelector.vue'
import { houseApi } from '@/api/house'
import { regionApi } from '@/api/region'

const searchText = ref('')
const loading = ref(true)
const loadingMore = ref(false)
const houseList = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)

const jumpPage = ref('')

// 分页配置
const pageSizeOptions = [
  { text: '10条/页', value: 10 },
  { text: '20条/页', value: 20 },
  { text: '50条/页', value: 50 }
]

// 筛选参数
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

// 计算属性
const totalPages = computed(() => Math.ceil(total.value / pageSize.value))
const startIndex = computed(() => Math.min((pageNum.value - 1) * pageSize.value + 1, total.value))
const endIndex = computed(() => Math.min(pageNum.value * pageSize.value, total.value))

// 计算可见页码（最多显示7个页码）
const visiblePages = computed(() => {
  const pages = []
  const total = totalPages.value
  const current = pageNum.value
  
  if (total <= 7) {
    for (let i = 1; i <= total; i++) {
      pages.push(i)
    }
  } else {
    // 始终显示第一页
    pages.push(1)
    
    if (current <= 4) {
      for (let i = 2; i <= 6; i++) {
        pages.push(i)
      }
    } else if (current >= total - 3) {
      for (let i = total - 5; i <= total - 1; i++) {
        pages.push(i)
      }
    } else {
      for (let i = current - 2; i <= current + 2; i++) {
        pages.push(i)
      }
    }
    
    // 始终显示最后一页
    if (total > 1) {
      pages.push(total)
    }
  }
  
  return pages
})

const listContainer = ref(null)

onMounted(async () => {
  await loadRegions()
  await loadHouseList()
})

onUnmounted(() => {
  // 清理
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

async function loadHouseList() {
  loading.value = true

  try {
    const params = {
      pageNum: pageNum.value,
      pageSize: pageSize.value,
      keyword: searchText.value,
      ...getFilterParams()
    }

    const { data } = await houseApi.pageHouse(params)
    houseList.value = data.records
    total.value = data.total
  } catch (error) {
    console.error('加载房源失败', error)
    showToast('加载失败，请重试')
  } finally {
    loading.value = false
  }
}

function getFilterParams() {
  const params = {}
  
  if (filterParams.value.region) {
    params.regionId = Number(filterParams.value.region)
  }
  
  if (filterParams.value.price) {
    const range = filterParams.value.price.split('-')
    if (range[0]) params.minRent = Number(range[0])
    if (range[1]) params.maxRent = Number(range[1])
  }
  
  if (filterParams.value.room) {
    if (filterParams.value.room === '4+') {
      params.minRoom = 4
    } else {
      params.room = Number(filterParams.value.room)
    }
  }
  
  return params
}

function handleFilterChange() {
  pageNum.value = 1
  loadHouseList()
  scrollToTop()
}

function handleSearch() {
  pageNum.value = 1
  loadHouseList()
  scrollToTop()
}

function handlePageChange(page) {
  if (page < 1 || page > totalPages.value || page === pageNum.value) return
  pageNum.value = page
  loadHouseList()
  scrollToTop()
}

function handlePageSizeChange(value) {
  pageSize.value = value
  pageNum.value = 1
  loadHouseList()
  scrollToTop()
}

function handleJump() {
  const page = parseInt(jumpPage.value)
  if (isNaN(page)) {
    showToast('请输入有效的页码')
    return
  }
  if (page < 1 || page > totalPages.value) {
    showToast(`页码范围：1-${totalPages.value}`)
    return
  }
  pageNum.value = page
  loadHouseList()
  scrollToTop()
  jumpPage.value = ''
}

function scrollToTop() {
  window.scrollTo({ top: 0, behavior: 'smooth' })
}
</script>

<style lang="scss" scoped>
.house-list-page {
  padding-bottom: 160px;
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

// 分页容器
.pagination-container {
  position: fixed;
  bottom: 50px;
  left: 0;
  right: 0;
  background: #fff;
  border-top: 1px solid #f0f0f0;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.05);
  z-index: 200;
  padding: 8px 12px;

  // 分页信息
  .pagination-info {
    text-align: center;
    font-size: 12px;
    color: #999;
    padding: 4px 0;
    border-bottom: 1px solid #f5f5f5;
    margin-bottom: 8px;
  }

  // 分页控制
  .pagination-control {
    display: flex;
    flex-direction: column;
    gap: 8px;

    // 分页按钮组
    .pagination-buttons {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;

      .page-btn {
        min-width: 70px;
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 2px;
      }

      .page-numbers {
        display: flex;
        gap: 4px;
        flex-wrap: nowrap;
        overflow-x: auto;
        max-width: 200px;

        .page-number-btn {
          min-width: 32px;
          padding: 0 8px;
        }
      }
    }

    // 页码选择器
    .page-size-menu {
      height: 28px;

      :deep(.van-dropdown-menu__bar) {
        height: 28px;
        position: relative;
        z-index: 201;
      }

      :deep(.van-dropdown-menu__title) {
        font-size: 12px;
        padding: 0 8px;
      }
      
      :deep(.van-dropdown-item) {
        position: fixed;
        z-index: 300;
      }
    }

    // 跳转功能
    .page-jump {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 6px;
      font-size: 12px;
      color: #666;
      margin-top: 4px;

      .jump-input {
        width: 50px;
        height: 28px;

        :deep(.van-field__control) {
          text-align: center;
          font-size: 12px;
        }
      }

      .jump-btn {
        height: 28px;
        padding: 0 10px;
        font-size: 12px;
      }
    }
  }
}

// 响应式适配
@media (min-width: 768px) {
  .pagination-container {
    .pagination-control {
      flex-direction: row;
      justify-content: space-between;
      align-items: center;

      .pagination-buttons {
        .page-numbers {
          max-width: none;
        }
      }

      .page-jump {
        margin-top: 0;
      }
    }
  }
}
</style>