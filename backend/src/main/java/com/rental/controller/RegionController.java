package com.rental.controller;

import com.rental.common.CommonResponse;
import com.rental.entity.RegionEntity;
import com.rental.service.RegionService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/region")
@RequiredArgsConstructor
@Slf4j
public class RegionController {

    private final RegionService regionService;

    @GetMapping("/list")
    public CommonResponse<List<RegionEntity>> listRegions() {
        return CommonResponse.success(regionService.listAllRegions());
    }

    /**
     * 根据城市编码查询区域列表
     *
     * @param cityCode 城市编码
     * @return 区域列表
     */
    @GetMapping("/list-by-city")
    public CommonResponse<List<RegionEntity>> listRegionsByCity(@RequestParam("cityCode") String cityCode) {
        log.info("接收到区域查询请求: cityCode={}", cityCode);
        return CommonResponse.success(regionService.listRegionsByCityCode(cityCode));
    }
}
