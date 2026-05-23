package com.rental.vo;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class NewsVO {

    private Long id;
    private String title;
    private String coverImage;
    private String summary;
    private String content;
    private String author;
    private String source;
    private Integer viewCount;
    private LocalDateTime publishTime;
}
