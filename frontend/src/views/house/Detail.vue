<template>
  <div class="house-detail-page" v-if="house">
    <van-nav-bar title="房源详情" left-arrow @click-left="goBack" />

    <!-- 图片轮播 -->
    <van-swipe :autoplay="3000" indicator-color="white" class="house-images">
      <van-swipe-item v-for="(img, index) in images" :key="index">
        <img :src="img" class="house-image" @error="handleImageError" />
      </van-swipe-item>
      <template #indicator>
        <div class="custom-indicator">{{ currentImageIndex + 1 }} / {{ images.length }}</div>
      </template>
    </van-swipe>

    <!-- 价格信息卡片 -->
    <van-card class="price-card">
      <template #tags>
        <div class="house-tags">
          <van-tag type="primary" size="medium">{{ formatRoomInfo(house) }}</van-tag>
          <van-tag type="success" size="medium">{{ formatDecorationType(house.decorationType) }}</van-tag>
          <van-tag type="warning" size="medium">{{ formatHouseType(house.houseType) }}</van-tag>
          <van-tag type="default" size="medium">{{ formatRentType(house.rentType) }}</van-tag>
        </div>
      </template>
      <template #num>
        <div class="price-section">
          <div class="price-main">
            <span class="price-label">租金</span>
            <span class="price-value">{{ formatMoney(house.rent) }}</span>
            <span class="price-unit">元/月</span>
          </div>
          <div class="price-deposit">
            <span class="deposit-label">押金：</span>
            <span class="deposit-value">{{ formatMoney(house.deposit) }}元</span>
          </div>
        </div>
      </template>
    </van-card>

    <!-- 基本信息区块 -->
    <van-cell-group inset class="info-section">
      <template #title>
        <div class="section-title">
          <van-icon name="orders-o" class="title-icon" />
          <span>基本信息</span>
        </div>
      </template>
      <van-cell title="房屋标题" :value="house.title" />
      <van-cell title="房屋类型" :value="formatHouseType(house.houseType)" />
      <van-cell title="租赁方式" :value="formatRentType(house.rentType)" />
      <van-cell title="装修情况" :value="formatDecorationType(house.decorationType)" />
    </van-cell-group>

    <!-- 房间配置区块 -->
    <van-cell-group inset class="info-section">
      <template #title>
        <div class="section-title">
          <van-icon name="hotel-o" class="title-icon" />
          <span>房间配置</span>
        </div>
      </template>
      <van-cell title="户型" :value="formatRoomInfo(house)" />
      <van-cell title="建筑面积" :value="`${house.area} ㎡`" />
      <van-cell title="所在楼层" :value="`${house.floor} / ${house.totalFloor} 层`" />
      <van-cell title="楼层位置" :value="formatFloor(house.floor, house.totalFloor)" />
    </van-cell-group>

    <!-- 位置信息区块 -->
    <van-cell-group inset class="info-section">
      <template #title>
        <div class="section-title">
          <van-icon name="location-o" class="title-icon" />
          <span>位置信息</span>
        </div>
      </template>
      <van-cell title="所在省份" :value="house.provinceName || '未知'" />
      <van-cell title="所在城市" :value="house.cityName || '未知'" />
      <van-cell title="所在区域" :value="house.districtName || house.regionName || '未知区域'" />
      <van-cell title="详细地址" :value="house.address" />
    </van-cell-group>

    <!-- 配套设施区块 -->
    <van-cell-group inset class="info-section">
      <template #title>
        <div class="section-title">
          <van-icon name="gift-o" class="title-icon" />
          <span>配套设施</span>
        </div>
      </template>
      <van-cell>
        <template #default>
          <div class="facility-scroll" v-if="house.facilityList && house.facilityList.length > 0">
            <div class="facility-list">
              <div v-for="facility in house.facilityList" :key="facility.id" class="facility-item">
                <van-icon :name="getFacilityIcon(facility.icon)" class="facility-icon" />
                <span class="facility-name">{{ facility.name }}</span>
              </div>
            </div>
          </div>
          <span v-else class="no-facility">暂无配套信息</span>
        </template>
      </van-cell>
    </van-cell-group>

    <!-- 房源描述区块 -->
    <van-cell-group inset class="info-section" v-if="house.description">
      <template #title>
        <div class="section-title">
          <van-icon name="description" class="title-icon" />
          <span>房源描述</span>
        </div>
      </template>
      <van-cell>
        <template #default>
          <div class="house-description">{{ house.description }}</div>
        </template>
      </van-cell>
    </van-cell-group>

        <!-- 底部操作栏 -->
    <div class="bottom-bar safe-area-bottom">
      <div class="action-buttons">
        <van-button type="default" plain icon="star-o" @click="handleCollect">收藏</van-button>
        <van-button type="primary" round block @click="handleContact">联系房东</van-button>
      </div>
    </div>

    <van-loading v-if="loading" class="loading" />
  </div>

  <!-- 空状态 -->
  <van-empty v-else-if="!loading" description="房源不存在或已下架" />
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { 
  NavBar, Swipe, SwipeItem, Card, CellGroup, Cell, 
  Button, Tag, Loading, Empty, Icon, showToast, showDialog 
} from 'vant'
import { houseApi } from '@/api/house'
import { formatMoney, formatRoomInfo, formatDecorationType, formatHouseType, formatDate, formatFloor, formatRentType } from '@/utils/format'

