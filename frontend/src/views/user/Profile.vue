<template>
  <div class="profile-page">
    <van-nav-bar title="个人中心" />

    <van-card class="user-card">
      <template #title>
        <van-image class="avatar" :src="userInfo?.avatar || defaultAvatar" round />
        <div class="user-info">
          <div class="username">{{ userInfo?.username || '未登录' }}</div>
          <div class="phone">{{ userInfo?.phone }}</div>
        </div>
      </template>
      <template #extra>
        <van-button size="small" type="primary" @click="goLogin" v-if="!isLoggedIn">登录</van-button>
        <van-button size="small" type="warning" @click="handleLogout" v-else>退出</van-button>
      </template>
    </van-card>

    <van-cell-group v-if="isLoggedIn" class="menu-group">
      <van-cell title="我的收藏" clickable @click="handleFavorite">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="浏览记录" clickable @click="handleHistory">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="个人设置" clickable @click="handleSettings">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
    </van-cell-group>

    <van-cell-group v-if="isLoggedIn" class="menu-group">
      <van-cell title="修改资料" clickable @click="handleEditProfile">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="意见反馈" clickable @click="handleFeedback">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
      <van-cell title="关于我们" clickable @click="handleAbout">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
    </van-cell-group>

    <van-cell-group v-if="!isLoggedIn" class="menu-group">
      <van-cell title="登录享更多权益" clickable @click="goLogin">
        <template #right-icon>
          <van-icon name="arrow" />
        </template>
      </van-cell>
    </van-cell-group>
  </div>
</template>

<script setup>
import { onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { showToast, NavBar, Card, CellGroup, Cell, Button, Image as VanImage, Icon } from 'vant'
import { useUserStore } from '@/stores/user'

const router = useRouter()
const userStore = useUserStore()

const defaultAvatar = 'https://picsum.photos/100/100?random=30'

const isLoggedIn = userStore.isLoggedIn
const userInfo = userStore.userInfo

onMounted(async () => {
  if (userStore.isLoggedIn && !userStore.userInfo) {
    await userStore.fetchUserInfo()
  }
})

function goLogin() {
  router.push('/login')
}

async function handleLogout() {
  userStore.logout()
  showToast('已退出登录')
  router.push('/login')
}

function handleFavorite() {
  showToast('收藏功能开发中')
}

function handleHistory() {
  showToast('浏览记录功能开发中')
}

function handleSettings() {
  showToast('设置功能开发中')
}

function handleEditProfile() {
  showToast('修改资料功能开发中')
}

function handleFeedback() {
  showToast('意见反馈功能开发中')
}

function handleAbout() {
  showToast('关于我们')
}
</script>

<style lang="scss" scoped>
.profile-page {
  min-height: 100vh;
  background-color: #f5f5f5;
  padding-bottom: 60px;
}

.user-card {
  margin: 12px;
  border-radius: 12px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);

  :deep(.van-card__content) {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .avatar {
    width: 60px;
    height: 60px;
    margin-right: 16px;
    border: 2px solid rgba(255, 255, 255, 0.5);
  }

  .user-info {
    flex: 1;

    .username {
      font-size: 18px;
      font-weight: 600;
      color: #fff;
      margin-bottom: 4px;
    }

    .phone {
      font-size: 13px;
      color: rgba(255, 255, 255, 0.8);
    }
  }
}

.menu-group {
  margin: 12px;
  border-radius: 12px;
  overflow: hidden;
}
</style>
