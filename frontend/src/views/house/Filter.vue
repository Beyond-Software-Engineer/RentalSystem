<template>
  <div class="filter-page" :class="{ 'filter-popup': asPopup }">
    <van-nav-bar title="筛选" left-arrow @click-left="goBack" right-text="重置" @click-right="resetFilter" />

    <van-cell-group>
      <van-cell title="区域" clickable @click="showRegionPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          <span v-if="regionLoading" class="loading-text">加载中...</span>
          <span v-else-if="regionLoadError" class="error-text">加载失败</span>
          <span v-else>{{ selectedRegion || '不限' }}</span>
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

      <!-- 房间结构筛选 -->
      <van-cell title="室" clickable @click="showRoomPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedRoomText }}
        </template>
      </van-cell>

      <van-cell title="厅" clickable @click="showHallPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedHallText }}  
        </template>
      </van-cell>

      <van-cell title="厨" clickable @click="showKitchenPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedKitchenText }}  
        </template>
      </van-cell>

      <van-cell title="卫" clickable @click="showToiletPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedToiletText }}  
        </template>
      </van-cell>

      <!-- 装修类型筛选 -->
      <van-cell title="装修类型" clickable @click="showDecorationPicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedDecorationText }}  
        </template>
      </van-cell>

      <!-- 租赁方式筛选 -->
      <van-cell title="租赁方式" clickable @click="showRentTypePicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedRentTypeText }}  
        </template>
      </van-cell>

      <!-- 房屋类型筛选 -->
      <van-cell title="房屋类型" clickable @click="showHouseTypePicker = true">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
        <template #value>
          {{ selectedHouseTypeText }}  
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

    <!-- 区域选择 -->
    <van-action-sheet
      v-model:show="showRegionPicker"
      :title="regionPickerTitle"
      :actions="regionActions"
      cancel-text="取消"
      @select="handleRegionSelect"
    >
      <template #description>
        <div class="region-picker-desc">
          <van-icon name="location-o" size="14" color="#667eea" />
          <span>当前城市：{{ currentCityName || '定位中...' }}</span>
        </div>
      </template>
      <template #default>
        <div v-if="regionActions.length <= 1" class="region-empty-state">
          <van-empty
            :image="regionLoadError ? 'error' : 'search'"
            :description="regionLoadError ? '区域加载失败，请检查网络后重试' : '该城市暂无区域数据'"
          />
          <van-button 
            v-if="regionLoadError" 
            type="primary" 
            size="small" 
            round 
            @click="retryLoadRegions"
            class="retry-btn"
          >
            重新加载
          </van-button>
        </div>
      </template>
    </van-action-sheet>

    <!-- 价格选择 -->
    <van-action-sheet
      v-model:show="showPricePicker"
      title="选择价格区间"
      :actions="priceActions"
      cancel-text="取消"
      @select="handlePriceSelect"
    />

    <!-- 自定义价格区间弹窗 -->
    <van-dialog
      v-model:show="showCustomPriceDialog"
      title="自定义价格区间"
      show-cancel-button
      confirm-button-text="确定"
      cancel-button-text="取消"
      @confirm="submitCustomPrice"
      @cancel="closeCustomPriceDialog"
    >
      <div class="custom-price-content">
        <div class="price-input-row">
          <div class="price-input-item">
            <label>最低价格（元/月）</label>
            <van-field
              v-model="customMinRent"
              type="digit"
              placeholder="请输入最低价格"
              maxlength="7"
              @input="validateCustomPrice"
            />
          </div>
          <span class="price-separator">-</span>
          <div class="price-input-item">
            <label>最高价格（元/月）</label>
            <van-field
              v-model="customMaxRent"
              type="digit"
              placeholder="请输入最高价格"
              maxlength="7"
              @input="validateCustomPrice"
            />
          </div>
        </div>
        <div v-if="priceError" class="price-error">
          <van-icon name="warning-o" class="error-icon" />
          <span>{{ priceError }}</span>
        </div>
        <div class="price-tip">
          <van-icon name="info-o" class="tip-icon" />
          <span>价格范围：{{ PRICE_MIN }} - {{ PRICE_MAX.toLocaleString() }} 元/月</span>
        </div>
      </div>
    </van-dialog>

    <!-- 室数量选择 -->
    <van-action-sheet
      v-model:show="showRoomPicker"
      title="选择室数量"
      :actions="roomCountActions"
      cancel-text="取消"
      @select="handleRoomSelect"
    />

    <!-- 厅数量选择 -->
    <van-action-sheet
      v-model:show="showHallPicker"
      title="选择厅数量"
      :actions="hallCountActions"
      cancel-text="取消"
      @select="handleHallSelect"
    />

    <!-- 厨数量选择 -->
    <van-action-sheet
      v-model:show="showKitchenPicker"
      title="选择厨数量"
      :actions="kitchenCountActions"
      cancel-text="取消"
      @select="handleKitchenSelect"
    />

    <!-- 卫数量选择 -->
    <van-action-sheet
      v-model:show="showToiletPicker"
      title="选择卫数量"
      :actions="toiletCountActions"
      cancel-text="取消"
      @select="handleToiletSelect"
    />

    <!-- 装修类型选择 -->
    <van-action-sheet
      v-model:show="showDecorationPicker"
      title="选择装修类型"
      :actions="decorationActions"
      cancel-text="取消"
      @select="handleDecorationSelect"
    />

    <!-- 租赁方式选择 -->
    <van-action-sheet
      v-model:show="showRentTypePicker"
      title="选择租赁方式"
      :actions="rentTypeActions"
      cancel-text="取消"
      @select="handleRentTypeSelect"
    />

    <!-- 房屋类型选择 -->
    <van-action-sheet
      v-model:show="showHouseTypePicker"
      title="选择房屋类型"
      :actions="houseTypeActions"
      cancel-text="取消"
      @select="handleHouseTypeSelect"
    />

    <!-- 排序选择 -->
    <van-action-sheet
      v-model:show="showSortPicker"
      title="选择排序方式"
      :actions="sortActions"
      cancel-text="取消"
      @select="handleSortSelect"
    />
  </div>
