package com.rental.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.rental.common.CommonResponse;
import com.rental.common.PageResult;
import com.rental.dto.HouseQueryDTO;
import com.rental.service.HouseService;
import com.rental.vo.HouseDetailVO;
import com.rental.vo.HouseSimpleVO;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/house")
@RequiredArgsConstructor
public class HouseController {

    private final HouseService houseService;

    @GetMapping("/page")
    public CommonResponse<PageResult<HouseSimpleVO>> pageHouse(
            @ModelAttribute HouseQueryDTO query) {
        // 设置默认分页参数
        if (query.getPageNum() == null) {
            query.setPageNum(1);
        }
        if (query.getPageSize() == null) {
            query.setPageSize(10);
        }
        
        IPage<HouseSimpleVO> page = houseService.pageHouse(query);
        return CommonResponse.success(new PageResult<>(
            page.getTotal(),
            page.getSize(),
            page.getCurrent(),
            page.getPages(),
            page.getRecords()
        ));
    }

    @GetMapping("/{id}")
    public CommonResponse<HouseDetailVO> getHouseDetail(@PathVariable Long id) {
        return CommonResponse.success(houseService.getHouseDetail(id));
    }

    @GetMapping("/recommend")
    public CommonResponse<PageResult<HouseSimpleVO>> getRecommendHouse(
            @RequestParam(required = false) String cityCode) {
        IPage<HouseSimpleVO> page = houseService.getRecommendHouse(cityCode);
        return CommonResponse.success(new PageResult<>(
            page.getTotal(),
            page.getSize(),
            page.getCurrent(),
            page.getPages(),
            page.getRecords()
        ));
    }
}
