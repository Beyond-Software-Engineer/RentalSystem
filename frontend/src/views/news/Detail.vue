<template>
  <div class="news-detail-page" v-if="news">
    <van-nav-bar title="资讯详情" left-arrow @click-left="goBack" />

    <div class="news-header">
      <h1 class="news-title">{{ news.title }}</h1>
      <div class="news-meta">
        <span class="author">{{ news.author }}</span>
        <span class="source">{{ news.source }}</span>
        <span class="time">{{ formatDate(news.publishTime) }}</span>
      </div>
    </div>

    <van-swipe v-if="news.coverImage" :autoplay="3000" indicator-color="white" class="news-cover">
      <van-swipe-item>
        <img :src="news.coverImage" class="cover-image" />
      </van-swipe-item>
    </van-swipe>

    <div class="news-content" v-html="news.content"></div>

    <div class="news-footer">
      <div class="view-count">
        <span>阅读 {{ news.viewCount || 0 }}</span>
      </div>
    </div>
  </div>

  <van-loading v-if="loading" class="loading" />
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { NavBar, Swipe, SwipeItem, Loading } from 'vant'
import { newsApi } from '@/api/news'

const route = useRoute()
const router = useRouter()
const loading = ref(true)
const news = ref(null)

function formatDate(date) {
  if (!date) return ''
  const d = new Date(date)
  return `${d.getFullYear()}-${String(d.getMonth() + 1).padStart(2, '0')}-${String(d.getDate()).padStart(2, '0')}`
}

function goBack() {
  router.back()
}

onMounted(async () => {
  try {
    const { data } = await newsApi.getNewsDetail(route.params.id)
    news.value = data
  } catch (error) {
    console.error('加载资讯详情失败', error)
  } finally {
    loading.value = false
  }
})
</script>

<style lang="scss" scoped>
.news-detail-page {
  min-height: 100vh;
  background-color: #fff;
  padding-bottom: 20px;
}

.news-header {
  padding: 16px;

  .news-title {
    font-size: 20px;
    font-weight: bold;
    color: #333;
    line-height: 1.5;
    margin-bottom: 12px;
  }

  .news-meta {
    display: flex;
    gap: 12px;
    font-size: 12px;
    color: #999;

    span {
      &::after {
        content: '·';
        margin-left: 12px;
      }

      &:last-child::after {
        display: none;
      }
    }
  }
}

.news-cover {
  width: 100%;
  height: 200px;

  .cover-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
}

.news-content {
  padding: 16px;
  font-size: 15px;
  line-height: 1.8;
  color: #333;

  :deep(p) {
    margin-bottom: 12px;
    text-indent: 2em;
  }

  :deep(img) {
    max-width: 100%;
    height: auto;
    display: block;
    margin: 12px auto;
  }
}

.news-footer {
  padding: 16px;
  text-align: center;

  .view-count {
    font-size: 12px;
    color: #999;
  }
}

.loading {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
</style>