</template>

<script setup>
import { ref, computed, onMounted, watch } from 'vue'
import { useRouter } from 'vue-router'
import { NavBar, CellGroup, Cell, Button, ActionSheet, Icon, Dialog, Toast, Empty, showToast, showFailToast } from 'vant'
import { regionApi } from '@/api/region'
import { getLocation } from '@/utils/storage'
import { useAppStore } from '@/stores/app'

const props = defineProps({
  asPopup: {
    type: Boolean,
    default: false
  }
})

const emit = defineEmits(['confirm', 'cancel'])

const router = useRouter()
const appStore = useAppStore()

const showRegionPicker = ref(false)
const showPricePicker = ref(false)
const showCustomPriceDialog = ref(false)
const showRoomPicker = ref(false)
const showHallPicker = ref(false)
const showKitchenPicker = ref(false)
const showToiletPicker = ref(false)
const showDecorationPicker = ref(false)
const showRentTypePicker = ref(false)
const showHouseTypePicker = ref(false)
const showSortPicker = ref(false)

const selectedRegion = ref('')
const selectedRegionId = ref('')
// 完整的三级区域信息
const locationInfo = ref({
  province: '',
  provinceCode: '',
  city: '',
  cityCode: '',
  district: '',
  districtCode: ''
})
const minRent = ref('')
const maxRent = ref('')

// 区域加载状态
const regionLoading = ref(false)
const regionLoadError = ref(false)
const currentCityName = ref('')
const currentCityCode = ref('110100')

// 自定义价格区间输入
const customMinRent = ref('')
const customMaxRent = ref('')
const priceError = ref('')
const lastSubmitTime = ref(0)

// 价格限制常量
const PRICE_MIN = 0
const PRICE_MAX = 1000000
const SUBMIT_INTERVAL = 1000
const selectedRoom = ref(null)
const selectedHall = ref(null)
const selectedKitchen = ref(null)
const selectedToilet = ref(null)
const selectedDecoration = ref(null)
const selectedRentType = ref(null)
const selectedHouseType = ref(null)
const selectedSort = ref('createTime_desc')

const regions = ref([])

// 生成0-5的选项，并添加"其他"选项
const generateCountActions = (label) => {
  const actions = [{ name: '不限', value: null }]
  for (let i = 0; i <= 5; i++) {
    actions.push({ name: `${i}${label}`, value: i })
  }
  actions.push({ name: '其他', value: -1 })
  return actions
}

const regionActions = computed(() => [
  { name: '不限', value: '' },
  ...regions.value.map(r => ({ name: r.name, value: r.code || r.id.toString() }))
])

const priceActions = [
  { name: '不限', value: '' },
  { name: '2000以下', value: '0-2000' },
  { name: '2000-3000', value: '2000-3000' },
  { name: '3000-5000', value: '3000-5000' },
  { name: '5000以上', value: '5000-' },
  { name: '自定义', value: 'custom' }
]

const roomCountActions = generateCountActions('室')
const hallCountActions = generateCountActions('厅')
const kitchenCountActions = generateCountActions('厨')
const toiletCountActions = generateCountActions('卫')

