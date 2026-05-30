<template>
  <div class="location-selector">
    <!-- 触发按钮 -->
    <div class="location-trigger" @click="showPicker = true">
      <van-icon name="location" size="16" />
      <span class="location-text">{{ currentLocation }}</span>
      <van-icon name="arrow-down" size="12" />
    </div>

    <!-- 选择弹窗 -->
    <van-popup v-model:show="showPicker" position="bottom" :safe-area-inset-bottom="true">
      <div class="picker-header">
        <span class="picker-title">选择位置</span>
        <van-icon name="cross" size="20" @click="showPicker = false" class="picker-close" />
      </div>

      <!-- 层级选择标签 -->
      <div class="picker-tabs">
        <div
          v-for="(tab, index) in tabs"
          :key="index"
          class="picker-tab"
          :class="{ active: activeTab === index }"
          @click="activeTab = index"
        >
          {{ tab }}
        </div>
      </div>

      <!-- 选择列表 -->
      <div class="picker-content">
        <Transition name="fade" mode="out-in">
          <div :key="activeTab" class="picker-list">
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
        </Transition>
      </div>

      <!-- 底部确认按钮 -->
      <div class="picker-footer">
        <van-button type="primary" block @click="confirmSelection">确认选择</van-button>
      </div>
    </van-popup>
  </div>
</template>

<script setup>
import { ref, computed, watch } from 'vue'
import { Icon, Popup, Button } from 'vant'

const props = defineProps({
  modelValue: {
    type: Object,
    default: () => ({
      province: '北京',
      city: '北京',
      district: '',
      provinceCode: '110000',
      cityCode: '110100',
      districtCode: ''
    })
  }
})

const emit = defineEmits(['update:modelValue', 'change'])

const showPicker = ref(false)
const activeTab = ref(0)

// 选择数据
const selectedProvince = ref(props.modelValue.province)
const selectedProvinceCode = ref(props.modelValue.provinceCode)
const selectedCity = ref(props.modelValue.city)
const selectedCityCode = ref(props.modelValue.cityCode)
const selectedDistrict = ref(props.modelValue.district)
const selectedDistrictCode = ref(props.modelValue.districtCode)

const tabs = ['省份', '城市', '区县']

// 模拟省市区数据
const provinces = [
  { code: '110000', name: '北京市' },
  { code: '120000', name: '天津市' },
  { code: '310000', name: '上海市' },
  { code: '320000', name: '江苏省' },
  { code: '330000', name: '浙江省' },
  { code: '340000', name: '安徽省' },
  { code: '350000', name: '福建省' },
  { code: '360000', name: '江西省' },
  { code: '370000', name: '山东省' },
  { code: '440000', name: '广东省' },
  { code: '450000', name: '广西壮族自治区' },
  { code: '460000', name: '海南省' },
  { code: '500000', name: '重庆市' },
  { code: '510000', name: '四川省' },
  { code: '520000', name: '贵州省' },
  { code: '530000', name: '云南省' },
  { code: '540000', name: '西藏自治区' },
  { code: '610000', name: '陕西省' },
  { code: '620000', name: '甘肃省' },
  { code: '630000', name: '青海省' }
]

const cities = {
  '110000': [
    { code: '110100', name: '北京市' }
  ],
  '120000': [
    { code: '120100', name: '天津市' }
  ],
  '310000': [
    { code: '310100', name: '上海市' }
  ],
  '320000': [
    { code: '320100', name: '南京市' },
    { code: '320200', name: '无锡市' },
    { code: '320300', name: '徐州市' },
    { code: '320400', name: '常州市' },
    { code: '320500', name: '苏州市' },
    { code: '320600', name: '南通市' }
  ],
  '330000': [
    { code: '330100', name: '杭州市' },
    { code: '330200', name: '宁波市' },
    { code: '330300', name: '温州市' },
    { code: '330400', name: '嘉兴市' },
    { code: '330500', name: '湖州市' },
    { code: '330600', name: '绍兴市' }
  ],
  '440000': [
    { code: '440100', name: '广州市' },
    { code: '440300', name: '深圳市' },
    { code: '440600', name: '佛山市' },
    { code: '440700', name: '江门市' },
    { code: '440800', name: '湛江市' },
    { code: '441900', name: '东莞市' }
  ],
  '500000': [
    { code: '500100', name: '万州区' },
    { code: '500200', name: '涪陵区' },
    { code: '500300', name: '渝中区' },
    { code: '500400', name: '大渡口区' },
    { code: '500500', name: '江北区' },
    { code: '500600', name: '沙坪坝区' }
  ]
}

