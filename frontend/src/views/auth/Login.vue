<template>
  <div class="login-page">
    <!-- 背景装饰 -->
    <div class="bg-decoration">
      <div class="circle circle-1"></div>
      <div class="circle circle-2"></div>
      <div class="circle circle-3"></div>
    </div>

    <!-- 登录卡片 -->
    <div class="login-card">
      <!-- Logo区域 -->
      <div class="logo-section">
        <div class="logo-icon">
          <van-icon name="home-o" size="48" />
        </div>
        <h1 class="logo-title">租房系统</h1>
        <p class="logo-subtitle">轻松找到理想住所</p>
      </div>

      <!-- 表单区域 -->
      <div class="form-section">
        <van-form @submit="handleLogin">
          <!-- 手机号输入 -->
          <div class="form-item">
            <van-cell-group inset class="input-group">
              <van-field
                v-model="formData.mobile"
                type="tel"
                placeholder="请输入手机号"
                :rules="[{ required: true, message: '请输入手机号' }, { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号' }]"
              >
                <template #left-icon>
                  <van-icon name="phone" size="20" color="#999" />
                </template>
              </van-field>
            </van-cell-group>
          </div>

          <!-- 验证码输入 -->
          <div class="form-item">
            <van-cell-group inset class="input-group">
              <van-field
                v-model="formData.code"
                type="digit"
                center
                placeholder="请输入验证码"
                :disabled="!formData.mobile"
                :rules="[{ required: true, message: '请输入验证码' }]"
              >
                <template #left-icon>
                  <van-icon name="code-o" size="20" color="#999" />
                </template>
                <template #button>
                  <van-button
                    size="small"
                    type="primary"
                    plain
                    :disabled="countdown.isCounting.value || !validatePhone(formData.mobile)"
                    @click="handleSendCode"
                  >
                    {{ countdown.isCounting.value ? `${countdown.count.value}s` : '获取验证码' }}
                  </van-button>
                </template>
              </van-field>
            </van-cell-group>
          </div>

          <!-- 用户协议 -->
          <div class="agreement">
            <van-checkbox v-model="agreed" shape="square" icon-size="14px">
              我已阅读并同意<a href="#" @click.prevent="showAgreement">《用户服务协议》</a>和<a href="#" @click.prevent="showPrivacy">《隐私政策》</a>
            </van-checkbox>
          </div>

          <!-- 登录按钮 -->
          <div class="login-btn">
            <van-button
              round
              block
              type="primary"
              native-type="submit"
              :loading="loading"
              :disabled="!agreed"
              size="large"
            >
              登 录
            </van-button>
          </div>
        </van-form>
      </div>

      <!-- 底部提示 -->
      <div class="footer-tip">
        <span>登录即表示您同意我们的</span>
        <a href="#" @click.prevent="showAgreement">服务条款</a>
        <span>和</span>
        <a href="#" @click.prevent="showPrivacy">隐私政策</a>
      </div>
    </div>

    <!-- 协议弹窗 -->
    <van-dialog
      v-model:show="showAgreementModal"
      :title="agreementTitle"
      :show-cancel-button="false"
      :confirm-button-text="'关闭'"
      @confirm="closeAgreementModal"
      class="agreement-dialog"
    >
      <div class="agreement-content" ref="agreementContentRef">
        <div v-if="currentAgreement === 'service'" class="agreement-text">
          <h3>一、服务条款</h3>
          <p>欢迎使用租房系统（以下简称"本平台"）。本服务条款是您与本平台之间的协议。</p>
          
          <h3>二、用户权利与义务</h3>
          <p>1. 用户必须确保所提供的个人信息真实、准确、完整。</p>
          <p>2. 用户应妥善保管自己的账户和密码，不得泄露给他人。</p>
          <p>3. 用户在使用本平台服务时，应遵守国家法律法规和社会公德。</p>
          
          <h3>三、平台服务</h3>
          <p>1. 本平台提供租房信息发布、搜索、交易等服务。</p>
          <p>2. 本平台有权根据业务发展调整服务内容。</p>
          <p>3. 本平台不保证服务的连续性和稳定性，但会尽力维护服务质量。</p>
          
          <h3>四、信息使用</h3>
          <p>1. 用户同意本平台收集和使用其个人信息以提供服务。</p>
          <p>2. 本平台不会向第三方泄露用户个人信息，除非法律法规要求。</p>
          
          <h3>五、违约责任</h3>
          <p>1. 用户违反本条款，本平台有权暂停或终止服务。</p>
          <p>2. 因不可抗力导致的服务中断，本平台不承担责任。</p>
          
          <h3>六、协议变更</h3>
          <p>本平台有权修改本条款，修改后将在平台公告。</p>
          
          <h3>七、争议解决</h3>
          <p>因本协议产生的争议，双方应协商解决；协商不成的，可向有管辖权的法院提起诉讼。</p>
          
          <p class="agreement-date">生效日期：2024年1月1日</p>
        </div>

        <div v-else class="agreement-text">
          <h3>一、隐私政策概述</h3>
          <p>本隐私政策说明本平台如何收集、使用、存储和保护用户的个人信息。</p>
          
          <h3>二、信息收集</h3>
          <p>1. 注册信息：包括手机号、用户名、头像等。</p>
          <p>2. 使用信息：包括浏览记录、搜索记录、收藏记录等。</p>
          <p>3. 设备信息：包括设备型号、操作系统、IP地址等。</p>
          
          <h3>三、信息使用</h3>
          <p>1. 提供服务：使用收集的信息为用户提供租房服务。</p>
          <p>2. 个性化推荐：根据用户行为提供个性化推荐。</p>
          <p>3. 安全保障：用于账户安全和反欺诈。</p>
          <p>4. 服务优化：分析用户数据以优化服务体验。</p>
          
          <h3>四、信息存储</h3>
          <p>1. 信息存储在安全的服务器上，采取加密措施保护。</p>
          <p>2. 信息保留至用户账户注销后一定期限。</p>
          
          <h3>五、信息共享</h3>
          <p>1. 不会向第三方出售用户个人信息。</p>
          <p>2. 可能与合作伙伴共享非个人身份信息。</p>
          <p>3. 法律要求时可能披露信息。</p>
          
          <h3>六、用户权利</h3>
          <p>1. 用户有权访问、更正、删除个人信息。</p>
          <p>2. 用户有权拒绝非必要的信息收集。</p>
          <p>3. 用户可随时注销账户。</p>
          
          <h3>七、安全措施</h3>
          <p>本平台采取多种安全措施保护用户信息安全。</p>
          
          <h3>八、政策变更</h3>
          <p>本政策可能更新，更新后将在平台公告。</p>
          
          <p class="agreement-date">生效日期：2024年1月1日</p>
        </div>
      </div>
    </van-dialog>
  </div>