// 装修类型选项（1-毛坯，2-简装，3-精装）
const decorationActions = [
  { name: '不限', value: null },
  { name: '毛坯', value: 1 },
  { name: '简装', value: 2 },
  { name: '精装', value: 3 }
]

// 租赁方式选项（1-整租，2-合租）
const rentTypeActions = [
  { name: '不限', value: null },
  { name: '整租', value: 1 },
  { name: '合租', value: 2 }
]

// 房屋类型选项（1-住宅，2-公寓，3-商铺，4-写字楼）
const houseTypeActions = [
  { name: '不限', value: null },
  { name: '住宅', value: 1 },
  { name: '公寓', value: 2 },
  { name: '商铺', value: 3 },
  { name: '写字楼', value: 4 }
]

const sortActions = [
  { name: '最新发布', value: 'createTime_desc' },
  { name: '价格最低', value: 'rent_asc' },
  { name: '价格最高', value: 'rent_desc' },
  { name: '面积最大', value: 'area_desc' }
]

const priceText = computed(() => {
  if (!minRent.value && !maxRent.value) return '不限'
  if (minRent.value && maxRent.value) return `${minRent.value}-${maxRent.value}`
  if (minRent.value) return `${minRent.value}以上`
  return `${maxRent.value}以下`
})

const selectedRoomText = computed(() => {
  if (selectedRoom.value === null) return '不限'
  if (selectedRoom.value === -1) return '其他'
  return `${selectedRoom.value}室`
})

const selectedHallText = computed(() => {
  if (selectedHall.value === null) return '不限'
  if (selectedHall.value === -1) return '其他'
  return `${selectedHall.value}厅`
})

const selectedKitchenText = computed(() => {
  if (selectedKitchen.value === null) return '不限'
  if (selectedKitchen.value === -1) return '其他'
  return `${selectedKitchen.value}厨`
})

const selectedToiletText = computed(() => {
  if (selectedToilet.value === null) return '不限'
  if (selectedToilet.value === -1) return '其他'
  return `${selectedToilet.value}卫`
})

const selectedDecorationText = computed(() => {
  if (selectedDecoration.value === null) return '不限'
  const map = { 1: '毛坯', 2: '简装', 3: '精装' }
  return map[selectedDecoration.value] || '请选择'
})

const selectedRentTypeText = computed(() => {
  if (selectedRentType.value === null) return '不限'
  const map = { 1: '整租', 2: '合租' }
  return map[selectedRentType.value] || '请选择'
})

const selectedHouseTypeText = computed(() => {
  if (selectedHouseType.value === null) return '不限'
  const map = { 1: '住宅', 2: '公寓', 3: '商铺', 4: '写字楼' }
  return map[selectedHouseType.value] || '请选择'
})

// 区域选择弹窗标题
const regionPickerTitle = computed(() => {
  if (regionLoading.value) return '加载中...'
  if (regionLoadError.value) return '加载失败'
  return `选择区域 (${currentCityName.value || '未知城市'})`
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
  // 获取位置信息（优先从全局状态，其次从本地存储）
  const location = appStore.currentLocation || getLocation()
  if (location && location.cityCode) {
    currentCityCode.value = location.cityCode
    currentCityName.value = location.city || ''
    
    // 初始化完整的三级区域信息
    updateLocationInfo(location)
  }
  await loadRegions(currentCityCode.value)
  
  // 监听全局位置变化
  watch(() => appStore.currentLocation, async (newLocation) => {
    if (newLocation && newLocation.cityCode && newLocation.cityCode !== currentCityCode.value) {
      currentCityCode.value = newLocation.cityCode
      currentCityName.value = newLocation.city || ''
      
      // 更新完整的三级区域信息
      updateLocationInfo(newLocation)
      
      await loadRegions(currentCityCode.value)
      // 重置已选择的区域，因为城市变了
      selectedRegion.value = ''
      selectedRegionId.value = ''
    }
  }, { deep: true })
})

/**
 * 更新完整的三级区域信息
 * 
 * @param {Object} location - 位置对象
 */
function updateLocationInfo(location) {
  locationInfo.value = {
    province: location.province || '',
    provinceCode: location.provinceCode || '',
    city: location.city || '',
    cityCode: location.cityCode || '',
    district: '',
    districtCode: ''
  }
}

/**
 * 根据城市编码加载区域列表
 *
 * @param {string} cityCode - 城市编码
 */
