package com.rental.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rental.common.CommonResponse;
import com.rental.common.PageResult;
import com.rental.dto.NewsQueryDTO;
import com.rental.service.NewsService;
import com.rental.vo.NewsVO;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/news")
@RequiredArgsConstructor
public class NewsController {

    private final NewsService newsService;

    @GetMapping("/page")
    public CommonResponse<PageResult<NewsVO>> pageNews(NewsQueryDTO query) {
        IPage<NewsVO> page = newsService.pageNews(query);
        return CommonResponse.success(new PageResult<>(
            page.getTotal(),
            page.getSize(),
            page.getCurrent(),
            page.getPages(),
            page.getRecords()
        ));
    }

    @GetMapping("/{id}")
    public CommonResponse<NewsVO> getNewsDetail(@PathVariable Long id) {
        return CommonResponse.success(newsService.getNewsDetail(id));
    }
}
