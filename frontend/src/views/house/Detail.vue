<template>
  <div class="house-detail-page" v-if="house">
    <van-nav-bar title="房源详情" left-arrow @click-left="goBack" />

    <van-swipe :autoplay="3000" indicator-color="white" class="house-images">
      <van-swipe-item v-for="(img, index) in images" :key="index">
        <img :src="img" class="house-image" />
      </van-swipe-item>
    </van-swipe>

    <van-card class="house-info">
      <template #title>
        <div class="house-title">{{ house.title }}</div>
        <div class="house-price">
          <span class="price">{{ formatMoney(house.rent) }}</span>
          <span class="unit">/月</span>
        </div>
      </template>
      <template #desc>
        <div class="house-tags">
          <van-tag type="primary" size="small">{{ formatRoomInfo(house) }}</van-tag>
          <van-tag type="success" size="small">{{ formatDecorationType(house.decorationType) }}</van-tag>
          <van-tag type="warning" size="small">{{ formatHouseType(house.type) }}</van-tag>
        </div>
        <div class="house-meta">
          <span>{{ house.area }}㎡</span>
          <span>{{ house.floor }}/{{ house.totalFloor }}层</span>
          <span>{{ formatFloor(house.floor) }}</span>
        </div>
      </template>
    </van-card>

    <van-cell-group class="house-detail">
      <van-cell title="位置" :value="house.address" />
      <van-cell title="朝向" :value="house.direction" />
      <van-cell title="楼层" :value="`${house.floor}/${house.totalFloor}层`" />
      <van-cell title="面积" :value="`${house.area}㎡`" />
      <van-cell title="装修" :value="formatDecorationType(house.decorationType)" />
      <van-cell title="类型" :value="formatHouseType(house.type)" />
      <van-cell title="配套设施" :value="facilityText" />
      <van-cell title="发布时间" :value="formatDate(house.createTime)" />
    </van-cell-group>

    <van-card class="house-desc">
      <template #title>房源描述</template>
      <template #desc>{{ house.description }}</template>
    </van-card>

    <div class="bottom-bar safe-area-bottom">
      <van-button type="primary" round block @click="handleContact">联系房东</van-button>
    </div>

    <van-loading v-if="loading" class="loading" />
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { NavBar, Swipe, SwipeItem, Card, CellGroup, Cell, Button, Tag, Loading } from 'vant'
import { houseApi } from '@/api/house'
import { formatMoney, formatRoomInfo, formatDecorationType, formatHouseType, formatDate, formatFloor } from '@/utils/format'

const route = useRoute()
const router = useRouter()
const loading = ref(true)
const house = ref(null)

const images = computed(() => {
  if (!house.value?.images) return []
  return house.value.images.split(',')
})

const facilityText = computed(() => {
  if (!house.value?.facilities) return '暂无'
  const facilityList = house.value.facilities.split(',').map(f => {
    const facilityMap = {
      '1': '空调', '2': '暖气', '3': '热水器', '4': '洗衣机',
      '5': '冰箱', '6': '电视', '7': '宽带', '8': '电梯'
    }
    return facilityMap[f] || f
  })
  return facilityList.join('、')
})

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
  } finally {
    loading.value = false
  }
}

function goBack() {
  router.back()
}

function handleContact() {
  alert('联系房东功能开发中')
}
</script>

<style lang="scss" scoped>
.house-detail-page {
  min-height: 100vh;
  background-color: #f5f5f5;
}

.house-images {
  width: 100%;

  .house-image {
    width: 100%;
    height: 250px;
    object-fit: cover;
  }
}

.house-info {
  margin: 12px;
  border-radius: 12px;

  .house-title {
    font-size: 18px;
    font-weight: 600;
    color: #333;
    margin-bottom: 8px;
  }

  .house-price {
    .price {
      font-size: 24px;
      font-weight: 600;
      color: #ff4d4f;
    }
    .unit {
      font-size: 14px;
      color: #999;
      margin-left: 4px;
    }
  }

  .house-tags {
    margin: 8px 0;
  }

  .house-meta {
    display: flex;
    gap: 16px;
    font-size: 13px;
    color: #666;
    margin-top: 8px;
  }
}

.house-detail {
  margin: 12px;
  border-radius: 12px;
  overflow: hidden;
}

.house-desc {
  margin: 12px;
  border-radius: 12px;
}

.bottom-bar {
  position: fixed;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 12px;
  background-color: #fff;
  box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
}

.loading {
  padding: 40px;
}
</style>