const districts = {
  '110100': [
    { code: '110101', name: '东城区' },
    { code: '110102', name: '西城区' },
    { code: '110105', name: '朝阳区' },
    { code: '110106', name: '丰台区' },
    { code: '110107', name: '石景山区' },
    { code: '110108', name: '海淀区' },
    { code: '110109', name: '门头沟区' },
    { code: '110111', name: '房山区' },
    { code: '110112', name: '通州区' },
    { code: '110113', name: '顺义区' }
  ],
  '310100': [
    { code: '310101', name: '黄浦区' },
    { code: '310104', name: '徐汇区' },
    { code: '310105', name: '长宁区' },
    { code: '310106', name: '静安区' },
    { code: '310107', name: '普陀区' },
    { code: '310109', name: '虹口区' },
    { code: '310110', name: '杨浦区' },
    { code: '310115', name: '浦东新区' },
    { code: '310116', name: '金山区' },
    { code: '310117', name: '松江区' }
  ],
  '440300': [
    { code: '440303', name: '罗湖区' },
    { code: '440304', name: '福田区' },
    { code: '440305', name: '南山区' },
    { code: '440306', name: '宝安区' },
    { code: '440307', name: '龙岗区' },
    { code: '440308', name: '盐田区' },
    { code: '440309', name: '龙华区' },
    { code: '440310', name: '坪山区' },
    { code: '440311', name: '光明区' },
    { code: '440312', name: '大鹏新区' }
  ],
  '330100': [
    { code: '330102', name: '上城区' },
    { code: '330105', name: '拱墅区' },
    { code: '330106', name: '西湖区' },
    { code: '330108', name: '滨江区' },
    { code: '330109', name: '萧山区' },
    { code: '330110', name: '余杭区' },
    { code: '330111', name: '富阳区' },
    { code: '330112', name: '临安区' },
    { code: '330113', name: '临平区' },
    { code: '330114', name: '钱塘区' }
  ]
}

const currentList = computed(() => {
  switch (activeTab.value) {
    case 0:
      return provinces
    case 1:
      return cities[selectedProvinceCode.value] || []
    case 2:
      return districts[selectedCityCode.value] || []
    default:
      return []
  }
})

const currentLocation = computed(() => {
  if (selectedDistrict.value) {
    return `${selectedProvince.value.replace('市', '').replace('省', '').replace('自治区', '')} ${selectedCity.value.replace('市', '')} ${selectedDistrict.value}`
  } else if (selectedCity.value) {
    return `${selectedProvince.value.replace('市', '').replace('省', '').replace('自治区', '')} ${selectedCity.value.replace('市', '')}`
  }
  return selectedProvince.value
})

function isSelected(item) {
  switch (activeTab.value) {
    case 0:
      return selectedProvinceCode.value === item.code
    case 1:
      return selectedCityCode.value === item.code
    case 2:
      return selectedDistrictCode.value === item.code
    default:
      return false
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
  const result = {
    province: selectedProvince.value,
    city: selectedCity.value,
    district: selectedDistrict.value,
    provinceCode: selectedProvinceCode.value,
    cityCode: selectedCityCode.value,
    districtCode: selectedDistrictCode.value
  }
  emit('update:modelValue', result)
  emit('change', result)
  showPicker.value = false
}

watch(() => props.modelValue, (val) => {
  selectedProvince.value = val.province
  selectedProvinceCode.value = val.provinceCode
  selectedCity.value = val.city
  selectedCityCode.value = val.cityCode
  selectedDistrict.value = val.district
  selectedDistrictCode.value = val.districtCode
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
      max-width: 60px;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }
  }
}

.picker-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px;
  border-bottom: 1px solid #f5f5f5;

  .picker-title {
    font-size: 16px;
    font-weight: 600;
    color: #333;
  }

  .picker-close {
    color: #999;
    cursor: pointer;
    padding: 4px;

    &:active {
      color: #666;
    }
  }
}

.picker-tabs {
  display: flex;
  padding: 0 16px;
  border-bottom: 1px solid #f5f5f5;

  .picker-tab {
    flex: 1;
    padding: 12px 0;
    text-align: center;
    font-size: 14px;
    color: #666;
    cursor: pointer;
    position: relative;
    transition: color 0.2s;

    &.active {
      color: #667eea;

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
  }
}

.picker-content {
  max-height: 400px;
  overflow-y: auto;
  padding: 8px 0;

  .picker-list {
    padding: 0 16px;
  }

  .picker-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 12px 16px;
    margin: 0 -16px;
    cursor: pointer;
    transition: background 0.2s;

    &:hover {
      background: #f8f9fa;
    }

    &.selected {
      background: #f0f5ff;

      .item-text {
        color: #667eea;
        font-weight: 500;
      }
    }

    .item-text {
      font-size: 14px;
      color: #333;
    }
  }
}

.picker-footer {
  padding: 16px;
  border-top: 1px solid #f5f5f5;

  :deep(.van-button) {
    height: 44px;
    border-radius: 8px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
  }
}

/* 动画 */
.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

/* 响应式适配 */
@media (min-width: 768px) {
  :deep(.van-popup) {
    max-width: 600px;
    margin: 0 auto;
    border-radius: 16px 16px 0 0;
  }

  .location-selector {
    .location-trigger {
      font-size: 15px;
      padding: 6px 12px;

      .location-text {
        max-width: 80px;
      }
    }
  }

  .picker-content {
    max-height: 450px;
  }
}
</style>