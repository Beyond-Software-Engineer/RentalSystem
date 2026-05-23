package com.rental.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class UserUpdateDTO {

    @Size(min = 2, max = 20, message = "用户名长度应在2-20个字符之间")
    private String username;

    private String avatar;

    private Integer gender;

    @Email(message = "邮箱格式不正确")
    private String email;
}
