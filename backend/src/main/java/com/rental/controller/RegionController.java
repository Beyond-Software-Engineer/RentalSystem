package com.rental.controller;

import com.rental.common.CommonResponse;
import com.rental.entity.RegionEntity;
import com.rental.service.RegionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/region")
@RequiredArgsConstructor
public class RegionController {

    private final RegionService regionService;

    @GetMapping("/list")
    public CommonResponse<List<RegionEntity>> listRegions() {
        return CommonResponse.success(regionService.listAllRegions());
    }
}
