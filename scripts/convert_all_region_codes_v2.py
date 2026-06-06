#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
区域编码转换脚本（改进版）
将 region_data.sql 中的所有区域编码转换为标准行政区划代码
参考 location.json 中的编码，并考虑城市上下文
"""

import json
import re
from typing import Dict, List, Tuple, Optional
from collections import defaultdict

# 文件路径
LOCATION_JSON_PATH = r'e:\Workspace\Java\GreatCreate\backend\src\main\resources\location.json'
REGION_SQL_PATH = r'e:\Workspace\Java\GreatCreate\sql\region_data.sql'
OUTPUT_SQL_PATH = r'e:\Workspace\Java\GreatCreate\sql\convert_all_region_codes.sql'


def load_location_data() -> Tuple[Dict[str, List[Tuple[str, str]]], Dict[str, str]]:
    """
    加载 location.json 中的所有数据
    返回: (城市->区县列表映射, 编码->名称映射)
    """
    print("正在加载 location.json...")
    
    with open(LOCATION_JSON_PATH, 'r', encoding='utf-8') as f:
        locations = json.load(f)
    
    # 按城市分组
    city_districts = defaultdict(list)
    code_to_name = {}
    
    # 存储城市编码对应的城市名称
    city_code_to_name = {}
    
    for loc in locations:
        code = loc['code']
        name = loc['name']
        province = loc.get('province', '')
        city_code = loc.get('city', 0)
        area = loc.get('area', 0)
        town = loc.get('town', 0)
        
        code_to_name[code] = name
        
        # 省级数据
        if city_code == 0 and area == 0 and town == 0:
            # 省级，如"北京市"
            province_code = province
            # 存储省名映射
        
        # 城市级数据
        elif area == 0 and town == 0:
            # 城市，如"石家庄市"
            city_code_str = f"{province}{city_code}0000"
            city_code_to_name[city_code_str] = name
        
        # 区县数据
        elif town == 0 and area != 0 and area != "00":
            # 区县，如"朝阳区"
            city_code_str = f"{province}{city_code}0000"
            city_districts[city_code_str].append((name, code))
    
    # 建立城市名称到编码的映射
    city_name_to_code = {}
    for code, name in code_to_name.items():
        if name.endswith('市') or name.endswith('省') or name.endswith('自治区') or name.endswith('特别行政区') or name.endswith('地区'):
            # 提取不带后缀的名称
            short_name = name.replace('省', '').replace('市', '').replace('自治区', '').replace('特别行政区', '').replace('地区', '')
            city_name_to_code[short_name] = code
    
    print(f"成功加载 {len(locations)} 条数据")
    print(f"  - {len(city_code_to_name)} 个城市")
    print(f"  - {sum(len(v) for v in city_districts.values())} 个区县")
    
    return city_districts, code_to_name, city_code_to_name, city_name_to_code


def parse_region_sql() -> List[Tuple[str, str, str]]:
    """
    解析 region_data.sql 中的所有区域数据
    返回: [(区域名称, 旧编码, 城市名称)]
    """
    print("正在解析 region_data.sql...")
    
    regions = []
    
    with open(REGION_SQL_PATH, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # 使用正则表达式匹配 INSERT 语句中的数据
    pattern = r"\('([^']+)',\s*'([^']+)',\s*'([^']+)',\s*\d+\)"
    
    matches = re.findall(pattern, content)
    
    for name, code, city in matches:
        regions.append((name, code, city))
    
    print(f"成功解析 {len(regions)} 个区域数据")
    return regions


def find_best_match(name: str, city: str, city_districts: Dict[str, List[Tuple[str, str]]], 
                   code_to_name: Dict[str, str], city_code_to_name: Dict[str, str], 
                   city_name_to_code: Dict[str, str]) -> Optional[str]:
    """
    根据区域名称和城市名称找到最佳匹配
    """
    # 特殊处理
    if name == '市辖区':
        return None  # 市辖区不转换
    
    # 获取城市的编码
    city_short = city.replace('市', '').replace('省', '').replace('自治区', '')
    
    # 1. 首先尝试精确匹配区域名
    if city in code_to_name.values():
        # 城市名称完整匹配
        for code, loc_name in code_to_name.items():
            if loc_name == city and code.startswith('1'):  # 确保是6位编码
                province = code[:2]
                # 在该省份的城市中查找
                for city_code_str, districts in city_districts.items():
                    if city_code_str.startswith(province):
                        for d_name, d_code in districts:
                            if d_name == name:
                                return d_code
    
    # 2. 尝试在所有区县中匹配
    matched_districts = []
    for city_code_str, districts in city_districts.items():
        for d_name, d_code in districts:
            if d_name == name:
                matched_districts.append((d_code, city_code_to_name.get(city_code_str, '')))
    
    if len(matched_districts) == 1:
        return matched_districts[0][0]
    elif len(matched_districts) > 1:
        # 多个匹配，尝试按城市名过滤
        for d_code, d_city in matched_districts:
            if city_short in d_city or d_city.replace('市', '') in city_short:
                return d_code
        # 返回第一个（可能不是最准确的）
        return matched_districts[0][0]
    
    # 3. 尝试模糊匹配
    for city_code_str, districts in city_districts.items():
        for d_name, d_code in districts:
            if name in d_name or d_name in name:
                return d_code
    
    return None


def generate_update_sql(regions: List[Tuple[str, str, str]], 
                      city_districts: Dict[str, List[Tuple[str, str]]], 
                      code_to_name: Dict[str, str],
                      city_code_to_name: Dict[str, str],
                      city_name_to_code: Dict[str, str]) -> Tuple[str, List]:
    """
    生成 UPDATE SQL 语句
    """
    print("正在生成 UPDATE SQL...")
    
    updates = []
    not_found = []
    skipped = []  # 跳过的区域（如市辖区）
    
    # 按城市分组
    city_groups = defaultdict(list)
    for name, old_code, city in regions:
        city_groups[city].append((name, old_code))
    
    for city, items in sorted(city_groups.items()):
        updates.append(f"\n-- {city}")
        updates.append("-" * 50)
        
        for name, old_code in items:
            # 跳过"市辖区"
            if name == '市辖区':
                skipped.append((name, old_code, city))
                continue
            
            # 尝试匹配
            new_code = find_best_match(
                name, city, city_districts, code_to_name, 
                city_code_to_name, city_name_to_code
            )
            
            if new_code:
                updates.append(f"UPDATE biz_region SET code = '{new_code}' WHERE name = '{name}' AND city = '{city}';")
            else:
                not_found.append((name, old_code, city))
    
    # 生成完整的 SQL 文件
    sql = """-- ==============================================
