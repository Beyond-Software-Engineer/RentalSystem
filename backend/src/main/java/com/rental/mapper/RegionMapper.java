package com.rental.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.rental.entity.RegionEntity;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RegionMapper extends BaseMapper<RegionEntity> {
    
    /**
     * 根据城市编码查询区域列表
     *
     * @param cityCode 城市编码
     * @return 区域列表
     */
    @Select("SELECT * FROM biz_region WHERE city = #{cityCode} AND deleted = 0 ORDER BY sort ASC")
    List<RegionEntity> selectByCityCode(@Param("cityCode") String cityCode);
}
