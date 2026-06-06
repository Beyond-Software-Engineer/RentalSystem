package com.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.rental.common.CityCodeMapper;
import com.rental.entity.RegionEntity;
import com.rental.mapper.RegionMapper;
import com.rental.service.RegionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
@Slf4j
public class RegionServiceImpl implements RegionService {

    private final RegionMapper regionMapper;
    private final CityCodeMapper cityCodeMapper;

    @Override
    public List<RegionEntity> listAllRegions() {
        return regionMapper.selectList(null);
    }

    @Override
    public List<RegionEntity> listRegionsByCityCode(String cityCode) {
        log.info("根据城市编码查询区域: cityCode={}", cityCode);
        
        if (cityCode == null || cityCode.trim().isEmpty()) {
            log.warn("城市编码为空，返回空列表");
            return List.of();
        }
        
        // 通过城市编码获取城市简称
        String cityShortName = cityCodeMapper.getCityShortName(cityCode);
        
        if (cityShortName == null || cityShortName.trim().isEmpty()) {
            log.warn("未找到城市编码对应的名称: cityCode={}，尝试直接使用编码查询", cityCode);
            // 回退：尝试直接使用编码查询
            return regionMapper.selectByCityCode(cityCode);
        }
        
        log.info("城市编码 {} 对应的城市简称: {}", cityCode, cityShortName);
        
        // 使用城市简称查询区域
        LambdaQueryWrapper<RegionEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(RegionEntity::getCity, cityShortName)
               .orderByAsc(RegionEntity::getSort);
        
        List<RegionEntity> regions = regionMapper.selectList(wrapper);
        log.info("使用城市简称 '{}' 查询到 {} 个区域", cityShortName, regions.size());
        
        // 如果使用简称查询不到，尝试使用完整名称
        if (regions.isEmpty()) {
            String cityFullName = cityCodeMapper.getCityName(cityCode);
            if (cityFullName != null) {
                log.info("尝试使用城市完整名称 '{}' 查询", cityFullName);
                wrapper = new LambdaQueryWrapper<>();
                wrapper.eq(RegionEntity::getCity, cityFullName)
                       .orderByAsc(RegionEntity::getSort);
                regions = regionMapper.selectList(wrapper);
                log.info("使用城市完整名称 '{}' 查询到 {} 个区域", cityFullName, regions.size());
            }
        }
        
        return regions;
    }
}
