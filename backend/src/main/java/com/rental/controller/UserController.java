package com.rental.controller;

import com.rental.common.CommonResponse;
import com.rental.dto.UserUpdateDTO;
import com.rental.entity.UserEntity;
import com.rental.service.UserService;
import com.rental.vo.UserVO;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;

    @GetMapping("/info")
    public CommonResponse<UserVO> getUserInfo(@AuthenticationPrincipal UserEntity user) {
        return CommonResponse.success(userService.getUserById(user.getId()));
    }

    @PutMapping("/info")
    public CommonResponse<UserVO> updateUserInfo(
            @AuthenticationPrincipal UserEntity user,
            @Valid @RequestBody UserUpdateDTO dto) {
        return CommonResponse.success(userService.updateUserInfo(user.getId(), dto));
    }
}
