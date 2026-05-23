<template>
  <van-cell class="news-card" clickable @click="handleClick">
    <template #icon>
      <img :src="news.coverImage || defaultImage" class="news-thumb" />
    </template>
    <template #title>
      <div class="news-title">{{ news.title }}</div>
    </template>
    <template #value>
      <div class="news-desc">{{ news.summary }}</div>
      <div class="news-time">{{ formatDate(news.createTime) }}</div>
    </template>
  </van-cell>
</template>

<script setup>
import { useRouter } from 'vue-router'
import { formatDate } from '@/utils/format'

const props = defineProps({
  news: {
    type: Object,
    required: true
  }
})

const router = useRouter()
const defaultImage = 'https://picsum.photos/160/120?random=20'

function handleClick() {
  router.push(`/news/${props.news.id}`)
}
</script>

<style lang="scss" scoped>
.news-card {
  :deep(.van-cell__icon) {
    margin-right: 12px;
  }

  .news-thumb {
    width: 80px;
    height: 60px;
    border-radius: 6px;
    object-fit: cover;
  }

  .news-title {
    font-size: 15px;
    font-weight: 500;
    color: #333;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    overflow: hidden;
    margin-bottom: 4px;
  }

  .news-desc {
    font-size: 12px;
    color: #999;
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 1;
    overflow: hidden;
    margin-bottom: 4px;
  }

  .news-time {
    font-size: 11px;
    color: #bbb;
  }
}
</style>
