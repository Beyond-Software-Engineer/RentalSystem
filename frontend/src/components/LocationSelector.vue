<template>
  <div class="location-selector">
    <div class="location-trigger" @click="showPicker = true">
      <van-icon name="location" size="16" />
      <span class="location-text">{{ currentLocation }}</span>
      <van-icon name="arrow-down" size="12" />
    </div>

    <van-popup
      v-model:show="showPicker"
      position="bottom"
      round
      :safe-area-inset-bottom="true"
      :safe-area-inset-top="true"
      :z-index="9999"
      class="location-popup"
    >
      <div class="picker-header">
        <span class="picker-title">选择位置</span>
        <van-icon name="cross" size="20" @click="showPicker = false" class="picker-close" />
      </div>

      <div class="picker-tabs">
        <div
          v-for="(tab, index) in tabs"
          :key="index"
          class="picker-tab"
          :class="{ active: activeTab === index, disabled: !canClickTab(index) }"
          @click="handleTabClick(index)"
        >
          {{ getTabName(tab, index) }}
        </div>
      </div>

      <div class="picker-content">
        <div class="picker-scroll-view">
          <div class="picker-list-wrapper">
            <div v-if="currentList.length === 0" class="empty-tip">
              暂无数据
            </div>
            <div
              v-for="item in currentList"
              :key="item.code"
              class="picker-item"
              :class="{ selected: isSelected(item) }"
              @click="handleSelect(item)"
            >
              <span class="item-text">{{ item.name }}</span>
              <van-icon v-if="isSelected(item)" name="success" size="16" color="#667eea" />
            </div>
          </div>
        </div>
      </div>

      <div class="picker-footer">
        <van-button type="primary" block @click="confirmSelection">确认选择</van-button>
      </div>
    </van-popup>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted } from 'vue'
import { Icon, Popup, Button } from 'vant'
import locationData from '../assets/location.json'
import { getLocation, setLocation } from '../utils/storage'
import { useAppStore } from '../stores/app'

const props = defineProps({
  modelValue: {
    type: Object,
    default: () => ({
      province: '北京市',
      city: '北京市',
      district: '朝阳区',
      provinceCode: '110000',
      cityCode: '110100',
      districtCode: '110105'
    })
  }
})

const emit = defineEmits(['update:modelValue', 'change'])

const showPicker = ref(false)
const activeTab = ref(0)

const appStore = useAppStore()

// 默认位置信息
const defaultLocation = {
  province: '北京市',
  city: '北京市',
  district: '朝阳区',
  provinceCode: '110000',
  cityCode: '110100',
  districtCode: '110105'
}

// 从本地存储读取位置信息，如果不存在则使用默认值
const getDefaultLocation = () => {
  const storedLocation = getLocation()
  return storedLocation || defaultLocation
}

const storedLocation = getDefaultLocation()

const selectedProvince = ref(props.modelValue.province || storedLocation.province)
const selectedProvinceCode = ref(props.modelValue.provinceCode || storedLocation.provinceCode)
const selectedCity = ref(props.modelValue.city || storedLocation.city)
const selectedCityCode = ref(props.modelValue.cityCode || storedLocation.cityCode)
const selectedDistrict = ref(props.modelValue.district || storedLocation.district)
const selectedDistrictCode = ref(props.modelValue.districtCode || storedLocation.districtCode)

const tabs = ['省份', '城市', '区县']

const PROVINCE_CODES = ['11', '12', '31', '50', '81', '82']

const isSpecialRegion = (provinceCode) => {
  const prefix = provinceCode.substring(0, 2)
  return ['11', '12', '31', '50', '81', '82'].includes(prefix)
}

const provinces = computed(() => {
  return locationData.filter(item => item.city === 0 && item.area === 0)
})

const getCities = (provinceCode) => {
  const provincePrefix = provinceCode.substring(0, 2)
  
  if (isSpecialRegion(provinceCode)) {
    const cityNum = ['81', '82'].includes(provincePrefix) ? '00' : '01'
    return [{
      code: provincePrefix + cityNum + '00',
      name: locationData.find(p => p.code === provinceCode)?.name || '',
      province: provincePrefix,
      city: cityNum,
      area: 0,
      town: 0
    }]
  }
  
  return locationData.filter(item => 
    item.province === provincePrefix && 
    item.city !== 0 && 
    item.city !== '0' &&
    item.area === 0 &&
    item.town === 0
  )
}

const getDistricts = (cityCode) => {
  const provincePrefix = cityCode.substring(0, 2)
  const cityNum = cityCode.substring(2, 4)
  
  if (isSpecialRegion(cityCode)) {
    return locationData.filter(item => 
      item.province === provincePrefix && 
      (String(item.city) === cityNum || !item.city) &&
      item.area !== 0 &&
      item.area !== '0' &&
      item.town === 0
    )
  }
  
  return locationData.filter(item => 
    item.province === provincePrefix &&
    String(item.city) === cityNum &&
    item.area !== 0 &&
    item.area !== '0' &&
    item.town === 0
  )
}

const currentList = computed(() => {
  switch (activeTab.value) {
    case 0: return provinces.value
    case 1: return getCities(selectedProvinceCode.value)
    case 2: return getDistricts(selectedCityCode.value)
    default: return []
  }
})

const currentLocation = computed(() => {
  if (selectedDistrict.value) {
    return `${formatName(selectedProvince.value)} ${formatName(selectedCity.value)} ${selectedDistrict.value}`
  } else if (selectedCity.value) {
    return `${formatName(selectedProvince.value)} ${formatName(selectedCity.value)}`
  }
  return formatName(selectedProvince.value)
})