</template>

<script setup>
import { reactive, ref } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { showToast, Form, Field, Button, Checkbox, CellGroup, Icon, Dialog } from 'vant'
import { authApi } from '@/api/auth'
import { useUserStore } from '@/stores/user'
import { useCountdown } from '@/composables/useCountdown'
import { validatePhone } from '@/utils/validate'

const router = useRouter()
const route = useRoute()
const userStore = useUserStore()

const formData = reactive({
  mobile: '',
  code: ''
})
const agreed = ref(true)
const loading = ref(false)
const countdown = useCountdown(60)

// 弹窗控制
const showAgreementModal = ref(false)
const currentAgreement = ref('service')
const agreementTitle = ref('用户服务协议')
const agreementContentRef = ref(null)

function showAgreement() {
  currentAgreement.value = 'service'
  agreementTitle.value = '用户服务协议'
  showAgreementModal.value = true
}

function showPrivacy() {
  currentAgreement.value = 'privacy'
  agreementTitle.value = '隐私政策'
  showAgreementModal.value = true
}

function closeAgreementModal() {
  showAgreementModal.value = false
}

async function handleSendCode() {
  if (!validatePhone(formData.mobile)) {
    showToast('请输入正确的手机号')
    return
  }
  
  try {
    await authApi.sendCode(formData.mobile)
    countdown.start()
    showToast('验证码已发送')
  } catch (error) {
    showToast(error.message || '发送失败')
  }
}

