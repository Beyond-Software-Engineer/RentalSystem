package com.rental.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rental.vo.NewsVO;

public interface NewsService {

    IPage<NewsVO> pageNews(Integer pageNum, Integer pageSize);

    NewsVO getNewsDetail(Long id);
}
