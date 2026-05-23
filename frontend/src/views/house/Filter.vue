<template>
  <div class="filter-page">
    <van-nav-bar title="筛选" left-arrow @click-left="goBack" right-text="重置" @click-right="resetFilter" />

    <van-cell-group>
      <van-cell title="区域" clickable @click="showRegionPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedRegion || '请选择区域' }}
        </template>
      </van-cell>

      <van-cell title="价格区间" clickable @click="showPricePicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ priceText }}
        </template>
      </van-cell>

      <van-cell title="房型" clickable @click="showRoomPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedRoom || '请选择房型' }}
        </template>
      </van-cell>

      <van-cell title="排序方式" clickable @click="showSortPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedSortText }}
        </template>
      </van-cell>
    </van-cell-group>

    <div class="filter-btn">
      <van-button type="primary" round block @click="confirmFilter">确定筛选</van-button>
    </div>

    <van-action-sheet
      v-model:show="showRegionPicker"
      title="选择区域"
      :actions="regionActions"
      cancel-text="取消"
      @select="handleRegionSelect"
    />

    <van-action-sheet
      v-model:show="showPricePicker"
      title="选择价格区间"
      :actions="priceActions"
      cancel-text="取消"
      @select="handlePriceSelect"
    />

    <van-action-sheet
      v-model:show="showRoomPicker"
      title="选择房型"
      :actions="roomActions"
      cancel-text="取消"
      @select="handleRoomSelect"
    />

    <van-action-sheet
      v-model:show="showSortPicker"
      title="选择排序"
      :actions="sortActions"
      cancel-text="取消"
      @select="handleSortSelect"
    />
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { NavBar, CellGroup, Cell, Button, ActionSheet, Icon } from 'vant'
import { regionApi } from '@/api/region'

const router = useRouter()

const showRegionPicker = ref(false)
const showPricePicker = ref(false)
const showRoomPicker = ref(false)
const showSortPicker = ref(false)

const selectedRegion = ref('')
const selectedRegionId = ref('')
const minRent = ref('')
const maxRent = ref('')
const selectedRoom = ref('')
const selectedSort = ref('createTime_desc')

const regions = ref([])

const regionActions = computed(() => [
  { name: '全部', value: '' },
  ...regions.value.map(r => ({ name: r.name, value: r.id.toString() }))
])

const priceActions = [
  { name: '全部', value: '' },
  { name: '2000以下', value: '0-2000' },
  { name: '2000-3000', value: '2000-3000' },
  { name: '3000-5000', value: '3000-5000' },
  { name: '5000以上', value: '5000-' }
]

const roomActions = [
  { name: '全部', value: '' },
  { name: '一居室', value: '1' },
  { name: '两居室', value: '2' },
  { name: '三居室', value: '3' },
  { name: '四居及以上', value: '4' }
]

const sortActions = [
  { name: '最新发布', value: 'createTime_desc' },
  { name: '价格最低', value: 'rent_asc' },
  { name: '价格最高', value: 'rent_desc' },
  { name: '面积最大', value: 'area_desc' }
]

const priceText = computed(() => {
  if (!minRent.value && !maxRent.value) return '请选择价格区间'
  if (minRent.value && maxRent.value) return `${minRent.value}-${maxRent.value}`
  if (minRent.value) return `${minRent.value}以上`
  return `${maxRent.value}以下`
})

const selectedSortText = computed(() => {
  const sortMap = {
    'createTime_desc': '最新发布',
    'rent_asc': '价格最低',
    'rent_desc': '价格最高',
    'area_desc': '面积最大'
  }
  return sortMap[selectedSort.value] || '最新发布'
})

onMounted(async () => {
  await loadRegions()
})

async function loadRegions() {
  try {
    const { data } = await regionApi.listRegions()
    regions.value = data
  } catch (error) {
    console.error('加载区域失败', error)
  }
}

function handleRegionSelect(action) {
  selectedRegionId.value = action.value
  selectedRegion.value = action.name
  showRegionPicker.value = false
}

function handlePriceSelect(action) {
  if (!action.value) {
    minRent.value = ''
    maxRent.value = ''
  } else {
    const range = action.value.split('-')
    minRent.value = range[0]
    maxRent.value = range[1] || ''
  }
  showPricePicker.value = false
}

function handleRoomSelect(action) {
  selectedRoom.value = action.value ? action.name : ''
  showRoomPicker.value = false
}

function handleSortSelect(action) {
  selectedSort.value = action.value
  showSortPicker.value = false
}

function resetFilter() {
  selectedRegion.value = ''
  selectedRegionId.value = ''
  minRent.value = ''
  maxRent.value = ''
  selectedRoom.value = ''
  selectedSort.value = 'createTime_desc'
}

function confirmFilter() {
  const query = {}
  if (selectedRegionId.value) query.regionId = selectedRegionId.value
  if (minRent.value) query.minRent = minRent.value
  if (maxRent.value) query.maxRent = maxRent.value
  if (selectedRoom.value) query.room = selectedRoom.value
  if (selectedSort.value) {
    const [field, order] = selectedSort.value.split('_')
    query.sortField = field
    query.sortOrder = order
  }
  
  router.push({ path: '/house', query })
}

function goBack() {
  router.back()
}
</script>

<style lang="scss" scoped>
.filter-page {
  min-height: 100vh;
  background-color: #f5f5f5;
  padding-bottom: 100px;
}

.filter-btn {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 16px;
  background-color: #fff;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
}
</style>