function formatName(name) {
  return name.replace(/市$/, '').replace(/省$/, '').replace(/自治区$/, '')
}

function getTabName(tab, index) {
  switch (index) {
    case 0: return selectedProvince.value ? formatName(selectedProvince.value) : tab
    case 1: return selectedCity.value ? formatName(selectedCity.value) : tab
    case 2: return selectedDistrict.value || tab
    default: return tab
  }
}

function canClickTab(index) {
  if (index === 0) return true
  if (index === 1) return !!selectedProvinceCode.value
  if (index === 2) return !!selectedCityCode.value
  return false
}

function handleTabClick(index) {
  if (canClickTab(index)) {
    activeTab.value = index
  }
}

function isSelected(item) {
  switch (activeTab.value) {
    case 0: return selectedProvinceCode.value === item.code
    case 1: return selectedCityCode.value === item.code
    case 2: return selectedDistrictCode.value === item.code
    default: return false
  }
}

function handleSelect(item) {
  switch (activeTab.value) {
    case 0:
      selectedProvince.value = item.name
      selectedProvinceCode.value = item.code
      selectedCity.value = ''
      selectedCityCode.value = ''
      selectedDistrict.value = ''
      selectedDistrictCode.value = ''
      activeTab.value = 1
      break
    case 1:
      selectedCity.value = item.name
      selectedCityCode.value = item.code
      selectedDistrict.value = ''
      selectedDistrictCode.value = ''
      activeTab.value = 2
      break
    case 2:
      selectedDistrict.value = item.name
      selectedDistrictCode.value = item.code
      break
  }
}

function confirmSelection() {
  if (!selectedProvince.value) return

  const result = {
    province: selectedProvince.value,
    city: selectedCity.value,
    district: selectedDistrict.value,
    provinceCode: selectedProvinceCode.value,
    cityCode: selectedCityCode.value,
    districtCode: selectedDistrictCode.value
  }
  
  // 将位置信息保存到本地存储
  setLocation(result)
  
  // 更新全局状态
  appStore.setLocation(result)
  
  emit('update:modelValue', result)
  emit('change', result)
  showPicker.value = false
}

watch(() => props.modelValue, (val) => {
  if (val) {
    selectedProvince.value = val.province || '北京市'
    selectedProvinceCode.value = val.provinceCode || '110000'
    selectedCity.value = val.city || '北京市'
    selectedCityCode.value = val.cityCode || '110100'
    selectedDistrict.value = val.district || '朝阳区'
    selectedDistrictCode.value = val.districtCode || '110105'
  }
}, { deep: true })
</script>

<style lang="scss" scoped>
.location-selector {
  display: inline-flex;

  .location-trigger {
    display: flex;
    align-items: center;
    gap: 4px;
    color: #fff;
    font-size: 14px;
    white-space: nowrap;
    cursor: pointer;
    padding: 4px 8px;
    border-radius: 6px;
    transition: all 0.2s;

    &:hover {
      background: rgba(255, 255, 255, 0.1);
    }

    &:active {
      transform: scale(0.96);
    }

    .location-text {
      max-width: 80px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
  }
}

.location-popup {
  width: 100%;
  height: 70vh;
  max-height: 70vh;
  position: fixed;
  top: auto;
  bottom: 5vh;
  left: 0;
  right: 0;
  transform: translate3d(0, 0, 0);
  display: flex;
  flex-direction: column;
  border-radius: 16px 16px 0 0;
  background: #fff;
  box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  margin-top: auto;

  .picker-header {
    flex-shrink: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px;
    border-bottom: 1px solid #f5f5f5;

    .picker-title {
      font-size: 16px;
      font-weight: 500;
      color: #333;
    }

    .picker-close {
      color: #999;
      cursor: pointer;
    }
  }

  .picker-tabs {
    flex-shrink: 0;
    display: flex;
    border-bottom: 1px solid #f5f5f5;

    .picker-tab {
      flex: 1;
      padding: 12px;
      text-align: center;
      font-size: 14px;
      color: #666;
      cursor: pointer;
      position: relative;
      transition: color 0.2s;

      &.active {
        color: #667eea;
        font-weight: 500;

        &::after {
          content: '';
          position: absolute;
          bottom: 0;
          left: 50%;
          transform: translateX(-50%);
          width: 24px;
          height: 2px;
          background: #667eea;
          border-radius: 1px;
        }
      }

      &.disabled {
        color: #ccc;
        cursor: not-allowed;
      }

      &:not(.disabled):active {
        opacity: 0.7;
      }
    }
  }

  .picker-content {
    flex: 1;
    flex-shrink: 1;
    min-height: 0;
    overflow: hidden;

    .picker-scroll-view {
      height: 100%;
      overflow-y: auto;
      -webkit-overflow-scrolling: touch;
      overscroll-behavior: contain;
    }

    .picker-list-wrapper {
      padding: 8px 0;
    }

    .empty-tip {
      text-align: center;
      color: #999;
      padding: 40px 0;
      font-size: 14px;
    }

    .picker-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 12px 16px;
      font-size: 14px;
      color: #333;
      cursor: pointer;
      transition: background 0.2s;

      &:active {
        background: #f5f5f5;
      }

      &.selected {
        color: #667eea;
        background: rgba(102, 126, 234, 0.1);
      }

      .item-text {
        flex: 1;
        text-align: left;
      }
    }
  }

  .picker-footer {
    flex-shrink: 0;
    padding: 12px 16px;
    padding-bottom: calc(12px + env(safe-area-inset-bottom));
    border-top: 1px solid #f5f5f5;
    background: #fff;
  }
}
</style>
