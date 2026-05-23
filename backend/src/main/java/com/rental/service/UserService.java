package com.rental.service;

import com.rental.dto.UserUpdateDTO;
import com.rental.vo.UserVO;

public interface UserService {

    UserVO getUserById(Long id);

    UserVO updateUserInfo(Long userId, UserUpdateDTO dto);
}
