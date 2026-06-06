package com.rental.service;

import com.rental.entity.RegionEntity;

import java.util.List;

public interface RegionService {

    List<RegionEntity> listAllRegions();
    
    /**
     * 根据城市编码查询区域列表
     *
     * @param cityCode 城市编码
     * @return 区域列表
     */
    List<RegionEntity> listRegionsByCityCode(String cityCode);
}
