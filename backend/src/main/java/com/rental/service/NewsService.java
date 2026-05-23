package com.rental.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rental.dto.NewsQueryDTO;
import com.rental.vo.NewsVO;

public interface NewsService {

    IPage<NewsVO> pageNews(NewsQueryDTO query);

    NewsVO getNewsDetail(Long id);
}
