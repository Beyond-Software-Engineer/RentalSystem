package com.rental.common;

import lombok.extern.slf4j.Slf4j;

import java.math.BigDecimal;
import java.util.regex.Pattern;

/**
 * 参数验证工具类
 */
@Slf4j
public class ValidationUtils {

    /**
     * 价格最小值（元/月）
     */
    public static final BigDecimal PRICE_MIN = BigDecimal.ZERO;

    /**
     * 价格最大值（元/月）- 100万
     */
    public static final BigDecimal PRICE_MAX = new BigDecimal("1000000");

    /**
     * 面积最小值（㎡）
     */
    public static final BigDecimal AREA_MIN = BigDecimal.ZERO;

    /**
     * 面积最大值（㎡）- 10万
     */
    public static final BigDecimal AREA_MAX = new BigDecimal("100000");

    /**
     * 楼层最小值
     */
    public static final Integer FLOOR_MIN = 1;

    /**
     * 楼层最大值
     */
    public static final Integer FLOOR_MAX = 1000;

    /**
     * 房间数量最大值（包含5）
     */
    public static final Integer ROOM_MAX = 5;

    /**
     * 数字正则表达式
     */
    private static final Pattern NUMBER_PATTERN = Pattern.compile("^\\d+$");

    /**
     * 验证价格区间
     *
     * @param minRent 最低价格
     * @param maxRent 最高价格
     * @return 验证结果，null表示验证通过，否则返回错误信息
     */
    public static String validatePriceRange(BigDecimal minRent, BigDecimal maxRent) {
        // 记录验证日志
        log.info("开始验证价格区间: minRent={}, maxRent={}", minRent, maxRent);

        // 检查是否都为空
        if (minRent == null && maxRent == null) {
            log.info("价格区间参数为空，跳过验证");
            return null;
        }

        // 验证最低价格
        if (minRent != null) {
            // 验证是否为有效数字
            if (minRent.compareTo(BigDecimal.ZERO) < 0) {
                String error = "最低价格不能为负数: " + minRent;
                log.warn("价格验证失败: {}", error);
                return error;
            }

            // 验证最小值边界
            if (minRent.compareTo(PRICE_MIN) < 0) {
                String error = "最低价格不能小于 " + PRICE_MIN + ": " + minRent;
                log.warn("价格验证失败: {}", error);
                return error;
            }

            // 验证最大值边界
            if (minRent.compareTo(PRICE_MAX) > 0) {
                String error = "最低价格不能大于 " + PRICE_MAX + ": " + minRent;
                log.warn("价格验证失败: {}", error);
                return error;
            }
        }

        // 验证最高价格
        if (maxRent != null) {
            // 验证是否为有效数字
            if (maxRent.compareTo(BigDecimal.ZERO) < 0) {
                String error = "最高价格不能为负数: " + maxRent;
                log.warn("价格验证失败: {}", error);
                return error;
            }

            // 验证最小值边界
            if (maxRent.compareTo(PRICE_MIN) < 0) {
                String error = "最高价格不能小于 " + PRICE_MIN + ": " + maxRent;
                log.warn("价格验证失败: {}", error);
                return error;
            }

            // 验证最大值边界
            if (maxRent.compareTo(PRICE_MAX) > 0) {
                String error = "最高价格不能大于 " + PRICE_MAX + ": " + maxRent;
                log.warn("价格验证失败: {}", error);
                return error;
            }
        }

        // 验证最小值小于最大值
        if (minRent != null && maxRent != null) {
            if (minRent.compareTo(maxRent) >= 0) {
                String error = "最低价格必须小于最高价格: minRent=" + minRent + ", maxRent=" + maxRent;
                log.warn("价格验证失败: {}", error);
                return error;
            }
        }

        log.info("价格区间验证通过");
        return null;
    }

    /**
     * 验证面积区间
     *
     * @param minArea 最小面积
     * @param maxArea 最大面积
     * @return 验证结果，null表示验证通过，否则返回错误信息
     */
    public static String validateAreaRange(BigDecimal minArea, BigDecimal maxArea) {
        log.info("开始验证面积区间: minArea={}, maxArea={}", minArea, maxArea);

        if (minArea == null && maxArea == null) {
            log.info("面积区间参数为空，跳过验证");
            return null;
        }

        if (minArea != null) {
            if (minArea.compareTo(BigDecimal.ZERO) < 0) {
                String error = "最小面积不能为负数: " + minArea;
                log.warn("面积验证失败: {}", error);
                return error;
            }
            if (minArea.compareTo(AREA_MIN) < 0) {
                String error = "最小面积不能小于 " + AREA_MIN + ": " + minArea;
                log.warn("面积验证失败: {}", error);
                return error;
            }
            if (minArea.compareTo(AREA_MAX) > 0) {
                String error = "最小面积不能大于 " + AREA_MAX + ": " + minArea;
                log.warn("面积验证失败: {}", error);
                return error;
            }
        }

        if (maxArea != null) {
            if (maxArea.compareTo(BigDecimal.ZERO) < 0) {
                String error = "最大面积不能为负数: " + maxArea;
                log.warn("面积验证失败: {}", error);
                return error;
            }
            if (maxArea.compareTo(AREA_MIN) < 0) {
                String error = "最大面积不能小于 " + AREA_MIN + ": " + maxArea;
                log.warn("面积验证失败: {}", error);
                return error;
            }
            if (maxArea.compareTo(AREA_MAX) > 0) {
                String error = "最大面积不能大于 " + AREA_MAX + ": " + maxArea;
                log.warn("面积验证失败: {}", error);
                return error;
            }
        }

        if (minArea != null && maxArea != null) {
            if (minArea.compareTo(maxArea) >= 0) {
                String error = "最小面积必须小于最大面积: minArea=" + minArea + ", maxArea=" + maxArea;
                log.warn("面积验证失败: {}", error);
                return error;
            }
        }

        log.info("面积区间验证通过");
        return null;
    }