async function handleLogin() {
  if (!validatePhone(formData.mobile)) {
    showToast('请输入正确的手机号')
    return
  }
  
  loading.value = true
  try {
    await userStore.login(formData)
    showToast('登录成功')
    
    const redirect = route.query.redirect || '/home'
    router.replace(redirect)
  } catch (error) {
    showToast(error.message || '登录失败')
  } finally {
    loading.value = false
  }
}
</script>

<style lang="scss" scoped>
.login-page {
  min-height: 100vh;
  background: linear-gradient(180deg, #667eea 0%, #764ba2 50%, #f093fb 100%);
  padding: 0 24px;
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;

  .bg-decoration {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    pointer-events: none;

    .circle {
      position: absolute;
      border-radius: 50%;
      opacity: 0.15;
      background: rgba(255, 255, 255, 0.3);
    }

    .circle-1 {
      width: 200px;
      height: 200px;
      top: 10%;
      right: -50px;
    }

    .circle-2 {
      width: 150px;
      height: 150px;
      bottom: 20%;
      left: -30px;
    }

    .circle-3 {
      width: 100px;
      height: 100px;
      top: 50%;
      left: 50%;
      transform: translate(-50%, -50%);
    }
  }

  .login-card {
    width: 100%;
    max-width: 540px;
    background: #fff;
    border-radius: 24px;
    padding: 40px 24px;
    box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
    position: relative;
    z-index: 1;

    .logo-section {
      text-align: center;
      margin-bottom: 32px;

      .logo-icon {
        width: 80px;
        height: 80px;
        margin: 0 auto 16px;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        border-radius: 20px;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #fff;
        box-shadow: 0 8px 24px rgba(102, 126, 234, 0.4);
      }

      .logo-title {
        font-size: 24px;
        font-weight: 600;
        color: #1a1a1a;
        margin-bottom: 8px;
      }

      .logo-subtitle {
        font-size: 14px;
        color: #999;
      }
    }

    .form-section {
      .form-item {
        margin-bottom: 16px;
      }

      .input-group {
        background: #f8f9fa;
        border-radius: 12px;
        overflow: hidden;
      }

      .agreement {
        padding: 12px 0 20px;
        font-size: 12px;
        color: #666;

        a {
          color: #667eea;
        }
      }

      .login-btn {
        margin-top: 8px;

        .van-button {
          height: 48px;
          font-size: 16px;
          font-weight: 500;
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          border: none;
          box-shadow: 0 4px 16px rgba(102, 126, 234, 0.4);

          &:active {
            transform: scale(0.98);
          }
        }
      }
    }

    .footer-tip {
      text-align: center;
      padding-top: 24px;
      font-size: 12px;
      color: #999;

      a {
        color: #667eea;
        margin: 0 4px;
      }
    }
  }

  .agreement-dialog {
    .van-dialog {
      max-width: 90%;
      width: 480px;
      border-radius: 16px;
      overflow: hidden;

      .van-dialog__header {
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        color: #fff;
        padding: 16px 24px;

        .van-dialog__title {
          font-size: 16px;
          font-weight: 500;
          color: #fff;
        }

        .van-icon-cross {
          color: #fff;
          opacity: 0.8;
        }
      }

      .van-dialog__body {
        padding: 0;
        max-height: 60vh;
        overflow: hidden;
      }

      .van-dialog__footer {
        padding: 12px 24px;
        border-top: 1px solid #f0f0f0;

        .van-button--primary {
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
          border: none;
          width: 100%;
        }
      }
    }

    .agreement-content {
      max-height: 50vh;
      overflow-y: auto;
      padding: 20px 24px;
    }

    .agreement-text {
      font-size: 13px;
      color: #333;
      line-height: 1.8;

      h3 {
        font-size: 14px;
        font-weight: 600;
        color: #1a1a1a;
        margin: 16px 0 10px;
        padding-bottom: 8px;
        border-bottom: 1px solid #f0f0f0;
      }

      p {
        margin: 8px 0;
        text-align: justify;
        text-indent: 2em;
      }

      .agreement-date {
        margin-top: 20px;
        padding-top: 16px;
        border-top: 1px solid #f0f0f0;
        text-align: center;
        color: #999;
        text-indent: 0 !important;
      }
    }
  }
}
</style>