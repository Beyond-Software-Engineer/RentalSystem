<template>
  <div class="main-layout">
    <div class="layout-content">
      <router-view v-slot="{ Component }">
        <transition name="fade" mode="out-in">
          <component :is="Component" />
        </transition>
      </router-view>
    </div>

    <van-tabbar
      v-model="activeTab"
      route
      fixed
      placeholder
      active-color="#667eea"
    >
      <van-tabbar-item
        v-for="tab in tabbarList"
        :key="tab.path"
        :to="tab.path"
        :icon="tab.icon"
      >
        {{ tab.title }}
      </van-tabbar-item>
    </van-tabbar>
  </div>
</template>

<script setup>
import { ref, watch } from 'vue'
import { useRoute } from 'vue-router'

const route = useRoute()
const activeTab = ref('/home')

const tabbarList = [
  { path: '/home', title: '首页', icon: 'wap-home-o' },
  { path: '/house', title: '房源', icon: 'search' },
  { path: '/news', title: '资讯', icon: 'notes-o' },
  { path: '/profile', title: '我的', icon: 'user-o' }
]

watch(
  () => route.path,
  (path) => {
    const tab = tabbarList.find(t => t.path === path)
    if (tab) {
      activeTab.value = path
    }
  },
  { immediate: true }
)
</script>

<style lang="scss" scoped>
.main-layout {
  width: 100%;
  min-height: 100vh;
  background-color: #f5f5f5;

  .layout-content {
    padding-bottom: 50px;
  }
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 0.2s ease;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}
</style>
