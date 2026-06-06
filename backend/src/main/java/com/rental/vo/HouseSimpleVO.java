package com.rental.vo;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class HouseSimpleVO {

    private Long id;
    private String title;
    private Integer room;
    private Integer hall;
    private Integer kitchen;
    private Integer toilet;
    private Integer decorationType;
    private BigDecimal rent;
    private BigDecimal deposit;
    private Integer rentType;
    private Integer floor;
    private Integer totalFloor;
    private BigDecimal area;
    private Long regionId;
    private String regionName;
    private String provinceCode;
    private String provinceName;
    private String cityCode;
    private String cityName;
    private String districtCode;
    private String districtName;
    private Integer houseType;
    private String coverImage;
    private String facilities;
}
