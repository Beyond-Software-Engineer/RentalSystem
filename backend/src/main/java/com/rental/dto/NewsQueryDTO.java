package com.rental.dto;

import lombok.Data;

@Data
public class NewsQueryDTO {

    private String keyword;

    private String source;

    private Integer pageNum = 1;

    private Integer pageSize = 10;
}
