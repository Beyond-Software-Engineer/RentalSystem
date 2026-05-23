package com.rental.service;

import com.rental.dto.LoginDTO;
import com.rental.dto.UserUpdateDTO;
import com.rental.vo.LoginVO;
import com.rental.vo.UserVO;

public interface AuthService {

    void sendCode(String mobile);

    LoginVO login(LoginDTO dto);

    LoginVO refreshToken(String refreshToken);
}
