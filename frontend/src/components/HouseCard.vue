<template>
  <van-card
    class="house-card"
    :price="formatMoney(house.rent)"
    :thumb="house.coverImage || defaultImage"
    @click="handleClick"
  >
    <template #title>
      <div class="card-title">{{ house.title }}</div>
    </template>
    <template #tags>
      <van-tag type="primary" size="small">{{ formatRoomInfo(house) }}</van-tag>
      <van-tag type="success" size="small">{{ formatDecorationType(house.decorationType) }}</van-tag>
    </template>
    <template #desc>
      <div class="card-desc">
        <span>{{ house.area }}㎡</span>
        <span class="floor">{{ house.floor }}/{{ house.totalFloor }}层</span>
      </div>
      <div class="card-address">{{ house.address }}</div>
    </template>
  </van-card>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { formatMoney, formatRoomInfo, formatDecorationType } from '@/utils/format'

const props = defineProps({
  house: {
    type: Object,
    required: true
  }
})

const router = useRouter()
const defaultImage = 'https://picsum.photos/240/180?random=10'

function handleClick() {
  router.push(`/house/${props.house.id}`)
}
</script>

<style lang="scss" scoped>
.house-card {
  margin-bottom: 12px;
  border-radius: 8px;
  overflow: hidden;

  :deep(.van-card__thumb) {
    width: 120px;
    height: 90px;
    object-fit: cover;
  }

  .card-title {
    font-size: 16px;
    font-weight: 600;
    color: #333;
    margin-bottom: 6px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    overflow: hidden;
  }

  .card-desc {
    display: flex;
    justify-content: space-between;
    color: #666;
    font-size: 12px;
    margin-top: 8px;
  }

  .card-address {
    color: #999;
    font-size: 12px;
    margin-top: 4px;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    overflow: hidden;
  }

  :deep(.van-card__price) {
    color: #ff4d4f;
    font-weight: 600;
    font-size: 16px;
  }

  :deep(.van-tag) {
    margin-right: 4px;
  }
}
</style>
