package com.rental.common;

import lombok.Data;

@Data
public class CommonResponse<T> {

    private Integer code;
    private String message;
    private T data;

    public CommonResponse() {
    }

    public CommonResponse(Integer code, String message, T data) {
        this.code = code;
        this.message = message;
        this.data = data;
    }

    public static <T> CommonResponse<T> success() {
        return new CommonResponse<>(200, "操作成功", null);
    }

    public static <T> CommonResponse<T> success(T data) {
        return new CommonResponse<>(200, "操作成功", data);
    }

    public static <T> CommonResponse<T> success(String message, T data) {
        return new CommonResponse<>(200, message, data);
    }

    public static <T> CommonResponse<T> error(String message) {
        return new CommonResponse<>(500, message, null);
    }

    public static <T> CommonResponse<T> error(Integer code, String message) {
        return new CommonResponse<>(code, message, null);
    }
}
