package com.rental.common;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import jakarta.annotation.PostConstruct;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 城市编码映射工具类
 * 用于根据城市编码查找城市名称
 */
@Component
@Slf4j
public class CityCodeMapper {

    /**
     * 城市编码到城市名称的映射
     * key: 城市编码（如 "110100"）
     * value: 城市名称（如 "北京市"）
     */
    private final Map<String, String> cityCodeToNameMap = new HashMap<>();

    /**
     * 城市编码到城市简称的映射
     * key: 城市编码（如 "110100"）
     * value: 城市简称（如 "北京"）
     */
    private final Map<String, String> cityCodeToShortNameMap = new HashMap<>();

    /**
     * 特殊行政区编码前缀
     */
    private static final String[] SPECIAL_REGION_PREFIXES = {"11", "12", "31", "50", "81", "82"};

    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * 初始化加载 location.json 文件
     */
    @PostConstruct
    public void init() {
        log.info("开始加载 location.json 文件...");
        try {
            ClassPathResource resource = new ClassPathResource("location.json");
            InputStream inputStream = resource.getInputStream();
            
            List<LocationItem> locationItems = objectMapper.readValue(inputStream, new TypeReference<List<LocationItem>>() {});
            
            for (LocationItem item : locationItems) {
                // 只处理市级数据（city != 0 且 area == 0）
                if (item.getCity() != 0 && item.getArea() == 0) {
                    String cityCode = item.getCode();
                    String cityName = item.getName();
                    
                    cityCodeToNameMap.put(cityCode, cityName);
                    
                    // 提取城市简称（去掉"市"、"省"、"自治区"等后缀）
                    String shortName = extractShortName(cityName);
                    cityCodeToShortNameMap.put(cityCode, shortName);
                    
                    log.debug("加载城市: code={}, name={}, shortName={}", cityCode, cityName, shortName);
                }
                
                // 处理省级数据（对于直辖市，省级编码也可以用于查询）
                if (item.getCity() == 0 && item.getArea() == 0) {
                    String provinceCode = item.getCode();
                    String provinceName = item.getName();
                    
                    // 对于直辖市（北京、天津、上海、重庆），省级编码也可以映射
                    String prefix = provinceCode.substring(0, 2);
                    if (isSpecialRegion(prefix)) {
                        // 直辖市的市级编码通常是 省级前缀 + "01" + "00"
                        String cityCode = prefix + "0100";
                        cityCodeToNameMap.put(cityCode, provinceName);
                        cityCodeToShortNameMap.put(cityCode, extractShortName(provinceName));
                        
                        // 同时也支持省级编码直接查询
                        cityCodeToNameMap.put(provinceCode, provinceName);
                        cityCodeToShortNameMap.put(provinceCode, extractShortName(provinceName));
                        
                        log.debug("加载直辖市: provinceCode={}, cityCode={}, name={}", provinceCode, cityCode, provinceName);
                    }
                }
            }
            
            log.info("location.json 加载完成，共加载 {} 个城市编码映射", cityCodeToNameMap.size());
            
        } catch (IOException e) {
            log.error("加载 location.json 文件失败", e);
        }
    }

    /**
     * 根据城市编码获取城市名称
     *
     * @param cityCode 城市编码
     * @return 城市名称，如果找不到则返回 null
     */
    public String getCityName(String cityCode) {
        if (cityCode == null || cityCode.trim().isEmpty()) {
            return null;
        }
        
        String cityName = cityCodeToNameMap.get(cityCode);
        if (cityName == null) {
            log.warn("未找到城市编码对应的名称: {}", cityCode);
        }
        return cityName;
    }

    /**
     * 根据城市编码获取城市简称
     *
     * @param cityCode 城市编码
     * @return 城市简称，如果找不到则返回 null
     */
    public String getCityShortName(String cityCode) {
        if (cityCode == null || cityCode.trim().isEmpty()) {
            return null;
        }
        
        String shortName = cityCodeToShortNameMap.get(cityCode);
        if (shortName == null) {
            log.warn("未找到城市编码对应的简称: {}", cityCode);
        }
        return shortName;
    }

    /**
     * 判断是否为特殊行政区（直辖市、特别行政区）
     *
     * @param prefix 编码前缀
     * @return 是否为特殊行政区
     */
    private boolean isSpecialRegion(String prefix) {
        for (String specialPrefix : SPECIAL_REGION_PREFIXES) {
            if (specialPrefix.equals(prefix)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 提取城市简称
     * 去掉"市"、"省"、"自治区"、"特别行政区"等后缀
     *
     * @param name 城市名称
     * @return 城市简称
     */
    private String extractShortName(String name) {
        if (name == null) {
            return null;
        }
        
        // 去掉常见的后缀
        return name
                .replace("市", "")
                .replace("省", "")
                .replace("自治区", "")
                .replace("特别行政区", "")
                .replace("壮族", "")
                .replace("回族", "")
                .replace("维吾尔", "");
    }

    /**
     * location.json 中的数据项结构
     */
    public static class LocationItem {
        private String code;
        private String name;
        private String province;
        private Object city;
        private Object area;
        private Object town;

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getProvince() {
            return province;
        }

        public void setProvince(String province) {
            this.province = province;
        }

        public int getCity() {
            if (city instanceof Number) {
                return ((Number) city).intValue();
            }
            if (city instanceof String) {
                try {
                    return Integer.parseInt((String) city);
                } catch (NumberFormatException e) {
                    return 0;
                }
            }
            return 0;
        }

        public void setCity(Object city) {
            this.city = city;
        }

        public int getArea() {
            if (area instanceof Number) {
                return ((Number) area).intValue();
            }
            if (area instanceof String) {
                try {
                    return Integer.parseInt((String) area);
                } catch (NumberFormatException e) {
                    return 0;
                }
            }
            return 0;
        }

        public void setArea(Object area) {
            this.area = area;
        }

        public int getTown() {
            if (town instanceof Number) {
                return ((Number) town).intValue();
            }
            if (town instanceof String) {
                try {
                    return Integer.parseInt((String) town);
                } catch (NumberFormatException e) {
                    return 0;
                }
            }
            return 0;
        }

        public void setTown(Object town) {
            this.town = town;
        }
    }
}