    /**
     * 验证楼层范围
     *
     * @param minFloor 最小楼层
     * @param maxFloor 最大楼层
     * @return 验证结果，null表示验证通过，否则返回错误信息
     */
    public static String validateFloorRange(Integer minFloor, Integer maxFloor) {
        log.info("开始验证楼层区间: minFloor={}, maxFloor={}", minFloor, maxFloor);

        if (minFloor == null && maxFloor == null) {
            log.info("楼层区间参数为空，跳过验证");
            return null;
        }

        if (minFloor != null) {
            if (minFloor < FLOOR_MIN) {
                String error = "最小楼层不能小于 " + FLOOR_MIN + ": " + minFloor;
                log.warn("楼层验证失败: {}", error);
                return error;
            }
            if (minFloor > FLOOR_MAX) {
                String error = "最小楼层不能大于 " + FLOOR_MAX + ": " + minFloor;
                log.warn("楼层验证失败: {}", error);
                return error;
            }
        }

        if (maxFloor != null) {
            if (maxFloor < FLOOR_MIN) {
                String error = "最大楼层不能小于 " + FLOOR_MIN + ": " + maxFloor;
                log.warn("楼层验证失败: {}", error);
                return error;
            }
            if (maxFloor > FLOOR_MAX) {
                String error = "最大楼层不能大于 " + FLOOR_MAX + ": " + maxFloor;
                log.warn("楼层验证失败: {}", error);
                return error;
            }
        }

        if (minFloor != null && maxFloor != null) {
            if (minFloor > maxFloor) {
                String error = "最小楼层必须小于最大楼层: minFloor=" + minFloor + ", maxFloor=" + maxFloor;
                log.warn("楼层验证失败: {}", error);
                return error;
            }
        }

        log.info("楼层区间验证通过");
        return null;
    }

    /**
     * 验证房间数量（0-5或-1表示"其他"）
     *
     * @param room 房间数量
     * @param fieldName 字段名称
     * @return 验证结果，null表示验证通过，否则返回错误信息
     */
    public static String validateRoomCount(Integer room, String fieldName) {
        log.info("开始验证房间数量: {}={}", fieldName, room);

        if (room == null) {
            log.info("{}参数为空，跳过验证", fieldName);
            return null;
        }

        // -1 表示"其他"选项，是有效值
        if (room == -1) {
            log.info("{}选择了'其他'选项", fieldName);
            return null;
        }

        if (room < 0) {
            String error = fieldName + "不能为负数: " + room;
            log.warn("房间数量验证失败: {}", error);
            return error;
        }

        if (room > ROOM_MAX) {
            String error = fieldName + "不能大于 " + ROOM_MAX + ": " + room;
            log.warn("房间数量验证失败: {}", error);
            return error;
        }

        log.info("{}验证通过", fieldName);
        return null;
    }

    /**
     * 验证是否为有效数字字符串
     *
     * @param value 待验证的字符串
     * @param fieldName 字段名称
     * @return 验证结果，null表示验证通过，否则返回错误信息
     */
    public static String validateNumberString(String value, String fieldName) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }

        if (!NUMBER_PATTERN.matcher(value.trim()).matches()) {
            String error = fieldName + "必须为有效数字: " + value;
            log.warn("数字验证失败: {}", error);
            return error;
        }

        return null;
    }

    /**
     * 记录异常输入日志
     *
     * @param paramName 参数名称
     * @param paramValue 参数值
     * @param errorMessage 错误信息
     */
    public static void logInvalidInput(String paramName, Object paramValue, String errorMessage) {
        log.error("检测到异常输入 - 参数名: {}, 参数值: {}, 错误信息: {}", 
                paramName, paramValue, errorMessage);
    }

    /**
     * 记录潜在攻击行为日志
     *
     * @param paramName 参数名称
     * @param paramValue 参数值
     * @param attackType 攻击类型
     */
    public static void logPotentialAttack(String paramName, Object paramValue, String attackType) {
        log.error("检测到潜在攻击行为 - 攻击类型: {}, 参数名: {}, 参数值: {}", 
                attackType, paramName, paramValue);
    }
}