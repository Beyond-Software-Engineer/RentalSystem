-- =============================================
-- 租房系统数据库初始化脚本
-- 版本: 1.0.0
-- 日期: 2026-05-23
-- =============================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS rental_system
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_unicode_ci;

USE rental_system;

-- =============================================
-- 1. 用户表
-- =============================================
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '用户ID',
    phone VARCHAR(11) NOT NULL COMMENT '手机号',
    username VARCHAR(50) DEFAULT NULL COMMENT '用户名',
    avatar VARCHAR(255) DEFAULT NULL COMMENT '头像URL',
    gender TINYINT DEFAULT 0 COMMENT '性别：0-未知，1-男，2-女',
    email VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
    password VARCHAR(255) DEFAULT NULL COMMENT '密码',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-禁用，1-正常',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    create_by BIGINT DEFAULT NULL COMMENT '创建人',
    update_by BIGINT DEFAULT NULL COMMENT '更新人',
    deleted TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记：0-未删除，1-已删除',
    PRIMARY KEY (id),
    UNIQUE KEY uk_sys_user_phone (phone),
    KEY idx_sys_user_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户表';

-- =============================================
-- 2. 区域表
-- =============================================
DROP TABLE IF EXISTS biz_region;
CREATE TABLE biz_region (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '区域ID',
    name VARCHAR(50) NOT NULL COMMENT '区域名称',
    code VARCHAR(20) NOT NULL COMMENT '区域编码',
    city VARCHAR(50) NOT NULL COMMENT '所属城市',
    sort INT NOT NULL DEFAULT 0 COMMENT '排序',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    deleted TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记：0-未删除，1-已删除',
    PRIMARY KEY (id),
    UNIQUE KEY uk_biz_region_code (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='区域表';

-- =============================================
-- 3. 设施表
-- =============================================
DROP TABLE IF EXISTS biz_facility;
CREATE TABLE biz_facility (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '设施ID',
    name VARCHAR(50) NOT NULL COMMENT '设施名称',
    icon VARCHAR(100) DEFAULT NULL COMMENT '图标',
    category VARCHAR(20) DEFAULT NULL COMMENT '分类',
    sort INT NOT NULL DEFAULT 0 COMMENT '排序',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记：0-未删除，1-已删除',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='设施表';

-- =============================================
-- 4. 房源表
-- =============================================
DROP TABLE IF EXISTS biz_house;
CREATE TABLE biz_house (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '房源ID',
    title VARCHAR(200) NOT NULL COMMENT '标题',
    room TINYINT NOT NULL COMMENT '户型-室',
    hall TINYINT NOT NULL COMMENT '户型-厅',
    kitchen TINYINT NOT NULL COMMENT '户型-厨',
    toilet TINYINT NOT NULL COMMENT '户型-卫',
    decoration_type TINYINT NOT NULL COMMENT '装修类型：1-毛坯，2-简装，3-精装',
    rent DECIMAL(10,2) NOT NULL COMMENT '租金/月',
    deposit DECIMAL(10,2) NOT NULL COMMENT '押金',
    rent_type TINYINT NOT NULL COMMENT '租赁方式：1-整租，2-合租',
    floor INT NOT NULL COMMENT '所在楼层',
    total_floor INT NOT NULL COMMENT '总楼层',
    area DECIMAL(8,2) NOT NULL COMMENT '面积(㎡)',
    region_id BIGINT NOT NULL COMMENT '区域ID',
    address VARCHAR(255) NOT NULL COMMENT '详细地址',
    house_type TINYINT NOT NULL COMMENT '房屋类型：1-住宅，2-公寓，3-商铺，4-写字楼',
    status TINYINT NOT NULL DEFAULT 0 COMMENT '状态：0-待租，1-已租，2-已下架',
    facilities VARCHAR(1000) DEFAULT NULL COMMENT '房屋配套JSON',
    three_d_url VARCHAR(500) DEFAULT NULL COMMENT '三维展示URL',
    cover_image VARCHAR(255) DEFAULT NULL COMMENT '封面图',
    images VARCHAR(2000) DEFAULT NULL COMMENT '详细图片JSON',
    description TEXT DEFAULT NULL COMMENT '描述',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    create_by BIGINT DEFAULT NULL COMMENT '创建人',
    update_by BIGINT DEFAULT NULL COMMENT '更新人',
    deleted TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记：0-未删除，1-已删除',
    PRIMARY KEY (id),
    KEY idx_biz_house_region (region_id),
    KEY idx_biz_house_rent (rent),
    KEY idx_biz_house_status (status),
    KEY idx_biz_house_create_time (create_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='房源表';

-- =============================================
-- 5. 房源设施关联表
-- =============================================
DROP TABLE IF EXISTS biz_house_facility;
CREATE TABLE biz_house_facility (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    house_id BIGINT NOT NULL COMMENT '房源ID',
    facility_id BIGINT NOT NULL COMMENT '设施ID',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (id),
    UNIQUE KEY uk_biz_house_facility (house_id, facility_id),
    KEY idx_biz_house_facility_house (house_id),
    KEY idx_biz_house_facility_facility (facility_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='房源设施关联表';

-- =============================================
-- 6. 房源图片表
-- =============================================
DROP TABLE IF EXISTS biz_house_image;
CREATE TABLE biz_house_image (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '图片ID',
    house_id BIGINT NOT NULL COMMENT '房源ID',
    url VARCHAR(500) NOT NULL COMMENT '图片URL',
    type TINYINT NOT NULL DEFAULT 1 COMMENT '类型：1-封面，2-详情图，3-三维图',
    sort INT NOT NULL DEFAULT 0 COMMENT '排序',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    deleted TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记：0-未删除，1-已删除',
    PRIMARY KEY (id),
    KEY idx_biz_house_image_house (house_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='房源图片表';

-- =============================================
-- 7. 订单表
-- =============================================
DROP TABLE IF EXISTS biz_order;
CREATE TABLE biz_order (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '订单ID',
    order_no VARCHAR(32) NOT NULL COMMENT '订单号',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    house_id BIGINT NOT NULL COMMENT '房源ID',
    rent DECIMAL(10,2) NOT NULL COMMENT '月租金',
    deposit DECIMAL(10,2) NOT NULL COMMENT '押金',
    start_date DATE NOT NULL COMMENT '租赁开始日期',
    end_date DATE NOT NULL COMMENT '租赁结束日期',
    status TINYINT NOT NULL DEFAULT 0 COMMENT '状态：0-待支付，1-已支付，2-已取消，3-已到期',
    pay_time DATETIME DEFAULT NULL COMMENT '支付时间',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    deleted TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记：0-未删除，1-已删除',
    PRIMARY KEY (id),
    UNIQUE KEY uk_biz_order_no (order_no),
    KEY idx_biz_order_user (user_id),
    KEY idx_biz_order_house (house_id),
    KEY idx_biz_order_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

-- =============================================
-- 8. 新闻表
-- =============================================
DROP TABLE IF EXISTS biz_news;
CREATE TABLE biz_news (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '新闻ID',
    title VARCHAR(200) NOT NULL COMMENT '标题',
    cover_image VARCHAR(255) DEFAULT NULL COMMENT '封面图',
    summary VARCHAR(500) DEFAULT NULL COMMENT '摘要',
    content TEXT NOT NULL COMMENT '内容',
    author VARCHAR(50) DEFAULT NULL COMMENT '作者',
    source VARCHAR(100) DEFAULT NULL COMMENT '来源',
    view_count INT NOT NULL DEFAULT 0 COMMENT '浏览量',
    status TINYINT NOT NULL DEFAULT 1 COMMENT '状态：0-草稿，1-已发布',
    publish_time DATETIME DEFAULT NULL COMMENT '发布时间',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    create_by BIGINT DEFAULT NULL COMMENT '创建人',
    update_by BIGINT DEFAULT NULL COMMENT '更新人',
    deleted TINYINT NOT NULL DEFAULT 0 COMMENT '删除标记：0-未删除，1-已删除',
    PRIMARY KEY (id),
    KEY idx_biz_news_status (status),
    KEY idx_biz_news_publish_time (publish_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='新闻表';

-- =============================================
-- 9. 短信验证码表
-- =============================================
DROP TABLE IF EXISTS biz_sms_code;
CREATE TABLE biz_sms_code (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    mobile VARCHAR(11) NOT NULL COMMENT '手机号',
    code VARCHAR(6) NOT NULL COMMENT '验证码',
    status TINYINT NOT NULL DEFAULT 0 COMMENT '状态：0-未使用，1-已使用，2-已失效',
    expire_time DATETIME NOT NULL COMMENT '过期时间',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    PRIMARY KEY (id),
    KEY idx_biz_sms_code_mobile (mobile),
    KEY idx_biz_sms_code_expire (expire_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='短信验证码表';

-- =============================================
-- 10. 令牌表
-- =============================================
DROP TABLE IF EXISTS biz_token;
CREATE TABLE biz_token (
    id BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键ID',
    user_id BIGINT NOT NULL COMMENT '用户ID',
    access_token VARCHAR(500) NOT NULL COMMENT '访问令牌',
    refresh_token VARCHAR(500) NOT NULL COMMENT '刷新令牌',
    access_expire_time DATETIME NOT NULL COMMENT '访问令牌过期时间',
    refresh_expire_time DATETIME NOT NULL COMMENT '刷新令牌过期时间',
    create_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    PRIMARY KEY (id),
    UNIQUE KEY uk_biz_token_user (user_id),
    KEY idx_biz_token_access (access_token),
    KEY idx_biz_token_refresh (refresh_token)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='令牌表';

-- =============================================
-- 初始化数据
-- =============================================

-- 插入设施数据
INSERT INTO biz_facility (name, icon, category, sort) VALUES
('电视', 'icon-tv', '家电', 1),
('空调', 'icon-ac', '家电', 2),
('洗衣机', 'icon-washer', '家电', 3),
('冰箱', 'icon-fridge', '家电', 4),
('热水器', 'icon-heater', '家电', 5),
('油烟机', 'icon-hood', '家电', 6),
('微波炉', 'icon-microwave', '家电', 7),
('床', 'icon-bed', '家具', 1),
('沙发', 'icon-sofa', '家具', 2),
('衣柜', 'icon-wardrobe', '家具', 3),
('书桌', 'icon-desk', '家具', 4),
('餐桌椅', 'icon-dining', '家具', 5),
('椅子', 'icon-chair', '家具', 6),
('宽带', 'icon-wifi', '其他', 1),
('阳台', 'icon-balcony', '其他', 2),
('独立卫生间', 'icon-bathroom', '其他', 3),
('电梯', 'icon-elevator', '其他', 4),
('暖气', 'icon-heating', '其他', 5),
('停车位', 'icon-parking', '其他', 6);


-- 插入房源设施关联
INSERT INTO biz_house_facility (house_id, facility_id) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 8), (1, 9), (1, 10), (1, 14),
(2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 8), (2, 9), (2, 10), (2, 14),
(3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 8), (3, 9), (3, 10), (3, 11), (3, 15),
(4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 14),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 5), (5, 8), (5, 10), (5, 14);

-- 插入新闻数据
INSERT INTO biz_news (title, cover_image, summary, content, author, source, view_count, status, publish_time) VALUES
('租房旺季来临，这些注意事项你需要知道', 'https://picsum.photos/400/300?random=1', '随着春季租房旺季的到来，越来越多的人开始寻找新的住处。本文为您整理了租房过程中需要注意的关键点。', '<p>随着春季租房旺季的到来...</p>', '房产小助手', '租房网', 1256, 1, NOW()),
('最新房产政策解读：租房补贴申请指南', 'https://picsum.photos/400/300?random=2', '各地出台的租房补贴政策为租客们带来了实实在在的福利。本文详细解读如何申请租房补贴。', '<p>各地出台的租房补贴政策...</p>', '政策研究员', '政策解读', 892, 1, NOW()),
('如何识别优质房源？资深中介来支招', 'https://picsum.photos/400/300?random=3', '找房过程中如何避免踩坑？一位从业十年的房产中介分享了他的经验。', '<p>找房过程中如何避免踩坑...</p>', '资深中介王老师', '经验分享', 2341, 1, NOW()),
('租房合同避坑指南，这些条款要注意', 'https://picsum.photos/400/300?random=4', '签订租房合同前，这些条款一定要仔细核对，否则可能会吃大亏。', '<p>签订租房合同前...</p>', '法律顾问李律师', '法律科普', 1567, 1, NOW()),
('年后返工租房忙，这些区域性价比最高', 'https://picsum.photos/400/300?random=5', '年后返工潮带动租房需求上涨，本文为您推荐几个性价比最高的租房区域。', '<p>年后返工潮带动租房需求...</p>', '数据分析师', '市场分析', 987, 1, NOW());

-- =============================================
-- 测试用户数据（密码都是123456，BCrypt加密）
-- =============================================
INSERT INTO sys_user (phone, username, avatar, gender, email, password, status) VALUES
('13800138000', '测试用户1', 'https://picsum.photos/100/100?random=1', 1, 'user1@test.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', 1),
('13800138001', '测试用户2', 'https://picsum.photos/100/100?random=2', 2, 'user2@test.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', 1);

-- =============================================
-- 存储过程：清理过期验证码
-- =============================================
DROP PROCEDURE IF EXISTS clean_expired_sms_code;
DELIMITER //
CREATE PROCEDURE clean_expired_sms_code()
BEGIN
    UPDATE biz_sms_code
    SET status = 2
    WHERE status = 0 AND expire_time < NOW();
END //
DELIMITER ;

-- =============================================
-- 事件：每天执行一次清理过期验证码
-- =============================================
DROP EVENT IF EXISTS evt_clean_expired_sms_code;
CREATE EVENT evt_clean_expired_sms_code
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
DO CALL clean_expired_sms_code();

