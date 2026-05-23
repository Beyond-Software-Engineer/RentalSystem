package com.rental.controller;

import com.rental.common.CommonResponse;
import com.rental.dto.LoginDTO;
import com.rental.dto.SendCodeDTO;
import com.rental.service.AuthService;
import com.rental.vo.LoginVO;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/send-code")
    public CommonResponse<Void> sendCode(@Valid @RequestBody SendCodeDTO dto) {
        authService.sendCode(dto.getMobile());
        return CommonResponse.success("验证码发送成功", null);
    }

    @PostMapping("/login")
    public CommonResponse<LoginVO> login(@Valid @RequestBody LoginDTO dto) {
        return CommonResponse.success(authService.login(dto));
    }

    @PostMapping("/refresh")
    public CommonResponse<LoginVO> refresh(@RequestHeader("Authorization") String refreshToken) {
        String token = refreshToken.replace("Bearer ", "");
        return CommonResponse.success(authService.refreshToken(token));
    }
}
