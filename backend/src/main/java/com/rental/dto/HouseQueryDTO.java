package com.rental.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class HouseQueryDTO {

    private String keyword;

    private BigDecimal minRent;

    private BigDecimal maxRent;

    private Long regionId;

    // 三级区域信息
    private String provinceCode;

    private String cityCode;

    private String districtCode;

    private Integer minRoom;

    private Integer maxRoom;

    private Integer room;

    private Integer hall;

    private Integer kitchen;

    private Integer toilet;

    private Integer houseType;

    private Integer rentType;

    private Integer decorationType;

    private BigDecimal minArea;

    private BigDecimal maxArea;

    private Integer minFloor;

    private Integer maxFloor;

    private String sortField;

    private String sortOrder;

    private Integer pageNum = 1;

    private Integer pageSize = 10;
}
