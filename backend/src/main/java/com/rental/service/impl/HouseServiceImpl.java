package com.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rental.common.BusinessException;
import com.rental.dto.HouseQueryDTO;
import com.rental.entity.FacilityEntity;
import com.rental.entity.HouseEntity;
import com.rental.entity.RegionEntity;
import com.rental.mapper.FacilityMapper;
import com.rental.mapper.HouseMapper;
import com.rental.mapper.RegionMapper;
import com.rental.service.HouseService;
import com.rental.vo.FacilityVO;
import com.rental.vo.HouseDetailVO;
import com.rental.vo.HouseSimpleVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class HouseServiceImpl implements HouseService {

    private final HouseMapper houseMapper;
    private final RegionMapper regionMapper;
    private final FacilityMapper facilityMapper;

    @Override
    public IPage<HouseSimpleVO> pageHouse(HouseQueryDTO query) {
        Page<HouseEntity> page = new Page<>(query.getPageNum(), query.getPageSize());
        
        LambdaQueryWrapper<HouseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HouseEntity::getStatus, 0);
        
        // 关键词搜索（搜索标题和地址）
        if (query.getKeyword() != null && !query.getKeyword().trim().isEmpty()) {
            wrapper.and(w -> w.like(HouseEntity::getTitle, query.getKeyword())
                    .or()
                    .like(HouseEntity::getAddress, query.getKeyword()));
        }
        
        if (query.getMinRent() != null) {
            wrapper.ge(HouseEntity::getRent, query.getMinRent());
        }
        if (query.getMaxRent() != null) {
            wrapper.le(HouseEntity::getRent, query.getMaxRent());
        }
        if (query.getRegionId() != null) {
            wrapper.eq(HouseEntity::getRegionId, query.getRegionId());
        }
        
        // 房型筛选（支持范围筛选）
        if (query.getRoom() != null) {
            wrapper.eq(HouseEntity::getRoom, query.getRoom());
        } else {
            if (query.getMinRoom() != null) {
                wrapper.ge(HouseEntity::getRoom, query.getMinRoom());
            }
            if (query.getMaxRoom() != null) {
                wrapper.le(HouseEntity::getRoom, query.getMaxRoom());
            }
        }
        
        if (query.getHouseType() != null) {
            wrapper.eq(HouseEntity::getHouseType, query.getHouseType());
        }
        if (query.getRentType() != null) {
            wrapper.eq(HouseEntity::getRentType, query.getRentType());
        }
        if (query.getMinArea() != null) {
            wrapper.ge(HouseEntity::getArea, query.getMinArea());
        }
        if (query.getMaxArea() != null) {
            wrapper.le(HouseEntity::getArea, query.getMaxArea());
        }

        if ("rent".equals(query.getSortField())) {
            wrapper.orderBy(true, "asc".equals(query.getSortOrder()), HouseEntity::getRent);
        } else {
            wrapper.orderByDesc(HouseEntity::getCreateTime);
        }

        IPage<HouseEntity> entityPage = houseMapper.selectPage(page, wrapper);

        return entityPage.convert(this::convertToSimpleVO);
    }

    @Override
    public HouseDetailVO getHouseDetail(Long id) {
        HouseEntity house = houseMapper.selectById(id);
        if (house == null) {
            throw new BusinessException("房源不存在");
        }

        HouseDetailVO detailVO = new HouseDetailVO();
        BeanUtils.copyProperties(house, detailVO);

        RegionEntity region = regionMapper.selectById(house.getRegionId());
        if (region != null) {
            detailVO.setRegionName(region.getName());
        }

        if (house.getImages() != null) {
            detailVO.setImages(Arrays.asList(house.getImages().split(",")));
        }

        if (house.getFacilities() != null) {
            List<Long> facilityIds = Arrays.stream(house.getFacilities().replace("[", "").replace("]", "").split(","))
                    .map(String::trim)
                    .filter(s -> !s.isEmpty())
                    .map(Long::parseLong)
                    .collect(Collectors.toList());
            
            if (!facilityIds.isEmpty()) {
                List<FacilityEntity> facilities = facilityMapper.selectBatchIds(facilityIds);
                List<FacilityVO> facilityVOs = facilities.stream().map(f -> {
                    FacilityVO vo = new FacilityVO();
                    BeanUtils.copyProperties(f, vo);
                    return vo;
                }).collect(Collectors.toList());
                detailVO.setFacilityList(facilityVOs);
            }
        }

        return detailVO;
    }

    @Override
    public IPage<HouseSimpleVO> getRecommendHouse() {
        Page<HouseEntity> page = new Page<>(1, 6);
        
        LambdaQueryWrapper<HouseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HouseEntity::getStatus, 0)
               .orderByDesc(HouseEntity::getCreateTime);

        IPage<HouseEntity> entityPage = houseMapper.selectPage(page, wrapper);

        return entityPage.convert(this::convertToSimpleVO);
    }

    private HouseSimpleVO convertToSimpleVO(HouseEntity entity) {
        HouseSimpleVO vo = new HouseSimpleVO();
        BeanUtils.copyProperties(entity, vo);
        
        RegionEntity region = regionMapper.selectById(entity.getRegionId());
        if (region != null) {
            vo.setRegionName(region.getName());
        }
        
        return vo;
    }
}
