package com.rental.service.impl;

import com.rental.common.BusinessException;
import com.rental.dto.LoginDTO;
import com.rental.entity.SmsCodeEntity;
import com.rental.entity.UserEntity;
import com.rental.mapper.SmsCodeMapper;
import com.rental.mapper.UserMapper;
import com.rental.security.JwtUtils;
import com.rental.service.AuthService;
import com.rental.vo.LoginVO;
import com.rental.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.time.LocalDateTime;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {

    private final SmsCodeMapper smsCodeMapper;
    private final UserMapper userMapper;
    private final JwtUtils jwtUtils;
    private final RedisTemplate<String, String> redisTemplate;

    private static final long CODE_INTERVAL = 60;
    private static final long CODE_EXPIRE = 300;

    @Override
    public void sendCode(String mobile) {
        String lastSendKey = "sms:send:time:" + mobile;
        String lastSend = redisTemplate.opsForValue().get(lastSendKey);
        if (StringUtils.hasText(lastSend)) {
            long interval = System.currentTimeMillis() - Long.parseLong(lastSend);
            if (interval < CODE_INTERVAL * 1000) {
                throw new BusinessException(400, "发送过于频繁，请" + (CODE_INTERVAL - interval / 1000) + "秒后重试");
            }
        }

        String code = String.valueOf((int) ((Math.random() * 9 + 1) * 100000));

        log.info("发送验证码到手机: {}, 验证码: {}", mobile, code);

        SmsCodeEntity smsCode = new SmsCodeEntity();
        smsCode.setMobile(mobile);
        smsCode.setCode(code);
        smsCode.setStatus(0);
        smsCode.setExpireTime(LocalDateTime.now().plusSeconds(CODE_EXPIRE));
        smsCodeMapper.insert(smsCode);

        redisTemplate.opsForValue().set(lastSendKey, String.valueOf(System.currentTimeMillis()), CODE_INTERVAL, TimeUnit.SECONDS);

        String codeKey = "sms:code:" + mobile;
        redisTemplate.opsForValue().set(codeKey, code, CODE_EXPIRE, TimeUnit.SECONDS);
    }

    @Override
    public LoginVO login(LoginDTO dto) {
        String codeKey = "sms:code:" + dto.getMobile();
        String cachedCode = redisTemplate.opsForValue().get(codeKey);

        if (!dto.getCode().equals(cachedCode)) {
            throw new BusinessException(400, "验证码错误或已过期");
        }

        redisTemplate.delete(codeKey);

        UserEntity user = userMapper.selectByPhone(dto.getMobile());
        if (user == null) {
            user = new UserEntity();
            user.setPhone(dto.getMobile());
            user.setUsername("用户" + dto.getMobile().substring(7));
            user.setStatus(1);
            userMapper.insert(user);
        }

        String accessToken = jwtUtils.generateAccessToken(user.getId(), user.getPhone());
        String refreshToken = jwtUtils.generateRefreshToken(user.getId());

        LoginVO loginVO = new LoginVO();
        loginVO.setAccessToken(accessToken);
        loginVO.setRefreshToken(refreshToken);
        loginVO.setExpiresIn(7200L);

        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(user, userVO);
        loginVO.setUser(userVO);

        return loginVO;
    }

    @Override
    public LoginVO refreshToken(String refreshToken) {
        if (!jwtUtils.validateToken(refreshToken) || !jwtUtils.isRefreshToken(refreshToken)) {
            throw new BusinessException(401, "无效的刷新令牌");
        }

        Long userId = jwtUtils.getUserId(refreshToken);
        UserEntity user = userMapper.selectById(userId);
        if (user == null) {
            throw new BusinessException(401, "用户不存在");
        }

        String newAccessToken = jwtUtils.generateAccessToken(user.getId(), user.getPhone());
        String newRefreshToken = jwtUtils.generateRefreshToken(user.getId());

        LoginVO loginVO = new LoginVO();
        loginVO.setAccessToken(newAccessToken);
        loginVO.setRefreshToken(newRefreshToken);
        loginVO.setExpiresIn(7200L);

        UserVO userVO = new UserVO();
        BeanUtils.copyProperties(user, userVO);
        loginVO.setUser(userVO);

        return loginVO;
    }
}
