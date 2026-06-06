package com.rental.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.rental.common.BusinessException;
import com.rental.common.ValidationUtils;
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
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class HouseServiceImpl implements HouseService {

    private final HouseMapper houseMapper;
    private final RegionMapper regionMapper;
    private final FacilityMapper facilityMapper;

    @Override
    public IPage<HouseSimpleVO> pageHouse(HouseQueryDTO query) {
        // 服务器端参数验证
        validateQueryParams(query);
        
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
        
        // 三级区域筛选（优先级高于 regionId）
        if (query.getDistrictCode() != null && !query.getDistrictCode().trim().isEmpty()) {
            wrapper.eq(HouseEntity::getDistrictCode, query.getDistrictCode());
        } else if (query.getCityCode() != null && !query.getCityCode().trim().isEmpty()) {
            wrapper.eq(HouseEntity::getCityCode, query.getCityCode());
        } else if (query.getProvinceCode() != null && !query.getProvinceCode().trim().isEmpty()) {
            wrapper.eq(HouseEntity::getProvinceCode, query.getProvinceCode());
        } else if (query.getRegionId() != null) {
            // 兼容原有的 regionId 筛选
            wrapper.eq(HouseEntity::getRegionId, query.getRegionId());
        }
        
        // 房型筛选（支持范围筛选）
        if (query.getRoom() != null) {
            if (query.getRoom() == -1) {
                // 其他：排除0-5范围内的值
                wrapper.notBetween(HouseEntity::getRoom, 0, 5);
            } else {
                wrapper.eq(HouseEntity::getRoom, query.getRoom());
            }
        } else {
            if (query.getMinRoom() != null) {
                wrapper.ge(HouseEntity::getRoom, query.getMinRoom());
            }
            if (query.getMaxRoom() != null) {
                wrapper.le(HouseEntity::getRoom, query.getMaxRoom());
            }
        }
        
        // 厅数量筛选（-1表示"其他"）
        if (query.getHall() != null) {
            if (query.getHall() == -1) {
                wrapper.notBetween(HouseEntity::getHall, 0, 5);
            } else {
                wrapper.eq(HouseEntity::getHall, query.getHall());
            }
        }
        
        // 厨数量筛选（-1表示"其他"）
        if (query.getKitchen() != null) {
            if (query.getKitchen() == -1) {
                wrapper.notBetween(HouseEntity::getKitchen, 0, 5);
            } else {
                wrapper.eq(HouseEntity::getKitchen, query.getKitchen());
            }
        }
        
        // 卫数量筛选（-1表示"其他"）
        if (query.getToilet() != null) {
            if (query.getToilet() == -1) {
                wrapper.notBetween(HouseEntity::getToilet, 0, 5);
            } else {
                wrapper.eq(HouseEntity::getToilet, query.getToilet());
            }
        }
        
        // 房屋类型筛选
        if (query.getHouseType() != null) {
            wrapper.eq(HouseEntity::getHouseType, query.getHouseType());
        }
        
        // 租赁方式筛选
        if (query.getRentType() != null) {
            wrapper.eq(HouseEntity::getRentType, query.getRentType());
        }
        
        // 装修类型筛选
        if (query.getDecorationType() != null) {
            wrapper.eq(HouseEntity::getDecorationType, query.getDecorationType());
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
    public IPage<HouseSimpleVO> getRecommendHouse(String cityCode) {
        Page<HouseEntity> page = new Page<>(1, 6);
        
        LambdaQueryWrapper<HouseEntity> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(HouseEntity::getStatus, 0)
               .orderByDesc(HouseEntity::getCreateTime);

        // 如果提供了城市编码，则按城市筛选推荐房源
        if (cityCode != null && !cityCode.trim().isEmpty()) {
            try {
                // 直接使用house表中的cityCode字段进行筛选
                wrapper.eq(HouseEntity::getCityCode, cityCode);
                log.info("按城市编码 {} 筛选推荐房源", cityCode);
            } catch (Exception e) {
                log.error("按城市筛选推荐房源失败: {}", e.getMessage());
                // 继续返回默认推荐，不影响用户体验
            }
        }

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

    /**
     * 验证查询参数
     * 
     * @param query 查询参数
     */
    private void validateQueryParams(HouseQueryDTO query) {
        log.info("开始验证房源查询参数: {}", query);
        
        // 验证价格区间
        String priceError = ValidationUtils.validatePriceRange(query.getMinRent(), query.getMaxRent());
        if (priceError != null) {
            log.warn("价格区间验证失败: {}", priceError);
            // 记录异常输入日志
            ValidationUtils.logInvalidInput("priceRange", 
                    String.format("minRent=%s, maxRent=%s", query.getMinRent(), query.getMaxRent()), 
                    priceError);
            // 可以选择抛出异常或修正参数
            // 这里选择修正参数，将无效参数置空
            query.setMinRent(null);
            query.setMaxRent(null);
        }
        
        // 验证面积区间
        String areaError = ValidationUtils.validateAreaRange(query.getMinArea(), query.getMaxArea());
        if (areaError != null) {
            log.warn("面积区间验证失败: {}", areaError);
            ValidationUtils.logInvalidInput("areaRange", 
                    String.format("minArea=%s, maxArea=%s", query.getMinArea(), query.getMaxArea()), 
                    areaError);
            query.setMinArea(null);
            query.setMaxArea(null);
        }
        
        // 验证楼层区间
        String floorError = ValidationUtils.validateFloorRange(query.getMinFloor(), query.getMaxFloor());
        if (floorError != null) {
            log.warn("楼层区间验证失败: {}", floorError);
            ValidationUtils.logInvalidInput("floorRange", 
                    String.format("minFloor=%s, maxFloor=%s", query.getMinFloor(), query.getMaxFloor()), 
                    floorError);
            query.setMinFloor(null);
            query.setMaxFloor(null);
        }
        
        // 验证房间数量
        String roomError = ValidationUtils.validateRoomCount(query.getRoom(), "room");
        if (roomError != null) {
            log.warn("房间数量验证失败: {}", roomError);
            ValidationUtils.logInvalidInput("room", query.getRoom(), roomError);
            query.setRoom(null);
        }
        
        // 验证厅数量
        String hallError = ValidationUtils.validateRoomCount(query.getHall(), "hall");
        if (hallError != null) {
            log.warn("厅数量验证失败: {}", hallError);
            ValidationUtils.logInvalidInput("hall", query.getHall(), hallError);
            query.setHall(null);
        }
        
        // 验证厨数量
        String kitchenError = ValidationUtils.validateRoomCount(query.getKitchen(), "kitchen");
        if (kitchenError != null) {
            log.warn("厨数量验证失败: {}", kitchenError);
            ValidationUtils.logInvalidInput("kitchen", query.getKitchen(), kitchenError);
            query.setKitchen(null);
        }
        
        // 验证卫数量
        String toiletError = ValidationUtils.validateRoomCount(query.getToilet(), "toilet");
        if (toiletError != null) {
            log.warn("卫数量验证失败: {}", toiletError);
            ValidationUtils.logInvalidInput("toilet", query.getToilet(), toiletError);
            query.setToilet(null);
        }
        
        // 验证分页参数
        if (query.getPageNum() == null || query.getPageNum() < 1) {
            log.warn("无效的页码参数: {}, 已修正为1", query.getPageNum());
            query.setPageNum(1);
        }
        if (query.getPageSize() == null || query.getPageSize() < 1) {
            log.warn("无效的每页条数参数: {}, 已修正为10", query.getPageSize());
            query.setPageSize(10);
        }
        if (query.getPageSize() > 100) {
            log.warn("每页条数参数过大: {}, 已修正为100", query.getPageSize());
            ValidationUtils.logPotentialAttack("pageSize", query.getPageSize(), "可能的资源耗尽攻击");
            query.setPageSize(100);
        }
        
        // 检查是否存在异常输入模式（潜在攻击检测）
        detectPotentialAttack(query);
        
        log.info("查询参数验证完成");
    }

    /**
     * 检测潜在攻击行为
     * 
     * @param query 查询参数
     */
    private void detectPotentialAttack(HouseQueryDTO query) {
        // 检测极端价格值攻击
        if (query.getMinRent() != null && query.getMinRent().compareTo(ValidationUtils.PRICE_MAX) > 0) {
            ValidationUtils.logPotentialAttack("minRent", query.getMinRent(), "极端价格值攻击");
        }
        if (query.getMaxRent() != null && query.getMaxRent().compareTo(ValidationUtils.PRICE_MAX) > 0) {
            ValidationUtils.logPotentialAttack("maxRent", query.getMaxRent(), "极端价格值攻击");
        }
        
        // 检测SQL注入模式（简单检测）
        if (query.getKeyword() != null) {
            String keyword = query.getKeyword().toLowerCase();
            if (keyword.contains("'") || keyword.contains(";") || 
                keyword.contains("union") || keyword.contains("select") ||
                keyword.contains("drop") || keyword.contains("insert")) {
                ValidationUtils.logPotentialAttack("keyword", query.getKeyword(), "可能的SQL注入攻击");
            }
        }
        
        // 检测大量并发请求的模式（可以结合请求频率限制器）
        // 这里只做简单记录，实际项目中应该配合限流组件
    }
}
