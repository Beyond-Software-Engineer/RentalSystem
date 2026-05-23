package com.rental.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName("biz_house")
public class HouseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
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

    private String address;

    private Integer houseType;

    private Integer status;

    private String facilities;

    private String threeDUrl;

    private String coverImage;

    private String images;

    private String description;

    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @TableField(fill = FieldFill.INSERT)
    private Long createBy;

    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Long updateBy;

    @TableLogic
    private Integer deleted;
}
