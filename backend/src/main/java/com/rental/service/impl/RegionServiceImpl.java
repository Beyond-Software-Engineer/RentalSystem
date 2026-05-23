package com.rental.service.impl;

import com.rental.entity.RegionEntity;
import com.rental.mapper.RegionMapper;
import com.rental.service.RegionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class RegionServiceImpl implements RegionService {

    private final RegionMapper regionMapper;

    @Override
    public List<RegionEntity> listAllRegions() {
        return regionMapper.selectList(null);
    }
}
