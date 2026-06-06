package com.rental.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rental.dto.HouseQueryDTO;
import com.rental.vo.HouseDetailVO;
import com.rental.vo.HouseSimpleVO;

public interface HouseService {

    IPage<HouseSimpleVO> pageHouse(HouseQueryDTO query);

    HouseDetailVO getHouseDetail(Long id);

    IPage<HouseSimpleVO> getRecommendHouse(String city);
}
