package com.rental.vo;

import lombok.Data;

@Data
public class UserVO {

    private Long id;
    private String phone;
    private String username;
    private String avatar;
    private Integer gender;
    private String email;
}