-- 区域编码转换脚本（基于 location.json）
-- 将 biz_region 表中的所有编码转换为标准行政区划代码
-- ==============================================

USE rental_system;

"""
    sql += "\n".join(updates)
    
    # 添加未找到的区域
    if not_found:
        sql += "\n\n-- ==============================================\n"
        sql += "-- 未找到匹配的区域（需要手动处理）\n"
        sql += "-- ==============================================\n"
        for name, old_code, city in not_found:
            sql += f"-- ('{name}', '{old_code}', '{city}') -- 未找到对应编码\n"
    
    # 添加验证查询
    sql += """
-- ==============================================
-- 验证查询
-- ==============================================
SELECT '验证区域编码转换结果' AS 说明, city AS 城市, COUNT(*) AS 数量
FROM biz_region
GROUP BY city
ORDER BY city;

SELECT '转换完成' AS 消息;
"""
    
    print(f"生成 {len(updates)} 条 UPDATE 语句")
    print(f"跳过 {len(skipped)} 个区域（市辖区）")
    print(f"未找到 {len(not_found)} 个区域")
    
    return sql, not_found, skipped


def main():
    """主函数"""
    print("=" * 60)
    print("区域编码转换脚本（改进版）")
    print("=" * 60)
    print()
    
    try:
        # 1. 加载 location.json
        city_districts, code_to_name, city_code_to_name, city_name_to_code = load_location_data()
        
        # 2. 解析 region_data.sql
        regions = parse_region_sql()
        
        # 3. 生成 UPDATE SQL
        sql_content, not_found, skipped = generate_update_sql(
            regions, city_districts, code_to_name, 
            city_code_to_name, city_name_to_code
        )
        
        # 4. 写入文件
        with open(OUTPUT_SQL_PATH, 'w', encoding='utf-8') as f:
            f.write(sql_content)
        
        print(f"\nSQL 文件已生成: {OUTPUT_SQL_PATH}")
        
        # 5. 输出统计
        print(f"\n转换统计:")
        print(f"  - 总区域数: {len(regions)}")
        print(f"  - 成功转换: {len(regions) - len(not_found) - len(skipped)}")
        print(f"  - 跳过: {len(skipped)}")
        print(f"  - 未找到: {len(not_found)}")
        
        # 6. 输出未找到的区域
        if not_found:
            print(f"\n以下 {len(not_found)} 个区域未找到对应的标准编码:")
            print("-" * 60)
            for name, old_code, city in not_found[:30]:  # 显示前30个
                print(f"  {city} - {name} ({old_code})")
            if len(not_found) > 30:
                print(f"  ... 还有 {len(not_found) - 30} 个")
        
        print("\n" + "=" * 60)
        print("脚本执行完成!")
        print("=" * 60)
        
    except Exception as e:
        print(f"\n脚本执行失败: {e}")
        import traceback
        traceback.print_exc()


if __name__ == '__main__':
    main()
