#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
从 location.json 提取城市和区县数据，生成 SQL 插入语句
特别处理直辖市（北京、天津、上海、重庆）
"""

import json
import os

# 直辖市列表（这些城市既是省级也是市级）
MUNICIPALITIES = {'北京市', '天津市', '上海市', '重庆市'}

def load_location_json(filepath):
    """加载 location.json 文件"""
    with open(filepath, 'r', encoding='utf-8') as f:
        return json.load(f)

def parse_location_data(data):
    """解析位置数据，分离省份、城市、区县"""
    provinces = {}  # 省份代码 -> 省份名称
    cities = {}     # 城市代码 -> (城市名称, 省份名称)
    districts = {}  # 区县代码 -> (区县名称, 城市名称, 排序)
    
    for item in data:
        code = item['code']
        name = item['name']
        province_code = str(item['province'])
        city_code = str(item['city']).zfill(2) if item['city'] else '00'
        area_code = str(item['area']).zfill(2) if item['area'] else '00'
        
        # 判断层级
        if area_code == '00' and city_code == '00':
            # 省级
            provinces[province_code] = name
            # 对于直辖市，同时作为市级数据
            if name in MUNICIPALITIES:
                cities[code] = (name.replace('市', ''), name)
        elif area_code == '00' and city_code != '00':
            # 市级
            full_city_code = f"{province_code}{city_code}00"
            province_name = provinces.get(province_code, "")
            cities[full_city_code] = (name, province_name)
        elif area_code != '00':
            # 区县级
            # 构建城市代码：省级代码+城市代码+00
            full_city_code = f"{province_code}{city_code}00"
            
            # 获取城市信息
            city_info = cities.get(full_city_code)
            
            if city_info:
                # 普通城市
                city_name = city_info[0]
            else:
                # 尝试使用省级代码获取直辖市信息
                province_name = provinces.get(province_code, "")
                if province_name in MUNICIPALITIES:
                    # 直辖市
                    city_name = province_name.replace('市', '')
                else:
                    # 无法确定城市，跳过
                    continue
            
            # 区县排序
            sort_order = int(area_code) if area_code.isdigit() else 999
            districts[code] = (name, city_name, sort_order)
    
    return provinces, cities, districts

def generate_sql(districts):
    """生成 SQL 插入语句"""
    # 按城市分组
    city_districts = {}
    for code, (district_name, city_name, sort_order) in districts.items():
        if city_name not in city_districts:
            city_districts[city_name] = []
        city_districts[city_name].append((district_name, code, sort_order))
    
    sql_parts = []
    
    # 文件头部
    sql_parts.append("-- ==============================================")
    sql_parts.append("-- 区域数据补充脚本")
    sql_parts.append("-- 从 location.json 自动生成")
    sql_parts.append("-- 使用 INSERT IGNORE 避免重复插入")
    sql_parts.append("-- ==============================================\n")
    sql_parts.append("USE rental_system;\n")
    sql_parts.append("-- 创建唯一索引（如果不存在）")
    sql_parts.append("ALTER TABLE IF EXISTS biz_region ")
    sql_parts.append("ADD CONSTRAINT IF NOT EXISTS uk_biz_region_code UNIQUE (code);\n")
    
    # 按城市生成 INSERT 语句，直辖市优先
    sorted_cities = sorted(city_districts.keys(), key=lambda x: (x not in {'北京', '天津', '上海', '重庆'}, x))
    
    city_count = 0
    total_districts = 0
    
    for city_name in sorted_cities:
        district_list = city_districts[city_name]
        # 按排序字段排序
        district_list.sort(key=lambda x: x[2])
        
        sql_parts.append(f"\n-- ==============================================")
        sql_parts.append(f"-- {city_name}区域数据 ({len(district_list)}个区县)")
        sql_parts.append(f"-- ==============================================")
        sql_parts.append(f"INSERT IGNORE INTO biz_region (name, code, city, sort) VALUES")
        
        rows = []
        for i, (district_name, code, sort_order) in enumerate(district_list, 1):
            # 使用区县code的后4位作为区县编码
            district_code = code[-4:] if len(code) >= 4 else code
            # 使用城市简称的拼音首字母作为前缀
            city_prefix = get_city_prefix(city_name)
            row = f"('{district_name}', '{city_prefix}_{district_code}', '{city_name}', {i})"
            rows.append(row)
        
        sql_parts.append(",\n".join(rows) + ";")
        city_count += 1
        total_districts += len(district_list)
    
    # 文件尾部
    sql_parts.append("\n-- ==============================================")
    sql_parts.append("-- 完成统计")
    sql_parts.append("-- ==============================================")
    sql_parts.append(f"SELECT '{city_count}个城市, {total_districts}个区县数据补充完成' AS message;")
    sql_parts.append("SELECT COUNT(*) AS total_regions FROM biz_region;")
    
    return "\n".join(sql_parts), city_count, total_districts

def get_city_prefix(city_name):
    """获取城市简称前缀"""
    prefix_map = {
        '北京': 'BJ',
        '天津': 'TJ',
        '上海': 'SH',
        '重庆': 'CQ',
        '广州': 'GZ',
        '深圳': 'SZ',
        '杭州': 'HZ',
        '南京': 'NJ',
        '成都': 'CD',
        '武汉': 'WH',
        '西安': 'XA',
        '苏州': 'SU',
        '郑州': 'ZZ',
        '长沙': 'CS',
        '青岛': 'QD',
        '济南': 'JN',
        '合肥': 'HF',
        '沈阳': 'SY',
        '大连': 'DL'
    }
    if city_name in prefix_map:
        return prefix_map[city_name]
    # 默认使用城市名前两个字的拼音首字母
    return ''.join([c for c in city_name if c.isalpha() or c.isdigit()])[:2].upper()

def main():
    # 路径配置
    json_path = r"e:\Workspace\Java\GreatCreate\backend\src\main\resources\location.json"
    sql_path = r"e:\Workspace\Java\GreatCreate\sql\region_data.sql"
    
    if not os.path.exists(json_path):
        print(f"错误：未找到文件 {json_path}")
        return
    
    print("正在加载 location.json...")
    data = load_location_json(json_path)
    print(f"加载完成，共 {len(data)} 条记录")
    
    print("正在解析数据...")
    provinces, cities, districts = parse_location_data(data)
    print(f"解析完成：{len(provinces)} 个省份, {len(cities)} 个城市, {len(districts)} 个区县")
    
    print("正在生成 SQL...")
    sql_content, city_count, total_districts = generate_sql(districts)
    
    print(f"正在写入 SQL 文件...")
    with open(sql_path, 'w', encoding='utf-8') as f:
        f.write(sql_content)
    
    print(f"生成完成！")
    print(f"  - 城市数量：{city_count}")
    print(f"  - 区县数量：{total_districts}")
    print(f"  - 输出文件：{sql_path}")

if __name__ == "__main__":
    main()