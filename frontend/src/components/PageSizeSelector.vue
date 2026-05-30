<template>
  <div class="page-size-selector" ref="selectorRef">
    <div class="selector-trigger" @click="toggleDropdown">
      <span class="current-value">{{ currentText }}</span>
      <van-icon :name="isOpen ? 'arrow-up' : 'arrow-down'" size="14" />
    </div>

    <Transition name="slide">
      <div v-if="isOpen" class="selector-dropdown">
        <div
          v-for="option in options"
          :key="option.value"
          class="dropdown-item"
          :class="{ active: modelValue === option.value }"
          @click="selectOption(option)"
        >
          {{ option.text }}
        </div>
      </div>
    </Transition>
  </div>
</template>

<script setup>
import { ref, computed, watch, onMounted, onUnmounted } from 'vue'
import { Icon } from 'vant'

const props = defineProps({
  modelValue: {
    type: Number,
    required: true
  },
  options: {
    type: Array,
    default: () => [
      { text: '10条/页', value: 10 },
      { text: '20条/页', value: 20 },
      { text: '50条/页', value: 50 }
    ]
  }
})

const emit = defineEmits(['update:modelValue', 'change'])

const isOpen = ref(false)
const selectorRef = ref(null)

const currentText = computed(() => {
  const option = props.options.find(opt => opt.value === props.modelValue)
  return option ? option.text : `${props.modelValue}条/页`
})

function toggleDropdown() {
  isOpen.value = !isOpen.value
}

function selectOption(option) {
  emit('update:modelValue', option.value)
  emit('change', option.value)
  isOpen.value = false
}

function handleClickOutside(event) {
  if (selectorRef.value && !selectorRef.value.contains(event.target)) {
    isOpen.value = false
  }
}

onMounted(() => {
  document.addEventListener('click', handleClickOutside)
})

onUnmounted(() => {
  document.removeEventListener('click', handleClickOutside)
})

watch(() => props.modelValue, () => {
  isOpen.value = false
})
</script>

<style lang="scss" scoped>
.page-size-selector {
  position: relative;
  display: inline-block;
  z-index: 200;

  .selector-trigger {
    display: flex;
    align-items: center;
    gap: 4px;
    padding: 6px 12px;
    background: #f5f5f5;
    border-radius: 8px;
    cursor: pointer;
    transition: all 0.2s ease;
    min-width: 80px;

    &:hover {
      background: #eee;
    }

    &:active {
      transform: scale(0.98);
    }

    .current-value {
      font-size: 13px;
      color: #333;
      white-space: nowrap;
    }
  }

  .selector-dropdown {
    position: absolute;
    top: calc(100% + 4px);
    left: 0;
    display: flex;
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 16px rgba(0, 0, 0, 0.15);
    overflow: hidden;
    transition: all 0.3s ease;
    z-index: 300;
    min-width: 100%;

    .dropdown-item {
      padding: 10px 16px;
      font-size: 13px;
      color: #333;
      cursor: pointer;
      white-space: nowrap;
      transition: all 0.2s ease;

      &:hover {
        background: #f5f5f5;
      }

      &.active {
        background: #667eea;
        color: #fff;
      }
    }
  }
}

/* 水平展开动画 */
.slide-enter-active,
.slide-leave-active {
  transition: all 0.3s ease;
}

.slide-enter-from,
.slide-leave-to {
  opacity: 0;
  transform: scaleX(0.8) translateY(-4px);
  transform-origin: left center;
}

/* 响应式适配 */
@media (min-width: 768px) {
  .page-size-selector {
    .selector-trigger {
      min-width: 90px;
      padding: 8px 14px;
    }

    .selector-dropdown {
      .dropdown-item {
        padding: 12px 20px;
        font-size: 14px;
      }
    }
  }
}
</style>