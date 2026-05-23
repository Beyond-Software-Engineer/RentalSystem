package com.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rental.common.BusinessException;
import com.rental.entity.NewsEntity;
import com.rental.mapper.NewsMapper;
import com.rental.service.NewsService;
import com.rental.vo.NewsVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class NewsServiceImpl implements NewsService {

    private final NewsMapper newsMapper;

    @Override
    public IPage<NewsVO> pageNews(Integer pageNum, Integer pageSize) {
        Page<NewsEntity> page = new Page<>(pageNum, pageSize);
        
        LambdaQueryWrapper<NewsEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(NewsEntity::getStatus, 1)
               .orderByDesc(NewsEntity::getPublishTime);

        IPage<NewsEntity> entityPage = newsMapper.selectPage(page, wrapper);

        return entityPage.convert(entity -> {
            NewsVO vo = new NewsVO();
            BeanUtils.copyProperties(entity, vo);
            return vo;
        });
    }

    @Override
    public NewsVO getNewsDetail(Long id) {
        NewsEntity news = newsMapper.selectById(id);
        if (news == null) {
            throw new BusinessException("新闻不存在");
        }

        news.setViewCount(news.getViewCount() + 1);
        newsMapper.updateById(news);

        NewsVO vo = new NewsVO();
        BeanUtils.copyProperties(news, vo);
        return vo;
    }
}
