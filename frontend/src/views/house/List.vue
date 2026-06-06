<template>
  <div class="house-list-page" ref="listContainer">
    <!-- 搜索栏和筛选按钮 -->
    <div class="search-bar-wrapper">
      <van-search
        v-model="searchText"
        placeholder="搜索房源"
        show-action
        @search="handleSearch"
      >
        <template #action>
          <div @click="handleSearch" class="search-btn">搜索</div>
        </template>
      </van-search>
      <div class="filter-wrapper" @click="openFilter">
        <van-icon name="filter-o" size="20" color="#1890ff" />
        <span class="filter-text">筛选</span>
      </div>
    </div>

    <!-- 筛选弹窗 -->
    <div v-if="showFilterPopup" class="custom-popup-overlay" @click.self="showFilterPopup = false">
      <div class="custom-popup-content">
        <div class="popup-header">
          <h3 class="popup-title">筛选</h3>
          <van-icon name="cross" class="popup-close" @click="showFilterPopup = false" />
        </div>
        <div class="popup-body">
          <Filter as-popup @confirm="handleFilterConfirm" @cancel="showFilterPopup = false" />
        </div>
      </div>
    </div>

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
import { useRoute, useRouter } from 'vue-router'
import { Search, Empty, Loading, Button, Icon, Field, Popup, showToast } from 'vant'
import HouseCard from '@/components/HouseCard.vue'
import PageSizeSelector from '@/components/PageSizeSelector.vue'
import Filter from './Filter.vue'
import { houseApi } from '@/api/house'

const route = useRoute()
const router = useRouter()

const searchText = ref('')
const loading = ref(true)
const loadingMore = ref(false)
const houseList = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)
const showFilterPopup = ref(false)

const jumpPage = ref('')

// 分页配置
const pageSizeOptions = [
  { text: '10条/页', value: 10 },
  { text: '20条/页', value: 20 },
  { text: '50条/页', value: 50 }
]

// 筛选参数
const filterParams = ref({
  regionId: '',
  minRent: '',
  maxRent: '',
  room: '',
  hall: '',
  kitchen: '',
  toilet: '',
  decorationType: '',
  rentType: '',
  houseType: '',
  sortField: '',
  sortOrder: ''
})

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
  // 处理从筛选页面传递的参数
  handleRouteParams()
  await loadHouseList()
})

onUnmounted(() => {
  // 清理
})

// 处理路由参数
function handleRouteParams() {
  const query = route.query
  
  if (query.regionId) {
    filterParams.value.regionId = query.regionId
  }
  if (query.minRent) {
    filterParams.value.minRent = query.minRent
  }
  if (query.maxRent) {
    filterParams.value.maxRent = query.maxRent
  }
  if (query.room) {
    filterParams.value.room = query.room
  }
  if (query.hall) {
    filterParams.value.hall = query.hall
  }
  if (query.kitchen) {
    filterParams.value.kitchen = query.kitchen
  }
  if (query.toilet) {
    filterParams.value.toilet = query.toilet
  }
  if (query.decorationType) {
    filterParams.value.decorationType = query.decorationType
  }
  if (query.rentType) {
    filterParams.value.rentType = query.rentType
  }
  if (query.houseType) {
    filterParams.value.houseType = query.houseType
  }
  if (query.sortField) {
    filterParams.value.sortField = query.sortField
  }
  if (query.sortOrder) {
    filterParams.value.sortOrder = query.sortOrder
  }
  if (query.keyword) {
    searchText.value = query.keyword
  }
}

function openFilter() {
  showFilterPopup.value = true
}

function handleFilterConfirm(params) {
  // 更新筛选参数
  filterParams.value = { ...params }
  showFilterPopup.value = false
  pageNum.value = 1
  loadHouseList()
  scrollToTop()
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
  
  // 处理三级区域信息
  if (filterParams.value.provinceCode) {
    params.provinceCode = filterParams.value.provinceCode
  }
  
  if (filterParams.value.cityCode) {
    params.cityCode = filterParams.value.cityCode
  }
  
  if (filterParams.value.districtCode) {
    params.districtCode = filterParams.value.districtCode
  }
  
  // 原有区域ID（保持兼容，仅当值为有效数字时才传递）
  if (filterParams.value.regionId && !isNaN(Number(filterParams.value.regionId))) {
    params.regionId = Number(filterParams.value.regionId)
  }
  
  if (filterParams.value.minRent) {
    params.minRent = Number(filterParams.value.minRent)
  }
  
  if (filterParams.value.maxRent) {
    params.maxRent = Number(filterParams.value.maxRent)
  }
  
  if (filterParams.value.room) {
    params.room = Number(filterParams.value.room)
  }
  
  if (filterParams.value.hall) {
    params.hall = Number(filterParams.value.hall)
  }
  
  if (filterParams.value.kitchen) {
    params.kitchen = Number(filterParams.value.kitchen)
  }
  
  if (filterParams.value.toilet) {
    params.toilet = Number(filterParams.value.toilet)
  }
  
  if (filterParams.value.decorationType) {
    params.decorationType = Number(filterParams.value.decorationType)
  }
  
  if (filterParams.value.rentType) {
    params.rentType = Number(filterParams.value.rentType)
  }
  
  if (filterParams.value.houseType) {
    params.houseType = Number(filterParams.value.houseType)
  }
  
  if (filterParams.value.sortField) {
    params.sortField = filterParams.value.sortField
  }
  
  if (filterParams.value.sortOrder) {
    params.sortOrder = filterParams.value.sortOrder
  }
  
  return params
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

.search-bar-wrapper {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px;
  background: #fff;
  
  :deep(.van-search) {
    flex: 1;
  }
  
  .filter-wrapper {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 8px 16px;
    background: #f5f5f5;
    border-radius: 8px;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
    }
    
    .filter-text {
      font-size: 12px;
      color: #1890ff;
      margin-top: 2px;
    }
  }
}

.house-content {
  padding: 0 12px;
}

/* 自定义弹窗样式 */
.custom-popup-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.5);
  z-index: 99999;
  display: flex;
  align-items: flex-end;
  justify-content: center;
}

.custom-popup-content {
  width: 100%;
  max-height: 80vh;
  background: #fff;
  border-radius: 16px 16px 0 0;
  overflow: hidden;
  animation: slideUp 0.3s ease;
}

@keyframes slideUp {
  from {
    transform: translateY(100%);
  }
  to {
    transform: translateY(0);
  }
}

.popup-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 20px;
  border-bottom: 1px solid #f0f0f0;
  background: #fff;
  position: sticky;
  top: 0;
  z-index: 10;
}

.popup-title {
  font-size: 18px;
  font-weight: bold;
  color: #333;
}

.popup-close {
  font-size: 24px;
  color: #999;
  padding: 8px;
}

.popup-body {
  max-height: calc(80vh - 60px);
  overflow-y: auto;
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

// 搜索栏操作区
.search-actions {
  display: flex;
  align-items: center;
  gap: 16px;
  
  .filter-btn {
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 6px 10px;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
    }
  }
  
  .search-btn {
    color: #1890ff;
    font-size: 16px;
    padding: 6px 10px;
    cursor: pointer;
    
    &:active {
      opacity: 0.7;
    }
  }
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