const route = useRoute()
const router = useRouter()
const loading = ref(true)
const house = ref(null)
const currentImageIndex = ref(0)

const images = computed(() => {
  if (!house.value) return []
  if (house.value.images && Array.isArray(house.value.images)) {
    return house.value.images
  }
  if (house.value.images && typeof house.value.images === 'string') {
    return house.value.images.split(',').filter(img => img.trim())
  }
  if (house.value.coverImage) {
    return [house.value.coverImage]
  }
  return ['/placeholder-house.png']
})

function handleImageError(e) {
  e.target.src = '/placeholder-house.png'
}

function getFacilityIcon(iconName) {
  const iconMap = {
    'icon-ac': 'tv-o',
    'icon-washer': 'orders-o',
    'icon-fridge': 'shop-o',
    'icon-tv': 'video-o',
    'icon-elevator': 'arrow-up',
    'default': 'coupon-o'
  }
  return iconMap[iconName] || iconMap['default']
}

onMounted(async () => {
  const id = route.params.id
  await loadHouseDetail(id)
})

async function loadHouseDetail(id) {
  loading.value = true
  try {
    const { data } = await houseApi.getHouseDetail(id)
    house.value = data
  } catch (error) {
    console.error('加载房源详情失败', error)
    showToast('加载失败，请重试')
  } finally {
    loading.value = false
  }
}

function goBack() {
  router.back()
}

function handleCollect() {
  showToast('收藏功能开发中')
}

function handleContact() {
  showDialog({
    title: '联系房东',
    message: '请联系客服热线：400-888-8888',
    confirmButtonText: '知道了'
  })
}
</script>

<style lang="scss" scoped>
.house-detail-page {
  min-height: 100vh;
  background-color: #f5f7fa;
  padding-bottom: 80px;
}

.house-images {
  width: 100%;
  position: relative;

  .house-image {
    width: 100%;
    height: 280px;
    object-fit: cover;
    background-color: #f0f0f0;
  }

  .custom-indicator {
    position: absolute;
    right: 16px;
    bottom: 16px;
    padding: 4px 12px;
    background-color: rgba(0, 0, 0, 0.5);
    color: #fff;
    font-size: 12px;
    border-radius: 12px;
  }
}

.price-card {
  margin: 12px;
  border-radius: 12px;
  overflow: hidden;

  :deep(.van-card__header) {
    padding: 16px;
  }

  :deep(.van-card__content) {
    padding: 0 16px 16px;
  }

  .house-tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    margin-bottom: 12px;
  }

  .price-section {
    display: flex;
    flex-direction: column;
    gap: 8px;

    .price-main {
      display: flex;
      align-items: baseline;

      .price-label {
        font-size: 14px;
        color: #666;
        margin-right: 8px;
      }

      .price-value {
        font-size: 28px;
        font-weight: 600;
        color: #ff4d4f;
      }

      .price-unit {
        font-size: 14px;
        color: #999;
        margin-left: 4px;
      }
    }

    .price-deposit {
      .deposit-label {
        font-size: 13px;
        color: #999;
      }

      .deposit-value {
        font-size: 14px;
        color: #666;
      }
    }
  }
}

.info-section {
  margin: 12px;
  border-radius: 12px;
  overflow: hidden;

  .section-title {
    display: flex;
    align-items: center;
    font-size: 16px;
    font-weight: 600;
    color: #333;
    padding: 12px 0;

    .title-icon {
      margin-right: 8px;
      font-size: 18px;
      color: #1989fa;
    }
  }

  :deep(.van-cell-group__title) {
    padding: 0 16px;
  }

  :deep(.van-cell) {
    padding: 14px 16px;
  }

  :deep(.van-cell__title) {
    color: #666;
    flex: 0 0 100px;
  }

  :deep(.van-cell__value) {
    color: #333;
    text-align: left;
  }
}

.facility-scroll {
  overflow-x: auto;
  overflow-y: hidden;
  -webkit-overflow-scrolling: touch;
  scrollbar-width: none;
  -ms-overflow-style: none;
  margin: 0 -16px;
  padding: 0 16px;

  &::-webkit-scrollbar {
    display: none;
  }

  .facility-list {
    display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    gap: 20px;
    padding: 8px 0;

    .facility-item {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 6px;
      flex-shrink: 0;
      min-width: 60px;

      .facility-icon {
        font-size: 26px;
        color: #1989fa;
      }

      .facility-name {
        font-size: 12px;
        color: #666;
        white-space: nowrap;
      }
    }
  }

  .no-facility {
    color: #999;
    font-size: 14px;
  }
}

.house-description {
  font-size: 14px;
  color: #333;
  line-height: 1.8;
  text-indent: 2em;
  padding: 8px 0;
}

.bottom-bar {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 12px 16px;
  background-color: #fff;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.08);
  z-index: 100;

  .action-buttons {
    display: flex;
    gap: 12px;

    :deep(.van-button) {
      flex: 1;
    }

    :deep(.van-button--primary) {
      flex: 2;
    }
  }
}

.loading {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}

:deep(.van-empty) {
  padding-top: 100px;
}
</style>