async function loadRegions(cityCode) {
  regionLoading.value = true
  regionLoadError.value = false
  
  try {
    const { data } = await regionApi.listRegionsByCity(cityCode)
    regions.value = data || []
    
    // 不显示Toast提示，只更新UI状态
    if (regions.value.length === 0) {
      console.warn('该城市暂无区域数据')
    }
  } catch (error) {
    console.error('加载区域失败', error)
    regionLoadError.value = true
    regions.value = []
    
    // 如果按城市查询失败，回退到查询所有区域
    try {
      const { data } = await regionApi.listRegions()
      regions.value = data || []
      if (regions.value.length > 0) {
        regionLoadError.value = false
      }
    } catch (fallbackError) {
      console.error('回退加载区域也失败', fallbackError)
    }
  } finally {
    regionLoading.value = false
  }
}

/**
 * 重新加载区域列表
 */
async function retryLoadRegions() {
  showToast('正在重新加载...')
  await loadRegions(currentCityCode.value)
}

function handleRegionSelect(action) {
  selectedRegionId.value = action.value
  selectedRegion.value = action.name
  showRegionPicker.value = false
  
  // 更新区县级区域信息，自动保留上级省市级信息
  locationInfo.value = {
    ...locationInfo.value,
    district: action.name,
    districtCode: action.value
  }
  
  console.log('已选择区域:', locationInfo.value)
}

function handlePriceSelect(action) {
  if (!action.value) {
    minRent.value = ''
    maxRent.value = ''
    showPricePicker.value = false
  } else if (action.value === 'custom') {
    // 打开自定义价格弹窗
    customMinRent.value = minRent.value || ''
    customMaxRent.value = maxRent.value || ''
    priceError.value = ''
    showPricePicker.value = false
    showCustomPriceDialog.value = true
  } else {
    const range = action.value.split('-')
    minRent.value = range[0]
    maxRent.value = range[1] || ''
    showPricePicker.value = false
  }
}

// 自定义价格验证
function validateCustomPrice() {
  const min = customMinRent.value.trim()
  const max = customMaxRent.value.trim()
  
  // 检查输入是否为空（允许只填一个）
  if (!min && !max) {
    priceError.value = '请至少输入一个价格'
    return false
  }
  
  // 验证最小值
  if (min) {
    if (!/^\d+$/.test(min)) {
      priceError.value = '最低价格必须为数字'
      return false
    }
    const minNum = parseInt(min)
    if (minNum < PRICE_MIN) {
      priceError.value = `最低价格不能小于 ${PRICE_MIN}`
      return false
    }
    if (minNum > PRICE_MAX) {
      priceError.value = `最低价格不能大于 ${PRICE_MAX.toLocaleString()}`
      return false
    }
  }
  
  // 验证最大值
  if (max) {
    if (!/^\d+$/.test(max)) {
      priceError.value = '最高价格必须为数字'
      return false
    }
    const maxNum = parseInt(max)
    if (maxNum < PRICE_MIN) {
      priceError.value = `最高价格不能小于 ${PRICE_MIN}`
      return false
    }
    if (maxNum > PRICE_MAX) {
      priceError.value = `最高价格不能大于 ${PRICE_MAX.toLocaleString()}`
      return false
    }
  }
  
  // 验证最小值小于最大值
  if (min && max) {
    const minNum = parseInt(min)
    const maxNum = parseInt(max)
    if (minNum >= maxNum) {
      priceError.value = '最低价格必须小于最高价格'
      return false
    }
  }
  
  priceError.value = ''
  return true
}

// 提交自定义价格
function submitCustomPrice() {
  // 输入频率限制
  const now = Date.now()
  if (now - lastSubmitTime.value < SUBMIT_INTERVAL) {
    showFailToast('操作过于频繁，请稍后再试')
    return
  }
  
  if (!validateCustomPrice()) {
    return
  }
  
  minRent.value = customMinRent.value
  maxRent.value = customMaxRent.value
  lastSubmitTime.value = now
  showCustomPriceDialog.value = false
  showToast('设置成功')
}

// 关闭自定义价格弹窗
function closeCustomPriceDialog() {
  showCustomPriceDialog.value = false
  priceError.value = ''
}

// 监听输入变化，实时验证
watch([customMinRent, customMaxRent], () => {
  if (customMinRent.value || customMaxRent.value) {
    validateCustomPrice()
  }
})

function handleRoomSelect(action) {
  selectedRoom.value = action.value
  showRoomPicker.value = false
}

function handleHallSelect(action) {
  selectedHall.value = action.value
  showHallPicker.value = false
}

function handleKitchenSelect(action) {
  selectedKitchen.value = action.value
  showKitchenPicker.value = false
}

function handleToiletSelect(action) {
  selectedToilet.value = action.value
  showToiletPicker.value = false
}

