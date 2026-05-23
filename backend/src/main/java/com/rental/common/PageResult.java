package com.rental.common;

import lombok.Data;

import java.util.List;

@Data
public class PageResult<T> {

    private Long total;
    private Long size;
    private Long current;
    private Long pages;
    private List<T> records;

    public PageResult() {
    }

    public PageResult(Long total, Long size, Long current, Long pages, List<T> records) {
        this.total = total;
        this.size = size;
        this.current = current;
        this.pages = pages;
        this.records = records;
    }
}