function handleDecorationSelect(action) {
  selectedDecoration.value = action.value
  showDecorationPicker.value = false
}

function handleRentTypeSelect(action) {
  selectedRentType.value = action.value
  showRentTypePicker.value = false
}

function handleHouseTypeSelect(action) {
  selectedHouseType.value = action.value
  showHouseTypePicker.value = false
}

function handleSortSelect(action) {
  selectedSort.value = action.value
  showSortPicker.value = false
}

function resetFilter() {
  selectedRegion.value = ''
  selectedRegionId.value = ''
  // 重置区县级信息，保留省市级信息
  locationInfo.value = {
    ...locationInfo.value,
    district: '',
    districtCode: ''
  }
  minRent.value = ''
  maxRent.value = ''
  selectedRoom.value = null
  selectedHall.value = null
  selectedKitchen.value = null
  selectedToilet.value = null
  selectedDecoration.value = null
  selectedRentType.value = null
  selectedHouseType.value = null
  selectedSort.value = 'createTime_desc'
}

function confirmFilter() {
  const query = {}
  
  // 添加完整的三级区域信息
  if (locationInfo.value.provinceCode) query.provinceCode = locationInfo.value.provinceCode
  if (locationInfo.value.cityCode) query.cityCode = locationInfo.value.cityCode
  if (locationInfo.value.districtCode) query.districtCode = locationInfo.value.districtCode
  
  // 原有区域ID（保持兼容）
  if (selectedRegionId.value) query.regionId = selectedRegionId.value
  
  if (minRent.value) query.minRent = minRent.value
  if (maxRent.value) query.maxRent = maxRent.value
  if (selectedRoom.value !== null) query.room = selectedRoom.value
  if (selectedHall.value !== null) query.hall = selectedHall.value
  if (selectedKitchen.value !== null) query.kitchen = selectedKitchen.value
  if (selectedToilet.value !== null) query.toilet = selectedToilet.value
  if (selectedDecoration.value !== null) query.decorationType = selectedDecoration.value
  if (selectedRentType.value !== null) query.rentType = selectedRentType.value
  if (selectedHouseType.value !== null) query.houseType = selectedHouseType.value
  if (selectedSort.value) {
    const [field, order] = selectedSort.value.split('_')
    query.sortField = field
    query.sortOrder = order
  }
  
  if (props.asPopup) {
    emit('confirm', query)
  } else {
    router.push({ path: '/house', query })
  }
}

function goBack() {
  if (props.asPopup) {
    emit('cancel')
  } else {
    router.back()
  }
}
</script>

<style lang="scss" scoped>
.filter-page {
  min-height: 100vh;
  background-color: #f5f5f5;
  padding-bottom: 100px;
  
  &.filter-popup {
    min-height: 100%;
    height: 100%;
    overflow-y: auto;
  }
}

.filter-btn {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 16px;
  background-color: #fff;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
  z-index: 100;
  
  .filter-popup & {
    position: sticky;
  }
}

// 自定义价格弹窗样式
.custom-price-content {
  padding: 10px 0;
}

.price-input-row {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 10px;
}

.price-input-item {
  flex: 1;
  
  label {
    display: block;
    font-size: 12px;
    color: #666;
    margin-bottom: 8px;
  }
  
  :deep(.van-field) {
    border-radius: 6px;
    border: 1px solid #ebedf0;
  }
}

.price-separator {
  font-size: 20px;
  color: #999;
  padding: 0 5px;
}

.price-error {
  display: flex;
  align-items: center;
  gap: 6px;
  color: #ee0a24;
  font-size: 12px;
  margin-top: 12px;
  padding: 8px 12px;
  background-color: #fff2f0;
  border-radius: 4px;
  
  .error-icon {
    font-size: 14px;
  }
}

.price-tip {
  display: flex;
  align-items: center;
  gap: 6px;
  color: #999;
  font-size: 12px;
  margin-top: 12px;
  padding: 8px 12px;
  background-color: #f7f8fa;
  border-radius: 4px;
  
  .tip-icon {
    font-size: 14px;
  }
}

// 区域选择相关样式
.loading-text {
  color: #999;
  font-size: 13px;
}

.error-text {
  color: #ee0a24;
  font-size: 13px;
}

.region-picker-desc {
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 4px;
  padding: 8px 16px;
  font-size: 13px;
  color: #666;
  background-color: #f7f8fa;
  
  span {
    color: #667eea;
    font-weight: 500;
  }
}

.region-empty-state {
  padding: 20px 0;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 12px;
  
  .retry-btn {
    margin-top: 8px;
  }
}
</style>