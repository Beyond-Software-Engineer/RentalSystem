-- ==============================================
-- 区域编码转换脚本（基于 location.json）
-- 将 biz_region 表中的所有编码转换为标准行政区划代码
-- ==============================================

USE rental_system;


-- 七台河市
--------------------------------------------------
UPDATE biz_region SET code = '230902' WHERE name = '新兴区' AND city = '七台河市';
UPDATE biz_region SET code = '230903' WHERE name = '桃山区' AND city = '七台河市';
UPDATE biz_region SET code = '230904' WHERE name = '茄子河区' AND city = '七台河市';
UPDATE biz_region SET code = '230921' WHERE name = '勃利县' AND city = '七台河市';

-- 三亚市
--------------------------------------------------
UPDATE biz_region SET code = '460202' WHERE name = '海棠区' AND city = '三亚市';
UPDATE biz_region SET code = '460203' WHERE name = '吉阳区' AND city = '三亚市';
UPDATE biz_region SET code = '460204' WHERE name = '天涯区' AND city = '三亚市';
UPDATE biz_region SET code = '460205' WHERE name = '崖州区' AND city = '三亚市';

-- 三明市
--------------------------------------------------
UPDATE biz_region SET code = '350402' WHERE name = '梅列区' AND city = '三明市';
UPDATE biz_region SET code = '350403' WHERE name = '三元区' AND city = '三明市';
UPDATE biz_region SET code = '350403' WHERE name = '三元区' AND city = '三明市';
UPDATE biz_region SET code = '350405' WHERE name = '沙县区' AND city = '三明市';
UPDATE biz_region SET code = '350421' WHERE name = '明溪县' AND city = '三明市';
UPDATE biz_region SET code = '350423' WHERE name = '清流县' AND city = '三明市';
UPDATE biz_region SET code = '350424' WHERE name = '宁化县' AND city = '三明市';
UPDATE biz_region SET code = '350425' WHERE name = '大田县' AND city = '三明市';
UPDATE biz_region SET code = '350426' WHERE name = '尤溪县' AND city = '三明市';
UPDATE biz_region SET code = '350427' WHERE name = '沙县' AND city = '三明市';
UPDATE biz_region SET code = '350428' WHERE name = '将乐县' AND city = '三明市';
UPDATE biz_region SET code = '350429' WHERE name = '泰宁县' AND city = '三明市';
UPDATE biz_region SET code = '350430' WHERE name = '建宁县' AND city = '三明市';
UPDATE biz_region SET code = '350481' WHERE name = '永安市' AND city = '三明市';

-- 三沙市
--------------------------------------------------
UPDATE biz_region SET code = '460321' WHERE name = '西沙群岛' AND city = '三沙市';
UPDATE biz_region SET code = '460322' WHERE name = '南沙群岛' AND city = '三沙市';
UPDATE biz_region SET code = '460323' WHERE name = '中沙群岛的岛礁及其海域' AND city = '三沙市';

-- 三门峡市
--------------------------------------------------
UPDATE biz_region SET code = '411202' WHERE name = '湖滨区' AND city = '三门峡市';
UPDATE biz_region SET code = '411203' WHERE name = '陕州区' AND city = '三门峡市';
UPDATE biz_region SET code = '411221' WHERE name = '渑池县' AND city = '三门峡市';
UPDATE biz_region SET code = '411224' WHERE name = '卢氏县' AND city = '三门峡市';
UPDATE biz_region SET code = '411271' WHERE name = '河南三门峡经济开发区' AND city = '三门峡市';
UPDATE biz_region SET code = '411281' WHERE name = '义马市' AND city = '三门峡市';
UPDATE biz_region SET code = '411282' WHERE name = '灵宝市' AND city = '三门峡市';

-- 上海
--------------------------------------------------
UPDATE biz_region SET code = '310101' WHERE name = '黄浦区' AND city = '上海';
UPDATE biz_region SET code = '310104' WHERE name = '徐汇区' AND city = '上海';
UPDATE biz_region SET code = '310105' WHERE name = '长宁区' AND city = '上海';
UPDATE biz_region SET code = '310106' WHERE name = '静安区' AND city = '上海';
UPDATE biz_region SET code = '310107' WHERE name = '普陀区' AND city = '上海';
UPDATE biz_region SET code = '310109' WHERE name = '虹口区' AND city = '上海';
UPDATE biz_region SET code = '310110' WHERE name = '杨浦区' AND city = '上海';
UPDATE biz_region SET code = '310112' WHERE name = '闵行区' AND city = '上海';
UPDATE biz_region SET code = '310113' WHERE name = '宝山区' AND city = '上海';
UPDATE biz_region SET code = '310114' WHERE name = '嘉定区' AND city = '上海';
UPDATE biz_region SET code = '310115' WHERE name = '浦东新区' AND city = '上海';
UPDATE biz_region SET code = '310116' WHERE name = '金山区' AND city = '上海';
UPDATE biz_region SET code = '310117' WHERE name = '松江区' AND city = '上海';
UPDATE biz_region SET code = '310118' WHERE name = '青浦区' AND city = '上海';
UPDATE biz_region SET code = '310120' WHERE name = '奉贤区' AND city = '上海';
UPDATE biz_region SET code = '310151' WHERE name = '崇明区' AND city = '上海';

-- 上饶市
--------------------------------------------------
UPDATE biz_region SET code = '361102' WHERE name = '信州区' AND city = '上饶市';
UPDATE biz_region SET code = '361103' WHERE name = '广丰区' AND city = '上饶市';
UPDATE biz_region SET code = '361104' WHERE name = '广信区' AND city = '上饶市';
UPDATE biz_region SET code = '361123' WHERE name = '玉山县' AND city = '上饶市';
UPDATE biz_region SET code = '361124' WHERE name = '铅山县' AND city = '上饶市';
UPDATE biz_region SET code = '361125' WHERE name = '横峰县' AND city = '上饶市';
UPDATE biz_region SET code = '361126' WHERE name = '弋阳县' AND city = '上饶市';
UPDATE biz_region SET code = '361127' WHERE name = '余干县' AND city = '上饶市';
UPDATE biz_region SET code = '361128' WHERE name = '鄱阳县' AND city = '上饶市';
UPDATE biz_region SET code = '361129' WHERE name = '万年县' AND city = '上饶市';
UPDATE biz_region SET code = '361130' WHERE name = '婺源县' AND city = '上饶市';
UPDATE biz_region SET code = '361181' WHERE name = '德兴市' AND city = '上饶市';

-- 东营市
--------------------------------------------------
UPDATE biz_region SET code = '370502' WHERE name = '东营区' AND city = '东营市';
UPDATE biz_region SET code = '370503' WHERE name = '河口区' AND city = '东营市';
UPDATE biz_region SET code = '370505' WHERE name = '垦利区' AND city = '东营市';
UPDATE biz_region SET code = '370522' WHERE name = '利津县' AND city = '东营市';
UPDATE biz_region SET code = '370523' WHERE name = '广饶县' AND city = '东营市';
UPDATE biz_region SET code = '370571' WHERE name = '东营经济技术开发区' AND city = '东营市';
UPDATE biz_region SET code = '370572' WHERE name = '东营港经济开发区' AND city = '东营市';

-- 中卫市
--------------------------------------------------
UPDATE biz_region SET code = '640502' WHERE name = '沙坡头区' AND city = '中卫市';
UPDATE biz_region SET code = '640521' WHERE name = '中宁县' AND city = '中卫市';
UPDATE biz_region SET code = '640522' WHERE name = '海原县' AND city = '中卫市';

-- 临夏回族自治州
--------------------------------------------------
UPDATE biz_region SET code = '622901' WHERE name = '临夏市' AND city = '临夏回族自治州';
UPDATE biz_region SET code = '622921' WHERE name = '临夏县' AND city = '临夏回族自治州';
UPDATE biz_region SET code = '622922' WHERE name = '康乐县' AND city = '临夏回族自治州';
UPDATE biz_region SET code = '622923' WHERE name = '永靖县' AND city = '临夏回族自治州';
UPDATE biz_region SET code = '622924' WHERE name = '广河县' AND city = '临夏回族自治州';
UPDATE biz_region SET code = '622925' WHERE name = '和政县' AND city = '临夏回族自治州';
UPDATE biz_region SET code = '622926' WHERE name = '东乡族自治县' AND city = '临夏回族自治州';
UPDATE biz_region SET code = '622927' WHERE name = '积石山保安族东乡族撒拉族自治县' AND city = '临夏回族自治州';

-- 临汾市
--------------------------------------------------
UPDATE biz_region SET code = '141002' WHERE name = '尧都区' AND city = '临汾市';
UPDATE biz_region SET code = '141021' WHERE name = '曲沃县' AND city = '临汾市';
UPDATE biz_region SET code = '141022' WHERE name = '翼城县' AND city = '临汾市';
UPDATE biz_region SET code = '141023' WHERE name = '襄汾县' AND city = '临汾市';
UPDATE biz_region SET code = '141024' WHERE name = '洪洞县' AND city = '临汾市';
UPDATE biz_region SET code = '141025' WHERE name = '古县' AND city = '临汾市';
UPDATE biz_region SET code = '141026' WHERE name = '安泽县' AND city = '临汾市';
UPDATE biz_region SET code = '141027' WHERE name = '浮山县' AND city = '临汾市';
UPDATE biz_region SET code = '141028' WHERE name = '吉县' AND city = '临汾市';
UPDATE biz_region SET code = '141029' WHERE name = '乡宁县' AND city = '临汾市';
UPDATE biz_region SET code = '141030' WHERE name = '大宁县' AND city = '临汾市';
UPDATE biz_region SET code = '141031' WHERE name = '隰县' AND city = '临汾市';
UPDATE biz_region SET code = '141032' WHERE name = '永和县' AND city = '临汾市';
UPDATE biz_region SET code = '141033' WHERE name = '蒲县' AND city = '临汾市';
UPDATE biz_region SET code = '141034' WHERE name = '汾西县' AND city = '临汾市';
UPDATE biz_region SET code = '141081' WHERE name = '侯马市' AND city = '临汾市';
UPDATE biz_region SET code = '141082' WHERE name = '霍州市' AND city = '临汾市';

-- 临沂市
--------------------------------------------------
UPDATE biz_region SET code = '371302' WHERE name = '兰山区' AND city = '临沂市';
UPDATE biz_region SET code = '371311' WHERE name = '罗庄区' AND city = '临沂市';
UPDATE biz_region SET code = '120102' WHERE name = '河东区' AND city = '临沂市';
UPDATE biz_region SET code = '371321' WHERE name = '沂南县' AND city = '临沂市';
UPDATE biz_region SET code = '371322' WHERE name = '郯城县' AND city = '临沂市';
UPDATE biz_region SET code = '371323' WHERE name = '沂水县' AND city = '临沂市';
UPDATE biz_region SET code = '371324' WHERE name = '兰陵县' AND city = '临沂市';
UPDATE biz_region SET code = '371325' WHERE name = '费县' AND city = '临沂市';
UPDATE biz_region SET code = '371326' WHERE name = '平邑县' AND city = '临沂市';
UPDATE biz_region SET code = '371327' WHERE name = '莒南县' AND city = '临沂市';
UPDATE biz_region SET code = '371328' WHERE name = '蒙阴县' AND city = '临沂市';
UPDATE biz_region SET code = '371329' WHERE name = '临沭县' AND city = '临沂市';
UPDATE biz_region SET code = '371371' WHERE name = '临沂高新技术产业开发区' AND city = '临沂市';

-- 临沧市
--------------------------------------------------
UPDATE biz_region SET code = '530902' WHERE name = '临翔区' AND city = '临沧市';
UPDATE biz_region SET code = '530921' WHERE name = '凤庆县' AND city = '临沧市';
UPDATE biz_region SET code = '530922' WHERE name = '云县' AND city = '临沧市';
UPDATE biz_region SET code = '530923' WHERE name = '永德县' AND city = '临沧市';
UPDATE biz_region SET code = '530924' WHERE name = '镇康县' AND city = '临沧市';
UPDATE biz_region SET code = '530925' WHERE name = '双江拉祜族佤族布朗族傣族自治县' AND city = '临沧市';
UPDATE biz_region SET code = '530926' WHERE name = '耿马傣族佤族自治县' AND city = '临沧市';
UPDATE biz_region SET code = '530927' WHERE name = '沧源佤族自治县' AND city = '临沧市';

-- 丹东市
--------------------------------------------------
UPDATE biz_region SET code = '210602' WHERE name = '元宝区' AND city = '丹东市';
UPDATE biz_region SET code = '210603' WHERE name = '振兴区' AND city = '丹东市';
UPDATE biz_region SET code = '210604' WHERE name = '振安区' AND city = '丹东市';
UPDATE biz_region SET code = '210624' WHERE name = '宽甸满族自治县' AND city = '丹东市';
UPDATE biz_region SET code = '210681' WHERE name = '东港市' AND city = '丹东市';
UPDATE biz_region SET code = '210682' WHERE name = '凤城市' AND city = '丹东市';

-- 丽水市
--------------------------------------------------
UPDATE biz_region SET code = '331102' WHERE name = '莲都区' AND city = '丽水市';
UPDATE biz_region SET code = '331121' WHERE name = '青田县' AND city = '丽水市';
UPDATE biz_region SET code = '331122' WHERE name = '缙云县' AND city = '丽水市';
UPDATE biz_region SET code = '331123' WHERE name = '遂昌县' AND city = '丽水市';
UPDATE biz_region SET code = '331124' WHERE name = '松阳县' AND city = '丽水市';
UPDATE biz_region SET code = '331125' WHERE name = '云和县' AND city = '丽水市';
UPDATE biz_region SET code = '331126' WHERE name = '庆元县' AND city = '丽水市';
UPDATE biz_region SET code = '331127' WHERE name = '景宁畲族自治县' AND city = '丽水市';
UPDATE biz_region SET code = '331181' WHERE name = '龙泉市' AND city = '丽水市';

-- 丽江市
--------------------------------------------------
UPDATE biz_region SET code = '530702' WHERE name = '古城区' AND city = '丽江市';
UPDATE biz_region SET code = '530721' WHERE name = '玉龙纳西族自治县' AND city = '丽江市';
UPDATE biz_region SET code = '530722' WHERE name = '永胜县' AND city = '丽江市';
UPDATE biz_region SET code = '530723' WHERE name = '华坪县' AND city = '丽江市';
UPDATE biz_region SET code = '530724' WHERE name = '宁蒗彝族自治县' AND city = '丽江市';

-- 乌兰察布市
--------------------------------------------------
UPDATE biz_region SET code = '150902' WHERE name = '集宁区' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150921' WHERE name = '卓资县' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150922' WHERE name = '化德县' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150923' WHERE name = '商都县' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150924' WHERE name = '兴和县' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150925' WHERE name = '凉城县' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150926' WHERE name = '察哈尔右翼前旗' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150927' WHERE name = '察哈尔右翼中旗' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150928' WHERE name = '察哈尔右翼后旗' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150929' WHERE name = '四子王旗' AND city = '乌兰察布市';
UPDATE biz_region SET code = '150981' WHERE name = '丰镇市' AND city = '乌兰察布市';

-- 乌海市
--------------------------------------------------
UPDATE biz_region SET code = '150302' WHERE name = '海勃湾区' AND city = '乌海市';
UPDATE biz_region SET code = '150303' WHERE name = '海南区' AND city = '乌海市';
UPDATE biz_region SET code = '150304' WHERE name = '乌达区' AND city = '乌海市';

-- 乌鲁木齐市
--------------------------------------------------
UPDATE biz_region SET code = '650102' WHERE name = '天山区' AND city = '乌鲁木齐市';
UPDATE biz_region SET code = '650103' WHERE name = '沙依巴克区' AND city = '乌鲁木齐市';
UPDATE biz_region SET code = '650104' WHERE name = '新市区' AND city = '乌鲁木齐市';
UPDATE biz_region SET code = '650105' WHERE name = '水磨沟区' AND city = '乌鲁木齐市';
UPDATE biz_region SET code = '650106' WHERE name = '头屯河区' AND city = '乌鲁木齐市';
UPDATE biz_region SET code = '650107' WHERE name = '达坂城区' AND city = '乌鲁木齐市';
UPDATE biz_region SET code = '650109' WHERE name = '米东区' AND city = '乌鲁木齐市';
UPDATE biz_region SET code = '650121' WHERE name = '乌鲁木齐县' AND city = '乌鲁木齐市';

-- 乐山市
--------------------------------------------------
UPDATE biz_region SET code = '511102' WHERE name = '市中区' AND city = '乐山市';
UPDATE biz_region SET code = '511111' WHERE name = '沙湾区' AND city = '乐山市';
UPDATE biz_region SET code = '511112' WHERE name = '五通桥区' AND city = '乐山市';
UPDATE biz_region SET code = '511113' WHERE name = '金口河区' AND city = '乐山市';
UPDATE biz_region SET code = '511123' WHERE name = '犍为县' AND city = '乐山市';
UPDATE biz_region SET code = '511124' WHERE name = '井研县' AND city = '乐山市';
UPDATE biz_region SET code = '511126' WHERE name = '夹江县' AND city = '乐山市';
UPDATE biz_region SET code = '511129' WHERE name = '沐川县' AND city = '乐山市';
UPDATE biz_region SET code = '511132' WHERE name = '峨边彝族自治县' AND city = '乐山市';
UPDATE biz_region SET code = '511133' WHERE name = '马边彝族自治县' AND city = '乐山市';
UPDATE biz_region SET code = '511181' WHERE name = '峨眉山市' AND city = '乐山市';

-- 九江市
--------------------------------------------------
UPDATE biz_region SET code = '360402' WHERE name = '濂溪区' AND city = '九江市';
UPDATE biz_region SET code = '360403' WHERE name = '浔阳区' AND city = '九江市';
UPDATE biz_region SET code = '360404' WHERE name = '柴桑区' AND city = '九江市';
UPDATE biz_region SET code = '360423' WHERE name = '武宁县' AND city = '九江市';
UPDATE biz_region SET code = '360424' WHERE name = '修水县' AND city = '九江市';
UPDATE biz_region SET code = '360425' WHERE name = '永修县' AND city = '九江市';
UPDATE biz_region SET code = '360426' WHERE name = '德安县' AND city = '九江市';
UPDATE biz_region SET code = '360428' WHERE name = '都昌县' AND city = '九江市';
UPDATE biz_region SET code = '360429' WHERE name = '湖口县' AND city = '九江市';
UPDATE biz_region SET code = '360430' WHERE name = '彭泽县' AND city = '九江市';
UPDATE biz_region SET code = '360481' WHERE name = '瑞昌市' AND city = '九江市';
UPDATE biz_region SET code = '360482' WHERE name = '共青城市' AND city = '九江市';
UPDATE biz_region SET code = '360483' WHERE name = '庐山市' AND city = '九江市';

-- 云浮市
--------------------------------------------------
UPDATE biz_region SET code = '445302' WHERE name = '云城区' AND city = '云浮市';
UPDATE biz_region SET code = '445303' WHERE name = '云安区' AND city = '云浮市';
UPDATE biz_region SET code = '445321' WHERE name = '新兴县' AND city = '云浮市';
UPDATE biz_region SET code = '445322' WHERE name = '郁南县' AND city = '云浮市';
UPDATE biz_region SET code = '445381' WHERE name = '罗定市' AND city = '云浮市';

-- 亳州市
--------------------------------------------------
UPDATE biz_region SET code = '341602' WHERE name = '谯城区' AND city = '亳州市';
UPDATE biz_region SET code = '341621' WHERE name = '涡阳县' AND city = '亳州市';
UPDATE biz_region SET code = '341622' WHERE name = '蒙城县' AND city = '亳州市';
UPDATE biz_region SET code = '341623' WHERE name = '利辛县' AND city = '亳州市';

-- 伊春市
--------------------------------------------------
UPDATE biz_region SET code = '230717' WHERE name = '伊美区' AND city = '伊春市';
UPDATE biz_region SET code = '230718' WHERE name = '乌翠区' AND city = '伊春市';
UPDATE biz_region SET code = '230719' WHERE name = '友好区' AND city = '伊春市';
UPDATE biz_region SET code = '230722' WHERE name = '嘉荫县' AND city = '伊春市';
UPDATE biz_region SET code = '230723' WHERE name = '汤旺县' AND city = '伊春市';
UPDATE biz_region SET code = '230724' WHERE name = '丰林县' AND city = '伊春市';
UPDATE biz_region SET code = '230725' WHERE name = '大箐山县' AND city = '伊春市';
UPDATE biz_region SET code = '230726' WHERE name = '南岔县' AND city = '伊春市';
UPDATE biz_region SET code = '230751' WHERE name = '金林区' AND city = '伊春市';
UPDATE biz_region SET code = '230781' WHERE name = '铁力市' AND city = '伊春市';

-- 伊犁哈萨克自治州
--------------------------------------------------
UPDATE biz_region SET code = '654002' WHERE name = '伊宁市' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654003' WHERE name = '奎屯市' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654004' WHERE name = '霍尔果斯市' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654021' WHERE name = '伊宁县' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654022' WHERE name = '察布查尔锡伯自治县' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654023' WHERE name = '霍城县' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654024' WHERE name = '巩留县' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654025' WHERE name = '新源县' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654026' WHERE name = '昭苏县' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654027' WHERE name = '特克斯县' AND city = '伊犁哈萨克自治州';
UPDATE biz_region SET code = '654028' WHERE name = '尼勒克县' AND city = '伊犁哈萨克自治州';

-- 佛山市
--------------------------------------------------
UPDATE biz_region SET code = '440604' WHERE name = '禅城区' AND city = '佛山市';
UPDATE biz_region SET code = '440605' WHERE name = '南海区' AND city = '佛山市';
UPDATE biz_region SET code = '440606' WHERE name = '顺德区' AND city = '佛山市';
UPDATE biz_region SET code = '440607' WHERE name = '三水区' AND city = '佛山市';
UPDATE biz_region SET code = '440608' WHERE name = '高明区' AND city = '佛山市';

-- 佳木斯市
--------------------------------------------------
UPDATE biz_region SET code = '230803' WHERE name = '向阳区' AND city = '佳木斯市';
UPDATE biz_region SET code = '230804' WHERE name = '前进区' AND city = '佳木斯市';
UPDATE biz_region SET code = '230805' WHERE name = '东风区' AND city = '佳木斯市';
UPDATE biz_region SET code = '230811' WHERE name = '郊区' AND city = '佳木斯市';
UPDATE biz_region SET code = '230822' WHERE name = '桦南县' AND city = '佳木斯市';
UPDATE biz_region SET code = '230826' WHERE name = '桦川县' AND city = '佳木斯市';
UPDATE biz_region SET code = '230828' WHERE name = '汤原县' AND city = '佳木斯市';
UPDATE biz_region SET code = '230881' WHERE name = '同江市' AND city = '佳木斯市';
UPDATE biz_region SET code = '230882' WHERE name = '富锦市' AND city = '佳木斯市';
UPDATE biz_region SET code = '230883' WHERE name = '抚远市' AND city = '佳木斯市';

-- 保定市
--------------------------------------------------
UPDATE biz_region SET code = '130602' WHERE name = '竞秀区' AND city = '保定市';
UPDATE biz_region SET code = '130606' WHERE name = '莲池区' AND city = '保定市';
UPDATE biz_region SET code = '130607' WHERE name = '满城区' AND city = '保定市';
UPDATE biz_region SET code = '130608' WHERE name = '清苑区' AND city = '保定市';
UPDATE biz_region SET code = '130609' WHERE name = '徐水区' AND city = '保定市';
UPDATE biz_region SET code = '130623' WHERE name = '涞水县' AND city = '保定市';
UPDATE biz_region SET code = '130624' WHERE name = '阜平县' AND city = '保定市';
UPDATE biz_region SET code = '130626' WHERE name = '定兴县' AND city = '保定市';
UPDATE biz_region SET code = '130627' WHERE name = '唐县' AND city = '保定市';
UPDATE biz_region SET code = '130628' WHERE name = '高阳县' AND city = '保定市';
UPDATE biz_region SET code = '130629' WHERE name = '容城县' AND city = '保定市';
UPDATE biz_region SET code = '130630' WHERE name = '涞源县' AND city = '保定市';
UPDATE biz_region SET code = '130631' WHERE name = '望都县' AND city = '保定市';
UPDATE biz_region SET code = '130632' WHERE name = '安新县' AND city = '保定市';
UPDATE biz_region SET code = '130633' WHERE name = '易县' AND city = '保定市';
UPDATE biz_region SET code = '130634' WHERE name = '曲阳县' AND city = '保定市';
UPDATE biz_region SET code = '130635' WHERE name = '蠡县' AND city = '保定市';
UPDATE biz_region SET code = '130636' WHERE name = '顺平县' AND city = '保定市';
UPDATE biz_region SET code = '130637' WHERE name = '博野县' AND city = '保定市';
UPDATE biz_region SET code = '130638' WHERE name = '雄县' AND city = '保定市';
UPDATE biz_region SET code = '130671' WHERE name = '保定高新技术产业开发区' AND city = '保定市';
UPDATE biz_region SET code = '130672' WHERE name = '保定白沟新城' AND city = '保定市';
UPDATE biz_region SET code = '130681' WHERE name = '涿州市' AND city = '保定市';
UPDATE biz_region SET code = '130682' WHERE name = '定州市' AND city = '保定市';
UPDATE biz_region SET code = '130683' WHERE name = '安国市' AND city = '保定市';
UPDATE biz_region SET code = '130684' WHERE name = '高碑店市' AND city = '保定市';

-- 保山市
--------------------------------------------------
UPDATE biz_region SET code = '530502' WHERE name = '隆阳区' AND city = '保山市';
UPDATE biz_region SET code = '530521' WHERE name = '施甸县' AND city = '保山市';
UPDATE biz_region SET code = '530523' WHERE name = '龙陵县' AND city = '保山市';
UPDATE biz_region SET code = '530524' WHERE name = '昌宁县' AND city = '保山市';
UPDATE biz_region SET code = '530581' WHERE name = '腾冲市' AND city = '保山市';

-- 信阳市
--------------------------------------------------
UPDATE biz_region SET code = '411502' WHERE name = '浉河区' AND city = '信阳市';
UPDATE biz_region SET code = '411503' WHERE name = '平桥区' AND city = '信阳市';
UPDATE biz_region SET code = '411521' WHERE name = '罗山县' AND city = '信阳市';
UPDATE biz_region SET code = '411522' WHERE name = '光山县' AND city = '信阳市';
UPDATE biz_region SET code = '411523' WHERE name = '新县' AND city = '信阳市';
UPDATE biz_region SET code = '411524' WHERE name = '商城县' AND city = '信阳市';
UPDATE biz_region SET code = '411525' WHERE name = '固始县' AND city = '信阳市';
UPDATE biz_region SET code = '411526' WHERE name = '潢川县' AND city = '信阳市';
UPDATE biz_region SET code = '411527' WHERE name = '淮滨县' AND city = '信阳市';
UPDATE biz_region SET code = '411528' WHERE name = '息县' AND city = '信阳市';
UPDATE biz_region SET code = '411571' WHERE name = '信阳高新技术产业开发区' AND city = '信阳市';

-- 克孜勒苏柯尔克孜自治州
--------------------------------------------------
UPDATE biz_region SET code = '653001' WHERE name = '阿图什市' AND city = '克孜勒苏柯尔克孜自治州';
UPDATE biz_region SET code = '653022' WHERE name = '阿克陶县' AND city = '克孜勒苏柯尔克孜自治州';
UPDATE biz_region SET code = '653023' WHERE name = '阿合奇县' AND city = '克孜勒苏柯尔克孜自治州';
UPDATE biz_region SET code = '653024' WHERE name = '乌恰县' AND city = '克孜勒苏柯尔克孜自治州';

-- 克拉玛依市
--------------------------------------------------
UPDATE biz_region SET code = '650202' WHERE name = '独山子区' AND city = '克拉玛依市';
UPDATE biz_region SET code = '650203' WHERE name = '克拉玛依区' AND city = '克拉玛依市';
UPDATE biz_region SET code = '650204' WHERE name = '白碱滩区' AND city = '克拉玛依市';
UPDATE biz_region SET code = '650205' WHERE name = '乌尔禾区' AND city = '克拉玛依市';

-- 六安市
--------------------------------------------------
UPDATE biz_region SET code = '341502' WHERE name = '金安区' AND city = '六安市';
UPDATE biz_region SET code = '341503' WHERE name = '裕安区' AND city = '六安市';
UPDATE biz_region SET code = '341504' WHERE name = '叶集区' AND city = '六安市';
UPDATE biz_region SET code = '341522' WHERE name = '霍邱县' AND city = '六安市';
UPDATE biz_region SET code = '341523' WHERE name = '舒城县' AND city = '六安市';
UPDATE biz_region SET code = '341524' WHERE name = '金寨县' AND city = '六安市';
UPDATE biz_region SET code = '341525' WHERE name = '霍山县' AND city = '六安市';

-- 六盘水市
--------------------------------------------------
UPDATE biz_region SET code = '520201' WHERE name = '钟山区' AND city = '六盘水市';
UPDATE biz_region SET code = '520203' WHERE name = '六枝特区' AND city = '六盘水市';
UPDATE biz_region SET code = '520204' WHERE name = '水城区' AND city = '六盘水市';
UPDATE biz_region SET code = '520281' WHERE name = '盘州市' AND city = '六盘水市';

-- 兰州市
--------------------------------------------------
UPDATE biz_region SET code = '620102' WHERE name = '城关区' AND city = '兰州市';
UPDATE biz_region SET code = '620103' WHERE name = '七里河区' AND city = '兰州市';
UPDATE biz_region SET code = '620104' WHERE name = '西固区' AND city = '兰州市';
UPDATE biz_region SET code = '620105' WHERE name = '安宁区' AND city = '兰州市';
UPDATE biz_region SET code = '620111' WHERE name = '红古区' AND city = '兰州市';
UPDATE biz_region SET code = '620121' WHERE name = '永登县' AND city = '兰州市';
UPDATE biz_region SET code = '620122' WHERE name = '皋兰县' AND city = '兰州市';
UPDATE biz_region SET code = '620123' WHERE name = '榆中县' AND city = '兰州市';
UPDATE biz_region SET code = '620171' WHERE name = '兰州新区' AND city = '兰州市';

-- 兴安盟
--------------------------------------------------
UPDATE biz_region SET code = '152201' WHERE name = '乌兰浩特市' AND city = '兴安盟';
UPDATE biz_region SET code = '152202' WHERE name = '阿尔山市' AND city = '兴安盟';
UPDATE biz_region SET code = '152221' WHERE name = '科尔沁右翼前旗' AND city = '兴安盟';
UPDATE biz_region SET code = '152222' WHERE name = '科尔沁右翼中旗' AND city = '兴安盟';
UPDATE biz_region SET code = '152223' WHERE name = '扎赉特旗' AND city = '兴安盟';
UPDATE biz_region SET code = '152224' WHERE name = '突泉县' AND city = '兴安盟';

-- 内江市
--------------------------------------------------
UPDATE biz_region SET code = '511002' WHERE name = '市中区' AND city = '内江市';
UPDATE biz_region SET code = '511011' WHERE name = '东兴区' AND city = '内江市';
UPDATE biz_region SET code = '511024' WHERE name = '威远县' AND city = '内江市';
UPDATE biz_region SET code = '511025' WHERE name = '资中县' AND city = '内江市';
UPDATE biz_region SET code = '511071' WHERE name = '内江经济开发区' AND city = '内江市';
UPDATE biz_region SET code = '511083' WHERE name = '隆昌市' AND city = '内江市';

-- 凉山彝族自治州
--------------------------------------------------
UPDATE biz_region SET code = '513401' WHERE name = '西昌市' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513402' WHERE name = '会理市' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513422' WHERE name = '木里藏族自治县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513423' WHERE name = '盐源县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513424' WHERE name = '德昌县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513425' WHERE name = '会理县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513426' WHERE name = '会东县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513427' WHERE name = '宁南县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513428' WHERE name = '普格县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513429' WHERE name = '布拖县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513430' WHERE name = '金阳县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513431' WHERE name = '昭觉县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513432' WHERE name = '喜德县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513433' WHERE name = '冕宁县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513434' WHERE name = '越西县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513435' WHERE name = '甘洛县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513436' WHERE name = '美姑县' AND city = '凉山彝族自治州';
UPDATE biz_region SET code = '513437' WHERE name = '雷波县' AND city = '凉山彝族自治州';

-- 包头市
--------------------------------------------------
UPDATE biz_region SET code = '150202' WHERE name = '东河区' AND city = '包头市';
UPDATE biz_region SET code = '150203' WHERE name = '昆都仑区' AND city = '包头市';
UPDATE biz_region SET code = '150204' WHERE name = '青山区' AND city = '包头市';
UPDATE biz_region SET code = '150205' WHERE name = '石拐区' AND city = '包头市';
UPDATE biz_region SET code = '150206' WHERE name = '白云鄂博矿区' AND city = '包头市';
UPDATE biz_region SET code = '150207' WHERE name = '九原区' AND city = '包头市';
UPDATE biz_region SET code = '150221' WHERE name = '土默特右旗' AND city = '包头市';
UPDATE biz_region SET code = '150222' WHERE name = '固阳县' AND city = '包头市';
UPDATE biz_region SET code = '150223' WHERE name = '达尔罕茂明安联合旗' AND city = '包头市';
UPDATE biz_region SET code = '150271' WHERE name = '包头稀土高新技术产业开发区' AND city = '包头市';

-- 北京
--------------------------------------------------
UPDATE biz_region SET code = '110101' WHERE name = '东城区' AND city = '北京';
UPDATE biz_region SET code = '110102' WHERE name = '西城区' AND city = '北京';
UPDATE biz_region SET code = '110105' WHERE name = '朝阳区' AND city = '北京';
UPDATE biz_region SET code = '110106' WHERE name = '丰台区' AND city = '北京';
UPDATE biz_region SET code = '110107' WHERE name = '石景山区' AND city = '北京';
UPDATE biz_region SET code = '110108' WHERE name = '海淀区' AND city = '北京';
UPDATE biz_region SET code = '110109' WHERE name = '门头沟区' AND city = '北京';
UPDATE biz_region SET code = '110111' WHERE name = '房山区' AND city = '北京';
UPDATE biz_region SET code = '110112' WHERE name = '通州区' AND city = '北京';
UPDATE biz_region SET code = '110113' WHERE name = '顺义区' AND city = '北京';
UPDATE biz_region SET code = '110114' WHERE name = '昌平区' AND city = '北京';
UPDATE biz_region SET code = '110115' WHERE name = '大兴区' AND city = '北京';
UPDATE biz_region SET code = '110116' WHERE name = '怀柔区' AND city = '北京';
UPDATE biz_region SET code = '110117' WHERE name = '平谷区' AND city = '北京';
UPDATE biz_region SET code = '110118' WHERE name = '密云区' AND city = '北京';
UPDATE biz_region SET code = '110119' WHERE name = '延庆区' AND city = '北京';

-- 北海市
--------------------------------------------------
UPDATE biz_region SET code = '450502' WHERE name = '海城区' AND city = '北海市';
UPDATE biz_region SET code = '450503' WHERE name = '银海区' AND city = '北海市';
UPDATE biz_region SET code = '450512' WHERE name = '铁山港区' AND city = '北海市';
UPDATE biz_region SET code = '450521' WHERE name = '合浦县' AND city = '北海市';

-- 十堰市
--------------------------------------------------
UPDATE biz_region SET code = '420302' WHERE name = '茅箭区' AND city = '十堰市';
UPDATE biz_region SET code = '420303' WHERE name = '张湾区' AND city = '十堰市';
UPDATE biz_region SET code = '420304' WHERE name = '郧阳区' AND city = '十堰市';
UPDATE biz_region SET code = '420322' WHERE name = '郧西县' AND city = '十堰市';
UPDATE biz_region SET code = '420323' WHERE name = '竹山县' AND city = '十堰市';
UPDATE biz_region SET code = '420324' WHERE name = '竹溪县' AND city = '十堰市';
UPDATE biz_region SET code = '420325' WHERE name = '房县' AND city = '十堰市';
UPDATE biz_region SET code = '420381' WHERE name = '丹江口市' AND city = '十堰市';

-- 南京市
--------------------------------------------------
UPDATE biz_region SET code = '320102' WHERE name = '玄武区' AND city = '南京市';
UPDATE biz_region SET code = '320104' WHERE name = '秦淮区' AND city = '南京市';
UPDATE biz_region SET code = '320105' WHERE name = '建邺区' AND city = '南京市';
UPDATE biz_region SET code = '320106' WHERE name = '鼓楼区' AND city = '南京市';
UPDATE biz_region SET code = '320111' WHERE name = '浦口区' AND city = '南京市';
UPDATE biz_region SET code = '320113' WHERE name = '栖霞区' AND city = '南京市';
UPDATE biz_region SET code = '320114' WHERE name = '雨花台区' AND city = '南京市';
UPDATE biz_region SET code = '320115' WHERE name = '江宁区' AND city = '南京市';
UPDATE biz_region SET code = '320116' WHERE name = '六合区' AND city = '南京市';
UPDATE biz_region SET code = '320117' WHERE name = '溧水区' AND city = '南京市';
UPDATE biz_region SET code = '320118' WHERE name = '高淳区' AND city = '南京市';

-- 南充市
--------------------------------------------------
UPDATE biz_region SET code = '511302' WHERE name = '顺庆区' AND city = '南充市';
UPDATE biz_region SET code = '511303' WHERE name = '高坪区' AND city = '南充市';
UPDATE biz_region SET code = '511304' WHERE name = '嘉陵区' AND city = '南充市';
UPDATE biz_region SET code = '511321' WHERE name = '南部县' AND city = '南充市';
UPDATE biz_region SET code = '511322' WHERE name = '营山县' AND city = '南充市';
UPDATE biz_region SET code = '511323' WHERE name = '蓬安县' AND city = '南充市';
UPDATE biz_region SET code = '511324' WHERE name = '仪陇县' AND city = '南充市';
UPDATE biz_region SET code = '511325' WHERE name = '西充县' AND city = '南充市';
UPDATE biz_region SET code = '511381' WHERE name = '阆中市' AND city = '南充市';

-- 南宁市
--------------------------------------------------
UPDATE biz_region SET code = '450102' WHERE name = '兴宁区' AND city = '南宁市';
UPDATE biz_region SET code = '450103' WHERE name = '青秀区' AND city = '南宁市';
UPDATE biz_region SET code = '450105' WHERE name = '江南区' AND city = '南宁市';
UPDATE biz_region SET code = '450107' WHERE name = '西乡塘区' AND city = '南宁市';
UPDATE biz_region SET code = '450108' WHERE name = '良庆区' AND city = '南宁市';
UPDATE biz_region SET code = '450109' WHERE name = '邕宁区' AND city = '南宁市';
UPDATE biz_region SET code = '450110' WHERE name = '武鸣区' AND city = '南宁市';
UPDATE biz_region SET code = '450123' WHERE name = '隆安县' AND city = '南宁市';
UPDATE biz_region SET code = '450124' WHERE name = '马山县' AND city = '南宁市';
UPDATE biz_region SET code = '450125' WHERE name = '上林县' AND city = '南宁市';
UPDATE biz_region SET code = '450126' WHERE name = '宾阳县' AND city = '南宁市';
UPDATE biz_region SET code = '450127' WHERE name = '横县' AND city = '南宁市';
UPDATE biz_region SET code = '450181' WHERE name = '横州市' AND city = '南宁市';

-- 南平市
--------------------------------------------------
UPDATE biz_region SET code = '350702' WHERE name = '延平区' AND city = '南平市';
UPDATE biz_region SET code = '350703' WHERE name = '建阳区' AND city = '南平市';
UPDATE biz_region SET code = '350721' WHERE name = '顺昌县' AND city = '南平市';
UPDATE biz_region SET code = '350722' WHERE name = '浦城县' AND city = '南平市';
UPDATE biz_region SET code = '350723' WHERE name = '光泽县' AND city = '南平市';
UPDATE biz_region SET code = '350724' WHERE name = '松溪县' AND city = '南平市';
UPDATE biz_region SET code = '350725' WHERE name = '政和县' AND city = '南平市';
UPDATE biz_region SET code = '350781' WHERE name = '邵武市' AND city = '南平市';
UPDATE biz_region SET code = '350782' WHERE name = '武夷山市' AND city = '南平市';
UPDATE biz_region SET code = '350783' WHERE name = '建瓯市' AND city = '南平市';

-- 南昌市
--------------------------------------------------
UPDATE biz_region SET code = '360102' WHERE name = '东湖区' AND city = '南昌市';
UPDATE biz_region SET code = '360103' WHERE name = '西湖区' AND city = '南昌市';
UPDATE biz_region SET code = '360104' WHERE name = '青云谱区' AND city = '南昌市';
UPDATE biz_region SET code = '360111' WHERE name = '青山湖区' AND city = '南昌市';
UPDATE biz_region SET code = '360112' WHERE name = '新建区' AND city = '南昌市';
UPDATE biz_region SET code = '360113' WHERE name = '红谷滩区' AND city = '南昌市';
UPDATE biz_region SET code = '360121' WHERE name = '南昌县' AND city = '南昌市';
UPDATE biz_region SET code = '360123' WHERE name = '安义县' AND city = '南昌市';
UPDATE biz_region SET code = '360124' WHERE name = '进贤县' AND city = '南昌市';

-- 南通市
--------------------------------------------------
UPDATE biz_region SET code = '110112' WHERE name = '通州区' AND city = '南通市';
UPDATE biz_region SET code = '320613' WHERE name = '崇川区' AND city = '南通市';
UPDATE biz_region SET code = '320614' WHERE name = '海门区' AND city = '南通市';
UPDATE biz_region SET code = '320623' WHERE name = '如东县' AND city = '南通市';
UPDATE biz_region SET code = '320671' WHERE name = '南通经济技术开发区' AND city = '南通市';
UPDATE biz_region SET code = '320681' WHERE name = '启东市' AND city = '南通市';
UPDATE biz_region SET code = '320682' WHERE name = '如皋市' AND city = '南通市';
UPDATE biz_region SET code = '320685' WHERE name = '海安市' AND city = '南通市';

-- 南阳市
--------------------------------------------------
UPDATE biz_region SET code = '411302' WHERE name = '宛城区' AND city = '南阳市';
UPDATE biz_region SET code = '411303' WHERE name = '卧龙区' AND city = '南阳市';
UPDATE biz_region SET code = '411321' WHERE name = '南召县' AND city = '南阳市';
UPDATE biz_region SET code = '411322' WHERE name = '方城县' AND city = '南阳市';
UPDATE biz_region SET code = '411323' WHERE name = '西峡县' AND city = '南阳市';
UPDATE biz_region SET code = '411324' WHERE name = '镇平县' AND city = '南阳市';
UPDATE biz_region SET code = '411325' WHERE name = '内乡县' AND city = '南阳市';
UPDATE biz_region SET code = '411326' WHERE name = '淅川县' AND city = '南阳市';
UPDATE biz_region SET code = '411327' WHERE name = '社旗县' AND city = '南阳市';
UPDATE biz_region SET code = '411328' WHERE name = '唐河县' AND city = '南阳市';
UPDATE biz_region SET code = '411329' WHERE name = '新野县' AND city = '南阳市';
UPDATE biz_region SET code = '411330' WHERE name = '桐柏县' AND city = '南阳市';
UPDATE biz_region SET code = '411371' WHERE name = '南阳高新技术产业开发区' AND city = '南阳市';
UPDATE biz_region SET code = '411372' WHERE name = '南阳市城乡一体化示范区' AND city = '南阳市';
UPDATE biz_region SET code = '411381' WHERE name = '邓州市' AND city = '南阳市';

-- 博尔塔拉蒙古自治州
--------------------------------------------------
UPDATE biz_region SET code = '652701' WHERE name = '博乐市' AND city = '博尔塔拉蒙古自治州';
UPDATE biz_region SET code = '652702' WHERE name = '阿拉山口市' AND city = '博尔塔拉蒙古自治州';
UPDATE biz_region SET code = '652722' WHERE name = '精河县' AND city = '博尔塔拉蒙古自治州';
UPDATE biz_region SET code = '652723' WHERE name = '温泉县' AND city = '博尔塔拉蒙古自治州';

-- 厦门市
--------------------------------------------------
UPDATE biz_region SET code = '350203' WHERE name = '思明区' AND city = '厦门市';
UPDATE biz_region SET code = '350205' WHERE name = '海沧区' AND city = '厦门市';
UPDATE biz_region SET code = '350206' WHERE name = '湖里区' AND city = '厦门市';
UPDATE biz_region SET code = '350211' WHERE name = '集美区' AND city = '厦门市';
UPDATE biz_region SET code = '350212' WHERE name = '同安区' AND city = '厦门市';
UPDATE biz_region SET code = '350213' WHERE name = '翔安区' AND city = '厦门市';

-- 双鸭山市
--------------------------------------------------
UPDATE biz_region SET code = '230502' WHERE name = '尖山区' AND city = '双鸭山市';
UPDATE biz_region SET code = '230503' WHERE name = '岭东区' AND city = '双鸭山市';
UPDATE biz_region SET code = '230505' WHERE name = '四方台区' AND city = '双鸭山市';
UPDATE biz_region SET code = '230506' WHERE name = '宝山区' AND city = '双鸭山市';
UPDATE biz_region SET code = '230521' WHERE name = '集贤县' AND city = '双鸭山市';
UPDATE biz_region SET code = '230522' WHERE name = '友谊县' AND city = '双鸭山市';
UPDATE biz_region SET code = '230523' WHERE name = '宝清县' AND city = '双鸭山市';
UPDATE biz_region SET code = '230524' WHERE name = '饶河县' AND city = '双鸭山市';

-- 台州市
--------------------------------------------------
UPDATE biz_region SET code = '331002' WHERE name = '椒江区' AND city = '台州市';
UPDATE biz_region SET code = '331003' WHERE name = '黄岩区' AND city = '台州市';
UPDATE biz_region SET code = '331004' WHERE name = '路桥区' AND city = '台州市';
UPDATE biz_region SET code = '331022' WHERE name = '三门县' AND city = '台州市';
UPDATE biz_region SET code = '331023' WHERE name = '天台县' AND city = '台州市';
UPDATE biz_region SET code = '331024' WHERE name = '仙居县' AND city = '台州市';
UPDATE biz_region SET code = '331081' WHERE name = '温岭市' AND city = '台州市';
UPDATE biz_region SET code = '331082' WHERE name = '临海市' AND city = '台州市';
UPDATE biz_region SET code = '331083' WHERE name = '玉环市' AND city = '台州市';

-- 合肥市
--------------------------------------------------
UPDATE biz_region SET code = '340102' WHERE name = '瑶海区' AND city = '合肥市';
UPDATE biz_region SET code = '340103' WHERE name = '庐阳区' AND city = '合肥市';
UPDATE biz_region SET code = '340104' WHERE name = '蜀山区' AND city = '合肥市';
UPDATE biz_region SET code = '340111' WHERE name = '包河区' AND city = '合肥市';
UPDATE biz_region SET code = '340121' WHERE name = '长丰县' AND city = '合肥市';
UPDATE biz_region SET code = '340122' WHERE name = '肥东县' AND city = '合肥市';
UPDATE biz_region SET code = '340123' WHERE name = '肥西县' AND city = '合肥市';
UPDATE biz_region SET code = '340124' WHERE name = '庐江县' AND city = '合肥市';
UPDATE biz_region SET code = '340171' WHERE name = '合肥高新技术产业开发区' AND city = '合肥市';
UPDATE biz_region SET code = '340172' WHERE name = '合肥经济技术开发区' AND city = '合肥市';
UPDATE biz_region SET code = '340173' WHERE name = '合肥新站高新技术产业开发区' AND city = '合肥市';
UPDATE biz_region SET code = '340181' WHERE name = '巢湖市' AND city = '合肥市';

-- 吉安市
--------------------------------------------------
UPDATE biz_region SET code = '360802' WHERE name = '吉州区' AND city = '吉安市';
UPDATE biz_region SET code = '360803' WHERE name = '青原区' AND city = '吉安市';
UPDATE biz_region SET code = '360821' WHERE name = '吉安县' AND city = '吉安市';
UPDATE biz_region SET code = '360822' WHERE name = '吉水县' AND city = '吉安市';
UPDATE biz_region SET code = '360823' WHERE name = '峡江县' AND city = '吉安市';
UPDATE biz_region SET code = '360824' WHERE name = '新干县' AND city = '吉安市';
UPDATE biz_region SET code = '360825' WHERE name = '永丰县' AND city = '吉安市';
UPDATE biz_region SET code = '360826' WHERE name = '泰和县' AND city = '吉安市';
UPDATE biz_region SET code = '360827' WHERE name = '遂川县' AND city = '吉安市';
UPDATE biz_region SET code = '360828' WHERE name = '万安县' AND city = '吉安市';
UPDATE biz_region SET code = '360829' WHERE name = '安福县' AND city = '吉安市';
UPDATE biz_region SET code = '360830' WHERE name = '永新县' AND city = '吉安市';
UPDATE biz_region SET code = '360881' WHERE name = '井冈山市' AND city = '吉安市';

-- 吉林市
--------------------------------------------------
UPDATE biz_region SET code = '220202' WHERE name = '昌邑区' AND city = '吉林市';
UPDATE biz_region SET code = '220203' WHERE name = '龙潭区' AND city = '吉林市';
UPDATE biz_region SET code = '220204' WHERE name = '船营区' AND city = '吉林市';
UPDATE biz_region SET code = '220211' WHERE name = '丰满区' AND city = '吉林市';
UPDATE biz_region SET code = '220221' WHERE name = '永吉县' AND city = '吉林市';
UPDATE biz_region SET code = '220271' WHERE name = '吉林经济开发区' AND city = '吉林市';
UPDATE biz_region SET code = '220272' WHERE name = '吉林高新技术产业开发区' AND city = '吉林市';
UPDATE biz_region SET code = '220273' WHERE name = '吉林中国新加坡食品区' AND city = '吉林市';
UPDATE biz_region SET code = '220281' WHERE name = '蛟河市' AND city = '吉林市';
UPDATE biz_region SET code = '220282' WHERE name = '桦甸市' AND city = '吉林市';
UPDATE biz_region SET code = '220283' WHERE name = '舒兰市' AND city = '吉林市';
UPDATE biz_region SET code = '220284' WHERE name = '磐石市' AND city = '吉林市';

-- 吐鲁番市
--------------------------------------------------
UPDATE biz_region SET code = '650402' WHERE name = '高昌区' AND city = '吐鲁番市';
UPDATE biz_region SET code = '650421' WHERE name = '鄯善县' AND city = '吐鲁番市';
UPDATE biz_region SET code = '650422' WHERE name = '托克逊县' AND city = '吐鲁番市';

-- 吕梁市
--------------------------------------------------
UPDATE biz_region SET code = '141102' WHERE name = '离石区' AND city = '吕梁市';
UPDATE biz_region SET code = '141121' WHERE name = '文水县' AND city = '吕梁市';
UPDATE biz_region SET code = '141122' WHERE name = '交城县' AND city = '吕梁市';
UPDATE biz_region SET code = '141123' WHERE name = '兴县' AND city = '吕梁市';
UPDATE biz_region SET code = '141124' WHERE name = '临县' AND city = '吕梁市';
UPDATE biz_region SET code = '141125' WHERE name = '柳林县' AND city = '吕梁市';
UPDATE biz_region SET code = '141126' WHERE name = '石楼县' AND city = '吕梁市';
UPDATE biz_region SET code = '141127' WHERE name = '岚县' AND city = '吕梁市';
UPDATE biz_region SET code = '141128' WHERE name = '方山县' AND city = '吕梁市';
UPDATE biz_region SET code = '141129' WHERE name = '中阳县' AND city = '吕梁市';
UPDATE biz_region SET code = '141130' WHERE name = '交口县' AND city = '吕梁市';
UPDATE biz_region SET code = '141181' WHERE name = '孝义市' AND city = '吕梁市';
UPDATE biz_region SET code = '141182' WHERE name = '汾阳市' AND city = '吕梁市';

-- 吴忠市
--------------------------------------------------
UPDATE biz_region SET code = '640302' WHERE name = '利通区' AND city = '吴忠市';
UPDATE biz_region SET code = '640303' WHERE name = '红寺堡区' AND city = '吴忠市';
UPDATE biz_region SET code = '640323' WHERE name = '盐池县' AND city = '吴忠市';
UPDATE biz_region SET code = '640324' WHERE name = '同心县' AND city = '吴忠市';
UPDATE biz_region SET code = '640381' WHERE name = '青铜峡市' AND city = '吴忠市';

-- 周口市
--------------------------------------------------
UPDATE biz_region SET code = '411602' WHERE name = '川汇区' AND city = '周口市';
UPDATE biz_region SET code = '411603' WHERE name = '淮阳区' AND city = '周口市';
UPDATE biz_region SET code = '411621' WHERE name = '扶沟县' AND city = '周口市';
UPDATE biz_region SET code = '411622' WHERE name = '西华县' AND city = '周口市';
UPDATE biz_region SET code = '411623' WHERE name = '商水县' AND city = '周口市';
UPDATE biz_region SET code = '411624' WHERE name = '沈丘县' AND city = '周口市';
UPDATE biz_region SET code = '411625' WHERE name = '郸城县' AND city = '周口市';
UPDATE biz_region SET code = '411627' WHERE name = '太康县' AND city = '周口市';
UPDATE biz_region SET code = '411628' WHERE name = '鹿邑县' AND city = '周口市';
UPDATE biz_region SET code = '411671' WHERE name = '河南周口经济开发区' AND city = '周口市';
UPDATE biz_region SET code = '411681' WHERE name = '项城市' AND city = '周口市';

-- 呼伦贝尔市
--------------------------------------------------
UPDATE biz_region SET code = '150702' WHERE name = '海拉尔区' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150703' WHERE name = '扎赉诺尔区' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150721' WHERE name = '阿荣旗' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150722' WHERE name = '莫力达瓦达斡尔族自治旗' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150723' WHERE name = '鄂伦春自治旗' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150724' WHERE name = '鄂温克族自治旗' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150725' WHERE name = '陈巴尔虎旗' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150726' WHERE name = '新巴尔虎左旗' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150727' WHERE name = '新巴尔虎右旗' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150781' WHERE name = '满洲里市' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150782' WHERE name = '牙克石市' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150783' WHERE name = '扎兰屯市' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150784' WHERE name = '额尔古纳市' AND city = '呼伦贝尔市';
UPDATE biz_region SET code = '150785' WHERE name = '根河市' AND city = '呼伦贝尔市';

-- 呼和浩特市
--------------------------------------------------
UPDATE biz_region SET code = '150102' WHERE name = '新城区' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150103' WHERE name = '回民区' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150104' WHERE name = '玉泉区' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150105' WHERE name = '赛罕区' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150121' WHERE name = '土默特左旗' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150122' WHERE name = '托克托县' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150123' WHERE name = '和林格尔县' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150124' WHERE name = '清水河县' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150125' WHERE name = '武川县' AND city = '呼和浩特市';
UPDATE biz_region SET code = '150172' WHERE name = '呼和浩特经济技术开发区' AND city = '呼和浩特市';

-- 和田地区
--------------------------------------------------
UPDATE biz_region SET code = '653201' WHERE name = '和田市' AND city = '和田地区';
UPDATE biz_region SET code = '653221' WHERE name = '和田县' AND city = '和田地区';
UPDATE biz_region SET code = '653222' WHERE name = '墨玉县' AND city = '和田地区';
UPDATE biz_region SET code = '653223' WHERE name = '皮山县' AND city = '和田地区';
UPDATE biz_region SET code = '653224' WHERE name = '洛浦县' AND city = '和田地区';
UPDATE biz_region SET code = '653225' WHERE name = '策勒县' AND city = '和田地区';
UPDATE biz_region SET code = '653226' WHERE name = '于田县' AND city = '和田地区';
UPDATE biz_region SET code = '653227' WHERE name = '民丰县' AND city = '和田地区';

-- 咸宁市
--------------------------------------------------
UPDATE biz_region SET code = '421202' WHERE name = '咸安区' AND city = '咸宁市';
UPDATE biz_region SET code = '421221' WHERE name = '嘉鱼县' AND city = '咸宁市';
UPDATE biz_region SET code = '421222' WHERE name = '通城县' AND city = '咸宁市';
UPDATE biz_region SET code = '421223' WHERE name = '崇阳县' AND city = '咸宁市';
UPDATE biz_region SET code = '421224' WHERE name = '通山县' AND city = '咸宁市';
UPDATE biz_region SET code = '421281' WHERE name = '赤壁市' AND city = '咸宁市';

-- 咸阳市
--------------------------------------------------
UPDATE biz_region SET code = '610402' WHERE name = '秦都区' AND city = '咸阳市';
UPDATE biz_region SET code = '610403' WHERE name = '杨陵区' AND city = '咸阳市';
UPDATE biz_region SET code = '610404' WHERE name = '渭城区' AND city = '咸阳市';
UPDATE biz_region SET code = '610422' WHERE name = '三原县' AND city = '咸阳市';
UPDATE biz_region SET code = '610423' WHERE name = '泾阳县' AND city = '咸阳市';
UPDATE biz_region SET code = '610424' WHERE name = '乾县' AND city = '咸阳市';
UPDATE biz_region SET code = '610425' WHERE name = '礼泉县' AND city = '咸阳市';
UPDATE biz_region SET code = '610426' WHERE name = '永寿县' AND city = '咸阳市';
UPDATE biz_region SET code = '610428' WHERE name = '长武县' AND city = '咸阳市';
UPDATE biz_region SET code = '610429' WHERE name = '旬邑县' AND city = '咸阳市';
UPDATE biz_region SET code = '610430' WHERE name = '淳化县' AND city = '咸阳市';
UPDATE biz_region SET code = '610431' WHERE name = '武功县' AND city = '咸阳市';
UPDATE biz_region SET code = '610481' WHERE name = '兴平市' AND city = '咸阳市';
UPDATE biz_region SET code = '610482' WHERE name = '彬州市' AND city = '咸阳市';

-- 哈密市
--------------------------------------------------
UPDATE biz_region SET code = '650502' WHERE name = '伊州区' AND city = '哈密市';
UPDATE biz_region SET code = '650521' WHERE name = '巴里坤哈萨克自治县' AND city = '哈密市';
UPDATE biz_region SET code = '650522' WHERE name = '伊吾县' AND city = '哈密市';

-- 哈尔滨市
--------------------------------------------------
UPDATE biz_region SET code = '230102' WHERE name = '道里区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230103' WHERE name = '南岗区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230104' WHERE name = '道外区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230108' WHERE name = '平房区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230109' WHERE name = '松北区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230110' WHERE name = '香坊区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230111' WHERE name = '呼兰区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230112' WHERE name = '阿城区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230113' WHERE name = '双城区' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230123' WHERE name = '依兰县' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230124' WHERE name = '方正县' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230125' WHERE name = '宾县' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230126' WHERE name = '巴彦县' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230127' WHERE name = '木兰县' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230128' WHERE name = '通河县' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230129' WHERE name = '延寿县' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230183' WHERE name = '尚志市' AND city = '哈尔滨市';
UPDATE biz_region SET code = '230184' WHERE name = '五常市' AND city = '哈尔滨市';

-- 唐山市
--------------------------------------------------
UPDATE biz_region SET code = '130202' WHERE name = '路南区' AND city = '唐山市';
UPDATE biz_region SET code = '130203' WHERE name = '路北区' AND city = '唐山市';
UPDATE biz_region SET code = '130204' WHERE name = '古冶区' AND city = '唐山市';
UPDATE biz_region SET code = '130205' WHERE name = '开平区' AND city = '唐山市';
UPDATE biz_region SET code = '130207' WHERE name = '丰南区' AND city = '唐山市';
UPDATE biz_region SET code = '130208' WHERE name = '丰润区' AND city = '唐山市';
UPDATE biz_region SET code = '130209' WHERE name = '曹妃甸区' AND city = '唐山市';
UPDATE biz_region SET code = '130224' WHERE name = '滦南县' AND city = '唐山市';
UPDATE biz_region SET code = '130225' WHERE name = '乐亭县' AND city = '唐山市';
UPDATE biz_region SET code = '130227' WHERE name = '迁西县' AND city = '唐山市';
UPDATE biz_region SET code = '130229' WHERE name = '玉田县' AND city = '唐山市';
UPDATE biz_region SET code = '130271' WHERE name = '河北唐山芦台经济开发区' AND city = '唐山市';
UPDATE biz_region SET code = '130272' WHERE name = '唐山市汉沽管理区' AND city = '唐山市';
UPDATE biz_region SET code = '130273' WHERE name = '唐山高新技术产业开发区' AND city = '唐山市';
UPDATE biz_region SET code = '130274' WHERE name = '河北唐山海港经济开发区' AND city = '唐山市';
UPDATE biz_region SET code = '130281' WHERE name = '遵化市' AND city = '唐山市';
UPDATE biz_region SET code = '130283' WHERE name = '迁安市' AND city = '唐山市';
UPDATE biz_region SET code = '130284' WHERE name = '滦州市' AND city = '唐山市';

-- 商丘市
--------------------------------------------------
UPDATE biz_region SET code = '411402' WHERE name = '梁园区' AND city = '商丘市';
UPDATE biz_region SET code = '411403' WHERE name = '睢阳区' AND city = '商丘市';
UPDATE biz_region SET code = '411421' WHERE name = '民权县' AND city = '商丘市';
UPDATE biz_region SET code = '411422' WHERE name = '睢县' AND city = '商丘市';
UPDATE biz_region SET code = '411423' WHERE name = '宁陵县' AND city = '商丘市';
UPDATE biz_region SET code = '411424' WHERE name = '柘城县' AND city = '商丘市';
UPDATE biz_region SET code = '411425' WHERE name = '虞城县' AND city = '商丘市';
UPDATE biz_region SET code = '411426' WHERE name = '夏邑县' AND city = '商丘市';
UPDATE biz_region SET code = '411471' WHERE name = '豫东综合物流产业聚集区' AND city = '商丘市';
UPDATE biz_region SET code = '411472' WHERE name = '河南商丘经济开发区' AND city = '商丘市';
UPDATE biz_region SET code = '411481' WHERE name = '永城市' AND city = '商丘市';

-- 商洛市
--------------------------------------------------
UPDATE biz_region SET code = '611002' WHERE name = '商州区' AND city = '商洛市';
UPDATE biz_region SET code = '611021' WHERE name = '洛南县' AND city = '商洛市';
UPDATE biz_region SET code = '611022' WHERE name = '丹凤县' AND city = '商洛市';
UPDATE biz_region SET code = '611023' WHERE name = '商南县' AND city = '商洛市';
UPDATE biz_region SET code = '611024' WHERE name = '山阳县' AND city = '商洛市';
UPDATE biz_region SET code = '611025' WHERE name = '镇安县' AND city = '商洛市';
UPDATE biz_region SET code = '611026' WHERE name = '柞水县' AND city = '商洛市';

-- 喀什地区
--------------------------------------------------
UPDATE biz_region SET code = '653101' WHERE name = '喀什市' AND city = '喀什地区';
UPDATE biz_region SET code = '653121' WHERE name = '疏附县' AND city = '喀什地区';
UPDATE biz_region SET code = '653122' WHERE name = '疏勒县' AND city = '喀什地区';
UPDATE biz_region SET code = '653123' WHERE name = '英吉沙县' AND city = '喀什地区';
UPDATE biz_region SET code = '653124' WHERE name = '泽普县' AND city = '喀什地区';
UPDATE biz_region SET code = '653125' WHERE name = '莎车县' AND city = '喀什地区';
UPDATE biz_region SET code = '653126' WHERE name = '叶城县' AND city = '喀什地区';
UPDATE biz_region SET code = '653127' WHERE name = '麦盖提县' AND city = '喀什地区';
UPDATE biz_region SET code = '653128' WHERE name = '岳普湖县' AND city = '喀什地区';
UPDATE biz_region SET code = '653129' WHERE name = '伽师县' AND city = '喀什地区';
UPDATE biz_region SET code = '653130' WHERE name = '巴楚县' AND city = '喀什地区';
UPDATE biz_region SET code = '653131' WHERE name = '塔什库尔干塔吉克自治县' AND city = '喀什地区';

-- 嘉兴市
--------------------------------------------------
UPDATE biz_region SET code = '330402' WHERE name = '南湖区' AND city = '嘉兴市';
UPDATE biz_region SET code = '330411' WHERE name = '秀洲区' AND city = '嘉兴市';
UPDATE biz_region SET code = '330421' WHERE name = '嘉善县' AND city = '嘉兴市';
UPDATE biz_region SET code = '330424' WHERE name = '海盐县' AND city = '嘉兴市';
UPDATE biz_region SET code = '330481' WHERE name = '海宁市' AND city = '嘉兴市';
UPDATE biz_region SET code = '330482' WHERE name = '平湖市' AND city = '嘉兴市';
UPDATE biz_region SET code = '330483' WHERE name = '桐乡市' AND city = '嘉兴市';

-- 嘉峪关市
--------------------------------------------------

-- 四平市
--------------------------------------------------
UPDATE biz_region SET code = '220302' WHERE name = '铁西区' AND city = '四平市';
UPDATE biz_region SET code = '220303' WHERE name = '铁东区' AND city = '四平市';
UPDATE biz_region SET code = '220322' WHERE name = '梨树县' AND city = '四平市';
UPDATE biz_region SET code = '220323' WHERE name = '伊通满族自治县' AND city = '四平市';
UPDATE biz_region SET code = '220382' WHERE name = '双辽市' AND city = '四平市';

-- 固原市
--------------------------------------------------
UPDATE biz_region SET code = '640402' WHERE name = '原州区' AND city = '固原市';
UPDATE biz_region SET code = '640422' WHERE name = '西吉县' AND city = '固原市';
UPDATE biz_region SET code = '640423' WHERE name = '隆德县' AND city = '固原市';
UPDATE biz_region SET code = '640424' WHERE name = '泾源县' AND city = '固原市';
UPDATE biz_region SET code = '640425' WHERE name = '彭阳县' AND city = '固原市';

-- 塔城地区
--------------------------------------------------
UPDATE biz_region SET code = '654201' WHERE name = '塔城市' AND city = '塔城地区';
UPDATE biz_region SET code = '654202' WHERE name = '乌苏市' AND city = '塔城地区';
UPDATE biz_region SET code = '654203' WHERE name = '沙湾市' AND city = '塔城地区';
UPDATE biz_region SET code = '654221' WHERE name = '额敏县' AND city = '塔城地区';
UPDATE biz_region SET code = '654223' WHERE name = '沙湾县' AND city = '塔城地区';
UPDATE biz_region SET code = '654224' WHERE name = '托里县' AND city = '塔城地区';
UPDATE biz_region SET code = '654225' WHERE name = '裕民县' AND city = '塔城地区';
UPDATE biz_region SET code = '654226' WHERE name = '和布克赛尔蒙古自治县' AND city = '塔城地区';

-- 大兴安岭地区
--------------------------------------------------
UPDATE biz_region SET code = '232701' WHERE name = '漠河市' AND city = '大兴安岭地区';
UPDATE biz_region SET code = '232721' WHERE name = '呼玛县' AND city = '大兴安岭地区';
UPDATE biz_region SET code = '232722' WHERE name = '塔河县' AND city = '大兴安岭地区';
UPDATE biz_region SET code = '232761' WHERE name = '加格达奇区' AND city = '大兴安岭地区';
UPDATE biz_region SET code = '232762' WHERE name = '松岭区' AND city = '大兴安岭地区';
UPDATE biz_region SET code = '232763' WHERE name = '新林区' AND city = '大兴安岭地区';
UPDATE biz_region SET code = '232764' WHERE name = '呼中区' AND city = '大兴安岭地区';

-- 大同市
--------------------------------------------------
UPDATE biz_region SET code = '140212' WHERE name = '新荣区' AND city = '大同市';
UPDATE biz_region SET code = '140213' WHERE name = '平城区' AND city = '大同市';
UPDATE biz_region SET code = '140214' WHERE name = '云冈区' AND city = '大同市';
UPDATE biz_region SET code = '140215' WHERE name = '云州区' AND city = '大同市';
UPDATE biz_region SET code = '140221' WHERE name = '阳高县' AND city = '大同市';
UPDATE biz_region SET code = '140222' WHERE name = '天镇县' AND city = '大同市';
UPDATE biz_region SET code = '140223' WHERE name = '广灵县' AND city = '大同市';
UPDATE biz_region SET code = '140224' WHERE name = '灵丘县' AND city = '大同市';
UPDATE biz_region SET code = '140225' WHERE name = '浑源县' AND city = '大同市';
UPDATE biz_region SET code = '140226' WHERE name = '左云县' AND city = '大同市';
UPDATE biz_region SET code = '140271' WHERE name = '山西大同经济开发区' AND city = '大同市';

-- 大庆市
--------------------------------------------------
UPDATE biz_region SET code = '230602' WHERE name = '萨尔图区' AND city = '大庆市';
UPDATE biz_region SET code = '230603' WHERE name = '龙凤区' AND city = '大庆市';
UPDATE biz_region SET code = '230604' WHERE name = '让胡路区' AND city = '大庆市';
UPDATE biz_region SET code = '230605' WHERE name = '红岗区' AND city = '大庆市';
UPDATE biz_region SET code = '230606' WHERE name = '大同区' AND city = '大庆市';
UPDATE biz_region SET code = '230621' WHERE name = '肇州县' AND city = '大庆市';
UPDATE biz_region SET code = '230622' WHERE name = '肇源县' AND city = '大庆市';
UPDATE biz_region SET code = '230623' WHERE name = '林甸县' AND city = '大庆市';
UPDATE biz_region SET code = '230624' WHERE name = '杜尔伯特蒙古族自治县' AND city = '大庆市';
UPDATE biz_region SET code = '230671' WHERE name = '大庆高新技术产业开发区' AND city = '大庆市';

-- 大理白族自治州
--------------------------------------------------
UPDATE biz_region SET code = '532901' WHERE name = '大理市' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532922' WHERE name = '漾濞彝族自治县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532923' WHERE name = '祥云县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532924' WHERE name = '宾川县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532925' WHERE name = '弥渡县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532926' WHERE name = '南涧彝族自治县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532927' WHERE name = '巍山彝族回族自治县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532928' WHERE name = '永平县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532929' WHERE name = '云龙县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532930' WHERE name = '洱源县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532931' WHERE name = '剑川县' AND city = '大理白族自治州';
UPDATE biz_region SET code = '532932' WHERE name = '鹤庆县' AND city = '大理白族自治州';

-- 大连市
--------------------------------------------------
UPDATE biz_region SET code = '210202' WHERE name = '中山区' AND city = '大连市';
UPDATE biz_region SET code = '210203' WHERE name = '西岗区' AND city = '大连市';
UPDATE biz_region SET code = '210204' WHERE name = '沙河口区' AND city = '大连市';
UPDATE biz_region SET code = '210211' WHERE name = '甘井子区' AND city = '大连市';
UPDATE biz_region SET code = '210212' WHERE name = '旅顺口区' AND city = '大连市';
UPDATE biz_region SET code = '210213' WHERE name = '金州区' AND city = '大连市';
UPDATE biz_region SET code = '210214' WHERE name = '普兰店区' AND city = '大连市';
UPDATE biz_region SET code = '210224' WHERE name = '长海县' AND city = '大连市';
UPDATE biz_region SET code = '210281' WHERE name = '瓦房店市' AND city = '大连市';
UPDATE biz_region SET code = '210283' WHERE name = '庄河市' AND city = '大连市';

-- 天水市
--------------------------------------------------
UPDATE biz_region SET code = '620502' WHERE name = '秦州区' AND city = '天水市';
UPDATE biz_region SET code = '620503' WHERE name = '麦积区' AND city = '天水市';
UPDATE biz_region SET code = '620521' WHERE name = '清水县' AND city = '天水市';
UPDATE biz_region SET code = '620522' WHERE name = '秦安县' AND city = '天水市';
UPDATE biz_region SET code = '620523' WHERE name = '甘谷县' AND city = '天水市';
UPDATE biz_region SET code = '620524' WHERE name = '武山县' AND city = '天水市';
UPDATE biz_region SET code = '620525' WHERE name = '张家川回族自治县' AND city = '天水市';

-- 天津
--------------------------------------------------
UPDATE biz_region SET code = '120101' WHERE name = '和平区' AND city = '天津';
UPDATE biz_region SET code = '120102' WHERE name = '河东区' AND city = '天津';
UPDATE biz_region SET code = '120103' WHERE name = '河西区' AND city = '天津';
UPDATE biz_region SET code = '120104' WHERE name = '南开区' AND city = '天津';
UPDATE biz_region SET code = '120105' WHERE name = '河北区' AND city = '天津';
UPDATE biz_region SET code = '120106' WHERE name = '红桥区' AND city = '天津';
UPDATE biz_region SET code = '120110' WHERE name = '东丽区' AND city = '天津';
UPDATE biz_region SET code = '120111' WHERE name = '西青区' AND city = '天津';
UPDATE biz_region SET code = '120112' WHERE name = '津南区' AND city = '天津';
UPDATE biz_region SET code = '120113' WHERE name = '北辰区' AND city = '天津';
UPDATE biz_region SET code = '120114' WHERE name = '武清区' AND city = '天津';
UPDATE biz_region SET code = '120115' WHERE name = '宝坻区' AND city = '天津';
UPDATE biz_region SET code = '120116' WHERE name = '滨海新区' AND city = '天津';
UPDATE biz_region SET code = '120117' WHERE name = '宁河区' AND city = '天津';
UPDATE biz_region SET code = '120118' WHERE name = '静海区' AND city = '天津';
UPDATE biz_region SET code = '120119' WHERE name = '蓟州区' AND city = '天津';

-- 太原市
--------------------------------------------------
UPDATE biz_region SET code = '140105' WHERE name = '小店区' AND city = '太原市';
UPDATE biz_region SET code = '140106' WHERE name = '迎泽区' AND city = '太原市';
UPDATE biz_region SET code = '140107' WHERE name = '杏花岭区' AND city = '太原市';
UPDATE biz_region SET code = '140108' WHERE name = '尖草坪区' AND city = '太原市';
UPDATE biz_region SET code = '140109' WHERE name = '万柏林区' AND city = '太原市';
UPDATE biz_region SET code = '140110' WHERE name = '晋源区' AND city = '太原市';
UPDATE biz_region SET code = '140121' WHERE name = '清徐县' AND city = '太原市';
UPDATE biz_region SET code = '140122' WHERE name = '阳曲县' AND city = '太原市';
UPDATE biz_region SET code = '140123' WHERE name = '娄烦县' AND city = '太原市';
UPDATE biz_region SET code = '140171' WHERE name = '山西转型综合改革示范区' AND city = '太原市';
UPDATE biz_region SET code = '140181' WHERE name = '古交市' AND city = '太原市';

-- 威海市
--------------------------------------------------
UPDATE biz_region SET code = '371002' WHERE name = '环翠区' AND city = '威海市';
UPDATE biz_region SET code = '371003' WHERE name = '文登区' AND city = '威海市';
UPDATE biz_region SET code = '371071' WHERE name = '威海火炬高技术产业开发区' AND city = '威海市';
UPDATE biz_region SET code = '371072' WHERE name = '威海经济技术开发区' AND city = '威海市';
UPDATE biz_region SET code = '371073' WHERE name = '威海临港经济技术开发区' AND city = '威海市';
UPDATE biz_region SET code = '371082' WHERE name = '荣成市' AND city = '威海市';
UPDATE biz_region SET code = '371083' WHERE name = '乳山市' AND city = '威海市';

-- 娄底市
--------------------------------------------------
UPDATE biz_region SET code = '431302' WHERE name = '娄星区' AND city = '娄底市';
UPDATE biz_region SET code = '431321' WHERE name = '双峰县' AND city = '娄底市';
UPDATE biz_region SET code = '431322' WHERE name = '新化县' AND city = '娄底市';
UPDATE biz_region SET code = '431381' WHERE name = '冷水江市' AND city = '娄底市';
UPDATE biz_region SET code = '431382' WHERE name = '涟源市' AND city = '娄底市';

-- 孝感市
--------------------------------------------------
UPDATE biz_region SET code = '420902' WHERE name = '孝南区' AND city = '孝感市';
UPDATE biz_region SET code = '420921' WHERE name = '孝昌县' AND city = '孝感市';
UPDATE biz_region SET code = '420922' WHERE name = '大悟县' AND city = '孝感市';
UPDATE biz_region SET code = '420923' WHERE name = '云梦县' AND city = '孝感市';
UPDATE biz_region SET code = '420981' WHERE name = '应城市' AND city = '孝感市';
UPDATE biz_region SET code = '420982' WHERE name = '安陆市' AND city = '孝感市';
UPDATE biz_region SET code = '420984' WHERE name = '汉川市' AND city = '孝感市';

-- 宁德市
--------------------------------------------------
UPDATE biz_region SET code = '350902' WHERE name = '蕉城区' AND city = '宁德市';
UPDATE biz_region SET code = '350921' WHERE name = '霞浦县' AND city = '宁德市';
UPDATE biz_region SET code = '350922' WHERE name = '古田县' AND city = '宁德市';
UPDATE biz_region SET code = '350923' WHERE name = '屏南县' AND city = '宁德市';
UPDATE biz_region SET code = '350924' WHERE name = '寿宁县' AND city = '宁德市';
UPDATE biz_region SET code = '350925' WHERE name = '周宁县' AND city = '宁德市';
UPDATE biz_region SET code = '350926' WHERE name = '柘荣县' AND city = '宁德市';
UPDATE biz_region SET code = '350981' WHERE name = '福安市' AND city = '宁德市';
UPDATE biz_region SET code = '350982' WHERE name = '福鼎市' AND city = '宁德市';

-- 宁波市
--------------------------------------------------
UPDATE biz_region SET code = '330203' WHERE name = '海曙区' AND city = '宁波市';
UPDATE biz_region SET code = '330205' WHERE name = '江北区' AND city = '宁波市';
UPDATE biz_region SET code = '330206' WHERE name = '北仑区' AND city = '宁波市';
UPDATE biz_region SET code = '330211' WHERE name = '镇海区' AND city = '宁波市';
UPDATE biz_region SET code = '330212' WHERE name = '鄞州区' AND city = '宁波市';
UPDATE biz_region SET code = '330213' WHERE name = '奉化区' AND city = '宁波市';
UPDATE biz_region SET code = '330225' WHERE name = '象山县' AND city = '宁波市';
UPDATE biz_region SET code = '330226' WHERE name = '宁海县' AND city = '宁波市';
UPDATE biz_region SET code = '330281' WHERE name = '余姚市' AND city = '宁波市';
UPDATE biz_region SET code = '330282' WHERE name = '慈溪市' AND city = '宁波市';

-- 安庆市
--------------------------------------------------
UPDATE biz_region SET code = '340802' WHERE name = '迎江区' AND city = '安庆市';
UPDATE biz_region SET code = '340803' WHERE name = '大观区' AND city = '安庆市';
UPDATE biz_region SET code = '340811' WHERE name = '宜秀区' AND city = '安庆市';
UPDATE biz_region SET code = '340822' WHERE name = '怀宁县' AND city = '安庆市';
UPDATE biz_region SET code = '340825' WHERE name = '太湖县' AND city = '安庆市';
UPDATE biz_region SET code = '340826' WHERE name = '宿松县' AND city = '安庆市';
UPDATE biz_region SET code = '340827' WHERE name = '望江县' AND city = '安庆市';
UPDATE biz_region SET code = '340828' WHERE name = '岳西县' AND city = '安庆市';
UPDATE biz_region SET code = '340871' WHERE name = '安徽安庆经济开发区' AND city = '安庆市';
UPDATE biz_region SET code = '340881' WHERE name = '桐城市' AND city = '安庆市';
UPDATE biz_region SET code = '340882' WHERE name = '潜山市' AND city = '安庆市';

-- 安康市
--------------------------------------------------
UPDATE biz_region SET code = '610902' WHERE name = '汉滨区' AND city = '安康市';
UPDATE biz_region SET code = '610921' WHERE name = '汉阴县' AND city = '安康市';
UPDATE biz_region SET code = '610922' WHERE name = '石泉县' AND city = '安康市';
UPDATE biz_region SET code = '610923' WHERE name = '宁陕县' AND city = '安康市';
UPDATE biz_region SET code = '610924' WHERE name = '紫阳县' AND city = '安康市';
UPDATE biz_region SET code = '610925' WHERE name = '岚皋县' AND city = '安康市';
UPDATE biz_region SET code = '610926' WHERE name = '平利县' AND city = '安康市';
UPDATE biz_region SET code = '610927' WHERE name = '镇坪县' AND city = '安康市';
UPDATE biz_region SET code = '610928' WHERE name = '旬阳县' AND city = '安康市';
UPDATE biz_region SET code = '610929' WHERE name = '白河县' AND city = '安康市';
UPDATE biz_region SET code = '610981' WHERE name = '旬阳市' AND city = '安康市';

-- 安阳市
--------------------------------------------------
UPDATE biz_region SET code = '410502' WHERE name = '文峰区' AND city = '安阳市';
UPDATE biz_region SET code = '410503' WHERE name = '北关区' AND city = '安阳市';
UPDATE biz_region SET code = '410505' WHERE name = '殷都区' AND city = '安阳市';
UPDATE biz_region SET code = '410506' WHERE name = '龙安区' AND city = '安阳市';
UPDATE biz_region SET code = '410522' WHERE name = '安阳县' AND city = '安阳市';
UPDATE biz_region SET code = '410523' WHERE name = '汤阴县' AND city = '安阳市';
UPDATE biz_region SET code = '410526' WHERE name = '滑县' AND city = '安阳市';
UPDATE biz_region SET code = '410527' WHERE name = '内黄县' AND city = '安阳市';
UPDATE biz_region SET code = '410571' WHERE name = '安阳高新技术产业开发区' AND city = '安阳市';
UPDATE biz_region SET code = '410581' WHERE name = '林州市' AND city = '安阳市';

-- 安顺市
--------------------------------------------------
UPDATE biz_region SET code = '520402' WHERE name = '西秀区' AND city = '安顺市';
UPDATE biz_region SET code = '520403' WHERE name = '平坝区' AND city = '安顺市';
UPDATE biz_region SET code = '520422' WHERE name = '普定县' AND city = '安顺市';
UPDATE biz_region SET code = '520423' WHERE name = '镇宁布依族苗族自治县' AND city = '安顺市';
UPDATE biz_region SET code = '520424' WHERE name = '关岭布依族苗族自治县' AND city = '安顺市';
UPDATE biz_region SET code = '520425' WHERE name = '紫云苗族布依族自治县' AND city = '安顺市';

-- 定西市
--------------------------------------------------
UPDATE biz_region SET code = '621102' WHERE name = '安定区' AND city = '定西市';
UPDATE biz_region SET code = '621121' WHERE name = '通渭县' AND city = '定西市';
UPDATE biz_region SET code = '621122' WHERE name = '陇西县' AND city = '定西市';
UPDATE biz_region SET code = '621123' WHERE name = '渭源县' AND city = '定西市';
UPDATE biz_region SET code = '621124' WHERE name = '临洮县' AND city = '定西市';
UPDATE biz_region SET code = '621125' WHERE name = '漳县' AND city = '定西市';
UPDATE biz_region SET code = '621126' WHERE name = '岷县' AND city = '定西市';

-- 宜宾市
--------------------------------------------------
UPDATE biz_region SET code = '511502' WHERE name = '翠屏区' AND city = '宜宾市';
UPDATE biz_region SET code = '511503' WHERE name = '南溪区' AND city = '宜宾市';
UPDATE biz_region SET code = '511504' WHERE name = '叙州区' AND city = '宜宾市';
UPDATE biz_region SET code = '511523' WHERE name = '江安县' AND city = '宜宾市';
UPDATE biz_region SET code = '511524' WHERE name = '长宁县' AND city = '宜宾市';
UPDATE biz_region SET code = '511525' WHERE name = '高县' AND city = '宜宾市';
UPDATE biz_region SET code = '511526' WHERE name = '珙县' AND city = '宜宾市';
UPDATE biz_region SET code = '511527' WHERE name = '筠连县' AND city = '宜宾市';
UPDATE biz_region SET code = '511528' WHERE name = '兴文县' AND city = '宜宾市';
UPDATE biz_region SET code = '511529' WHERE name = '屏山县' AND city = '宜宾市';

-- 宜昌市
--------------------------------------------------
UPDATE biz_region SET code = '420502' WHERE name = '西陵区' AND city = '宜昌市';
UPDATE biz_region SET code = '420503' WHERE name = '伍家岗区' AND city = '宜昌市';
UPDATE biz_region SET code = '420504' WHERE name = '点军区' AND city = '宜昌市';
UPDATE biz_region SET code = '420505' WHERE name = '猇亭区' AND city = '宜昌市';
UPDATE biz_region SET code = '420506' WHERE name = '夷陵区' AND city = '宜昌市';
UPDATE biz_region SET code = '420525' WHERE name = '远安县' AND city = '宜昌市';
UPDATE biz_region SET code = '420526' WHERE name = '兴山县' AND city = '宜昌市';
UPDATE biz_region SET code = '420527' WHERE name = '秭归县' AND city = '宜昌市';
UPDATE biz_region SET code = '420528' WHERE name = '长阳土家族自治县' AND city = '宜昌市';
UPDATE biz_region SET code = '420529' WHERE name = '五峰土家族自治县' AND city = '宜昌市';
UPDATE biz_region SET code = '420581' WHERE name = '宜都市' AND city = '宜昌市';
UPDATE biz_region SET code = '420582' WHERE name = '当阳市' AND city = '宜昌市';
UPDATE biz_region SET code = '420583' WHERE name = '枝江市' AND city = '宜昌市';

-- 宜春市
--------------------------------------------------
UPDATE biz_region SET code = '360902' WHERE name = '袁州区' AND city = '宜春市';
UPDATE biz_region SET code = '360921' WHERE name = '奉新县' AND city = '宜春市';
UPDATE biz_region SET code = '360922' WHERE name = '万载县' AND city = '宜春市';
UPDATE biz_region SET code = '360923' WHERE name = '上高县' AND city = '宜春市';
UPDATE biz_region SET code = '360924' WHERE name = '宜丰县' AND city = '宜春市';
UPDATE biz_region SET code = '360925' WHERE name = '靖安县' AND city = '宜春市';
UPDATE biz_region SET code = '360926' WHERE name = '铜鼓县' AND city = '宜春市';
UPDATE biz_region SET code = '360981' WHERE name = '丰城市' AND city = '宜春市';
UPDATE biz_region SET code = '360982' WHERE name = '樟树市' AND city = '宜春市';
UPDATE biz_region SET code = '360983' WHERE name = '高安市' AND city = '宜春市';

-- 宝鸡市
--------------------------------------------------
UPDATE biz_region SET code = '610302' WHERE name = '渭滨区' AND city = '宝鸡市';
UPDATE biz_region SET code = '610303' WHERE name = '金台区' AND city = '宝鸡市';
UPDATE biz_region SET code = '610304' WHERE name = '陈仓区' AND city = '宝鸡市';
UPDATE biz_region SET code = '610305' WHERE name = '凤翔区' AND city = '宝鸡市';
UPDATE biz_region SET code = '610322' WHERE name = '凤翔县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610323' WHERE name = '岐山县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610324' WHERE name = '扶风县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610326' WHERE name = '眉县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610327' WHERE name = '陇县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610328' WHERE name = '千阳县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610329' WHERE name = '麟游县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610330' WHERE name = '凤县' AND city = '宝鸡市';
UPDATE biz_region SET code = '610331' WHERE name = '太白县' AND city = '宝鸡市';

-- 宣城市
--------------------------------------------------
UPDATE biz_region SET code = '341802' WHERE name = '宣州区' AND city = '宣城市';
UPDATE biz_region SET code = '341821' WHERE name = '郎溪县' AND city = '宣城市';
UPDATE biz_region SET code = '341823' WHERE name = '泾县' AND city = '宣城市';
UPDATE biz_region SET code = '341824' WHERE name = '绩溪县' AND city = '宣城市';
UPDATE biz_region SET code = '341825' WHERE name = '旌德县' AND city = '宣城市';
UPDATE biz_region SET code = '341871' WHERE name = '宣城市经济开发区' AND city = '宣城市';
UPDATE biz_region SET code = '341881' WHERE name = '宁国市' AND city = '宣城市';
UPDATE biz_region SET code = '341882' WHERE name = '广德市' AND city = '宣城市';

-- 宿州市
--------------------------------------------------
UPDATE biz_region SET code = '341302' WHERE name = '埇桥区' AND city = '宿州市';
UPDATE biz_region SET code = '341321' WHERE name = '砀山县' AND city = '宿州市';
UPDATE biz_region SET code = '341322' WHERE name = '萧县' AND city = '宿州市';
UPDATE biz_region SET code = '341323' WHERE name = '灵璧县' AND city = '宿州市';
UPDATE biz_region SET code = '341324' WHERE name = '泗县' AND city = '宿州市';
UPDATE biz_region SET code = '341371' WHERE name = '宿州马鞍山现代产业园区' AND city = '宿州市';
UPDATE biz_region SET code = '341372' WHERE name = '宿州经济技术开发区' AND city = '宿州市';

-- 宿迁市
--------------------------------------------------
UPDATE biz_region SET code = '321302' WHERE name = '宿城区' AND city = '宿迁市';
UPDATE biz_region SET code = '321311' WHERE name = '宿豫区' AND city = '宿迁市';
UPDATE biz_region SET code = '321322' WHERE name = '沭阳县' AND city = '宿迁市';
UPDATE biz_region SET code = '321323' WHERE name = '泗阳县' AND city = '宿迁市';
UPDATE biz_region SET code = '321324' WHERE name = '泗洪县' AND city = '宿迁市';
UPDATE biz_region SET code = '321371' WHERE name = '宿迁经济技术开发区' AND city = '宿迁市';

-- 山南市
--------------------------------------------------
UPDATE biz_region SET code = '540502' WHERE name = '乃东区' AND city = '山南市';
UPDATE biz_region SET code = '540521' WHERE name = '扎囊县' AND city = '山南市';
UPDATE biz_region SET code = '540522' WHERE name = '贡嘎县' AND city = '山南市';
UPDATE biz_region SET code = '540523' WHERE name = '桑日县' AND city = '山南市';
UPDATE biz_region SET code = '540524' WHERE name = '琼结县' AND city = '山南市';
UPDATE biz_region SET code = '540525' WHERE name = '曲松县' AND city = '山南市';
UPDATE biz_region SET code = '540526' WHERE name = '措美县' AND city = '山南市';
UPDATE biz_region SET code = '540527' WHERE name = '洛扎县' AND city = '山南市';
UPDATE biz_region SET code = '540528' WHERE name = '加查县' AND city = '山南市';
UPDATE biz_region SET code = '540529' WHERE name = '隆子县' AND city = '山南市';
UPDATE biz_region SET code = '540530' WHERE name = '错那县' AND city = '山南市';
UPDATE biz_region SET code = '540531' WHERE name = '浪卡子县' AND city = '山南市';

-- 岳阳市
--------------------------------------------------
UPDATE biz_region SET code = '430602' WHERE name = '岳阳楼区' AND city = '岳阳市';
UPDATE biz_region SET code = '430603' WHERE name = '云溪区' AND city = '岳阳市';
UPDATE biz_region SET code = '430611' WHERE name = '君山区' AND city = '岳阳市';
UPDATE biz_region SET code = '430621' WHERE name = '岳阳县' AND city = '岳阳市';
UPDATE biz_region SET code = '430623' WHERE name = '华容县' AND city = '岳阳市';
UPDATE biz_region SET code = '430624' WHERE name = '湘阴县' AND city = '岳阳市';
UPDATE biz_region SET code = '430626' WHERE name = '平江县' AND city = '岳阳市';
UPDATE biz_region SET code = '430671' WHERE name = '岳阳市屈原管理区' AND city = '岳阳市';
UPDATE biz_region SET code = '430681' WHERE name = '汨罗市' AND city = '岳阳市';
UPDATE biz_region SET code = '430682' WHERE name = '临湘市' AND city = '岳阳市';

-- 崇左市
--------------------------------------------------
UPDATE biz_region SET code = '451402' WHERE name = '江州区' AND city = '崇左市';
UPDATE biz_region SET code = '451421' WHERE name = '扶绥县' AND city = '崇左市';
UPDATE biz_region SET code = '451422' WHERE name = '宁明县' AND city = '崇左市';
UPDATE biz_region SET code = '451423' WHERE name = '龙州县' AND city = '崇左市';
UPDATE biz_region SET code = '451424' WHERE name = '大新县' AND city = '崇左市';
UPDATE biz_region SET code = '451425' WHERE name = '天等县' AND city = '崇左市';
UPDATE biz_region SET code = '451481' WHERE name = '凭祥市' AND city = '崇左市';

-- 巴中市
--------------------------------------------------
UPDATE biz_region SET code = '511902' WHERE name = '巴州区' AND city = '巴中市';
UPDATE biz_region SET code = '511903' WHERE name = '恩阳区' AND city = '巴中市';
UPDATE biz_region SET code = '511921' WHERE name = '通江县' AND city = '巴中市';
UPDATE biz_region SET code = '511922' WHERE name = '南江县' AND city = '巴中市';
UPDATE biz_region SET code = '511923' WHERE name = '平昌县' AND city = '巴中市';
UPDATE biz_region SET code = '511971' WHERE name = '巴中经济开发区' AND city = '巴中市';

-- 巴彦淖尔市
--------------------------------------------------
UPDATE biz_region SET code = '150802' WHERE name = '临河区' AND city = '巴彦淖尔市';
UPDATE biz_region SET code = '150821' WHERE name = '五原县' AND city = '巴彦淖尔市';
UPDATE biz_region SET code = '150822' WHERE name = '磴口县' AND city = '巴彦淖尔市';
UPDATE biz_region SET code = '150823' WHERE name = '乌拉特前旗' AND city = '巴彦淖尔市';
UPDATE biz_region SET code = '150824' WHERE name = '乌拉特中旗' AND city = '巴彦淖尔市';
UPDATE biz_region SET code = '150825' WHERE name = '乌拉特后旗' AND city = '巴彦淖尔市';
UPDATE biz_region SET code = '150826' WHERE name = '杭锦后旗' AND city = '巴彦淖尔市';

-- 巴音郭楞蒙古自治州
--------------------------------------------------
UPDATE biz_region SET code = '652801' WHERE name = '库尔勒市' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652822' WHERE name = '轮台县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652823' WHERE name = '尉犁县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652824' WHERE name = '若羌县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652825' WHERE name = '且末县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652826' WHERE name = '焉耆回族自治县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652827' WHERE name = '和静县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652828' WHERE name = '和硕县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652829' WHERE name = '博湖县' AND city = '巴音郭楞蒙古自治州';
UPDATE biz_region SET code = '652871' WHERE name = '库尔勒经济技术开发区' AND city = '巴音郭楞蒙古自治州';

-- 常州市
--------------------------------------------------
UPDATE biz_region SET code = '320402' WHERE name = '天宁区' AND city = '常州市';
UPDATE biz_region SET code = '320404' WHERE name = '钟楼区' AND city = '常州市';
UPDATE biz_region SET code = '320411' WHERE name = '新北区' AND city = '常州市';
UPDATE biz_region SET code = '320412' WHERE name = '武进区' AND city = '常州市';
UPDATE biz_region SET code = '320413' WHERE name = '金坛区' AND city = '常州市';
UPDATE biz_region SET code = '320481' WHERE name = '溧阳市' AND city = '常州市';

-- 常德市
--------------------------------------------------
UPDATE biz_region SET code = '430702' WHERE name = '武陵区' AND city = '常德市';
UPDATE biz_region SET code = '430703' WHERE name = '鼎城区' AND city = '常德市';
UPDATE biz_region SET code = '430721' WHERE name = '安乡县' AND city = '常德市';
UPDATE biz_region SET code = '430722' WHERE name = '汉寿县' AND city = '常德市';
UPDATE biz_region SET code = '430723' WHERE name = '澧县' AND city = '常德市';
UPDATE biz_region SET code = '430724' WHERE name = '临澧县' AND city = '常德市';
UPDATE biz_region SET code = '430725' WHERE name = '桃源县' AND city = '常德市';
UPDATE biz_region SET code = '430726' WHERE name = '石门县' AND city = '常德市';
UPDATE biz_region SET code = '430771' WHERE name = '常德市西洞庭管理区' AND city = '常德市';
UPDATE biz_region SET code = '430781' WHERE name = '津市市' AND city = '常德市';

-- 平凉市
--------------------------------------------------
UPDATE biz_region SET code = '620802' WHERE name = '崆峒区' AND city = '平凉市';
UPDATE biz_region SET code = '620821' WHERE name = '泾川县' AND city = '平凉市';
UPDATE biz_region SET code = '620822' WHERE name = '灵台县' AND city = '平凉市';
UPDATE biz_region SET code = '620823' WHERE name = '崇信县' AND city = '平凉市';
UPDATE biz_region SET code = '620825' WHERE name = '庄浪县' AND city = '平凉市';
UPDATE biz_region SET code = '620826' WHERE name = '静宁县' AND city = '平凉市';
UPDATE biz_region SET code = '620881' WHERE name = '华亭市' AND city = '平凉市';

-- 平顶山市
--------------------------------------------------
UPDATE biz_region SET code = '410402' WHERE name = '新华区' AND city = '平顶山市';
UPDATE biz_region SET code = '410403' WHERE name = '卫东区' AND city = '平顶山市';
UPDATE biz_region SET code = '410404' WHERE name = '石龙区' AND city = '平顶山市';
UPDATE biz_region SET code = '410411' WHERE name = '湛河区' AND city = '平顶山市';
UPDATE biz_region SET code = '410421' WHERE name = '宝丰县' AND city = '平顶山市';
UPDATE biz_region SET code = '410422' WHERE name = '叶县' AND city = '平顶山市';
UPDATE biz_region SET code = '410423' WHERE name = '鲁山县' AND city = '平顶山市';
UPDATE biz_region SET code = '410425' WHERE name = '郏县' AND city = '平顶山市';
UPDATE biz_region SET code = '410471' WHERE name = '平顶山高新技术产业开发区' AND city = '平顶山市';
UPDATE biz_region SET code = '410472' WHERE name = '平顶山市城乡一体化示范区' AND city = '平顶山市';
UPDATE biz_region SET code = '410481' WHERE name = '舞钢市' AND city = '平顶山市';
UPDATE biz_region SET code = '410482' WHERE name = '汝州市' AND city = '平顶山市';

-- 广元市
--------------------------------------------------
UPDATE biz_region SET code = '510802' WHERE name = '利州区' AND city = '广元市';
UPDATE biz_region SET code = '510811' WHERE name = '昭化区' AND city = '广元市';
UPDATE biz_region SET code = '510812' WHERE name = '朝天区' AND city = '广元市';
UPDATE biz_region SET code = '510821' WHERE name = '旺苍县' AND city = '广元市';
UPDATE biz_region SET code = '510822' WHERE name = '青川县' AND city = '广元市';
UPDATE biz_region SET code = '510823' WHERE name = '剑阁县' AND city = '广元市';
UPDATE biz_region SET code = '510824' WHERE name = '苍溪县' AND city = '广元市';

-- 广安市
--------------------------------------------------
UPDATE biz_region SET code = '511602' WHERE name = '广安区' AND city = '广安市';
UPDATE biz_region SET code = '511603' WHERE name = '前锋区' AND city = '广安市';
UPDATE biz_region SET code = '511621' WHERE name = '岳池县' AND city = '广安市';
UPDATE biz_region SET code = '511622' WHERE name = '武胜县' AND city = '广安市';
UPDATE biz_region SET code = '511623' WHERE name = '邻水县' AND city = '广安市';
UPDATE biz_region SET code = '511681' WHERE name = '华蓥市' AND city = '广安市';

-- 广州市
--------------------------------------------------
UPDATE biz_region SET code = '440103' WHERE name = '荔湾区' AND city = '广州市';
UPDATE biz_region SET code = '440104' WHERE name = '越秀区' AND city = '广州市';
UPDATE biz_region SET code = '440105' WHERE name = '海珠区' AND city = '广州市';
UPDATE biz_region SET code = '440106' WHERE name = '天河区' AND city = '广州市';
UPDATE biz_region SET code = '440111' WHERE name = '白云区' AND city = '广州市';
UPDATE biz_region SET code = '440112' WHERE name = '黄埔区' AND city = '广州市';
UPDATE biz_region SET code = '440113' WHERE name = '番禺区' AND city = '广州市';
UPDATE biz_region SET code = '440114' WHERE name = '花都区' AND city = '广州市';
UPDATE biz_region SET code = '440115' WHERE name = '南沙区' AND city = '广州市';
UPDATE biz_region SET code = '440117' WHERE name = '从化区' AND city = '广州市';
UPDATE biz_region SET code = '440118' WHERE name = '增城区' AND city = '广州市';

-- 庆阳市
--------------------------------------------------
UPDATE biz_region SET code = '621002' WHERE name = '西峰区' AND city = '庆阳市';
UPDATE biz_region SET code = '621021' WHERE name = '庆城县' AND city = '庆阳市';
UPDATE biz_region SET code = '621022' WHERE name = '环县' AND city = '庆阳市';
UPDATE biz_region SET code = '621023' WHERE name = '华池县' AND city = '庆阳市';
UPDATE biz_region SET code = '621024' WHERE name = '合水县' AND city = '庆阳市';
UPDATE biz_region SET code = '621025' WHERE name = '正宁县' AND city = '庆阳市';
UPDATE biz_region SET code = '621026' WHERE name = '宁县' AND city = '庆阳市';
UPDATE biz_region SET code = '621027' WHERE name = '镇原县' AND city = '庆阳市';

-- 廊坊市
--------------------------------------------------
UPDATE biz_region SET code = '131002' WHERE name = '安次区' AND city = '廊坊市';
UPDATE biz_region SET code = '131003' WHERE name = '广阳区' AND city = '廊坊市';
UPDATE biz_region SET code = '131022' WHERE name = '固安县' AND city = '廊坊市';
UPDATE biz_region SET code = '131023' WHERE name = '永清县' AND city = '廊坊市';
UPDATE biz_region SET code = '131024' WHERE name = '香河县' AND city = '廊坊市';
UPDATE biz_region SET code = '131025' WHERE name = '大城县' AND city = '廊坊市';
UPDATE biz_region SET code = '131026' WHERE name = '文安县' AND city = '廊坊市';
UPDATE biz_region SET code = '131028' WHERE name = '大厂回族自治县' AND city = '廊坊市';
UPDATE biz_region SET code = '131071' WHERE name = '廊坊经济技术开发区' AND city = '廊坊市';
UPDATE biz_region SET code = '131081' WHERE name = '霸州市' AND city = '廊坊市';
UPDATE biz_region SET code = '131082' WHERE name = '三河市' AND city = '廊坊市';

-- 延安市
--------------------------------------------------
UPDATE biz_region SET code = '610602' WHERE name = '宝塔区' AND city = '延安市';
UPDATE biz_region SET code = '610603' WHERE name = '安塞区' AND city = '延安市';
UPDATE biz_region SET code = '610621' WHERE name = '延长县' AND city = '延安市';
UPDATE biz_region SET code = '610622' WHERE name = '延川县' AND city = '延安市';
UPDATE biz_region SET code = '610625' WHERE name = '志丹县' AND city = '延安市';
UPDATE biz_region SET code = '610626' WHERE name = '吴起县' AND city = '延安市';
UPDATE biz_region SET code = '610627' WHERE name = '甘泉县' AND city = '延安市';
UPDATE biz_region SET code = '610628' WHERE name = '富县' AND city = '延安市';
UPDATE biz_region SET code = '610629' WHERE name = '洛川县' AND city = '延安市';
UPDATE biz_region SET code = '610630' WHERE name = '宜川县' AND city = '延安市';
UPDATE biz_region SET code = '610631' WHERE name = '黄龙县' AND city = '延安市';
UPDATE biz_region SET code = '610632' WHERE name = '黄陵县' AND city = '延安市';
UPDATE biz_region SET code = '610681' WHERE name = '子长市' AND city = '延安市';

-- 延边朝鲜族自治州
--------------------------------------------------
UPDATE biz_region SET code = '222401' WHERE name = '延吉市' AND city = '延边朝鲜族自治州';
UPDATE biz_region SET code = '222402' WHERE name = '图们市' AND city = '延边朝鲜族自治州';
UPDATE biz_region SET code = '222403' WHERE name = '敦化市' AND city = '延边朝鲜族自治州';
UPDATE biz_region SET code = '222404' WHERE name = '珲春市' AND city = '延边朝鲜族自治州';
UPDATE biz_region SET code = '222405' WHERE name = '龙井市' AND city = '延边朝鲜族自治州';
UPDATE biz_region SET code = '222406' WHERE name = '和龙市' AND city = '延边朝鲜族自治州';
UPDATE biz_region SET code = '222424' WHERE name = '汪清县' AND city = '延边朝鲜族自治州';
UPDATE biz_region SET code = '222426' WHERE name = '安图县' AND city = '延边朝鲜族自治州';

-- 开封市
--------------------------------------------------
UPDATE biz_region SET code = '410202' WHERE name = '龙亭区' AND city = '开封市';
UPDATE biz_region SET code = '410203' WHERE name = '顺河回族区' AND city = '开封市';
UPDATE biz_region SET code = '410204' WHERE name = '鼓楼区' AND city = '开封市';
UPDATE biz_region SET code = '410205' WHERE name = '禹王台区' AND city = '开封市';
UPDATE biz_region SET code = '410212' WHERE name = '祥符区' AND city = '开封市';
UPDATE biz_region SET code = '410221' WHERE name = '杞县' AND city = '开封市';
UPDATE biz_region SET code = '410222' WHERE name = '通许县' AND city = '开封市';
UPDATE biz_region SET code = '410223' WHERE name = '尉氏县' AND city = '开封市';
UPDATE biz_region SET code = '410225' WHERE name = '兰考县' AND city = '开封市';

-- 张家口市
--------------------------------------------------
UPDATE biz_region SET code = '130702' WHERE name = '桥东区' AND city = '张家口市';
UPDATE biz_region SET code = '130104' WHERE name = '桥西区' AND city = '张家口市';
UPDATE biz_region SET code = '130705' WHERE name = '宣化区' AND city = '张家口市';
UPDATE biz_region SET code = '130706' WHERE name = '下花园区' AND city = '张家口市';
UPDATE biz_region SET code = '130708' WHERE name = '万全区' AND city = '张家口市';
UPDATE biz_region SET code = '130709' WHERE name = '崇礼区' AND city = '张家口市';
UPDATE biz_region SET code = '130722' WHERE name = '张北县' AND city = '张家口市';
UPDATE biz_region SET code = '130723' WHERE name = '康保县' AND city = '张家口市';
UPDATE biz_region SET code = '130724' WHERE name = '沽源县' AND city = '张家口市';
UPDATE biz_region SET code = '130725' WHERE name = '尚义县' AND city = '张家口市';
UPDATE biz_region SET code = '130726' WHERE name = '蔚县' AND city = '张家口市';
UPDATE biz_region SET code = '130727' WHERE name = '阳原县' AND city = '张家口市';
UPDATE biz_region SET code = '130728' WHERE name = '怀安县' AND city = '张家口市';
UPDATE biz_region SET code = '130730' WHERE name = '怀来县' AND city = '张家口市';
UPDATE biz_region SET code = '130731' WHERE name = '涿鹿县' AND city = '张家口市';
UPDATE biz_region SET code = '130732' WHERE name = '赤城县' AND city = '张家口市';
UPDATE biz_region SET code = '130771' WHERE name = '张家口经济开发区' AND city = '张家口市';
UPDATE biz_region SET code = '130772' WHERE name = '张家口市察北管理区' AND city = '张家口市';
UPDATE biz_region SET code = '130773' WHERE name = '张家口市塞北管理区' AND city = '张家口市';

-- 张家界市
--------------------------------------------------
UPDATE biz_region SET code = '430802' WHERE name = '永定区' AND city = '张家界市';
UPDATE biz_region SET code = '430811' WHERE name = '武陵源区' AND city = '张家界市';
UPDATE biz_region SET code = '430821' WHERE name = '慈利县' AND city = '张家界市';
UPDATE biz_region SET code = '430822' WHERE name = '桑植县' AND city = '张家界市';

-- 张掖市
--------------------------------------------------
UPDATE biz_region SET code = '620702' WHERE name = '甘州区' AND city = '张掖市';
UPDATE biz_region SET code = '620721' WHERE name = '肃南裕固族自治县' AND city = '张掖市';
UPDATE biz_region SET code = '620722' WHERE name = '民乐县' AND city = '张掖市';
UPDATE biz_region SET code = '620723' WHERE name = '临泽县' AND city = '张掖市';
UPDATE biz_region SET code = '620724' WHERE name = '高台县' AND city = '张掖市';
UPDATE biz_region SET code = '620725' WHERE name = '山丹县' AND city = '张掖市';

-- 徐州市
--------------------------------------------------
UPDATE biz_region SET code = '320302' WHERE name = '鼓楼区' AND city = '徐州市';
UPDATE biz_region SET code = '320303' WHERE name = '云龙区' AND city = '徐州市';
UPDATE biz_region SET code = '320305' WHERE name = '贾汪区' AND city = '徐州市';
UPDATE biz_region SET code = '320311' WHERE name = '泉山区' AND city = '徐州市';
UPDATE biz_region SET code = '320312' WHERE name = '铜山区' AND city = '徐州市';
UPDATE biz_region SET code = '320321' WHERE name = '丰县' AND city = '徐州市';
UPDATE biz_region SET code = '320322' WHERE name = '沛县' AND city = '徐州市';
UPDATE biz_region SET code = '320324' WHERE name = '睢宁县' AND city = '徐州市';
UPDATE biz_region SET code = '320371' WHERE name = '徐州经济技术开发区' AND city = '徐州市';
UPDATE biz_region SET code = '320381' WHERE name = '新沂市' AND city = '徐州市';
UPDATE biz_region SET code = '320382' WHERE name = '邳州市' AND city = '徐州市';

-- 德宏傣族景颇族自治州
--------------------------------------------------
UPDATE biz_region SET code = '533102' WHERE name = '瑞丽市' AND city = '德宏傣族景颇族自治州';
UPDATE biz_region SET code = '533103' WHERE name = '芒市' AND city = '德宏傣族景颇族自治州';
UPDATE biz_region SET code = '533122' WHERE name = '梁河县' AND city = '德宏傣族景颇族自治州';
UPDATE biz_region SET code = '533123' WHERE name = '盈江县' AND city = '德宏傣族景颇族自治州';
UPDATE biz_region SET code = '533124' WHERE name = '陇川县' AND city = '德宏傣族景颇族自治州';

-- 德州市
--------------------------------------------------
UPDATE biz_region SET code = '371402' WHERE name = '德城区' AND city = '德州市';
UPDATE biz_region SET code = '371403' WHERE name = '陵城区' AND city = '德州市';
UPDATE biz_region SET code = '371422' WHERE name = '宁津县' AND city = '德州市';
UPDATE biz_region SET code = '371423' WHERE name = '庆云县' AND city = '德州市';
UPDATE biz_region SET code = '371424' WHERE name = '临邑县' AND city = '德州市';
UPDATE biz_region SET code = '371425' WHERE name = '齐河县' AND city = '德州市';
UPDATE biz_region SET code = '371426' WHERE name = '平原县' AND city = '德州市';
UPDATE biz_region SET code = '371427' WHERE name = '夏津县' AND city = '德州市';
UPDATE biz_region SET code = '371428' WHERE name = '武城县' AND city = '德州市';
UPDATE biz_region SET code = '371471' WHERE name = '德州经济技术开发区' AND city = '德州市';
UPDATE biz_region SET code = '371472' WHERE name = '德州运河经济开发区' AND city = '德州市';
UPDATE biz_region SET code = '371481' WHERE name = '乐陵市' AND city = '德州市';
UPDATE biz_region SET code = '371482' WHERE name = '禹城市' AND city = '德州市';

-- 德阳市
--------------------------------------------------
UPDATE biz_region SET code = '510603' WHERE name = '旌阳区' AND city = '德阳市';
UPDATE biz_region SET code = '510604' WHERE name = '罗江区' AND city = '德阳市';
UPDATE biz_region SET code = '510623' WHERE name = '中江县' AND city = '德阳市';
UPDATE biz_region SET code = '510681' WHERE name = '广汉市' AND city = '德阳市';
UPDATE biz_region SET code = '510682' WHERE name = '什邡市' AND city = '德阳市';
UPDATE biz_region SET code = '510683' WHERE name = '绵竹市' AND city = '德阳市';

-- 忻州市
--------------------------------------------------
UPDATE biz_region SET code = '140902' WHERE name = '忻府区' AND city = '忻州市';
UPDATE biz_region SET code = '140921' WHERE name = '定襄县' AND city = '忻州市';
UPDATE biz_region SET code = '140922' WHERE name = '五台县' AND city = '忻州市';
UPDATE biz_region SET code = '140923' WHERE name = '代县' AND city = '忻州市';
UPDATE biz_region SET code = '140924' WHERE name = '繁峙县' AND city = '忻州市';
UPDATE biz_region SET code = '140925' WHERE name = '宁武县' AND city = '忻州市';
UPDATE biz_region SET code = '140926' WHERE name = '静乐县' AND city = '忻州市';
UPDATE biz_region SET code = '140927' WHERE name = '神池县' AND city = '忻州市';
UPDATE biz_region SET code = '140928' WHERE name = '五寨县' AND city = '忻州市';
UPDATE biz_region SET code = '140929' WHERE name = '岢岚县' AND city = '忻州市';
UPDATE biz_region SET code = '140930' WHERE name = '河曲县' AND city = '忻州市';
UPDATE biz_region SET code = '140931' WHERE name = '保德县' AND city = '忻州市';
UPDATE biz_region SET code = '140932' WHERE name = '偏关县' AND city = '忻州市';
UPDATE biz_region SET code = '140971' WHERE name = '五台山风景名胜区' AND city = '忻州市';
UPDATE biz_region SET code = '140981' WHERE name = '原平市' AND city = '忻州市';

-- 怀化市
--------------------------------------------------
UPDATE biz_region SET code = '431202' WHERE name = '鹤城区' AND city = '怀化市';
UPDATE biz_region SET code = '431221' WHERE name = '中方县' AND city = '怀化市';
UPDATE biz_region SET code = '431222' WHERE name = '沅陵县' AND city = '怀化市';
UPDATE biz_region SET code = '431223' WHERE name = '辰溪县' AND city = '怀化市';
UPDATE biz_region SET code = '431224' WHERE name = '溆浦县' AND city = '怀化市';
UPDATE biz_region SET code = '431225' WHERE name = '会同县' AND city = '怀化市';
UPDATE biz_region SET code = '431226' WHERE name = '麻阳苗族自治县' AND city = '怀化市';
UPDATE biz_region SET code = '431227' WHERE name = '新晃侗族自治县' AND city = '怀化市';
UPDATE biz_region SET code = '431228' WHERE name = '芷江侗族自治县' AND city = '怀化市';
UPDATE biz_region SET code = '431229' WHERE name = '靖州苗族侗族自治县' AND city = '怀化市';
UPDATE biz_region SET code = '431230' WHERE name = '通道侗族自治县' AND city = '怀化市';
UPDATE biz_region SET code = '431271' WHERE name = '怀化市洪江管理区' AND city = '怀化市';
UPDATE biz_region SET code = '431281' WHERE name = '洪江市' AND city = '怀化市';

-- 怒江傈僳族自治州
--------------------------------------------------
UPDATE biz_region SET code = '533301' WHERE name = '泸水市' AND city = '怒江傈僳族自治州';
UPDATE biz_region SET code = '533323' WHERE name = '福贡县' AND city = '怒江傈僳族自治州';
UPDATE biz_region SET code = '533324' WHERE name = '贡山独龙族怒族自治县' AND city = '怒江傈僳族自治州';
UPDATE biz_region SET code = '533325' WHERE name = '兰坪白族普米族自治县' AND city = '怒江傈僳族自治州';

-- 恩施土家族苗族自治州
--------------------------------------------------
UPDATE biz_region SET code = '422801' WHERE name = '恩施市' AND city = '恩施土家族苗族自治州';
UPDATE biz_region SET code = '422802' WHERE name = '利川市' AND city = '恩施土家族苗族自治州';
UPDATE biz_region SET code = '422822' WHERE name = '建始县' AND city = '恩施土家族苗族自治州';
UPDATE biz_region SET code = '422823' WHERE name = '巴东县' AND city = '恩施土家族苗族自治州';
UPDATE biz_region SET code = '422825' WHERE name = '宣恩县' AND city = '恩施土家族苗族自治州';
UPDATE biz_region SET code = '422826' WHERE name = '咸丰县' AND city = '恩施土家族苗族自治州';
UPDATE biz_region SET code = '422827' WHERE name = '来凤县' AND city = '恩施土家族苗族自治州';
UPDATE biz_region SET code = '422828' WHERE name = '鹤峰县' AND city = '恩施土家族苗族自治州';

-- 惠州市
--------------------------------------------------
UPDATE biz_region SET code = '441302' WHERE name = '惠城区' AND city = '惠州市';
UPDATE biz_region SET code = '441303' WHERE name = '惠阳区' AND city = '惠州市';
UPDATE biz_region SET code = '441322' WHERE name = '博罗县' AND city = '惠州市';
UPDATE biz_region SET code = '441323' WHERE name = '惠东县' AND city = '惠州市';
UPDATE biz_region SET code = '441324' WHERE name = '龙门县' AND city = '惠州市';

-- 成都市
--------------------------------------------------
UPDATE biz_region SET code = '510104' WHERE name = '锦江区' AND city = '成都市';
UPDATE biz_region SET code = '510105' WHERE name = '青羊区' AND city = '成都市';
UPDATE biz_region SET code = '510106' WHERE name = '金牛区' AND city = '成都市';
UPDATE biz_region SET code = '510107' WHERE name = '武侯区' AND city = '成都市';
UPDATE biz_region SET code = '510108' WHERE name = '成华区' AND city = '成都市';
UPDATE biz_region SET code = '510112' WHERE name = '龙泉驿区' AND city = '成都市';
UPDATE biz_region SET code = '510113' WHERE name = '青白江区' AND city = '成都市';
UPDATE biz_region SET code = '510114' WHERE name = '新都区' AND city = '成都市';
UPDATE biz_region SET code = '510115' WHERE name = '温江区' AND city = '成都市';
UPDATE biz_region SET code = '510116' WHERE name = '双流区' AND city = '成都市';
UPDATE biz_region SET code = '510117' WHERE name = '郫都区' AND city = '成都市';
UPDATE biz_region SET code = '510118' WHERE name = '新津区' AND city = '成都市';
UPDATE biz_region SET code = '510121' WHERE name = '金堂县' AND city = '成都市';
UPDATE biz_region SET code = '510129' WHERE name = '大邑县' AND city = '成都市';
UPDATE biz_region SET code = '510131' WHERE name = '蒲江县' AND city = '成都市';
UPDATE biz_region SET code = '510181' WHERE name = '都江堰市' AND city = '成都市';
UPDATE biz_region SET code = '510182' WHERE name = '彭州市' AND city = '成都市';
UPDATE biz_region SET code = '510183' WHERE name = '邛崃市' AND city = '成都市';
UPDATE biz_region SET code = '510184' WHERE name = '崇州市' AND city = '成都市';
UPDATE biz_region SET code = '510185' WHERE name = '简阳市' AND city = '成都市';

-- 扬州市
--------------------------------------------------
UPDATE biz_region SET code = '321002' WHERE name = '广陵区' AND city = '扬州市';
UPDATE biz_region SET code = '321003' WHERE name = '邗江区' AND city = '扬州市';
UPDATE biz_region SET code = '321012' WHERE name = '江都区' AND city = '扬州市';
UPDATE biz_region SET code = '321023' WHERE name = '宝应县' AND city = '扬州市';
UPDATE biz_region SET code = '321071' WHERE name = '扬州经济技术开发区' AND city = '扬州市';
UPDATE biz_region SET code = '321081' WHERE name = '仪征市' AND city = '扬州市';
UPDATE biz_region SET code = '321084' WHERE name = '高邮市' AND city = '扬州市';

-- 承德市
--------------------------------------------------
UPDATE biz_region SET code = '130802' WHERE name = '双桥区' AND city = '承德市';
UPDATE biz_region SET code = '130803' WHERE name = '双滦区' AND city = '承德市';
UPDATE biz_region SET code = '130804' WHERE name = '鹰手营子矿区' AND city = '承德市';
UPDATE biz_region SET code = '130821' WHERE name = '承德县' AND city = '承德市';
UPDATE biz_region SET code = '130822' WHERE name = '兴隆县' AND city = '承德市';
UPDATE biz_region SET code = '130824' WHERE name = '滦平县' AND city = '承德市';
UPDATE biz_region SET code = '130825' WHERE name = '隆化县' AND city = '承德市';
UPDATE biz_region SET code = '130826' WHERE name = '丰宁满族自治县' AND city = '承德市';
UPDATE biz_region SET code = '130827' WHERE name = '宽城满族自治县' AND city = '承德市';
UPDATE biz_region SET code = '130828' WHERE name = '围场满族蒙古族自治县' AND city = '承德市';
UPDATE biz_region SET code = '130871' WHERE name = '承德高新技术产业开发区' AND city = '承德市';
UPDATE biz_region SET code = '130881' WHERE name = '平泉市' AND city = '承德市';

-- 抚州市
--------------------------------------------------
UPDATE biz_region SET code = '361002' WHERE name = '临川区' AND city = '抚州市';
UPDATE biz_region SET code = '361003' WHERE name = '东乡区' AND city = '抚州市';
UPDATE biz_region SET code = '361021' WHERE name = '南城县' AND city = '抚州市';
UPDATE biz_region SET code = '361022' WHERE name = '黎川县' AND city = '抚州市';
UPDATE biz_region SET code = '361023' WHERE name = '南丰县' AND city = '抚州市';
UPDATE biz_region SET code = '361024' WHERE name = '崇仁县' AND city = '抚州市';
UPDATE biz_region SET code = '361025' WHERE name = '乐安县' AND city = '抚州市';
UPDATE biz_region SET code = '361026' WHERE name = '宜黄县' AND city = '抚州市';
UPDATE biz_region SET code = '361027' WHERE name = '金溪县' AND city = '抚州市';
UPDATE biz_region SET code = '361028' WHERE name = '资溪县' AND city = '抚州市';
UPDATE biz_region SET code = '361030' WHERE name = '广昌县' AND city = '抚州市';

-- 抚顺市
--------------------------------------------------
UPDATE biz_region SET code = '210402' WHERE name = '新抚区' AND city = '抚顺市';
UPDATE biz_region SET code = '210403' WHERE name = '东洲区' AND city = '抚顺市';
UPDATE biz_region SET code = '210404' WHERE name = '望花区' AND city = '抚顺市';
UPDATE biz_region SET code = '210411' WHERE name = '顺城区' AND city = '抚顺市';
UPDATE biz_region SET code = '210421' WHERE name = '抚顺县' AND city = '抚顺市';
UPDATE biz_region SET code = '210422' WHERE name = '新宾满族自治县' AND city = '抚顺市';
UPDATE biz_region SET code = '210423' WHERE name = '清原满族自治县' AND city = '抚顺市';

-- 拉萨市
--------------------------------------------------
UPDATE biz_region SET code = '540102' WHERE name = '城关区' AND city = '拉萨市';
UPDATE biz_region SET code = '540103' WHERE name = '堆龙德庆区' AND city = '拉萨市';
UPDATE biz_region SET code = '540104' WHERE name = '达孜区' AND city = '拉萨市';
UPDATE biz_region SET code = '540121' WHERE name = '林周县' AND city = '拉萨市';
UPDATE biz_region SET code = '540122' WHERE name = '当雄县' AND city = '拉萨市';
UPDATE biz_region SET code = '540123' WHERE name = '尼木县' AND city = '拉萨市';
UPDATE biz_region SET code = '540124' WHERE name = '曲水县' AND city = '拉萨市';
UPDATE biz_region SET code = '540127' WHERE name = '墨竹工卡县' AND city = '拉萨市';
UPDATE biz_region SET code = '540171' WHERE name = '格尔木藏青工业园区' AND city = '拉萨市';
UPDATE biz_region SET code = '540172' WHERE name = '拉萨经济技术开发区' AND city = '拉萨市';
UPDATE biz_region SET code = '540173' WHERE name = '西藏文化旅游创意园区' AND city = '拉萨市';
UPDATE biz_region SET code = '540174' WHERE name = '达孜工业园区' AND city = '拉萨市';

-- 揭阳市
--------------------------------------------------
UPDATE biz_region SET code = '445202' WHERE name = '榕城区' AND city = '揭阳市';
UPDATE biz_region SET code = '445203' WHERE name = '揭东区' AND city = '揭阳市';
UPDATE biz_region SET code = '445222' WHERE name = '揭西县' AND city = '揭阳市';
UPDATE biz_region SET code = '445224' WHERE name = '惠来县' AND city = '揭阳市';
UPDATE biz_region SET code = '445281' WHERE name = '普宁市' AND city = '揭阳市';

-- 攀枝花市
--------------------------------------------------
UPDATE biz_region SET code = '510402' WHERE name = '东区' AND city = '攀枝花市';
UPDATE biz_region SET code = '510403' WHERE name = '西区' AND city = '攀枝花市';
UPDATE biz_region SET code = '510411' WHERE name = '仁和区' AND city = '攀枝花市';
UPDATE biz_region SET code = '510421' WHERE name = '米易县' AND city = '攀枝花市';
UPDATE biz_region SET code = '510422' WHERE name = '盐边县' AND city = '攀枝花市';

-- 文山壮族苗族自治州
--------------------------------------------------
UPDATE biz_region SET code = '532601' WHERE name = '文山市' AND city = '文山壮族苗族自治州';
UPDATE biz_region SET code = '532622' WHERE name = '砚山县' AND city = '文山壮族苗族自治州';
UPDATE biz_region SET code = '532623' WHERE name = '西畴县' AND city = '文山壮族苗族自治州';
UPDATE biz_region SET code = '532624' WHERE name = '麻栗坡县' AND city = '文山壮族苗族自治州';
UPDATE biz_region SET code = '532625' WHERE name = '马关县' AND city = '文山壮族苗族自治州';
UPDATE biz_region SET code = '532626' WHERE name = '丘北县' AND city = '文山壮族苗族自治州';
UPDATE biz_region SET code = '532627' WHERE name = '广南县' AND city = '文山壮族苗族自治州';
UPDATE biz_region SET code = '532628' WHERE name = '富宁县' AND city = '文山壮族苗族自治州';

-- 新乡市
--------------------------------------------------
UPDATE biz_region SET code = '410702' WHERE name = '红旗区' AND city = '新乡市';
UPDATE biz_region SET code = '410703' WHERE name = '卫滨区' AND city = '新乡市';
UPDATE biz_region SET code = '410704' WHERE name = '凤泉区' AND city = '新乡市';
UPDATE biz_region SET code = '410711' WHERE name = '牧野区' AND city = '新乡市';
UPDATE biz_region SET code = '410721' WHERE name = '新乡县' AND city = '新乡市';
UPDATE biz_region SET code = '410724' WHERE name = '获嘉县' AND city = '新乡市';
UPDATE biz_region SET code = '410725' WHERE name = '原阳县' AND city = '新乡市';
UPDATE biz_region SET code = '410726' WHERE name = '延津县' AND city = '新乡市';
UPDATE biz_region SET code = '410727' WHERE name = '封丘县' AND city = '新乡市';
UPDATE biz_region SET code = '410771' WHERE name = '新乡高新技术产业开发区' AND city = '新乡市';
UPDATE biz_region SET code = '410772' WHERE name = '新乡经济技术开发区' AND city = '新乡市';
UPDATE biz_region SET code = '410773' WHERE name = '新乡市平原城乡一体化示范区' AND city = '新乡市';
UPDATE biz_region SET code = '410781' WHERE name = '卫辉市' AND city = '新乡市';
UPDATE biz_region SET code = '410782' WHERE name = '辉县市' AND city = '新乡市';
UPDATE biz_region SET code = '410783' WHERE name = '长垣市' AND city = '新乡市';

-- 新余市
--------------------------------------------------
UPDATE biz_region SET code = '360502' WHERE name = '渝水区' AND city = '新余市';
UPDATE biz_region SET code = '360521' WHERE name = '分宜县' AND city = '新余市';

-- 新疆维吾尔自治区-自治区直辖县级行政区划
--------------------------------------------------
UPDATE biz_region SET code = '659001' WHERE name = '石河子市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659002' WHERE name = '阿拉尔市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659003' WHERE name = '图木舒克市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659004' WHERE name = '五家渠市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659005' WHERE name = '北屯市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659006' WHERE name = '铁门关市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659007' WHERE name = '双河市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659008' WHERE name = '可克达拉市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659009' WHERE name = '昆玉市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659010' WHERE name = '胡杨河市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';
UPDATE biz_region SET code = '659011' WHERE name = '新星市' AND city = '新疆维吾尔自治区-自治区直辖县级行政区划';

-- 无锡市
--------------------------------------------------
UPDATE biz_region SET code = '320205' WHERE name = '锡山区' AND city = '无锡市';
UPDATE biz_region SET code = '320206' WHERE name = '惠山区' AND city = '无锡市';
UPDATE biz_region SET code = '320211' WHERE name = '滨湖区' AND city = '无锡市';
UPDATE biz_region SET code = '320213' WHERE name = '梁溪区' AND city = '无锡市';
UPDATE biz_region SET code = '320214' WHERE name = '新吴区' AND city = '无锡市';
UPDATE biz_region SET code = '320281' WHERE name = '江阴市' AND city = '无锡市';
UPDATE biz_region SET code = '320282' WHERE name = '宜兴市' AND city = '无锡市';

-- 日喀则市
--------------------------------------------------
UPDATE biz_region SET code = '540202' WHERE name = '桑珠孜区' AND city = '日喀则市';
UPDATE biz_region SET code = '540221' WHERE name = '南木林县' AND city = '日喀则市';
UPDATE biz_region SET code = '540222' WHERE name = '江孜县' AND city = '日喀则市';
UPDATE biz_region SET code = '540223' WHERE name = '定日县' AND city = '日喀则市';
UPDATE biz_region SET code = '540224' WHERE name = '萨迦县' AND city = '日喀则市';
UPDATE biz_region SET code = '540225' WHERE name = '拉孜县' AND city = '日喀则市';
UPDATE biz_region SET code = '540226' WHERE name = '昂仁县' AND city = '日喀则市';
UPDATE biz_region SET code = '540227' WHERE name = '谢通门县' AND city = '日喀则市';
UPDATE biz_region SET code = '540228' WHERE name = '白朗县' AND city = '日喀则市';
UPDATE biz_region SET code = '540229' WHERE name = '仁布县' AND city = '日喀则市';
UPDATE biz_region SET code = '540230' WHERE name = '康马县' AND city = '日喀则市';
UPDATE biz_region SET code = '540231' WHERE name = '定结县' AND city = '日喀则市';
UPDATE biz_region SET code = '540232' WHERE name = '仲巴县' AND city = '日喀则市';
UPDATE biz_region SET code = '540233' WHERE name = '亚东县' AND city = '日喀则市';
UPDATE biz_region SET code = '540234' WHERE name = '吉隆县' AND city = '日喀则市';
UPDATE biz_region SET code = '540235' WHERE name = '聂拉木县' AND city = '日喀则市';
UPDATE biz_region SET code = '540236' WHERE name = '萨嘎县' AND city = '日喀则市';
UPDATE biz_region SET code = '540237' WHERE name = '岗巴县' AND city = '日喀则市';

-- 日照市
--------------------------------------------------
UPDATE biz_region SET code = '371102' WHERE name = '东港区' AND city = '日照市';
UPDATE biz_region SET code = '371103' WHERE name = '岚山区' AND city = '日照市';
UPDATE biz_region SET code = '371121' WHERE name = '五莲县' AND city = '日照市';
UPDATE biz_region SET code = '371122' WHERE name = '莒县' AND city = '日照市';
UPDATE biz_region SET code = '371171' WHERE name = '日照经济技术开发区' AND city = '日照市';

-- 昆明市
--------------------------------------------------
UPDATE biz_region SET code = '530102' WHERE name = '五华区' AND city = '昆明市';
UPDATE biz_region SET code = '530103' WHERE name = '盘龙区' AND city = '昆明市';
UPDATE biz_region SET code = '530111' WHERE name = '官渡区' AND city = '昆明市';
UPDATE biz_region SET code = '530112' WHERE name = '西山区' AND city = '昆明市';
UPDATE biz_region SET code = '530113' WHERE name = '东川区' AND city = '昆明市';
UPDATE biz_region SET code = '530114' WHERE name = '呈贡区' AND city = '昆明市';
UPDATE biz_region SET code = '530115' WHERE name = '晋宁区' AND city = '昆明市';
UPDATE biz_region SET code = '530124' WHERE name = '富民县' AND city = '昆明市';
UPDATE biz_region SET code = '530125' WHERE name = '宜良县' AND city = '昆明市';
UPDATE biz_region SET code = '530126' WHERE name = '石林彝族自治县' AND city = '昆明市';
UPDATE biz_region SET code = '530127' WHERE name = '嵩明县' AND city = '昆明市';
UPDATE biz_region SET code = '530128' WHERE name = '禄劝彝族苗族自治县' AND city = '昆明市';
UPDATE biz_region SET code = '530129' WHERE name = '寻甸回族彝族自治县' AND city = '昆明市';
UPDATE biz_region SET code = '530181' WHERE name = '安宁市' AND city = '昆明市';

-- 昌吉回族自治州
--------------------------------------------------
UPDATE biz_region SET code = '652301' WHERE name = '昌吉市' AND city = '昌吉回族自治州';
UPDATE biz_region SET code = '652302' WHERE name = '阜康市' AND city = '昌吉回族自治州';
UPDATE biz_region SET code = '652323' WHERE name = '呼图壁县' AND city = '昌吉回族自治州';
UPDATE biz_region SET code = '652324' WHERE name = '玛纳斯县' AND city = '昌吉回族自治州';
UPDATE biz_region SET code = '652325' WHERE name = '奇台县' AND city = '昌吉回族自治州';
UPDATE biz_region SET code = '652327' WHERE name = '吉木萨尔县' AND city = '昌吉回族自治州';
UPDATE biz_region SET code = '652328' WHERE name = '木垒哈萨克自治县' AND city = '昌吉回族自治州';

-- 昌都市
--------------------------------------------------
UPDATE biz_region SET code = '540302' WHERE name = '卡若区' AND city = '昌都市';
UPDATE biz_region SET code = '540321' WHERE name = '江达县' AND city = '昌都市';
UPDATE biz_region SET code = '540322' WHERE name = '贡觉县' AND city = '昌都市';
UPDATE biz_region SET code = '540323' WHERE name = '类乌齐县' AND city = '昌都市';
UPDATE biz_region SET code = '540324' WHERE name = '丁青县' AND city = '昌都市';
UPDATE biz_region SET code = '540325' WHERE name = '察雅县' AND city = '昌都市';
UPDATE biz_region SET code = '540326' WHERE name = '八宿县' AND city = '昌都市';
UPDATE biz_region SET code = '540327' WHERE name = '左贡县' AND city = '昌都市';
UPDATE biz_region SET code = '540328' WHERE name = '芒康县' AND city = '昌都市';
UPDATE biz_region SET code = '540329' WHERE name = '洛隆县' AND city = '昌都市';
UPDATE biz_region SET code = '540330' WHERE name = '边坝县' AND city = '昌都市';

-- 昭通市
--------------------------------------------------
UPDATE biz_region SET code = '530602' WHERE name = '昭阳区' AND city = '昭通市';
UPDATE biz_region SET code = '530621' WHERE name = '鲁甸县' AND city = '昭通市';
UPDATE biz_region SET code = '530622' WHERE name = '巧家县' AND city = '昭通市';
UPDATE biz_region SET code = '530623' WHERE name = '盐津县' AND city = '昭通市';
UPDATE biz_region SET code = '530624' WHERE name = '大关县' AND city = '昭通市';
UPDATE biz_region SET code = '530625' WHERE name = '永善县' AND city = '昭通市';
UPDATE biz_region SET code = '530626' WHERE name = '绥江县' AND city = '昭通市';
UPDATE biz_region SET code = '530627' WHERE name = '镇雄县' AND city = '昭通市';
UPDATE biz_region SET code = '530628' WHERE name = '彝良县' AND city = '昭通市';
UPDATE biz_region SET code = '530629' WHERE name = '威信县' AND city = '昭通市';
UPDATE biz_region SET code = '530681' WHERE name = '水富市' AND city = '昭通市';

-- 晋中市
--------------------------------------------------
UPDATE biz_region SET code = '140702' WHERE name = '榆次区' AND city = '晋中市';
UPDATE biz_region SET code = '140703' WHERE name = '太谷区' AND city = '晋中市';
UPDATE biz_region SET code = '140721' WHERE name = '榆社县' AND city = '晋中市';
UPDATE biz_region SET code = '140722' WHERE name = '左权县' AND city = '晋中市';
UPDATE biz_region SET code = '140723' WHERE name = '和顺县' AND city = '晋中市';
UPDATE biz_region SET code = '140724' WHERE name = '昔阳县' AND city = '晋中市';
UPDATE biz_region SET code = '140725' WHERE name = '寿阳县' AND city = '晋中市';
UPDATE biz_region SET code = '140727' WHERE name = '祁县' AND city = '晋中市';
UPDATE biz_region SET code = '140728' WHERE name = '平遥县' AND city = '晋中市';
UPDATE biz_region SET code = '140729' WHERE name = '灵石县' AND city = '晋中市';
UPDATE biz_region SET code = '140781' WHERE name = '介休市' AND city = '晋中市';

-- 晋城市
--------------------------------------------------
UPDATE biz_region SET code = '140302' WHERE name = '城区' AND city = '晋城市';
UPDATE biz_region SET code = '140521' WHERE name = '沁水县' AND city = '晋城市';
UPDATE biz_region SET code = '140522' WHERE name = '阳城县' AND city = '晋城市';
UPDATE biz_region SET code = '140524' WHERE name = '陵川县' AND city = '晋城市';
UPDATE biz_region SET code = '140525' WHERE name = '泽州县' AND city = '晋城市';
UPDATE biz_region SET code = '140581' WHERE name = '高平市' AND city = '晋城市';

-- 普洱市
--------------------------------------------------
UPDATE biz_region SET code = '530802' WHERE name = '思茅区' AND city = '普洱市';
UPDATE biz_region SET code = '530821' WHERE name = '宁洱哈尼族彝族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530822' WHERE name = '墨江哈尼族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530823' WHERE name = '景东彝族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530824' WHERE name = '景谷傣族彝族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530825' WHERE name = '镇沅彝族哈尼族拉祜族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530826' WHERE name = '江城哈尼族彝族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530827' WHERE name = '孟连傣族拉祜族佤族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530828' WHERE name = '澜沧拉祜族自治县' AND city = '普洱市';
UPDATE biz_region SET code = '530829' WHERE name = '西盟佤族自治县' AND city = '普洱市';

-- 景德镇市
--------------------------------------------------
UPDATE biz_region SET code = '360202' WHERE name = '昌江区' AND city = '景德镇市';
UPDATE biz_region SET code = '360203' WHERE name = '珠山区' AND city = '景德镇市';
UPDATE biz_region SET code = '360222' WHERE name = '浮梁县' AND city = '景德镇市';
UPDATE biz_region SET code = '360281' WHERE name = '乐平市' AND city = '景德镇市';

-- 曲靖市
--------------------------------------------------
UPDATE biz_region SET code = '530302' WHERE name = '麒麟区' AND city = '曲靖市';
UPDATE biz_region SET code = '530303' WHERE name = '沾益区' AND city = '曲靖市';
UPDATE biz_region SET code = '530304' WHERE name = '马龙区' AND city = '曲靖市';
UPDATE biz_region SET code = '530322' WHERE name = '陆良县' AND city = '曲靖市';
UPDATE biz_region SET code = '530323' WHERE name = '师宗县' AND city = '曲靖市';
UPDATE biz_region SET code = '530324' WHERE name = '罗平县' AND city = '曲靖市';
UPDATE biz_region SET code = '530325' WHERE name = '富源县' AND city = '曲靖市';
UPDATE biz_region SET code = '530326' WHERE name = '会泽县' AND city = '曲靖市';
UPDATE biz_region SET code = '530381' WHERE name = '宣威市' AND city = '曲靖市';

-- 朔州市
--------------------------------------------------
UPDATE biz_region SET code = '140602' WHERE name = '朔城区' AND city = '朔州市';
UPDATE biz_region SET code = '140603' WHERE name = '平鲁区' AND city = '朔州市';
UPDATE biz_region SET code = '140621' WHERE name = '山阴县' AND city = '朔州市';
UPDATE biz_region SET code = '140622' WHERE name = '应县' AND city = '朔州市';
UPDATE biz_region SET code = '140623' WHERE name = '右玉县' AND city = '朔州市';
UPDATE biz_region SET code = '140671' WHERE name = '山西朔州经济开发区' AND city = '朔州市';
UPDATE biz_region SET code = '140681' WHERE name = '怀仁市' AND city = '朔州市';

-- 朝阳市
--------------------------------------------------
UPDATE biz_region SET code = '211302' WHERE name = '双塔区' AND city = '朝阳市';
UPDATE biz_region SET code = '211303' WHERE name = '龙城区' AND city = '朝阳市';
UPDATE biz_region SET code = '211321' WHERE name = '朝阳县' AND city = '朝阳市';
UPDATE biz_region SET code = '211322' WHERE name = '建平县' AND city = '朝阳市';
UPDATE biz_region SET code = '211324' WHERE name = '喀喇沁左翼蒙古族自治县' AND city = '朝阳市';
UPDATE biz_region SET code = '211381' WHERE name = '北票市' AND city = '朝阳市';
UPDATE biz_region SET code = '211382' WHERE name = '凌源市' AND city = '朝阳市';

-- 本溪市
--------------------------------------------------
UPDATE biz_region SET code = '210502' WHERE name = '平山区' AND city = '本溪市';
UPDATE biz_region SET code = '210503' WHERE name = '溪湖区' AND city = '本溪市';
UPDATE biz_region SET code = '210504' WHERE name = '明山区' AND city = '本溪市';
UPDATE biz_region SET code = '210505' WHERE name = '南芬区' AND city = '本溪市';
UPDATE biz_region SET code = '210521' WHERE name = '本溪满族自治县' AND city = '本溪市';
UPDATE biz_region SET code = '210522' WHERE name = '桓仁满族自治县' AND city = '本溪市';

-- 来宾市
--------------------------------------------------
UPDATE biz_region SET code = '451302' WHERE name = '兴宾区' AND city = '来宾市';
UPDATE biz_region SET code = '451321' WHERE name = '忻城县' AND city = '来宾市';
UPDATE biz_region SET code = '451322' WHERE name = '象州县' AND city = '来宾市';
UPDATE biz_region SET code = '451323' WHERE name = '武宣县' AND city = '来宾市';
UPDATE biz_region SET code = '451324' WHERE name = '金秀瑶族自治县' AND city = '来宾市';
UPDATE biz_region SET code = '451381' WHERE name = '合山市' AND city = '来宾市';

-- 杭州市
--------------------------------------------------
UPDATE biz_region SET code = '330102' WHERE name = '上城区' AND city = '杭州市';
UPDATE biz_region SET code = '330103' WHERE name = '下城区' AND city = '杭州市';
UPDATE biz_region SET code = '330104' WHERE name = '江干区' AND city = '杭州市';
UPDATE biz_region SET code = '330105' WHERE name = '拱墅区' AND city = '杭州市';
UPDATE biz_region SET code = '330106' WHERE name = '西湖区' AND city = '杭州市';
UPDATE biz_region SET code = '330108' WHERE name = '滨江区' AND city = '杭州市';
UPDATE biz_region SET code = '330109' WHERE name = '萧山区' AND city = '杭州市';
UPDATE biz_region SET code = '330110' WHERE name = '余杭区' AND city = '杭州市';
UPDATE biz_region SET code = '330111' WHERE name = '富阳区' AND city = '杭州市';
UPDATE biz_region SET code = '330112' WHERE name = '临安区' AND city = '杭州市';
UPDATE biz_region SET code = '330113' WHERE name = '临平区' AND city = '杭州市';
UPDATE biz_region SET code = '330114' WHERE name = '钱塘区' AND city = '杭州市';
UPDATE biz_region SET code = '330122' WHERE name = '桐庐县' AND city = '杭州市';
UPDATE biz_region SET code = '330127' WHERE name = '淳安县' AND city = '杭州市';
UPDATE biz_region SET code = '330182' WHERE name = '建德市' AND city = '杭州市';

-- 松原市
--------------------------------------------------
UPDATE biz_region SET code = '220702' WHERE name = '宁江区' AND city = '松原市';
UPDATE biz_region SET code = '220721' WHERE name = '前郭尔罗斯蒙古族自治县' AND city = '松原市';
UPDATE biz_region SET code = '220722' WHERE name = '长岭县' AND city = '松原市';
UPDATE biz_region SET code = '220723' WHERE name = '乾安县' AND city = '松原市';
UPDATE biz_region SET code = '220771' WHERE name = '吉林松原经济开发区' AND city = '松原市';
UPDATE biz_region SET code = '220781' WHERE name = '扶余市' AND city = '松原市';

-- 林芝市
--------------------------------------------------
UPDATE biz_region SET code = '540402' WHERE name = '巴宜区' AND city = '林芝市';
UPDATE biz_region SET code = '540421' WHERE name = '工布江达县' AND city = '林芝市';
UPDATE biz_region SET code = '540422' WHERE name = '米林县' AND city = '林芝市';
UPDATE biz_region SET code = '540423' WHERE name = '墨脱县' AND city = '林芝市';
UPDATE biz_region SET code = '540424' WHERE name = '波密县' AND city = '林芝市';
UPDATE biz_region SET code = '540425' WHERE name = '察隅县' AND city = '林芝市';
UPDATE biz_region SET code = '540426' WHERE name = '朗县' AND city = '林芝市';

-- 果洛藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '632621' WHERE name = '玛沁县' AND city = '果洛藏族自治州';
UPDATE biz_region SET code = '632622' WHERE name = '班玛县' AND city = '果洛藏族自治州';
UPDATE biz_region SET code = '632623' WHERE name = '甘德县' AND city = '果洛藏族自治州';
UPDATE biz_region SET code = '632624' WHERE name = '达日县' AND city = '果洛藏族自治州';
UPDATE biz_region SET code = '632625' WHERE name = '久治县' AND city = '果洛藏族自治州';
UPDATE biz_region SET code = '632626' WHERE name = '玛多县' AND city = '果洛藏族自治州';

-- 枣庄市
--------------------------------------------------
UPDATE biz_region SET code = '370402' WHERE name = '市中区' AND city = '枣庄市';
UPDATE biz_region SET code = '370403' WHERE name = '薛城区' AND city = '枣庄市';
UPDATE biz_region SET code = '370404' WHERE name = '峄城区' AND city = '枣庄市';
UPDATE biz_region SET code = '370405' WHERE name = '台儿庄区' AND city = '枣庄市';
UPDATE biz_region SET code = '370406' WHERE name = '山亭区' AND city = '枣庄市';
UPDATE biz_region SET code = '370481' WHERE name = '滕州市' AND city = '枣庄市';

-- 柳州市
--------------------------------------------------
UPDATE biz_region SET code = '450202' WHERE name = '城中区' AND city = '柳州市';
UPDATE biz_region SET code = '450203' WHERE name = '鱼峰区' AND city = '柳州市';
UPDATE biz_region SET code = '450204' WHERE name = '柳南区' AND city = '柳州市';
UPDATE biz_region SET code = '450205' WHERE name = '柳北区' AND city = '柳州市';
UPDATE biz_region SET code = '450206' WHERE name = '柳江区' AND city = '柳州市';
UPDATE biz_region SET code = '450222' WHERE name = '柳城县' AND city = '柳州市';
UPDATE biz_region SET code = '450223' WHERE name = '鹿寨县' AND city = '柳州市';
UPDATE biz_region SET code = '450224' WHERE name = '融安县' AND city = '柳州市';
UPDATE biz_region SET code = '450225' WHERE name = '融水苗族自治县' AND city = '柳州市';
UPDATE biz_region SET code = '450226' WHERE name = '三江侗族自治县' AND city = '柳州市';

-- 株洲市
--------------------------------------------------
UPDATE biz_region SET code = '430202' WHERE name = '荷塘区' AND city = '株洲市';
UPDATE biz_region SET code = '430203' WHERE name = '芦淞区' AND city = '株洲市';
UPDATE biz_region SET code = '430204' WHERE name = '石峰区' AND city = '株洲市';
UPDATE biz_region SET code = '430211' WHERE name = '天元区' AND city = '株洲市';
UPDATE biz_region SET code = '430212' WHERE name = '渌口区' AND city = '株洲市';
UPDATE biz_region SET code = '430223' WHERE name = '攸县' AND city = '株洲市';
UPDATE biz_region SET code = '430224' WHERE name = '茶陵县' AND city = '株洲市';
UPDATE biz_region SET code = '430225' WHERE name = '炎陵县' AND city = '株洲市';
UPDATE biz_region SET code = '430271' WHERE name = '云龙示范区' AND city = '株洲市';
UPDATE biz_region SET code = '430281' WHERE name = '醴陵市' AND city = '株洲市';

-- 桂林市
--------------------------------------------------
UPDATE biz_region SET code = '450302' WHERE name = '秀峰区' AND city = '桂林市';
UPDATE biz_region SET code = '450303' WHERE name = '叠彩区' AND city = '桂林市';
UPDATE biz_region SET code = '450304' WHERE name = '象山区' AND city = '桂林市';
UPDATE biz_region SET code = '450305' WHERE name = '七星区' AND city = '桂林市';
UPDATE biz_region SET code = '450311' WHERE name = '雁山区' AND city = '桂林市';
UPDATE biz_region SET code = '450312' WHERE name = '临桂区' AND city = '桂林市';
UPDATE biz_region SET code = '450321' WHERE name = '阳朔县' AND city = '桂林市';
UPDATE biz_region SET code = '450323' WHERE name = '灵川县' AND city = '桂林市';
UPDATE biz_region SET code = '450324' WHERE name = '全州县' AND city = '桂林市';
UPDATE biz_region SET code = '450325' WHERE name = '兴安县' AND city = '桂林市';
UPDATE biz_region SET code = '450326' WHERE name = '永福县' AND city = '桂林市';
UPDATE biz_region SET code = '450327' WHERE name = '灌阳县' AND city = '桂林市';
UPDATE biz_region SET code = '450328' WHERE name = '龙胜各族自治县' AND city = '桂林市';
UPDATE biz_region SET code = '450329' WHERE name = '资源县' AND city = '桂林市';
UPDATE biz_region SET code = '450330' WHERE name = '平乐县' AND city = '桂林市';
UPDATE biz_region SET code = '450332' WHERE name = '恭城瑶族自治县' AND city = '桂林市';
UPDATE biz_region SET code = '450381' WHERE name = '荔浦市' AND city = '桂林市';

-- 梅州市
--------------------------------------------------
UPDATE biz_region SET code = '441402' WHERE name = '梅江区' AND city = '梅州市';
UPDATE biz_region SET code = '441403' WHERE name = '梅县区' AND city = '梅州市';
UPDATE biz_region SET code = '441422' WHERE name = '大埔县' AND city = '梅州市';
UPDATE biz_region SET code = '441423' WHERE name = '丰顺县' AND city = '梅州市';
UPDATE biz_region SET code = '441424' WHERE name = '五华县' AND city = '梅州市';
UPDATE biz_region SET code = '441426' WHERE name = '平远县' AND city = '梅州市';
UPDATE biz_region SET code = '441427' WHERE name = '蕉岭县' AND city = '梅州市';
UPDATE biz_region SET code = '441481' WHERE name = '兴宁市' AND city = '梅州市';

-- 梧州市
--------------------------------------------------
UPDATE biz_region SET code = '450403' WHERE name = '万秀区' AND city = '梧州市';
UPDATE biz_region SET code = '450405' WHERE name = '长洲区' AND city = '梧州市';
UPDATE biz_region SET code = '450406' WHERE name = '龙圩区' AND city = '梧州市';
UPDATE biz_region SET code = '450421' WHERE name = '苍梧县' AND city = '梧州市';
UPDATE biz_region SET code = '450422' WHERE name = '藤县' AND city = '梧州市';
UPDATE biz_region SET code = '450423' WHERE name = '蒙山县' AND city = '梧州市';
UPDATE biz_region SET code = '450481' WHERE name = '岑溪市' AND city = '梧州市';

-- 楚雄彝族自治州
--------------------------------------------------
UPDATE biz_region SET code = '532301' WHERE name = '楚雄市' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532302' WHERE name = '禄丰市' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532322' WHERE name = '双柏县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532323' WHERE name = '牟定县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532324' WHERE name = '南华县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532325' WHERE name = '姚安县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532326' WHERE name = '大姚县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532327' WHERE name = '永仁县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532328' WHERE name = '元谋县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532329' WHERE name = '武定县' AND city = '楚雄彝族自治州';
UPDATE biz_region SET code = '532331' WHERE name = '禄丰县' AND city = '楚雄彝族自治州';

-- 榆林市
--------------------------------------------------
UPDATE biz_region SET code = '610802' WHERE name = '榆阳区' AND city = '榆林市';
UPDATE biz_region SET code = '610803' WHERE name = '横山区' AND city = '榆林市';
UPDATE biz_region SET code = '610822' WHERE name = '府谷县' AND city = '榆林市';
UPDATE biz_region SET code = '610824' WHERE name = '靖边县' AND city = '榆林市';
UPDATE biz_region SET code = '610825' WHERE name = '定边县' AND city = '榆林市';
UPDATE biz_region SET code = '610826' WHERE name = '绥德县' AND city = '榆林市';
UPDATE biz_region SET code = '610827' WHERE name = '米脂县' AND city = '榆林市';
UPDATE biz_region SET code = '610828' WHERE name = '佳县' AND city = '榆林市';
UPDATE biz_region SET code = '610829' WHERE name = '吴堡县' AND city = '榆林市';
UPDATE biz_region SET code = '610830' WHERE name = '清涧县' AND city = '榆林市';
UPDATE biz_region SET code = '610831' WHERE name = '子洲县' AND city = '榆林市';
UPDATE biz_region SET code = '610881' WHERE name = '神木市' AND city = '榆林市';

-- 武威市
--------------------------------------------------
UPDATE biz_region SET code = '620602' WHERE name = '凉州区' AND city = '武威市';
UPDATE biz_region SET code = '620621' WHERE name = '民勤县' AND city = '武威市';
UPDATE biz_region SET code = '620622' WHERE name = '古浪县' AND city = '武威市';
UPDATE biz_region SET code = '620623' WHERE name = '天祝藏族自治县' AND city = '武威市';

-- 武汉市
--------------------------------------------------
UPDATE biz_region SET code = '420102' WHERE name = '江岸区' AND city = '武汉市';
UPDATE biz_region SET code = '420103' WHERE name = '江汉区' AND city = '武汉市';
UPDATE biz_region SET code = '420104' WHERE name = '硚口区' AND city = '武汉市';
UPDATE biz_region SET code = '420105' WHERE name = '汉阳区' AND city = '武汉市';
UPDATE biz_region SET code = '420106' WHERE name = '武昌区' AND city = '武汉市';
UPDATE biz_region SET code = '420107' WHERE name = '青山区' AND city = '武汉市';
UPDATE biz_region SET code = '420111' WHERE name = '洪山区' AND city = '武汉市';
UPDATE biz_region SET code = '420112' WHERE name = '东西湖区' AND city = '武汉市';
UPDATE biz_region SET code = '420113' WHERE name = '汉南区' AND city = '武汉市';
UPDATE biz_region SET code = '420114' WHERE name = '蔡甸区' AND city = '武汉市';
UPDATE biz_region SET code = '420115' WHERE name = '江夏区' AND city = '武汉市';
UPDATE biz_region SET code = '420116' WHERE name = '黄陂区' AND city = '武汉市';
UPDATE biz_region SET code = '420117' WHERE name = '新洲区' AND city = '武汉市';

-- 毕节市
--------------------------------------------------
UPDATE biz_region SET code = '520502' WHERE name = '七星关区' AND city = '毕节市';
UPDATE biz_region SET code = '520521' WHERE name = '大方县' AND city = '毕节市';
UPDATE biz_region SET code = '520522' WHERE name = '黔西县' AND city = '毕节市';
UPDATE biz_region SET code = '520523' WHERE name = '金沙县' AND city = '毕节市';
UPDATE biz_region SET code = '520524' WHERE name = '织金县' AND city = '毕节市';
UPDATE biz_region SET code = '520525' WHERE name = '纳雍县' AND city = '毕节市';
UPDATE biz_region SET code = '520526' WHERE name = '威宁彝族回族苗族自治县' AND city = '毕节市';
UPDATE biz_region SET code = '520527' WHERE name = '赫章县' AND city = '毕节市';
UPDATE biz_region SET code = '520581' WHERE name = '黔西市' AND city = '毕节市';

-- 永州市
--------------------------------------------------
UPDATE biz_region SET code = '431102' WHERE name = '零陵区' AND city = '永州市';
UPDATE biz_region SET code = '431103' WHERE name = '冷水滩区' AND city = '永州市';
UPDATE biz_region SET code = '431121' WHERE name = '祁阳县' AND city = '永州市';
UPDATE biz_region SET code = '431122' WHERE name = '东安县' AND city = '永州市';
UPDATE biz_region SET code = '431123' WHERE name = '双牌县' AND city = '永州市';
UPDATE biz_region SET code = '431124' WHERE name = '道县' AND city = '永州市';
UPDATE biz_region SET code = '431125' WHERE name = '江永县' AND city = '永州市';
UPDATE biz_region SET code = '431126' WHERE name = '宁远县' AND city = '永州市';
UPDATE biz_region SET code = '431127' WHERE name = '蓝山县' AND city = '永州市';
UPDATE biz_region SET code = '431128' WHERE name = '新田县' AND city = '永州市';
UPDATE biz_region SET code = '431129' WHERE name = '江华瑶族自治县' AND city = '永州市';
UPDATE biz_region SET code = '431171' WHERE name = '永州经济技术开发区' AND city = '永州市';
UPDATE biz_region SET code = '431173' WHERE name = '永州市回龙圩管理区' AND city = '永州市';
UPDATE biz_region SET code = '431181' WHERE name = '祁阳市' AND city = '永州市';

-- 汉中市
--------------------------------------------------
UPDATE biz_region SET code = '610702' WHERE name = '汉台区' AND city = '汉中市';
UPDATE biz_region SET code = '610703' WHERE name = '南郑区' AND city = '汉中市';
UPDATE biz_region SET code = '610722' WHERE name = '城固县' AND city = '汉中市';
UPDATE biz_region SET code = '610723' WHERE name = '洋县' AND city = '汉中市';
UPDATE biz_region SET code = '610724' WHERE name = '西乡县' AND city = '汉中市';
UPDATE biz_region SET code = '610725' WHERE name = '勉县' AND city = '汉中市';
UPDATE biz_region SET code = '610726' WHERE name = '宁强县' AND city = '汉中市';
UPDATE biz_region SET code = '610727' WHERE name = '略阳县' AND city = '汉中市';
UPDATE biz_region SET code = '610728' WHERE name = '镇巴县' AND city = '汉中市';
UPDATE biz_region SET code = '610729' WHERE name = '留坝县' AND city = '汉中市';
UPDATE biz_region SET code = '610730' WHERE name = '佛坪县' AND city = '汉中市';

-- 汕头市
--------------------------------------------------
UPDATE biz_region SET code = '440507' WHERE name = '龙湖区' AND city = '汕头市';
UPDATE biz_region SET code = '440511' WHERE name = '金平区' AND city = '汕头市';
UPDATE biz_region SET code = '440512' WHERE name = '濠江区' AND city = '汕头市';
UPDATE biz_region SET code = '440513' WHERE name = '潮阳区' AND city = '汕头市';
UPDATE biz_region SET code = '440514' WHERE name = '潮南区' AND city = '汕头市';
UPDATE biz_region SET code = '440515' WHERE name = '澄海区' AND city = '汕头市';
UPDATE biz_region SET code = '440523' WHERE name = '南澳县' AND city = '汕头市';

-- 汕尾市
--------------------------------------------------
UPDATE biz_region SET code = '441502' WHERE name = '城区' AND city = '汕尾市';
UPDATE biz_region SET code = '441521' WHERE name = '海丰县' AND city = '汕尾市';
UPDATE biz_region SET code = '441523' WHERE name = '陆河县' AND city = '汕尾市';
UPDATE biz_region SET code = '441581' WHERE name = '陆丰市' AND city = '汕尾市';

-- 江门市
--------------------------------------------------
UPDATE biz_region SET code = '440703' WHERE name = '蓬江区' AND city = '江门市';
UPDATE biz_region SET code = '440704' WHERE name = '江海区' AND city = '江门市';
UPDATE biz_region SET code = '440705' WHERE name = '新会区' AND city = '江门市';
UPDATE biz_region SET code = '440781' WHERE name = '台山市' AND city = '江门市';
UPDATE biz_region SET code = '440783' WHERE name = '开平市' AND city = '江门市';
UPDATE biz_region SET code = '440784' WHERE name = '鹤山市' AND city = '江门市';
UPDATE biz_region SET code = '440785' WHERE name = '恩平市' AND city = '江门市';

-- 池州市
--------------------------------------------------
UPDATE biz_region SET code = '341702' WHERE name = '贵池区' AND city = '池州市';
UPDATE biz_region SET code = '341721' WHERE name = '东至县' AND city = '池州市';
UPDATE biz_region SET code = '341722' WHERE name = '石台县' AND city = '池州市';
UPDATE biz_region SET code = '341723' WHERE name = '青阳县' AND city = '池州市';

-- 沈阳市
--------------------------------------------------
UPDATE biz_region SET code = '120101' WHERE name = '和平区' AND city = '沈阳市';
UPDATE biz_region SET code = '210103' WHERE name = '沈河区' AND city = '沈阳市';
UPDATE biz_region SET code = '210104' WHERE name = '大东区' AND city = '沈阳市';
UPDATE biz_region SET code = '210105' WHERE name = '皇姑区' AND city = '沈阳市';
UPDATE biz_region SET code = '210106' WHERE name = '铁西区' AND city = '沈阳市';
UPDATE biz_region SET code = '210111' WHERE name = '苏家屯区' AND city = '沈阳市';
UPDATE biz_region SET code = '210112' WHERE name = '浑南区' AND city = '沈阳市';
UPDATE biz_region SET code = '210113' WHERE name = '沈北新区' AND city = '沈阳市';
UPDATE biz_region SET code = '210114' WHERE name = '于洪区' AND city = '沈阳市';
UPDATE biz_region SET code = '210115' WHERE name = '辽中区' AND city = '沈阳市';
UPDATE biz_region SET code = '210123' WHERE name = '康平县' AND city = '沈阳市';
UPDATE biz_region SET code = '210124' WHERE name = '法库县' AND city = '沈阳市';
UPDATE biz_region SET code = '210181' WHERE name = '新民市' AND city = '沈阳市';

-- 沧州市
--------------------------------------------------
UPDATE biz_region SET code = '130105' WHERE name = '新华区' AND city = '沧州市';
UPDATE biz_region SET code = '130903' WHERE name = '运河区' AND city = '沧州市';
UPDATE biz_region SET code = '130921' WHERE name = '沧县' AND city = '沧州市';
UPDATE biz_region SET code = '130922' WHERE name = '青县' AND city = '沧州市';
UPDATE biz_region SET code = '130923' WHERE name = '东光县' AND city = '沧州市';
UPDATE biz_region SET code = '130924' WHERE name = '海兴县' AND city = '沧州市';
UPDATE biz_region SET code = '130925' WHERE name = '盐山县' AND city = '沧州市';
UPDATE biz_region SET code = '130926' WHERE name = '肃宁县' AND city = '沧州市';
UPDATE biz_region SET code = '130927' WHERE name = '南皮县' AND city = '沧州市';
UPDATE biz_region SET code = '130928' WHERE name = '吴桥县' AND city = '沧州市';
UPDATE biz_region SET code = '130929' WHERE name = '献县' AND city = '沧州市';
UPDATE biz_region SET code = '130930' WHERE name = '孟村回族自治县' AND city = '沧州市';
UPDATE biz_region SET code = '130971' WHERE name = '河北沧州经济开发区' AND city = '沧州市';
UPDATE biz_region SET code = '130972' WHERE name = '沧州高新技术产业开发区' AND city = '沧州市';
UPDATE biz_region SET code = '130973' WHERE name = '沧州渤海新区' AND city = '沧州市';
UPDATE biz_region SET code = '130981' WHERE name = '泊头市' AND city = '沧州市';
UPDATE biz_region SET code = '130982' WHERE name = '任丘市' AND city = '沧州市';
UPDATE biz_region SET code = '130983' WHERE name = '黄骅市' AND city = '沧州市';
UPDATE biz_region SET code = '130984' WHERE name = '河间市' AND city = '沧州市';

-- 河南省-省直辖县级行政区划
--------------------------------------------------
UPDATE biz_region SET code = '419001' WHERE name = '济源市' AND city = '河南省-省直辖县级行政区划';

-- 河池市
--------------------------------------------------
UPDATE biz_region SET code = '451202' WHERE name = '金城江区' AND city = '河池市';
UPDATE biz_region SET code = '451203' WHERE name = '宜州区' AND city = '河池市';
UPDATE biz_region SET code = '451221' WHERE name = '南丹县' AND city = '河池市';
UPDATE biz_region SET code = '451222' WHERE name = '天峨县' AND city = '河池市';
UPDATE biz_region SET code = '451223' WHERE name = '凤山县' AND city = '河池市';
UPDATE biz_region SET code = '451224' WHERE name = '东兰县' AND city = '河池市';
UPDATE biz_region SET code = '451225' WHERE name = '罗城仫佬族自治县' AND city = '河池市';
UPDATE biz_region SET code = '451226' WHERE name = '环江毛南族自治县' AND city = '河池市';
UPDATE biz_region SET code = '451227' WHERE name = '巴马瑶族自治县' AND city = '河池市';
UPDATE biz_region SET code = '451228' WHERE name = '都安瑶族自治县' AND city = '河池市';
UPDATE biz_region SET code = '451229' WHERE name = '大化瑶族自治县' AND city = '河池市';

-- 河源市
--------------------------------------------------
UPDATE biz_region SET code = '441602' WHERE name = '源城区' AND city = '河源市';
UPDATE biz_region SET code = '441621' WHERE name = '紫金县' AND city = '河源市';
UPDATE biz_region SET code = '441622' WHERE name = '龙川县' AND city = '河源市';
UPDATE biz_region SET code = '441623' WHERE name = '连平县' AND city = '河源市';
UPDATE biz_region SET code = '441624' WHERE name = '和平县' AND city = '河源市';
UPDATE biz_region SET code = '441625' WHERE name = '东源县' AND city = '河源市';

-- 泉州市
--------------------------------------------------
UPDATE biz_region SET code = '350502' WHERE name = '鲤城区' AND city = '泉州市';
UPDATE biz_region SET code = '350503' WHERE name = '丰泽区' AND city = '泉州市';
UPDATE biz_region SET code = '350504' WHERE name = '洛江区' AND city = '泉州市';
UPDATE biz_region SET code = '350505' WHERE name = '泉港区' AND city = '泉州市';
UPDATE biz_region SET code = '350521' WHERE name = '惠安县' AND city = '泉州市';
UPDATE biz_region SET code = '350524' WHERE name = '安溪县' AND city = '泉州市';
UPDATE biz_region SET code = '350525' WHERE name = '永春县' AND city = '泉州市';
UPDATE biz_region SET code = '350526' WHERE name = '德化县' AND city = '泉州市';
UPDATE biz_region SET code = '350527' WHERE name = '金门县' AND city = '泉州市';
UPDATE biz_region SET code = '350581' WHERE name = '石狮市' AND city = '泉州市';
UPDATE biz_region SET code = '350582' WHERE name = '晋江市' AND city = '泉州市';
UPDATE biz_region SET code = '350583' WHERE name = '南安市' AND city = '泉州市';

-- 泰安市
--------------------------------------------------
UPDATE biz_region SET code = '370902' WHERE name = '泰山区' AND city = '泰安市';
UPDATE biz_region SET code = '370911' WHERE name = '岱岳区' AND city = '泰安市';
UPDATE biz_region SET code = '370921' WHERE name = '宁阳县' AND city = '泰安市';
UPDATE biz_region SET code = '370923' WHERE name = '东平县' AND city = '泰安市';
UPDATE biz_region SET code = '370982' WHERE name = '新泰市' AND city = '泰安市';
UPDATE biz_region SET code = '370983' WHERE name = '肥城市' AND city = '泰安市';

-- 泰州市
--------------------------------------------------
UPDATE biz_region SET code = '321202' WHERE name = '海陵区' AND city = '泰州市';
UPDATE biz_region SET code = '321203' WHERE name = '高港区' AND city = '泰州市';
UPDATE biz_region SET code = '321204' WHERE name = '姜堰区' AND city = '泰州市';
UPDATE biz_region SET code = '321271' WHERE name = '泰州医药高新技术产业开发区' AND city = '泰州市';
UPDATE biz_region SET code = '321281' WHERE name = '兴化市' AND city = '泰州市';
UPDATE biz_region SET code = '321282' WHERE name = '靖江市' AND city = '泰州市';
UPDATE biz_region SET code = '321283' WHERE name = '泰兴市' AND city = '泰州市';

-- 泸州市
--------------------------------------------------
UPDATE biz_region SET code = '510502' WHERE name = '江阳区' AND city = '泸州市';
UPDATE biz_region SET code = '510503' WHERE name = '纳溪区' AND city = '泸州市';
UPDATE biz_region SET code = '510504' WHERE name = '龙马潭区' AND city = '泸州市';
UPDATE biz_region SET code = '510521' WHERE name = '泸县' AND city = '泸州市';
UPDATE biz_region SET code = '510522' WHERE name = '合江县' AND city = '泸州市';
UPDATE biz_region SET code = '510524' WHERE name = '叙永县' AND city = '泸州市';
UPDATE biz_region SET code = '510525' WHERE name = '古蔺县' AND city = '泸州市';

-- 洛阳市
--------------------------------------------------
UPDATE biz_region SET code = '410302' WHERE name = '老城区' AND city = '洛阳市';
UPDATE biz_region SET code = '410303' WHERE name = '西工区' AND city = '洛阳市';
UPDATE biz_region SET code = '410304' WHERE name = '瀍河回族区' AND city = '洛阳市';
UPDATE biz_region SET code = '410305' WHERE name = '涧西区' AND city = '洛阳市';
UPDATE biz_region SET code = '410306' WHERE name = '吉利区' AND city = '洛阳市';
UPDATE biz_region SET code = '410307' WHERE name = '偃师区' AND city = '洛阳市';
UPDATE biz_region SET code = '410308' WHERE name = '孟津区' AND city = '洛阳市';
UPDATE biz_region SET code = '410311' WHERE name = '洛龙区' AND city = '洛阳市';
UPDATE biz_region SET code = '410322' WHERE name = '孟津县' AND city = '洛阳市';
UPDATE biz_region SET code = '410323' WHERE name = '新安县' AND city = '洛阳市';
UPDATE biz_region SET code = '410324' WHERE name = '栾川县' AND city = '洛阳市';
UPDATE biz_region SET code = '410325' WHERE name = '嵩县' AND city = '洛阳市';
UPDATE biz_region SET code = '410326' WHERE name = '汝阳县' AND city = '洛阳市';
UPDATE biz_region SET code = '410327' WHERE name = '宜阳县' AND city = '洛阳市';
UPDATE biz_region SET code = '410328' WHERE name = '洛宁县' AND city = '洛阳市';
UPDATE biz_region SET code = '410329' WHERE name = '伊川县' AND city = '洛阳市';
UPDATE biz_region SET code = '410371' WHERE name = '洛阳高新技术产业开发区' AND city = '洛阳市';
UPDATE biz_region SET code = '410381' WHERE name = '偃师市' AND city = '洛阳市';

-- 济南市
--------------------------------------------------
UPDATE biz_region SET code = '370102' WHERE name = '历下区' AND city = '济南市';
UPDATE biz_region SET code = '370103' WHERE name = '市中区' AND city = '济南市';
UPDATE biz_region SET code = '370104' WHERE name = '槐荫区' AND city = '济南市';
UPDATE biz_region SET code = '370105' WHERE name = '天桥区' AND city = '济南市';
UPDATE biz_region SET code = '370112' WHERE name = '历城区' AND city = '济南市';
UPDATE biz_region SET code = '370113' WHERE name = '长清区' AND city = '济南市';
UPDATE biz_region SET code = '370114' WHERE name = '章丘区' AND city = '济南市';
UPDATE biz_region SET code = '370115' WHERE name = '济阳区' AND city = '济南市';
UPDATE biz_region SET code = '370116' WHERE name = '莱芜区' AND city = '济南市';
UPDATE biz_region SET code = '370117' WHERE name = '钢城区' AND city = '济南市';
UPDATE biz_region SET code = '370124' WHERE name = '平阴县' AND city = '济南市';
UPDATE biz_region SET code = '370126' WHERE name = '商河县' AND city = '济南市';
UPDATE biz_region SET code = '370171' WHERE name = '济南高新技术产业开发区' AND city = '济南市';

-- 济宁市
--------------------------------------------------
UPDATE biz_region SET code = '370811' WHERE name = '任城区' AND city = '济宁市';
UPDATE biz_region SET code = '370812' WHERE name = '兖州区' AND city = '济宁市';
UPDATE biz_region SET code = '370826' WHERE name = '微山县' AND city = '济宁市';
UPDATE biz_region SET code = '370827' WHERE name = '鱼台县' AND city = '济宁市';
UPDATE biz_region SET code = '370828' WHERE name = '金乡县' AND city = '济宁市';
UPDATE biz_region SET code = '370829' WHERE name = '嘉祥县' AND city = '济宁市';
UPDATE biz_region SET code = '370830' WHERE name = '汶上县' AND city = '济宁市';
UPDATE biz_region SET code = '370831' WHERE name = '泗水县' AND city = '济宁市';
UPDATE biz_region SET code = '370832' WHERE name = '梁山县' AND city = '济宁市';
UPDATE biz_region SET code = '370871' WHERE name = '济宁高新技术产业开发区' AND city = '济宁市';
UPDATE biz_region SET code = '370881' WHERE name = '曲阜市' AND city = '济宁市';
UPDATE biz_region SET code = '370883' WHERE name = '邹城市' AND city = '济宁市';

-- 海东市
--------------------------------------------------
UPDATE biz_region SET code = '630202' WHERE name = '乐都区' AND city = '海东市';
UPDATE biz_region SET code = '630203' WHERE name = '平安区' AND city = '海东市';
UPDATE biz_region SET code = '630222' WHERE name = '民和回族土族自治县' AND city = '海东市';
UPDATE biz_region SET code = '630223' WHERE name = '互助土族自治县' AND city = '海东市';
UPDATE biz_region SET code = '630224' WHERE name = '化隆回族自治县' AND city = '海东市';
UPDATE biz_region SET code = '630225' WHERE name = '循化撒拉族自治县' AND city = '海东市';

-- 海北藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '632221' WHERE name = '门源回族自治县' AND city = '海北藏族自治州';
UPDATE biz_region SET code = '632222' WHERE name = '祁连县' AND city = '海北藏族自治州';
UPDATE biz_region SET code = '632223' WHERE name = '海晏县' AND city = '海北藏族自治州';
UPDATE biz_region SET code = '632224' WHERE name = '刚察县' AND city = '海北藏族自治州';

-- 海南省-自治区直辖县级行政区划
--------------------------------------------------
UPDATE biz_region SET code = '469001' WHERE name = '五指山市' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469002' WHERE name = '琼海市' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469005' WHERE name = '文昌市' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469006' WHERE name = '万宁市' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469007' WHERE name = '东方市' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469021' WHERE name = '定安县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469022' WHERE name = '屯昌县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469023' WHERE name = '澄迈县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469024' WHERE name = '临高县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469025' WHERE name = '白沙黎族自治县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469026' WHERE name = '昌江黎族自治县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469027' WHERE name = '乐东黎族自治县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469028' WHERE name = '陵水黎族自治县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469029' WHERE name = '保亭黎族苗族自治县' AND city = '海南省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '469030' WHERE name = '琼中黎族苗族自治县' AND city = '海南省-自治区直辖县级行政区划';

-- 海南藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '632521' WHERE name = '共和县' AND city = '海南藏族自治州';
UPDATE biz_region SET code = '632522' WHERE name = '同德县' AND city = '海南藏族自治州';
UPDATE biz_region SET code = '632523' WHERE name = '贵德县' AND city = '海南藏族自治州';
UPDATE biz_region SET code = '632524' WHERE name = '兴海县' AND city = '海南藏族自治州';
UPDATE biz_region SET code = '632525' WHERE name = '贵南县' AND city = '海南藏族自治州';

-- 海口市
--------------------------------------------------
UPDATE biz_region SET code = '460105' WHERE name = '秀英区' AND city = '海口市';
UPDATE biz_region SET code = '460106' WHERE name = '龙华区' AND city = '海口市';
UPDATE biz_region SET code = '460107' WHERE name = '琼山区' AND city = '海口市';
UPDATE biz_region SET code = '460108' WHERE name = '美兰区' AND city = '海口市';

-- 海西蒙古族藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '632801' WHERE name = '格尔木市' AND city = '海西蒙古族藏族自治州';
UPDATE biz_region SET code = '632802' WHERE name = '德令哈市' AND city = '海西蒙古族藏族自治州';
UPDATE biz_region SET code = '632803' WHERE name = '茫崖市' AND city = '海西蒙古族藏族自治州';
UPDATE biz_region SET code = '632821' WHERE name = '乌兰县' AND city = '海西蒙古族藏族自治州';
UPDATE biz_region SET code = '632822' WHERE name = '都兰县' AND city = '海西蒙古族藏族自治州';
UPDATE biz_region SET code = '632823' WHERE name = '天峻县' AND city = '海西蒙古族藏族自治州';
UPDATE biz_region SET code = '632857' WHERE name = '大柴旦行政委员会' AND city = '海西蒙古族藏族自治州';

-- 淄博市
--------------------------------------------------
UPDATE biz_region SET code = '370302' WHERE name = '淄川区' AND city = '淄博市';
UPDATE biz_region SET code = '370303' WHERE name = '张店区' AND city = '淄博市';
UPDATE biz_region SET code = '370304' WHERE name = '博山区' AND city = '淄博市';
UPDATE biz_region SET code = '370305' WHERE name = '临淄区' AND city = '淄博市';
UPDATE biz_region SET code = '370306' WHERE name = '周村区' AND city = '淄博市';
UPDATE biz_region SET code = '370321' WHERE name = '桓台县' AND city = '淄博市';
UPDATE biz_region SET code = '370322' WHERE name = '高青县' AND city = '淄博市';
UPDATE biz_region SET code = '370323' WHERE name = '沂源县' AND city = '淄博市';

-- 淮北市
--------------------------------------------------
UPDATE biz_region SET code = '340602' WHERE name = '杜集区' AND city = '淮北市';
UPDATE biz_region SET code = '340603' WHERE name = '相山区' AND city = '淮北市';
UPDATE biz_region SET code = '340604' WHERE name = '烈山区' AND city = '淮北市';
UPDATE biz_region SET code = '340621' WHERE name = '濉溪县' AND city = '淮北市';

-- 淮南市
--------------------------------------------------
UPDATE biz_region SET code = '340402' WHERE name = '大通区' AND city = '淮南市';
UPDATE biz_region SET code = '340403' WHERE name = '田家庵区' AND city = '淮南市';
UPDATE biz_region SET code = '340404' WHERE name = '谢家集区' AND city = '淮南市';
UPDATE biz_region SET code = '340405' WHERE name = '八公山区' AND city = '淮南市';
UPDATE biz_region SET code = '340406' WHERE name = '潘集区' AND city = '淮南市';
UPDATE biz_region SET code = '340421' WHERE name = '凤台县' AND city = '淮南市';
UPDATE biz_region SET code = '340422' WHERE name = '寿县' AND city = '淮南市';

-- 淮安市
--------------------------------------------------
UPDATE biz_region SET code = '320803' WHERE name = '淮安区' AND city = '淮安市';
UPDATE biz_region SET code = '320804' WHERE name = '淮阴区' AND city = '淮安市';
UPDATE biz_region SET code = '320812' WHERE name = '清江浦区' AND city = '淮安市';
UPDATE biz_region SET code = '320813' WHERE name = '洪泽区' AND city = '淮安市';
UPDATE biz_region SET code = '320826' WHERE name = '涟水县' AND city = '淮安市';
UPDATE biz_region SET code = '320830' WHERE name = '盱眙县' AND city = '淮安市';
UPDATE biz_region SET code = '320831' WHERE name = '金湖县' AND city = '淮安市';
UPDATE biz_region SET code = '320871' WHERE name = '淮安经济技术开发区' AND city = '淮安市';

-- 深圳市
--------------------------------------------------
UPDATE biz_region SET code = '440303' WHERE name = '罗湖区' AND city = '深圳市';
UPDATE biz_region SET code = '440304' WHERE name = '福田区' AND city = '深圳市';
UPDATE biz_region SET code = '440305' WHERE name = '南山区' AND city = '深圳市';
UPDATE biz_region SET code = '440306' WHERE name = '宝安区' AND city = '深圳市';
UPDATE biz_region SET code = '440307' WHERE name = '龙岗区' AND city = '深圳市';
UPDATE biz_region SET code = '440308' WHERE name = '盐田区' AND city = '深圳市';
UPDATE biz_region SET code = '440309' WHERE name = '龙华区' AND city = '深圳市';
UPDATE biz_region SET code = '440310' WHERE name = '坪山区' AND city = '深圳市';
UPDATE biz_region SET code = '440311' WHERE name = '光明区' AND city = '深圳市';

-- 清远市
--------------------------------------------------
UPDATE biz_region SET code = '441802' WHERE name = '清城区' AND city = '清远市';
UPDATE biz_region SET code = '441803' WHERE name = '清新区' AND city = '清远市';
UPDATE biz_region SET code = '441821' WHERE name = '佛冈县' AND city = '清远市';
UPDATE biz_region SET code = '441823' WHERE name = '阳山县' AND city = '清远市';
UPDATE biz_region SET code = '441825' WHERE name = '连山壮族瑶族自治县' AND city = '清远市';
UPDATE biz_region SET code = '441826' WHERE name = '连南瑶族自治县' AND city = '清远市';
UPDATE biz_region SET code = '441881' WHERE name = '英德市' AND city = '清远市';
UPDATE biz_region SET code = '441882' WHERE name = '连州市' AND city = '清远市';

-- 温州市
--------------------------------------------------
UPDATE biz_region SET code = '330302' WHERE name = '鹿城区' AND city = '温州市';
UPDATE biz_region SET code = '330303' WHERE name = '龙湾区' AND city = '温州市';
UPDATE biz_region SET code = '330304' WHERE name = '瓯海区' AND city = '温州市';
UPDATE biz_region SET code = '330305' WHERE name = '洞头区' AND city = '温州市';
UPDATE biz_region SET code = '330324' WHERE name = '永嘉县' AND city = '温州市';
UPDATE biz_region SET code = '330326' WHERE name = '平阳县' AND city = '温州市';
UPDATE biz_region SET code = '330327' WHERE name = '苍南县' AND city = '温州市';
UPDATE biz_region SET code = '330328' WHERE name = '文成县' AND city = '温州市';
UPDATE biz_region SET code = '330329' WHERE name = '泰顺县' AND city = '温州市';
UPDATE biz_region SET code = '330371' WHERE name = '温州经济技术开发区' AND city = '温州市';
UPDATE biz_region SET code = '330381' WHERE name = '瑞安市' AND city = '温州市';
UPDATE biz_region SET code = '330382' WHERE name = '乐清市' AND city = '温州市';
UPDATE biz_region SET code = '330383' WHERE name = '龙港市' AND city = '温州市';

-- 渭南市
--------------------------------------------------
UPDATE biz_region SET code = '610502' WHERE name = '临渭区' AND city = '渭南市';
UPDATE biz_region SET code = '610503' WHERE name = '华州区' AND city = '渭南市';
UPDATE biz_region SET code = '610522' WHERE name = '潼关县' AND city = '渭南市';
UPDATE biz_region SET code = '610523' WHERE name = '大荔县' AND city = '渭南市';
UPDATE biz_region SET code = '610524' WHERE name = '合阳县' AND city = '渭南市';
UPDATE biz_region SET code = '610525' WHERE name = '澄城县' AND city = '渭南市';
UPDATE biz_region SET code = '610526' WHERE name = '蒲城县' AND city = '渭南市';
UPDATE biz_region SET code = '610527' WHERE name = '白水县' AND city = '渭南市';
UPDATE biz_region SET code = '610528' WHERE name = '富平县' AND city = '渭南市';
UPDATE biz_region SET code = '610581' WHERE name = '韩城市' AND city = '渭南市';
UPDATE biz_region SET code = '610582' WHERE name = '华阴市' AND city = '渭南市';

-- 湖北省-自治区直辖县级行政区划
--------------------------------------------------
UPDATE biz_region SET code = '429004' WHERE name = '仙桃市' AND city = '湖北省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '429005' WHERE name = '潜江市' AND city = '湖北省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '429006' WHERE name = '天门市' AND city = '湖北省-自治区直辖县级行政区划';
UPDATE biz_region SET code = '429021' WHERE name = '神农架林区' AND city = '湖北省-自治区直辖县级行政区划';

-- 湖州市
--------------------------------------------------
UPDATE biz_region SET code = '330502' WHERE name = '吴兴区' AND city = '湖州市';
UPDATE biz_region SET code = '330503' WHERE name = '南浔区' AND city = '湖州市';
UPDATE biz_region SET code = '330521' WHERE name = '德清县' AND city = '湖州市';
UPDATE biz_region SET code = '330522' WHERE name = '长兴县' AND city = '湖州市';
UPDATE biz_region SET code = '330523' WHERE name = '安吉县' AND city = '湖州市';

-- 湘潭市
--------------------------------------------------
UPDATE biz_region SET code = '430302' WHERE name = '雨湖区' AND city = '湘潭市';
UPDATE biz_region SET code = '430304' WHERE name = '岳塘区' AND city = '湘潭市';
UPDATE biz_region SET code = '430321' WHERE name = '湘潭县' AND city = '湘潭市';
UPDATE biz_region SET code = '430371' WHERE name = '湖南湘潭高新技术产业园区' AND city = '湘潭市';
UPDATE biz_region SET code = '430372' WHERE name = '湘潭昭山示范区' AND city = '湘潭市';
UPDATE biz_region SET code = '430373' WHERE name = '湘潭九华示范区' AND city = '湘潭市';
UPDATE biz_region SET code = '430381' WHERE name = '湘乡市' AND city = '湘潭市';
UPDATE biz_region SET code = '430382' WHERE name = '韶山市' AND city = '湘潭市';

-- 湘西土家族苗族自治州
--------------------------------------------------
UPDATE biz_region SET code = '433101' WHERE name = '吉首市' AND city = '湘西土家族苗族自治州';
UPDATE biz_region SET code = '433122' WHERE name = '泸溪县' AND city = '湘西土家族苗族自治州';
UPDATE biz_region SET code = '433123' WHERE name = '凤凰县' AND city = '湘西土家族苗族自治州';
UPDATE biz_region SET code = '433124' WHERE name = '花垣县' AND city = '湘西土家族苗族自治州';
UPDATE biz_region SET code = '433125' WHERE name = '保靖县' AND city = '湘西土家族苗族自治州';
UPDATE biz_region SET code = '433126' WHERE name = '古丈县' AND city = '湘西土家族苗族自治州';
UPDATE biz_region SET code = '433127' WHERE name = '永顺县' AND city = '湘西土家族苗族自治州';
UPDATE biz_region SET code = '433130' WHERE name = '龙山县' AND city = '湘西土家族苗族自治州';

-- 湛江市
--------------------------------------------------
UPDATE biz_region SET code = '440802' WHERE name = '赤坎区' AND city = '湛江市';
UPDATE biz_region SET code = '440803' WHERE name = '霞山区' AND city = '湛江市';
UPDATE biz_region SET code = '440804' WHERE name = '坡头区' AND city = '湛江市';
UPDATE biz_region SET code = '440811' WHERE name = '麻章区' AND city = '湛江市';
UPDATE biz_region SET code = '440823' WHERE name = '遂溪县' AND city = '湛江市';
UPDATE biz_region SET code = '440825' WHERE name = '徐闻县' AND city = '湛江市';
UPDATE biz_region SET code = '440881' WHERE name = '廉江市' AND city = '湛江市';
UPDATE biz_region SET code = '440882' WHERE name = '雷州市' AND city = '湛江市';
UPDATE biz_region SET code = '440883' WHERE name = '吴川市' AND city = '湛江市';

-- 滁州市
--------------------------------------------------
UPDATE biz_region SET code = '341102' WHERE name = '琅琊区' AND city = '滁州市';
UPDATE biz_region SET code = '341103' WHERE name = '南谯区' AND city = '滁州市';
UPDATE biz_region SET code = '341122' WHERE name = '来安县' AND city = '滁州市';
UPDATE biz_region SET code = '341124' WHERE name = '全椒县' AND city = '滁州市';
UPDATE biz_region SET code = '341125' WHERE name = '定远县' AND city = '滁州市';
UPDATE biz_region SET code = '341126' WHERE name = '凤阳县' AND city = '滁州市';
UPDATE biz_region SET code = '341171' WHERE name = '中新苏滁高新技术产业开发区' AND city = '滁州市';
UPDATE biz_region SET code = '341172' WHERE name = '滁州经济技术开发区' AND city = '滁州市';
UPDATE biz_region SET code = '341181' WHERE name = '天长市' AND city = '滁州市';
UPDATE biz_region SET code = '341182' WHERE name = '明光市' AND city = '滁州市';

-- 滨州市
--------------------------------------------------
UPDATE biz_region SET code = '371602' WHERE name = '滨城区' AND city = '滨州市';
UPDATE biz_region SET code = '371603' WHERE name = '沾化区' AND city = '滨州市';
UPDATE biz_region SET code = '371621' WHERE name = '惠民县' AND city = '滨州市';
UPDATE biz_region SET code = '371622' WHERE name = '阳信县' AND city = '滨州市';
UPDATE biz_region SET code = '371623' WHERE name = '无棣县' AND city = '滨州市';
UPDATE biz_region SET code = '371625' WHERE name = '博兴县' AND city = '滨州市';
UPDATE biz_region SET code = '371681' WHERE name = '邹平市' AND city = '滨州市';

-- 漯河市
--------------------------------------------------
UPDATE biz_region SET code = '411102' WHERE name = '源汇区' AND city = '漯河市';
UPDATE biz_region SET code = '411103' WHERE name = '郾城区' AND city = '漯河市';
UPDATE biz_region SET code = '411104' WHERE name = '召陵区' AND city = '漯河市';
UPDATE biz_region SET code = '411121' WHERE name = '舞阳县' AND city = '漯河市';
UPDATE biz_region SET code = '411122' WHERE name = '临颍县' AND city = '漯河市';
UPDATE biz_region SET code = '411171' WHERE name = '漯河经济技术开发区' AND city = '漯河市';

-- 漳州市
--------------------------------------------------
UPDATE biz_region SET code = '350602' WHERE name = '芗城区' AND city = '漳州市';
UPDATE biz_region SET code = '350603' WHERE name = '龙文区' AND city = '漳州市';
UPDATE biz_region SET code = '350604' WHERE name = '龙海区' AND city = '漳州市';
UPDATE biz_region SET code = '350605' WHERE name = '长泰区' AND city = '漳州市';
UPDATE biz_region SET code = '350622' WHERE name = '云霄县' AND city = '漳州市';
UPDATE biz_region SET code = '350623' WHERE name = '漳浦县' AND city = '漳州市';
UPDATE biz_region SET code = '350624' WHERE name = '诏安县' AND city = '漳州市';
UPDATE biz_region SET code = '350625' WHERE name = '长泰县' AND city = '漳州市';
UPDATE biz_region SET code = '350626' WHERE name = '东山县' AND city = '漳州市';
UPDATE biz_region SET code = '350627' WHERE name = '南靖县' AND city = '漳州市';
UPDATE biz_region SET code = '350628' WHERE name = '平和县' AND city = '漳州市';
UPDATE biz_region SET code = '350629' WHERE name = '华安县' AND city = '漳州市';
UPDATE biz_region SET code = '350681' WHERE name = '龙海市' AND city = '漳州市';

-- 潍坊市
--------------------------------------------------
UPDATE biz_region SET code = '370702' WHERE name = '潍城区' AND city = '潍坊市';
UPDATE biz_region SET code = '370703' WHERE name = '寒亭区' AND city = '潍坊市';
UPDATE biz_region SET code = '370704' WHERE name = '坊子区' AND city = '潍坊市';
UPDATE biz_region SET code = '370705' WHERE name = '奎文区' AND city = '潍坊市';
UPDATE biz_region SET code = '370724' WHERE name = '临朐县' AND city = '潍坊市';
UPDATE biz_region SET code = '370725' WHERE name = '昌乐县' AND city = '潍坊市';
UPDATE biz_region SET code = '370772' WHERE name = '潍坊滨海经济技术开发区' AND city = '潍坊市';
UPDATE biz_region SET code = '370781' WHERE name = '青州市' AND city = '潍坊市';
UPDATE biz_region SET code = '370782' WHERE name = '诸城市' AND city = '潍坊市';
UPDATE biz_region SET code = '370783' WHERE name = '寿光市' AND city = '潍坊市';
UPDATE biz_region SET code = '370784' WHERE name = '安丘市' AND city = '潍坊市';
UPDATE biz_region SET code = '370785' WHERE name = '高密市' AND city = '潍坊市';
UPDATE biz_region SET code = '370786' WHERE name = '昌邑市' AND city = '潍坊市';

-- 潮州市
--------------------------------------------------
UPDATE biz_region SET code = '445102' WHERE name = '湘桥区' AND city = '潮州市';
UPDATE biz_region SET code = '445103' WHERE name = '潮安区' AND city = '潮州市';
UPDATE biz_region SET code = '445122' WHERE name = '饶平县' AND city = '潮州市';

-- 濮阳市
--------------------------------------------------
UPDATE biz_region SET code = '410902' WHERE name = '华龙区' AND city = '濮阳市';
UPDATE biz_region SET code = '410922' WHERE name = '清丰县' AND city = '濮阳市';
UPDATE biz_region SET code = '410923' WHERE name = '南乐县' AND city = '濮阳市';
UPDATE biz_region SET code = '410926' WHERE name = '范县' AND city = '濮阳市';
UPDATE biz_region SET code = '410927' WHERE name = '台前县' AND city = '濮阳市';
UPDATE biz_region SET code = '410928' WHERE name = '濮阳县' AND city = '濮阳市';
UPDATE biz_region SET code = '410971' WHERE name = '河南濮阳工业园区' AND city = '濮阳市';
UPDATE biz_region SET code = '410972' WHERE name = '濮阳经济技术开发区' AND city = '濮阳市';

-- 烟台市
--------------------------------------------------
UPDATE biz_region SET code = '370602' WHERE name = '芝罘区' AND city = '烟台市';
UPDATE biz_region SET code = '370611' WHERE name = '福山区' AND city = '烟台市';
UPDATE biz_region SET code = '370612' WHERE name = '牟平区' AND city = '烟台市';
UPDATE biz_region SET code = '370613' WHERE name = '莱山区' AND city = '烟台市';
UPDATE biz_region SET code = '370614' WHERE name = '蓬莱区' AND city = '烟台市';
UPDATE biz_region SET code = '370671' WHERE name = '烟台高新技术产业开发区' AND city = '烟台市';
UPDATE biz_region SET code = '370672' WHERE name = '烟台经济技术开发区' AND city = '烟台市';
UPDATE biz_region SET code = '370681' WHERE name = '龙口市' AND city = '烟台市';
UPDATE biz_region SET code = '370682' WHERE name = '莱阳市' AND city = '烟台市';
UPDATE biz_region SET code = '370683' WHERE name = '莱州市' AND city = '烟台市';
UPDATE biz_region SET code = '370685' WHERE name = '招远市' AND city = '烟台市';
UPDATE biz_region SET code = '370686' WHERE name = '栖霞市' AND city = '烟台市';
UPDATE biz_region SET code = '370687' WHERE name = '海阳市' AND city = '烟台市';

-- 焦作市
--------------------------------------------------
UPDATE biz_region SET code = '410802' WHERE name = '解放区' AND city = '焦作市';
UPDATE biz_region SET code = '410803' WHERE name = '中站区' AND city = '焦作市';
UPDATE biz_region SET code = '410804' WHERE name = '马村区' AND city = '焦作市';
UPDATE biz_region SET code = '410811' WHERE name = '山阳区' AND city = '焦作市';
UPDATE biz_region SET code = '410821' WHERE name = '修武县' AND city = '焦作市';
UPDATE biz_region SET code = '410822' WHERE name = '博爱县' AND city = '焦作市';
UPDATE biz_region SET code = '410823' WHERE name = '武陟县' AND city = '焦作市';
UPDATE biz_region SET code = '410825' WHERE name = '温县' AND city = '焦作市';
UPDATE biz_region SET code = '410871' WHERE name = '焦作城乡一体化示范区' AND city = '焦作市';
UPDATE biz_region SET code = '410882' WHERE name = '沁阳市' AND city = '焦作市';
UPDATE biz_region SET code = '410883' WHERE name = '孟州市' AND city = '焦作市';

-- 牡丹江市
--------------------------------------------------
UPDATE biz_region SET code = '231002' WHERE name = '东安区' AND city = '牡丹江市';
UPDATE biz_region SET code = '231003' WHERE name = '阳明区' AND city = '牡丹江市';
UPDATE biz_region SET code = '231004' WHERE name = '爱民区' AND city = '牡丹江市';
UPDATE biz_region SET code = '231005' WHERE name = '西安区' AND city = '牡丹江市';
UPDATE biz_region SET code = '231025' WHERE name = '林口县' AND city = '牡丹江市';
UPDATE biz_region SET code = '231071' WHERE name = '牡丹江经济技术开发区' AND city = '牡丹江市';
UPDATE biz_region SET code = '231081' WHERE name = '绥芬河市' AND city = '牡丹江市';
UPDATE biz_region SET code = '231083' WHERE name = '海林市' AND city = '牡丹江市';
UPDATE biz_region SET code = '231084' WHERE name = '宁安市' AND city = '牡丹江市';
UPDATE biz_region SET code = '231085' WHERE name = '穆棱市' AND city = '牡丹江市';
UPDATE biz_region SET code = '231086' WHERE name = '东宁市' AND city = '牡丹江市';

-- 玉林市
--------------------------------------------------
UPDATE biz_region SET code = '450902' WHERE name = '玉州区' AND city = '玉林市';
UPDATE biz_region SET code = '450903' WHERE name = '福绵区' AND city = '玉林市';
UPDATE biz_region SET code = '450921' WHERE name = '容县' AND city = '玉林市';
UPDATE biz_region SET code = '450922' WHERE name = '陆川县' AND city = '玉林市';
UPDATE biz_region SET code = '450923' WHERE name = '博白县' AND city = '玉林市';
UPDATE biz_region SET code = '450924' WHERE name = '兴业县' AND city = '玉林市';
UPDATE biz_region SET code = '450981' WHERE name = '北流市' AND city = '玉林市';

-- 玉树藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '632701' WHERE name = '玉树市' AND city = '玉树藏族自治州';
UPDATE biz_region SET code = '632722' WHERE name = '杂多县' AND city = '玉树藏族自治州';
UPDATE biz_region SET code = '632723' WHERE name = '称多县' AND city = '玉树藏族自治州';
UPDATE biz_region SET code = '632724' WHERE name = '治多县' AND city = '玉树藏族自治州';
UPDATE biz_region SET code = '632725' WHERE name = '囊谦县' AND city = '玉树藏族自治州';
UPDATE biz_region SET code = '632726' WHERE name = '曲麻莱县' AND city = '玉树藏族自治州';

-- 玉溪市
--------------------------------------------------
UPDATE biz_region SET code = '530402' WHERE name = '红塔区' AND city = '玉溪市';
UPDATE biz_region SET code = '530403' WHERE name = '江川区' AND city = '玉溪市';
UPDATE biz_region SET code = '530423' WHERE name = '通海县' AND city = '玉溪市';
UPDATE biz_region SET code = '530424' WHERE name = '华宁县' AND city = '玉溪市';
UPDATE biz_region SET code = '530425' WHERE name = '易门县' AND city = '玉溪市';
UPDATE biz_region SET code = '530426' WHERE name = '峨山彝族自治县' AND city = '玉溪市';
UPDATE biz_region SET code = '530427' WHERE name = '新平彝族傣族自治县' AND city = '玉溪市';
UPDATE biz_region SET code = '530428' WHERE name = '元江哈尼族彝族傣族自治县' AND city = '玉溪市';
UPDATE biz_region SET code = '530481' WHERE name = '澄江市' AND city = '玉溪市';

-- 珠海市
--------------------------------------------------
UPDATE biz_region SET code = '440402' WHERE name = '香洲区' AND city = '珠海市';
UPDATE biz_region SET code = '440403' WHERE name = '斗门区' AND city = '珠海市';
UPDATE biz_region SET code = '440404' WHERE name = '金湾区' AND city = '珠海市';

-- 甘南藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '623001' WHERE name = '合作市' AND city = '甘南藏族自治州';
UPDATE biz_region SET code = '623021' WHERE name = '临潭县' AND city = '甘南藏族自治州';
UPDATE biz_region SET code = '623022' WHERE name = '卓尼县' AND city = '甘南藏族自治州';
UPDATE biz_region SET code = '623023' WHERE name = '舟曲县' AND city = '甘南藏族自治州';
UPDATE biz_region SET code = '623024' WHERE name = '迭部县' AND city = '甘南藏族自治州';
UPDATE biz_region SET code = '623025' WHERE name = '玛曲县' AND city = '甘南藏族自治州';
UPDATE biz_region SET code = '623026' WHERE name = '碌曲县' AND city = '甘南藏族自治州';
UPDATE biz_region SET code = '623027' WHERE name = '夏河县' AND city = '甘南藏族自治州';

-- 甘孜藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '513301' WHERE name = '康定市' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513322' WHERE name = '泸定县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513323' WHERE name = '丹巴县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513324' WHERE name = '九龙县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513325' WHERE name = '雅江县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513326' WHERE name = '道孚县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513327' WHERE name = '炉霍县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513328' WHERE name = '甘孜县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513329' WHERE name = '新龙县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513330' WHERE name = '德格县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513331' WHERE name = '白玉县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513332' WHERE name = '石渠县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513333' WHERE name = '色达县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513334' WHERE name = '理塘县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513335' WHERE name = '巴塘县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513336' WHERE name = '乡城县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513337' WHERE name = '稻城县' AND city = '甘孜藏族自治州';
UPDATE biz_region SET code = '513338' WHERE name = '得荣县' AND city = '甘孜藏族自治州';

-- 白城市
--------------------------------------------------
UPDATE biz_region SET code = '220802' WHERE name = '洮北区' AND city = '白城市';
UPDATE biz_region SET code = '220821' WHERE name = '镇赉县' AND city = '白城市';
UPDATE biz_region SET code = '220822' WHERE name = '通榆县' AND city = '白城市';
UPDATE biz_region SET code = '220871' WHERE name = '吉林白城经济开发区' AND city = '白城市';
UPDATE biz_region SET code = '220881' WHERE name = '洮南市' AND city = '白城市';
UPDATE biz_region SET code = '220882' WHERE name = '大安市' AND city = '白城市';

-- 白山市
--------------------------------------------------
UPDATE biz_region SET code = '220602' WHERE name = '浑江区' AND city = '白山市';
UPDATE biz_region SET code = '220605' WHERE name = '江源区' AND city = '白山市';
UPDATE biz_region SET code = '220621' WHERE name = '抚松县' AND city = '白山市';
UPDATE biz_region SET code = '220622' WHERE name = '靖宇县' AND city = '白山市';
UPDATE biz_region SET code = '220623' WHERE name = '长白朝鲜族自治县' AND city = '白山市';
UPDATE biz_region SET code = '220681' WHERE name = '临江市' AND city = '白山市';

-- 白银市
--------------------------------------------------
UPDATE biz_region SET code = '620402' WHERE name = '白银区' AND city = '白银市';
UPDATE biz_region SET code = '620403' WHERE name = '平川区' AND city = '白银市';
UPDATE biz_region SET code = '620421' WHERE name = '靖远县' AND city = '白银市';
UPDATE biz_region SET code = '620422' WHERE name = '会宁县' AND city = '白银市';
UPDATE biz_region SET code = '620423' WHERE name = '景泰县' AND city = '白银市';

-- 百色市
--------------------------------------------------
UPDATE biz_region SET code = '451002' WHERE name = '右江区' AND city = '百色市';
UPDATE biz_region SET code = '451003' WHERE name = '田阳区' AND city = '百色市';
UPDATE biz_region SET code = '451022' WHERE name = '田东县' AND city = '百色市';
UPDATE biz_region SET code = '451024' WHERE name = '德保县' AND city = '百色市';
UPDATE biz_region SET code = '451026' WHERE name = '那坡县' AND city = '百色市';
UPDATE biz_region SET code = '451027' WHERE name = '凌云县' AND city = '百色市';
UPDATE biz_region SET code = '451028' WHERE name = '乐业县' AND city = '百色市';
UPDATE biz_region SET code = '451029' WHERE name = '田林县' AND city = '百色市';
UPDATE biz_region SET code = '451030' WHERE name = '西林县' AND city = '百色市';
UPDATE biz_region SET code = '451031' WHERE name = '隆林各族自治县' AND city = '百色市';
UPDATE biz_region SET code = '451081' WHERE name = '靖西市' AND city = '百色市';
UPDATE biz_region SET code = '451082' WHERE name = '平果市' AND city = '百色市';

-- 益阳市
--------------------------------------------------
UPDATE biz_region SET code = '430902' WHERE name = '资阳区' AND city = '益阳市';
UPDATE biz_region SET code = '430903' WHERE name = '赫山区' AND city = '益阳市';
UPDATE biz_region SET code = '430921' WHERE name = '南县' AND city = '益阳市';
UPDATE biz_region SET code = '430922' WHERE name = '桃江县' AND city = '益阳市';
UPDATE biz_region SET code = '430923' WHERE name = '安化县' AND city = '益阳市';
UPDATE biz_region SET code = '430971' WHERE name = '益阳市大通湖管理区' AND city = '益阳市';
UPDATE biz_region SET code = '430972' WHERE name = '湖南益阳高新技术产业园区' AND city = '益阳市';
UPDATE biz_region SET code = '430981' WHERE name = '沅江市' AND city = '益阳市';

-- 盐城市
--------------------------------------------------
UPDATE biz_region SET code = '320902' WHERE name = '亭湖区' AND city = '盐城市';
UPDATE biz_region SET code = '320903' WHERE name = '盐都区' AND city = '盐城市';
UPDATE biz_region SET code = '320904' WHERE name = '大丰区' AND city = '盐城市';
UPDATE biz_region SET code = '320921' WHERE name = '响水县' AND city = '盐城市';
UPDATE biz_region SET code = '320922' WHERE name = '滨海县' AND city = '盐城市';
UPDATE biz_region SET code = '320923' WHERE name = '阜宁县' AND city = '盐城市';
UPDATE biz_region SET code = '320924' WHERE name = '射阳县' AND city = '盐城市';
UPDATE biz_region SET code = '320925' WHERE name = '建湖县' AND city = '盐城市';
UPDATE biz_region SET code = '320971' WHERE name = '盐城经济技术开发区' AND city = '盐城市';
UPDATE biz_region SET code = '320981' WHERE name = '东台市' AND city = '盐城市';

-- 盘锦市
--------------------------------------------------
UPDATE biz_region SET code = '211102' WHERE name = '双台子区' AND city = '盘锦市';
UPDATE biz_region SET code = '211103' WHERE name = '兴隆台区' AND city = '盘锦市';
UPDATE biz_region SET code = '211104' WHERE name = '大洼区' AND city = '盘锦市';
UPDATE biz_region SET code = '211122' WHERE name = '盘山县' AND city = '盘锦市';

-- 眉山市
--------------------------------------------------
UPDATE biz_region SET code = '511402' WHERE name = '东坡区' AND city = '眉山市';
UPDATE biz_region SET code = '511403' WHERE name = '彭山区' AND city = '眉山市';
UPDATE biz_region SET code = '511421' WHERE name = '仁寿县' AND city = '眉山市';
UPDATE biz_region SET code = '511423' WHERE name = '洪雅县' AND city = '眉山市';
UPDATE biz_region SET code = '511424' WHERE name = '丹棱县' AND city = '眉山市';
UPDATE biz_region SET code = '511425' WHERE name = '青神县' AND city = '眉山市';

-- 石嘴山市
--------------------------------------------------
UPDATE biz_region SET code = '640202' WHERE name = '大武口区' AND city = '石嘴山市';
UPDATE biz_region SET code = '640205' WHERE name = '惠农区' AND city = '石嘴山市';
UPDATE biz_region SET code = '640221' WHERE name = '平罗县' AND city = '石嘴山市';

-- 石家庄市
--------------------------------------------------
UPDATE biz_region SET code = '130102' WHERE name = '长安区' AND city = '石家庄市';
UPDATE biz_region SET code = '130104' WHERE name = '桥西区' AND city = '石家庄市';
UPDATE biz_region SET code = '130105' WHERE name = '新华区' AND city = '石家庄市';
UPDATE biz_region SET code = '130107' WHERE name = '井陉矿区' AND city = '石家庄市';
UPDATE biz_region SET code = '130108' WHERE name = '裕华区' AND city = '石家庄市';
UPDATE biz_region SET code = '130109' WHERE name = '藁城区' AND city = '石家庄市';
UPDATE biz_region SET code = '130110' WHERE name = '鹿泉区' AND city = '石家庄市';
UPDATE biz_region SET code = '130111' WHERE name = '栾城区' AND city = '石家庄市';
UPDATE biz_region SET code = '130121' WHERE name = '井陉县' AND city = '石家庄市';
UPDATE biz_region SET code = '130123' WHERE name = '正定县' AND city = '石家庄市';
UPDATE biz_region SET code = '130125' WHERE name = '行唐县' AND city = '石家庄市';
UPDATE biz_region SET code = '130126' WHERE name = '灵寿县' AND city = '石家庄市';
UPDATE biz_region SET code = '130127' WHERE name = '高邑县' AND city = '石家庄市';
UPDATE biz_region SET code = '130128' WHERE name = '深泽县' AND city = '石家庄市';
UPDATE biz_region SET code = '130129' WHERE name = '赞皇县' AND city = '石家庄市';
UPDATE biz_region SET code = '130130' WHERE name = '无极县' AND city = '石家庄市';
UPDATE biz_region SET code = '130131' WHERE name = '平山县' AND city = '石家庄市';
UPDATE biz_region SET code = '130132' WHERE name = '元氏县' AND city = '石家庄市';
UPDATE biz_region SET code = '130133' WHERE name = '赵县' AND city = '石家庄市';
UPDATE biz_region SET code = '130171' WHERE name = '石家庄高新技术产业开发区' AND city = '石家庄市';
UPDATE biz_region SET code = '130172' WHERE name = '石家庄循环化工园区' AND city = '石家庄市';
UPDATE biz_region SET code = '130181' WHERE name = '辛集市' AND city = '石家庄市';
UPDATE biz_region SET code = '130183' WHERE name = '晋州市' AND city = '石家庄市';
UPDATE biz_region SET code = '130184' WHERE name = '新乐市' AND city = '石家庄市';

-- 福州市
--------------------------------------------------
UPDATE biz_region SET code = '350102' WHERE name = '鼓楼区' AND city = '福州市';
UPDATE biz_region SET code = '350103' WHERE name = '台江区' AND city = '福州市';
UPDATE biz_region SET code = '350104' WHERE name = '仓山区' AND city = '福州市';
UPDATE biz_region SET code = '350105' WHERE name = '马尾区' AND city = '福州市';
UPDATE biz_region SET code = '350111' WHERE name = '晋安区' AND city = '福州市';
UPDATE biz_region SET code = '350112' WHERE name = '长乐区' AND city = '福州市';
UPDATE biz_region SET code = '350121' WHERE name = '闽侯县' AND city = '福州市';
UPDATE biz_region SET code = '350122' WHERE name = '连江县' AND city = '福州市';
UPDATE biz_region SET code = '350123' WHERE name = '罗源县' AND city = '福州市';
UPDATE biz_region SET code = '350124' WHERE name = '闽清县' AND city = '福州市';
UPDATE biz_region SET code = '350125' WHERE name = '永泰县' AND city = '福州市';
UPDATE biz_region SET code = '350128' WHERE name = '平潭县' AND city = '福州市';
UPDATE biz_region SET code = '350181' WHERE name = '福清市' AND city = '福州市';

-- 秦皇岛市
--------------------------------------------------
UPDATE biz_region SET code = '130302' WHERE name = '海港区' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130303' WHERE name = '山海关区' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130304' WHERE name = '北戴河区' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130306' WHERE name = '抚宁区' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130321' WHERE name = '青龙满族自治县' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130322' WHERE name = '昌黎县' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130324' WHERE name = '卢龙县' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130371' WHERE name = '秦皇岛市经济技术开发区' AND city = '秦皇岛市';
UPDATE biz_region SET code = '130372' WHERE name = '北戴河新区' AND city = '秦皇岛市';

-- 红河哈尼族彝族自治州
--------------------------------------------------
UPDATE biz_region SET code = '532501' WHERE name = '个旧市' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532502' WHERE name = '开远市' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532503' WHERE name = '蒙自市' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532504' WHERE name = '弥勒市' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532523' WHERE name = '屏边苗族自治县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532524' WHERE name = '建水县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532525' WHERE name = '石屏县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532527' WHERE name = '泸西县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532528' WHERE name = '元阳县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532529' WHERE name = '红河县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532530' WHERE name = '金平苗族瑶族傣族自治县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532531' WHERE name = '绿春县' AND city = '红河哈尼族彝族自治州';
UPDATE biz_region SET code = '532532' WHERE name = '河口瑶族自治县' AND city = '红河哈尼族彝族自治州';

-- 绍兴市
--------------------------------------------------
UPDATE biz_region SET code = '330602' WHERE name = '越城区' AND city = '绍兴市';
UPDATE biz_region SET code = '330603' WHERE name = '柯桥区' AND city = '绍兴市';
UPDATE biz_region SET code = '330604' WHERE name = '上虞区' AND city = '绍兴市';
UPDATE biz_region SET code = '330624' WHERE name = '新昌县' AND city = '绍兴市';
UPDATE biz_region SET code = '330681' WHERE name = '诸暨市' AND city = '绍兴市';
UPDATE biz_region SET code = '330683' WHERE name = '嵊州市' AND city = '绍兴市';

-- 绥化市
--------------------------------------------------
UPDATE biz_region SET code = '231202' WHERE name = '北林区' AND city = '绥化市';
UPDATE biz_region SET code = '231221' WHERE name = '望奎县' AND city = '绥化市';
UPDATE biz_region SET code = '231222' WHERE name = '兰西县' AND city = '绥化市';
UPDATE biz_region SET code = '231223' WHERE name = '青冈县' AND city = '绥化市';
UPDATE biz_region SET code = '231224' WHERE name = '庆安县' AND city = '绥化市';
UPDATE biz_region SET code = '231225' WHERE name = '明水县' AND city = '绥化市';
UPDATE biz_region SET code = '231226' WHERE name = '绥棱县' AND city = '绥化市';
UPDATE biz_region SET code = '231281' WHERE name = '安达市' AND city = '绥化市';
UPDATE biz_region SET code = '231282' WHERE name = '肇东市' AND city = '绥化市';
UPDATE biz_region SET code = '231283' WHERE name = '海伦市' AND city = '绥化市';

-- 绵阳市
--------------------------------------------------
UPDATE biz_region SET code = '510703' WHERE name = '涪城区' AND city = '绵阳市';
UPDATE biz_region SET code = '510704' WHERE name = '游仙区' AND city = '绵阳市';
UPDATE biz_region SET code = '510705' WHERE name = '安州区' AND city = '绵阳市';
UPDATE biz_region SET code = '510722' WHERE name = '三台县' AND city = '绵阳市';
UPDATE biz_region SET code = '510723' WHERE name = '盐亭县' AND city = '绵阳市';
UPDATE biz_region SET code = '510725' WHERE name = '梓潼县' AND city = '绵阳市';
UPDATE biz_region SET code = '510726' WHERE name = '北川羌族自治县' AND city = '绵阳市';
UPDATE biz_region SET code = '510727' WHERE name = '平武县' AND city = '绵阳市';
UPDATE biz_region SET code = '510781' WHERE name = '江油市' AND city = '绵阳市';

-- 聊城市
--------------------------------------------------
UPDATE biz_region SET code = '371502' WHERE name = '东昌府区' AND city = '聊城市';
UPDATE biz_region SET code = '371503' WHERE name = '茌平区' AND city = '聊城市';
UPDATE biz_region SET code = '371521' WHERE name = '阳谷县' AND city = '聊城市';
UPDATE biz_region SET code = '371522' WHERE name = '莘县' AND city = '聊城市';
UPDATE biz_region SET code = '371524' WHERE name = '东阿县' AND city = '聊城市';
UPDATE biz_region SET code = '371525' WHERE name = '冠县' AND city = '聊城市';
UPDATE biz_region SET code = '371526' WHERE name = '高唐县' AND city = '聊城市';
UPDATE biz_region SET code = '371581' WHERE name = '临清市' AND city = '聊城市';

-- 肇庆市
--------------------------------------------------
UPDATE biz_region SET code = '441202' WHERE name = '端州区' AND city = '肇庆市';
UPDATE biz_region SET code = '441203' WHERE name = '鼎湖区' AND city = '肇庆市';
UPDATE biz_region SET code = '441204' WHERE name = '高要区' AND city = '肇庆市';
UPDATE biz_region SET code = '441223' WHERE name = '广宁县' AND city = '肇庆市';
UPDATE biz_region SET code = '441224' WHERE name = '怀集县' AND city = '肇庆市';
UPDATE biz_region SET code = '441225' WHERE name = '封开县' AND city = '肇庆市';
UPDATE biz_region SET code = '441226' WHERE name = '德庆县' AND city = '肇庆市';
UPDATE biz_region SET code = '441284' WHERE name = '四会市' AND city = '肇庆市';

-- 自贡市
--------------------------------------------------
UPDATE biz_region SET code = '510302' WHERE name = '自流井区' AND city = '自贡市';
UPDATE biz_region SET code = '510303' WHERE name = '贡井区' AND city = '自贡市';
UPDATE biz_region SET code = '510304' WHERE name = '大安区' AND city = '自贡市';
UPDATE biz_region SET code = '510311' WHERE name = '沿滩区' AND city = '自贡市';
UPDATE biz_region SET code = '510321' WHERE name = '荣县' AND city = '自贡市';
UPDATE biz_region SET code = '510322' WHERE name = '富顺县' AND city = '自贡市';

-- 舟山市
--------------------------------------------------
UPDATE biz_region SET code = '330902' WHERE name = '定海区' AND city = '舟山市';
UPDATE biz_region SET code = '310107' WHERE name = '普陀区' AND city = '舟山市';
UPDATE biz_region SET code = '330921' WHERE name = '岱山县' AND city = '舟山市';
UPDATE biz_region SET code = '330922' WHERE name = '嵊泗县' AND city = '舟山市';

-- 芜湖市
--------------------------------------------------
UPDATE biz_region SET code = '340202' WHERE name = '镜湖区' AND city = '芜湖市';
UPDATE biz_region SET code = '340207' WHERE name = '鸠江区' AND city = '芜湖市';
UPDATE biz_region SET code = '340209' WHERE name = '弋江区' AND city = '芜湖市';
UPDATE biz_region SET code = '340210' WHERE name = '湾沚区' AND city = '芜湖市';
UPDATE biz_region SET code = '340212' WHERE name = '繁昌区' AND city = '芜湖市';
UPDATE biz_region SET code = '340223' WHERE name = '南陵县' AND city = '芜湖市';
UPDATE biz_region SET code = '340271' WHERE name = '芜湖经济技术开发区' AND city = '芜湖市';
UPDATE biz_region SET code = '340272' WHERE name = '安徽芜湖三山经济开发区' AND city = '芜湖市';
UPDATE biz_region SET code = '340281' WHERE name = '无为市' AND city = '芜湖市';

-- 苏州市
--------------------------------------------------
UPDATE biz_region SET code = '320505' WHERE name = '虎丘区' AND city = '苏州市';
UPDATE biz_region SET code = '320506' WHERE name = '吴中区' AND city = '苏州市';
UPDATE biz_region SET code = '320507' WHERE name = '相城区' AND city = '苏州市';
UPDATE biz_region SET code = '320508' WHERE name = '姑苏区' AND city = '苏州市';
UPDATE biz_region SET code = '320509' WHERE name = '吴江区' AND city = '苏州市';
UPDATE biz_region SET code = '320571' WHERE name = '苏州工业园区' AND city = '苏州市';
UPDATE biz_region SET code = '320581' WHERE name = '常熟市' AND city = '苏州市';
UPDATE biz_region SET code = '320582' WHERE name = '张家港市' AND city = '苏州市';
UPDATE biz_region SET code = '320583' WHERE name = '昆山市' AND city = '苏州市';
UPDATE biz_region SET code = '320585' WHERE name = '太仓市' AND city = '苏州市';

-- 茂名市
--------------------------------------------------
UPDATE biz_region SET code = '440902' WHERE name = '茂南区' AND city = '茂名市';
UPDATE biz_region SET code = '440904' WHERE name = '电白区' AND city = '茂名市';
UPDATE biz_region SET code = '440981' WHERE name = '高州市' AND city = '茂名市';
UPDATE biz_region SET code = '440982' WHERE name = '化州市' AND city = '茂名市';
UPDATE biz_region SET code = '440983' WHERE name = '信宜市' AND city = '茂名市';

-- 荆州市
--------------------------------------------------
UPDATE biz_region SET code = '421002' WHERE name = '沙市区' AND city = '荆州市';
UPDATE biz_region SET code = '421003' WHERE name = '荆州区' AND city = '荆州市';
UPDATE biz_region SET code = '421022' WHERE name = '公安县' AND city = '荆州市';
UPDATE biz_region SET code = '421024' WHERE name = '江陵县' AND city = '荆州市';
UPDATE biz_region SET code = '421071' WHERE name = '荆州经济技术开发区' AND city = '荆州市';
UPDATE biz_region SET code = '421081' WHERE name = '石首市' AND city = '荆州市';
UPDATE biz_region SET code = '421083' WHERE name = '洪湖市' AND city = '荆州市';
UPDATE biz_region SET code = '421087' WHERE name = '松滋市' AND city = '荆州市';
UPDATE biz_region SET code = '421088' WHERE name = '监利市' AND city = '荆州市';

-- 荆门市
--------------------------------------------------
UPDATE biz_region SET code = '420802' WHERE name = '东宝区' AND city = '荆门市';
UPDATE biz_region SET code = '420804' WHERE name = '掇刀区' AND city = '荆门市';
UPDATE biz_region SET code = '420822' WHERE name = '沙洋县' AND city = '荆门市';
UPDATE biz_region SET code = '420881' WHERE name = '钟祥市' AND city = '荆门市';
UPDATE biz_region SET code = '420882' WHERE name = '京山市' AND city = '荆门市';

-- 莆田市
--------------------------------------------------
UPDATE biz_region SET code = '350302' WHERE name = '城厢区' AND city = '莆田市';
UPDATE biz_region SET code = '350303' WHERE name = '涵江区' AND city = '莆田市';
UPDATE biz_region SET code = '350304' WHERE name = '荔城区' AND city = '莆田市';
UPDATE biz_region SET code = '350305' WHERE name = '秀屿区' AND city = '莆田市';
UPDATE biz_region SET code = '350322' WHERE name = '仙游县' AND city = '莆田市';

-- 菏泽市
--------------------------------------------------
UPDATE biz_region SET code = '371702' WHERE name = '牡丹区' AND city = '菏泽市';
UPDATE biz_region SET code = '371703' WHERE name = '定陶区' AND city = '菏泽市';
UPDATE biz_region SET code = '371721' WHERE name = '曹县' AND city = '菏泽市';
UPDATE biz_region SET code = '371722' WHERE name = '单县' AND city = '菏泽市';
UPDATE biz_region SET code = '371723' WHERE name = '成武县' AND city = '菏泽市';
UPDATE biz_region SET code = '371724' WHERE name = '巨野县' AND city = '菏泽市';
UPDATE biz_region SET code = '371725' WHERE name = '郓城县' AND city = '菏泽市';
UPDATE biz_region SET code = '371726' WHERE name = '鄄城县' AND city = '菏泽市';
UPDATE biz_region SET code = '371728' WHERE name = '东明县' AND city = '菏泽市';
UPDATE biz_region SET code = '371771' WHERE name = '菏泽经济技术开发区' AND city = '菏泽市';
UPDATE biz_region SET code = '371772' WHERE name = '菏泽高新技术开发区' AND city = '菏泽市';

-- 萍乡市
--------------------------------------------------
UPDATE biz_region SET code = '360302' WHERE name = '安源区' AND city = '萍乡市';
UPDATE biz_region SET code = '360313' WHERE name = '湘东区' AND city = '萍乡市';
UPDATE biz_region SET code = '360321' WHERE name = '莲花县' AND city = '萍乡市';
UPDATE biz_region SET code = '360322' WHERE name = '上栗县' AND city = '萍乡市';
UPDATE biz_region SET code = '360323' WHERE name = '芦溪县' AND city = '萍乡市';

-- 营口市
--------------------------------------------------
UPDATE biz_region SET code = '210802' WHERE name = '站前区' AND city = '营口市';
UPDATE biz_region SET code = '210803' WHERE name = '西市区' AND city = '营口市';
UPDATE biz_region SET code = '210804' WHERE name = '鲅鱼圈区' AND city = '营口市';
UPDATE biz_region SET code = '210811' WHERE name = '老边区' AND city = '营口市';
UPDATE biz_region SET code = '210881' WHERE name = '盖州市' AND city = '营口市';
UPDATE biz_region SET code = '210882' WHERE name = '大石桥市' AND city = '营口市';

-- 葫芦岛市
--------------------------------------------------
UPDATE biz_region SET code = '211402' WHERE name = '连山区' AND city = '葫芦岛市';
UPDATE biz_region SET code = '211403' WHERE name = '龙港区' AND city = '葫芦岛市';
UPDATE biz_region SET code = '211404' WHERE name = '南票区' AND city = '葫芦岛市';
UPDATE biz_region SET code = '211421' WHERE name = '绥中县' AND city = '葫芦岛市';
UPDATE biz_region SET code = '211422' WHERE name = '建昌县' AND city = '葫芦岛市';
UPDATE biz_region SET code = '211481' WHERE name = '兴城市' AND city = '葫芦岛市';

-- 蚌埠市
--------------------------------------------------
UPDATE biz_region SET code = '340302' WHERE name = '龙子湖区' AND city = '蚌埠市';
UPDATE biz_region SET code = '340303' WHERE name = '蚌山区' AND city = '蚌埠市';
UPDATE biz_region SET code = '340304' WHERE name = '禹会区' AND city = '蚌埠市';
UPDATE biz_region SET code = '340311' WHERE name = '淮上区' AND city = '蚌埠市';
UPDATE biz_region SET code = '340321' WHERE name = '怀远县' AND city = '蚌埠市';
UPDATE biz_region SET code = '340322' WHERE name = '五河县' AND city = '蚌埠市';
UPDATE biz_region SET code = '340323' WHERE name = '固镇县' AND city = '蚌埠市';
UPDATE biz_region SET code = '340371' WHERE name = '蚌埠市高新技术开发区' AND city = '蚌埠市';
UPDATE biz_region SET code = '340372' WHERE name = '蚌埠市经济开发区' AND city = '蚌埠市';

-- 衡水市
--------------------------------------------------
UPDATE biz_region SET code = '131102' WHERE name = '桃城区' AND city = '衡水市';
UPDATE biz_region SET code = '131103' WHERE name = '冀州区' AND city = '衡水市';
UPDATE biz_region SET code = '131121' WHERE name = '枣强县' AND city = '衡水市';
UPDATE biz_region SET code = '131122' WHERE name = '武邑县' AND city = '衡水市';
UPDATE biz_region SET code = '131123' WHERE name = '武强县' AND city = '衡水市';
UPDATE biz_region SET code = '131124' WHERE name = '饶阳县' AND city = '衡水市';
UPDATE biz_region SET code = '131125' WHERE name = '安平县' AND city = '衡水市';
UPDATE biz_region SET code = '131126' WHERE name = '故城县' AND city = '衡水市';
UPDATE biz_region SET code = '131127' WHERE name = '景县' AND city = '衡水市';
UPDATE biz_region SET code = '131128' WHERE name = '阜城县' AND city = '衡水市';
UPDATE biz_region SET code = '131171' WHERE name = '河北衡水高新技术产业开发区' AND city = '衡水市';
UPDATE biz_region SET code = '131172' WHERE name = '衡水滨湖新区' AND city = '衡水市';
UPDATE biz_region SET code = '131182' WHERE name = '深州市' AND city = '衡水市';

-- 衡阳市
--------------------------------------------------
UPDATE biz_region SET code = '430405' WHERE name = '珠晖区' AND city = '衡阳市';
UPDATE biz_region SET code = '430406' WHERE name = '雁峰区' AND city = '衡阳市';
UPDATE biz_region SET code = '430407' WHERE name = '石鼓区' AND city = '衡阳市';
UPDATE biz_region SET code = '430408' WHERE name = '蒸湘区' AND city = '衡阳市';
UPDATE biz_region SET code = '430412' WHERE name = '南岳区' AND city = '衡阳市';
UPDATE biz_region SET code = '430421' WHERE name = '衡阳县' AND city = '衡阳市';
UPDATE biz_region SET code = '430422' WHERE name = '衡南县' AND city = '衡阳市';
UPDATE biz_region SET code = '430423' WHERE name = '衡山县' AND city = '衡阳市';
UPDATE biz_region SET code = '430424' WHERE name = '衡东县' AND city = '衡阳市';
UPDATE biz_region SET code = '430426' WHERE name = '祁东县' AND city = '衡阳市';
UPDATE biz_region SET code = '430471' WHERE name = '衡阳综合保税区' AND city = '衡阳市';
UPDATE biz_region SET code = '430472' WHERE name = '湖南衡阳高新技术产业园区' AND city = '衡阳市';
UPDATE biz_region SET code = '430473' WHERE name = '湖南衡阳松木经济开发区' AND city = '衡阳市';
UPDATE biz_region SET code = '430481' WHERE name = '耒阳市' AND city = '衡阳市';
UPDATE biz_region SET code = '430482' WHERE name = '常宁市' AND city = '衡阳市';

-- 衢州市
--------------------------------------------------
UPDATE biz_region SET code = '330802' WHERE name = '柯城区' AND city = '衢州市';
UPDATE biz_region SET code = '330803' WHERE name = '衢江区' AND city = '衢州市';
UPDATE biz_region SET code = '330822' WHERE name = '常山县' AND city = '衢州市';
UPDATE biz_region SET code = '330824' WHERE name = '开化县' AND city = '衢州市';
UPDATE biz_region SET code = '330825' WHERE name = '龙游县' AND city = '衢州市';
UPDATE biz_region SET code = '330881' WHERE name = '江山市' AND city = '衢州市';

-- 襄阳市
--------------------------------------------------
UPDATE biz_region SET code = '420602' WHERE name = '襄城区' AND city = '襄阳市';
UPDATE biz_region SET code = '420606' WHERE name = '樊城区' AND city = '襄阳市';
UPDATE biz_region SET code = '420607' WHERE name = '襄州区' AND city = '襄阳市';
UPDATE biz_region SET code = '420624' WHERE name = '南漳县' AND city = '襄阳市';
UPDATE biz_region SET code = '420625' WHERE name = '谷城县' AND city = '襄阳市';
UPDATE biz_region SET code = '420626' WHERE name = '保康县' AND city = '襄阳市';
UPDATE biz_region SET code = '420682' WHERE name = '老河口市' AND city = '襄阳市';
UPDATE biz_region SET code = '420683' WHERE name = '枣阳市' AND city = '襄阳市';
UPDATE biz_region SET code = '420684' WHERE name = '宜城市' AND city = '襄阳市';

-- 西双版纳傣族自治州
--------------------------------------------------
UPDATE biz_region SET code = '532801' WHERE name = '景洪市' AND city = '西双版纳傣族自治州';
UPDATE biz_region SET code = '532822' WHERE name = '勐海县' AND city = '西双版纳傣族自治州';
UPDATE biz_region SET code = '532823' WHERE name = '勐腊县' AND city = '西双版纳傣族自治州';

-- 西宁市
--------------------------------------------------
UPDATE biz_region SET code = '630102' WHERE name = '城东区' AND city = '西宁市';
UPDATE biz_region SET code = '630103' WHERE name = '城中区' AND city = '西宁市';
UPDATE biz_region SET code = '630104' WHERE name = '城西区' AND city = '西宁市';
UPDATE biz_region SET code = '630105' WHERE name = '城北区' AND city = '西宁市';
UPDATE biz_region SET code = '630106' WHERE name = '湟中区' AND city = '西宁市';
UPDATE biz_region SET code = '630121' WHERE name = '大通回族土族自治县' AND city = '西宁市';
UPDATE biz_region SET code = '630123' WHERE name = '湟源县' AND city = '西宁市';

-- 西安市
--------------------------------------------------
UPDATE biz_region SET code = '610102' WHERE name = '新城区' AND city = '西安市';
UPDATE biz_region SET code = '610103' WHERE name = '碑林区' AND city = '西安市';
UPDATE biz_region SET code = '610104' WHERE name = '莲湖区' AND city = '西安市';
UPDATE biz_region SET code = '610111' WHERE name = '灞桥区' AND city = '西安市';
UPDATE biz_region SET code = '610112' WHERE name = '未央区' AND city = '西安市';
UPDATE biz_region SET code = '610113' WHERE name = '雁塔区' AND city = '西安市';
UPDATE biz_region SET code = '610114' WHERE name = '阎良区' AND city = '西安市';
UPDATE biz_region SET code = '610115' WHERE name = '临潼区' AND city = '西安市';
UPDATE biz_region SET code = '610116' WHERE name = '长安区' AND city = '西安市';
UPDATE biz_region SET code = '610117' WHERE name = '高陵区' AND city = '西安市';
UPDATE biz_region SET code = '610118' WHERE name = '鄠邑区' AND city = '西安市';
UPDATE biz_region SET code = '610122' WHERE name = '蓝田县' AND city = '西安市';
UPDATE biz_region SET code = '610124' WHERE name = '周至县' AND city = '西安市';

-- 许昌市
--------------------------------------------------
UPDATE biz_region SET code = '411002' WHERE name = '魏都区' AND city = '许昌市';
UPDATE biz_region SET code = '411003' WHERE name = '建安区' AND city = '许昌市';
UPDATE biz_region SET code = '411024' WHERE name = '鄢陵县' AND city = '许昌市';
UPDATE biz_region SET code = '411025' WHERE name = '襄城县' AND city = '许昌市';
UPDATE biz_region SET code = '411071' WHERE name = '许昌经济技术开发区' AND city = '许昌市';
UPDATE biz_region SET code = '411081' WHERE name = '禹州市' AND city = '许昌市';
UPDATE biz_region SET code = '411082' WHERE name = '长葛市' AND city = '许昌市';

-- 贵港市
--------------------------------------------------
UPDATE biz_region SET code = '450802' WHERE name = '港北区' AND city = '贵港市';
UPDATE biz_region SET code = '450803' WHERE name = '港南区' AND city = '贵港市';
UPDATE biz_region SET code = '450804' WHERE name = '覃塘区' AND city = '贵港市';
UPDATE biz_region SET code = '450821' WHERE name = '平南县' AND city = '贵港市';
UPDATE biz_region SET code = '450881' WHERE name = '桂平市' AND city = '贵港市';

-- 贵阳市
--------------------------------------------------
UPDATE biz_region SET code = '520102' WHERE name = '南明区' AND city = '贵阳市';
UPDATE biz_region SET code = '520103' WHERE name = '云岩区' AND city = '贵阳市';
UPDATE biz_region SET code = '520111' WHERE name = '花溪区' AND city = '贵阳市';
UPDATE biz_region SET code = '520112' WHERE name = '乌当区' AND city = '贵阳市';
UPDATE biz_region SET code = '520113' WHERE name = '白云区' AND city = '贵阳市';
UPDATE biz_region SET code = '520115' WHERE name = '观山湖区' AND city = '贵阳市';
UPDATE biz_region SET code = '520121' WHERE name = '开阳县' AND city = '贵阳市';
UPDATE biz_region SET code = '520122' WHERE name = '息烽县' AND city = '贵阳市';
UPDATE biz_region SET code = '520123' WHERE name = '修文县' AND city = '贵阳市';
UPDATE biz_region SET code = '520181' WHERE name = '清镇市' AND city = '贵阳市';

-- 贺州市
--------------------------------------------------
UPDATE biz_region SET code = '451102' WHERE name = '八步区' AND city = '贺州市';
UPDATE biz_region SET code = '451103' WHERE name = '平桂区' AND city = '贺州市';
UPDATE biz_region SET code = '451121' WHERE name = '昭平县' AND city = '贺州市';
UPDATE biz_region SET code = '451122' WHERE name = '钟山县' AND city = '贺州市';
UPDATE biz_region SET code = '451123' WHERE name = '富川瑶族自治县' AND city = '贺州市';

-- 资阳市
--------------------------------------------------
UPDATE biz_region SET code = '512002' WHERE name = '雁江区' AND city = '资阳市';
UPDATE biz_region SET code = '512021' WHERE name = '安岳县' AND city = '资阳市';
UPDATE biz_region SET code = '512022' WHERE name = '乐至县' AND city = '资阳市';

-- 赣州市
--------------------------------------------------
UPDATE biz_region SET code = '360702' WHERE name = '章贡区' AND city = '赣州市';
UPDATE biz_region SET code = '360703' WHERE name = '南康区' AND city = '赣州市';
UPDATE biz_region SET code = '360704' WHERE name = '赣县区' AND city = '赣州市';
UPDATE biz_region SET code = '360722' WHERE name = '信丰县' AND city = '赣州市';
UPDATE biz_region SET code = '360723' WHERE name = '大余县' AND city = '赣州市';
UPDATE biz_region SET code = '360724' WHERE name = '上犹县' AND city = '赣州市';
UPDATE biz_region SET code = '360725' WHERE name = '崇义县' AND city = '赣州市';
UPDATE biz_region SET code = '360726' WHERE name = '安远县' AND city = '赣州市';
UPDATE biz_region SET code = '360728' WHERE name = '定南县' AND city = '赣州市';
UPDATE biz_region SET code = '360729' WHERE name = '全南县' AND city = '赣州市';
UPDATE biz_region SET code = '360730' WHERE name = '宁都县' AND city = '赣州市';
UPDATE biz_region SET code = '360731' WHERE name = '于都县' AND city = '赣州市';
UPDATE biz_region SET code = '360732' WHERE name = '兴国县' AND city = '赣州市';
UPDATE biz_region SET code = '360733' WHERE name = '会昌县' AND city = '赣州市';
UPDATE biz_region SET code = '360734' WHERE name = '寻乌县' AND city = '赣州市';
UPDATE biz_region SET code = '360735' WHERE name = '石城县' AND city = '赣州市';
UPDATE biz_region SET code = '360781' WHERE name = '瑞金市' AND city = '赣州市';
UPDATE biz_region SET code = '360783' WHERE name = '龙南市' AND city = '赣州市';

-- 赤峰市
--------------------------------------------------
UPDATE biz_region SET code = '150402' WHERE name = '红山区' AND city = '赤峰市';
UPDATE biz_region SET code = '150403' WHERE name = '元宝山区' AND city = '赤峰市';
UPDATE biz_region SET code = '150404' WHERE name = '松山区' AND city = '赤峰市';
UPDATE biz_region SET code = '150421' WHERE name = '阿鲁科尔沁旗' AND city = '赤峰市';
UPDATE biz_region SET code = '150422' WHERE name = '巴林左旗' AND city = '赤峰市';
UPDATE biz_region SET code = '150423' WHERE name = '巴林右旗' AND city = '赤峰市';
UPDATE biz_region SET code = '150424' WHERE name = '林西县' AND city = '赤峰市';
UPDATE biz_region SET code = '150425' WHERE name = '克什克腾旗' AND city = '赤峰市';
UPDATE biz_region SET code = '150426' WHERE name = '翁牛特旗' AND city = '赤峰市';
UPDATE biz_region SET code = '150428' WHERE name = '喀喇沁旗' AND city = '赤峰市';
UPDATE biz_region SET code = '150429' WHERE name = '宁城县' AND city = '赤峰市';
UPDATE biz_region SET code = '150430' WHERE name = '敖汉旗' AND city = '赤峰市';

-- 辽源市
--------------------------------------------------
UPDATE biz_region SET code = '220402' WHERE name = '龙山区' AND city = '辽源市';
UPDATE biz_region SET code = '220403' WHERE name = '西安区' AND city = '辽源市';
UPDATE biz_region SET code = '220421' WHERE name = '东丰县' AND city = '辽源市';
UPDATE biz_region SET code = '220422' WHERE name = '东辽县' AND city = '辽源市';

-- 辽阳市
--------------------------------------------------
UPDATE biz_region SET code = '211002' WHERE name = '白塔区' AND city = '辽阳市';
UPDATE biz_region SET code = '211003' WHERE name = '文圣区' AND city = '辽阳市';
UPDATE biz_region SET code = '211004' WHERE name = '宏伟区' AND city = '辽阳市';
UPDATE biz_region SET code = '211005' WHERE name = '弓长岭区' AND city = '辽阳市';
UPDATE biz_region SET code = '211011' WHERE name = '太子河区' AND city = '辽阳市';
UPDATE biz_region SET code = '211021' WHERE name = '辽阳县' AND city = '辽阳市';
UPDATE biz_region SET code = '211081' WHERE name = '灯塔市' AND city = '辽阳市';

-- 达州市
--------------------------------------------------
UPDATE biz_region SET code = '511702' WHERE name = '通川区' AND city = '达州市';
UPDATE biz_region SET code = '511703' WHERE name = '达川区' AND city = '达州市';
UPDATE biz_region SET code = '511722' WHERE name = '宣汉县' AND city = '达州市';
UPDATE biz_region SET code = '511723' WHERE name = '开江县' AND city = '达州市';
UPDATE biz_region SET code = '511724' WHERE name = '大竹县' AND city = '达州市';
UPDATE biz_region SET code = '511725' WHERE name = '渠县' AND city = '达州市';
UPDATE biz_region SET code = '511771' WHERE name = '达州经济开发区' AND city = '达州市';
UPDATE biz_region SET code = '511781' WHERE name = '万源市' AND city = '达州市';

-- 运城市
--------------------------------------------------
UPDATE biz_region SET code = '140802' WHERE name = '盐湖区' AND city = '运城市';
UPDATE biz_region SET code = '140821' WHERE name = '临猗县' AND city = '运城市';
UPDATE biz_region SET code = '140822' WHERE name = '万荣县' AND city = '运城市';
UPDATE biz_region SET code = '140823' WHERE name = '闻喜县' AND city = '运城市';
UPDATE biz_region SET code = '140824' WHERE name = '稷山县' AND city = '运城市';
UPDATE biz_region SET code = '140825' WHERE name = '新绛县' AND city = '运城市';
UPDATE biz_region SET code = '140826' WHERE name = '绛县' AND city = '运城市';
UPDATE biz_region SET code = '140827' WHERE name = '垣曲县' AND city = '运城市';
UPDATE biz_region SET code = '140828' WHERE name = '夏县' AND city = '运城市';
UPDATE biz_region SET code = '140829' WHERE name = '平陆县' AND city = '运城市';
UPDATE biz_region SET code = '140830' WHERE name = '芮城县' AND city = '运城市';
UPDATE biz_region SET code = '140881' WHERE name = '永济市' AND city = '运城市';
UPDATE biz_region SET code = '140882' WHERE name = '河津市' AND city = '运城市';

-- 连云港市
--------------------------------------------------
UPDATE biz_region SET code = '320703' WHERE name = '连云区' AND city = '连云港市';
UPDATE biz_region SET code = '320706' WHERE name = '海州区' AND city = '连云港市';
UPDATE biz_region SET code = '320707' WHERE name = '赣榆区' AND city = '连云港市';
UPDATE biz_region SET code = '320722' WHERE name = '东海县' AND city = '连云港市';
UPDATE biz_region SET code = '320723' WHERE name = '灌云县' AND city = '连云港市';
UPDATE biz_region SET code = '320724' WHERE name = '灌南县' AND city = '连云港市';
UPDATE biz_region SET code = '320771' WHERE name = '连云港经济技术开发区' AND city = '连云港市';
UPDATE biz_region SET code = '320772' WHERE name = '连云港高新技术产业开发区' AND city = '连云港市';

-- 迪庆藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '533401' WHERE name = '香格里拉市' AND city = '迪庆藏族自治州';
UPDATE biz_region SET code = '533422' WHERE name = '德钦县' AND city = '迪庆藏族自治州';
UPDATE biz_region SET code = '533423' WHERE name = '维西傈僳族自治县' AND city = '迪庆藏族自治州';

-- 通化市
--------------------------------------------------
UPDATE biz_region SET code = '220502' WHERE name = '东昌区' AND city = '通化市';
UPDATE biz_region SET code = '220503' WHERE name = '二道江区' AND city = '通化市';
UPDATE biz_region SET code = '220521' WHERE name = '通化县' AND city = '通化市';
UPDATE biz_region SET code = '220523' WHERE name = '辉南县' AND city = '通化市';
UPDATE biz_region SET code = '220524' WHERE name = '柳河县' AND city = '通化市';
UPDATE biz_region SET code = '220581' WHERE name = '梅河口市' AND city = '通化市';
UPDATE biz_region SET code = '220582' WHERE name = '集安市' AND city = '通化市';

-- 通辽市
--------------------------------------------------
UPDATE biz_region SET code = '150502' WHERE name = '科尔沁区' AND city = '通辽市';
UPDATE biz_region SET code = '150521' WHERE name = '科尔沁左翼中旗' AND city = '通辽市';
UPDATE biz_region SET code = '150522' WHERE name = '科尔沁左翼后旗' AND city = '通辽市';
UPDATE biz_region SET code = '150523' WHERE name = '开鲁县' AND city = '通辽市';
UPDATE biz_region SET code = '150524' WHERE name = '库伦旗' AND city = '通辽市';
UPDATE biz_region SET code = '150525' WHERE name = '奈曼旗' AND city = '通辽市';
UPDATE biz_region SET code = '150526' WHERE name = '扎鲁特旗' AND city = '通辽市';
UPDATE biz_region SET code = '150571' WHERE name = '通辽经济技术开发区' AND city = '通辽市';
UPDATE biz_region SET code = '150581' WHERE name = '霍林郭勒市' AND city = '通辽市';

-- 遂宁市
--------------------------------------------------
UPDATE biz_region SET code = '510903' WHERE name = '船山区' AND city = '遂宁市';
UPDATE biz_region SET code = '510904' WHERE name = '安居区' AND city = '遂宁市';
UPDATE biz_region SET code = '510921' WHERE name = '蓬溪县' AND city = '遂宁市';
UPDATE biz_region SET code = '510923' WHERE name = '大英县' AND city = '遂宁市';
UPDATE biz_region SET code = '510981' WHERE name = '射洪市' AND city = '遂宁市';

-- 遵义市
--------------------------------------------------
UPDATE biz_region SET code = '520302' WHERE name = '红花岗区' AND city = '遵义市';
UPDATE biz_region SET code = '520303' WHERE name = '汇川区' AND city = '遵义市';
UPDATE biz_region SET code = '520304' WHERE name = '播州区' AND city = '遵义市';
UPDATE biz_region SET code = '520322' WHERE name = '桐梓县' AND city = '遵义市';
UPDATE biz_region SET code = '520323' WHERE name = '绥阳县' AND city = '遵义市';
UPDATE biz_region SET code = '520324' WHERE name = '正安县' AND city = '遵义市';
UPDATE biz_region SET code = '520325' WHERE name = '道真仡佬族苗族自治县' AND city = '遵义市';
UPDATE biz_region SET code = '520326' WHERE name = '务川仡佬族苗族自治县' AND city = '遵义市';
UPDATE biz_region SET code = '520327' WHERE name = '凤冈县' AND city = '遵义市';
UPDATE biz_region SET code = '520328' WHERE name = '湄潭县' AND city = '遵义市';
UPDATE biz_region SET code = '520329' WHERE name = '余庆县' AND city = '遵义市';
UPDATE biz_region SET code = '520330' WHERE name = '习水县' AND city = '遵义市';
UPDATE biz_region SET code = '520381' WHERE name = '赤水市' AND city = '遵义市';
UPDATE biz_region SET code = '520382' WHERE name = '仁怀市' AND city = '遵义市';

-- 邢台市
--------------------------------------------------
UPDATE biz_region SET code = '130502' WHERE name = '襄都区' AND city = '邢台市';
UPDATE biz_region SET code = '130503' WHERE name = '信都区' AND city = '邢台市';
UPDATE biz_region SET code = '130505' WHERE name = '任泽区' AND city = '邢台市';
UPDATE biz_region SET code = '130506' WHERE name = '南和区' AND city = '邢台市';
UPDATE biz_region SET code = '130522' WHERE name = '临城县' AND city = '邢台市';
UPDATE biz_region SET code = '130523' WHERE name = '内丘县' AND city = '邢台市';
UPDATE biz_region SET code = '130524' WHERE name = '柏乡县' AND city = '邢台市';
UPDATE biz_region SET code = '130525' WHERE name = '隆尧县' AND city = '邢台市';
UPDATE biz_region SET code = '130528' WHERE name = '宁晋县' AND city = '邢台市';
UPDATE biz_region SET code = '130529' WHERE name = '巨鹿县' AND city = '邢台市';
UPDATE biz_region SET code = '130530' WHERE name = '新河县' AND city = '邢台市';
UPDATE biz_region SET code = '130531' WHERE name = '广宗县' AND city = '邢台市';
UPDATE biz_region SET code = '130532' WHERE name = '平乡县' AND city = '邢台市';
UPDATE biz_region SET code = '130533' WHERE name = '威县' AND city = '邢台市';
UPDATE biz_region SET code = '130534' WHERE name = '清河县' AND city = '邢台市';
UPDATE biz_region SET code = '130535' WHERE name = '临西县' AND city = '邢台市';
UPDATE biz_region SET code = '130571' WHERE name = '河北邢台经济开发区' AND city = '邢台市';
UPDATE biz_region SET code = '130581' WHERE name = '南宫市' AND city = '邢台市';
UPDATE biz_region SET code = '130582' WHERE name = '沙河市' AND city = '邢台市';

-- 那曲市
--------------------------------------------------
UPDATE biz_region SET code = '540602' WHERE name = '色尼区' AND city = '那曲市';
UPDATE biz_region SET code = '540621' WHERE name = '嘉黎县' AND city = '那曲市';
UPDATE biz_region SET code = '540622' WHERE name = '比如县' AND city = '那曲市';
UPDATE biz_region SET code = '540623' WHERE name = '聂荣县' AND city = '那曲市';
UPDATE biz_region SET code = '540624' WHERE name = '安多县' AND city = '那曲市';
UPDATE biz_region SET code = '540625' WHERE name = '申扎县' AND city = '那曲市';
UPDATE biz_region SET code = '540626' WHERE name = '索县' AND city = '那曲市';
UPDATE biz_region SET code = '540627' WHERE name = '班戈县' AND city = '那曲市';
UPDATE biz_region SET code = '540628' WHERE name = '巴青县' AND city = '那曲市';
UPDATE biz_region SET code = '540629' WHERE name = '尼玛县' AND city = '那曲市';
UPDATE biz_region SET code = '540630' WHERE name = '双湖县' AND city = '那曲市';

-- 邯郸市
--------------------------------------------------
UPDATE biz_region SET code = '130402' WHERE name = '邯山区' AND city = '邯郸市';
UPDATE biz_region SET code = '130403' WHERE name = '丛台区' AND city = '邯郸市';
UPDATE biz_region SET code = '130404' WHERE name = '复兴区' AND city = '邯郸市';
UPDATE biz_region SET code = '130406' WHERE name = '峰峰矿区' AND city = '邯郸市';
UPDATE biz_region SET code = '130407' WHERE name = '肥乡区' AND city = '邯郸市';
UPDATE biz_region SET code = '130408' WHERE name = '永年区' AND city = '邯郸市';
UPDATE biz_region SET code = '130423' WHERE name = '临漳县' AND city = '邯郸市';
UPDATE biz_region SET code = '130424' WHERE name = '成安县' AND city = '邯郸市';
UPDATE biz_region SET code = '130425' WHERE name = '大名县' AND city = '邯郸市';
UPDATE biz_region SET code = '130426' WHERE name = '涉县' AND city = '邯郸市';
UPDATE biz_region SET code = '130427' WHERE name = '磁县' AND city = '邯郸市';
UPDATE biz_region SET code = '130430' WHERE name = '邱县' AND city = '邯郸市';
UPDATE biz_region SET code = '130431' WHERE name = '鸡泽县' AND city = '邯郸市';
UPDATE biz_region SET code = '130432' WHERE name = '广平县' AND city = '邯郸市';
UPDATE biz_region SET code = '130433' WHERE name = '馆陶县' AND city = '邯郸市';
UPDATE biz_region SET code = '130434' WHERE name = '魏县' AND city = '邯郸市';
UPDATE biz_region SET code = '130435' WHERE name = '曲周县' AND city = '邯郸市';
UPDATE biz_region SET code = '130471' WHERE name = '邯郸经济技术开发区' AND city = '邯郸市';
UPDATE biz_region SET code = '130473' WHERE name = '邯郸冀南新区' AND city = '邯郸市';
UPDATE biz_region SET code = '130481' WHERE name = '武安市' AND city = '邯郸市';

-- 邵阳市
--------------------------------------------------
UPDATE biz_region SET code = '430502' WHERE name = '双清区' AND city = '邵阳市';
UPDATE biz_region SET code = '430503' WHERE name = '大祥区' AND city = '邵阳市';
UPDATE biz_region SET code = '430511' WHERE name = '北塔区' AND city = '邵阳市';
UPDATE biz_region SET code = '430522' WHERE name = '新邵县' AND city = '邵阳市';
UPDATE biz_region SET code = '430523' WHERE name = '邵阳县' AND city = '邵阳市';
UPDATE biz_region SET code = '430524' WHERE name = '隆回县' AND city = '邵阳市';
UPDATE biz_region SET code = '430525' WHERE name = '洞口县' AND city = '邵阳市';
UPDATE biz_region SET code = '430527' WHERE name = '绥宁县' AND city = '邵阳市';
UPDATE biz_region SET code = '430528' WHERE name = '新宁县' AND city = '邵阳市';
UPDATE biz_region SET code = '430529' WHERE name = '城步苗族自治县' AND city = '邵阳市';
UPDATE biz_region SET code = '430581' WHERE name = '武冈市' AND city = '邵阳市';
UPDATE biz_region SET code = '430582' WHERE name = '邵东市' AND city = '邵阳市';

-- 郑州市
--------------------------------------------------
UPDATE biz_region SET code = '410102' WHERE name = '中原区' AND city = '郑州市';
UPDATE biz_region SET code = '410103' WHERE name = '二七区' AND city = '郑州市';
UPDATE biz_region SET code = '410104' WHERE name = '管城回族区' AND city = '郑州市';
UPDATE biz_region SET code = '410105' WHERE name = '金水区' AND city = '郑州市';
UPDATE biz_region SET code = '410106' WHERE name = '上街区' AND city = '郑州市';
UPDATE biz_region SET code = '410108' WHERE name = '惠济区' AND city = '郑州市';
UPDATE biz_region SET code = '410122' WHERE name = '中牟县' AND city = '郑州市';
UPDATE biz_region SET code = '410171' WHERE name = '郑州经济技术开发区' AND city = '郑州市';
UPDATE biz_region SET code = '410172' WHERE name = '郑州高新技术产业开发区' AND city = '郑州市';
UPDATE biz_region SET code = '410173' WHERE name = '郑州航空港经济综合实验区' AND city = '郑州市';
UPDATE biz_region SET code = '410181' WHERE name = '巩义市' AND city = '郑州市';
UPDATE biz_region SET code = '410182' WHERE name = '荥阳市' AND city = '郑州市';
UPDATE biz_region SET code = '410183' WHERE name = '新密市' AND city = '郑州市';
UPDATE biz_region SET code = '410184' WHERE name = '新郑市' AND city = '郑州市';
UPDATE biz_region SET code = '410185' WHERE name = '登封市' AND city = '郑州市';

-- 郴州市
--------------------------------------------------
UPDATE biz_region SET code = '431002' WHERE name = '北湖区' AND city = '郴州市';
UPDATE biz_region SET code = '431003' WHERE name = '苏仙区' AND city = '郴州市';
UPDATE biz_region SET code = '431021' WHERE name = '桂阳县' AND city = '郴州市';
UPDATE biz_region SET code = '431022' WHERE name = '宜章县' AND city = '郴州市';
UPDATE biz_region SET code = '431023' WHERE name = '永兴县' AND city = '郴州市';
UPDATE biz_region SET code = '431024' WHERE name = '嘉禾县' AND city = '郴州市';
UPDATE biz_region SET code = '431025' WHERE name = '临武县' AND city = '郴州市';
UPDATE biz_region SET code = '431026' WHERE name = '汝城县' AND city = '郴州市';
UPDATE biz_region SET code = '431027' WHERE name = '桂东县' AND city = '郴州市';
UPDATE biz_region SET code = '431028' WHERE name = '安仁县' AND city = '郴州市';
UPDATE biz_region SET code = '431081' WHERE name = '资兴市' AND city = '郴州市';

-- 鄂尔多斯市
--------------------------------------------------
UPDATE biz_region SET code = '150602' WHERE name = '东胜区' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150603' WHERE name = '康巴什区' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150621' WHERE name = '达拉特旗' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150622' WHERE name = '准格尔旗' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150623' WHERE name = '鄂托克前旗' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150624' WHERE name = '鄂托克旗' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150625' WHERE name = '杭锦旗' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150626' WHERE name = '乌审旗' AND city = '鄂尔多斯市';
UPDATE biz_region SET code = '150627' WHERE name = '伊金霍洛旗' AND city = '鄂尔多斯市';

-- 鄂州市
--------------------------------------------------
UPDATE biz_region SET code = '420702' WHERE name = '梁子湖区' AND city = '鄂州市';
UPDATE biz_region SET code = '420703' WHERE name = '华容区' AND city = '鄂州市';
UPDATE biz_region SET code = '420704' WHERE name = '鄂城区' AND city = '鄂州市';

-- 酒泉市
--------------------------------------------------
UPDATE biz_region SET code = '620902' WHERE name = '肃州区' AND city = '酒泉市';
UPDATE biz_region SET code = '620921' WHERE name = '金塔县' AND city = '酒泉市';
UPDATE biz_region SET code = '620922' WHERE name = '瓜州县' AND city = '酒泉市';
UPDATE biz_region SET code = '620923' WHERE name = '肃北蒙古族自治县' AND city = '酒泉市';
UPDATE biz_region SET code = '620924' WHERE name = '阿克塞哈萨克族自治县' AND city = '酒泉市';
UPDATE biz_region SET code = '620981' WHERE name = '玉门市' AND city = '酒泉市';
UPDATE biz_region SET code = '620982' WHERE name = '敦煌市' AND city = '酒泉市';

-- 重庆
--------------------------------------------------
UPDATE biz_region SET code = '500101' WHERE name = '万州区' AND city = '重庆';
UPDATE biz_region SET code = '500102' WHERE name = '涪陵区' AND city = '重庆';
UPDATE biz_region SET code = '500103' WHERE name = '渝中区' AND city = '重庆';
UPDATE biz_region SET code = '500104' WHERE name = '大渡口区' AND city = '重庆';
UPDATE biz_region SET code = '500105' WHERE name = '江北区' AND city = '重庆';
UPDATE biz_region SET code = '500106' WHERE name = '沙坪坝区' AND city = '重庆';
UPDATE biz_region SET code = '500107' WHERE name = '九龙坡区' AND city = '重庆';
UPDATE biz_region SET code = '500108' WHERE name = '南岸区' AND city = '重庆';
UPDATE biz_region SET code = '500109' WHERE name = '北碚区' AND city = '重庆';
UPDATE biz_region SET code = '500110' WHERE name = '綦江区' AND city = '重庆';
UPDATE biz_region SET code = '500111' WHERE name = '大足区' AND city = '重庆';
UPDATE biz_region SET code = '500112' WHERE name = '渝北区' AND city = '重庆';
UPDATE biz_region SET code = '500113' WHERE name = '巴南区' AND city = '重庆';
UPDATE biz_region SET code = '500114' WHERE name = '黔江区' AND city = '重庆';
UPDATE biz_region SET code = '500115' WHERE name = '长寿区' AND city = '重庆';
UPDATE biz_region SET code = '500116' WHERE name = '江津区' AND city = '重庆';
UPDATE biz_region SET code = '500117' WHERE name = '合川区' AND city = '重庆';
UPDATE biz_region SET code = '500118' WHERE name = '永川区' AND city = '重庆';
UPDATE biz_region SET code = '500119' WHERE name = '南川区' AND city = '重庆';
UPDATE biz_region SET code = '500120' WHERE name = '璧山区' AND city = '重庆';
UPDATE biz_region SET code = '500229' WHERE name = '城口县' AND city = '重庆';
UPDATE biz_region SET code = '500230' WHERE name = '丰都县' AND city = '重庆';
UPDATE biz_region SET code = '500231' WHERE name = '垫江县' AND city = '重庆';
UPDATE biz_region SET code = '500233' WHERE name = '忠县' AND city = '重庆';
UPDATE biz_region SET code = '500235' WHERE name = '云阳县' AND city = '重庆';
UPDATE biz_region SET code = '500236' WHERE name = '奉节县' AND city = '重庆';
UPDATE biz_region SET code = '500237' WHERE name = '巫山县' AND city = '重庆';
UPDATE biz_region SET code = '500238' WHERE name = '巫溪县' AND city = '重庆';
UPDATE biz_region SET code = '500240' WHERE name = '石柱土家族自治县' AND city = '重庆';
UPDATE biz_region SET code = '500241' WHERE name = '秀山土家族苗族自治县' AND city = '重庆';
UPDATE biz_region SET code = '500242' WHERE name = '酉阳土家族苗族自治县' AND city = '重庆';
UPDATE biz_region SET code = '500243' WHERE name = '彭水苗族土家族自治县' AND city = '重庆';
UPDATE biz_region SET code = '500151' WHERE name = '铜梁区' AND city = '重庆';
UPDATE biz_region SET code = '500152' WHERE name = '潼南区' AND city = '重庆';
UPDATE biz_region SET code = '500153' WHERE name = '荣昌区' AND city = '重庆';
UPDATE biz_region SET code = '500154' WHERE name = '开州区' AND city = '重庆';
UPDATE biz_region SET code = '500155' WHERE name = '梁平区' AND city = '重庆';
UPDATE biz_region SET code = '500156' WHERE name = '武隆区' AND city = '重庆';

-- 金华市
--------------------------------------------------
UPDATE biz_region SET code = '330702' WHERE name = '婺城区' AND city = '金华市';
UPDATE biz_region SET code = '330703' WHERE name = '金东区' AND city = '金华市';
UPDATE biz_region SET code = '330723' WHERE name = '武义县' AND city = '金华市';
UPDATE biz_region SET code = '330726' WHERE name = '浦江县' AND city = '金华市';
UPDATE biz_region SET code = '330727' WHERE name = '磐安县' AND city = '金华市';
UPDATE biz_region SET code = '330781' WHERE name = '兰溪市' AND city = '金华市';
UPDATE biz_region SET code = '330782' WHERE name = '义乌市' AND city = '金华市';
UPDATE biz_region SET code = '330783' WHERE name = '东阳市' AND city = '金华市';
UPDATE biz_region SET code = '330784' WHERE name = '永康市' AND city = '金华市';

-- 金昌市
--------------------------------------------------
UPDATE biz_region SET code = '620302' WHERE name = '金川区' AND city = '金昌市';
UPDATE biz_region SET code = '620321' WHERE name = '永昌县' AND city = '金昌市';

-- 钦州市
--------------------------------------------------
UPDATE biz_region SET code = '450702' WHERE name = '钦南区' AND city = '钦州市';
UPDATE biz_region SET code = '450703' WHERE name = '钦北区' AND city = '钦州市';
UPDATE biz_region SET code = '450721' WHERE name = '灵山县' AND city = '钦州市';
UPDATE biz_region SET code = '450722' WHERE name = '浦北县' AND city = '钦州市';

-- 铁岭市
--------------------------------------------------
UPDATE biz_region SET code = '211202' WHERE name = '银州区' AND city = '铁岭市';
UPDATE biz_region SET code = '211204' WHERE name = '清河区' AND city = '铁岭市';
UPDATE biz_region SET code = '211221' WHERE name = '铁岭县' AND city = '铁岭市';
UPDATE biz_region SET code = '211223' WHERE name = '西丰县' AND city = '铁岭市';
UPDATE biz_region SET code = '211224' WHERE name = '昌图县' AND city = '铁岭市';
UPDATE biz_region SET code = '211281' WHERE name = '调兵山市' AND city = '铁岭市';
UPDATE biz_region SET code = '211282' WHERE name = '开原市' AND city = '铁岭市';

-- 铜仁市
--------------------------------------------------
UPDATE biz_region SET code = '520602' WHERE name = '碧江区' AND city = '铜仁市';
UPDATE biz_region SET code = '520603' WHERE name = '万山区' AND city = '铜仁市';
UPDATE biz_region SET code = '520621' WHERE name = '江口县' AND city = '铜仁市';
UPDATE biz_region SET code = '520622' WHERE name = '玉屏侗族自治县' AND city = '铜仁市';
UPDATE biz_region SET code = '520623' WHERE name = '石阡县' AND city = '铜仁市';
UPDATE biz_region SET code = '520624' WHERE name = '思南县' AND city = '铜仁市';
UPDATE biz_region SET code = '520625' WHERE name = '印江土家族苗族自治县' AND city = '铜仁市';
UPDATE biz_region SET code = '520626' WHERE name = '德江县' AND city = '铜仁市';
UPDATE biz_region SET code = '520627' WHERE name = '沿河土家族自治县' AND city = '铜仁市';
UPDATE biz_region SET code = '520628' WHERE name = '松桃苗族自治县' AND city = '铜仁市';

-- 铜川市
--------------------------------------------------
UPDATE biz_region SET code = '610202' WHERE name = '王益区' AND city = '铜川市';
UPDATE biz_region SET code = '610203' WHERE name = '印台区' AND city = '铜川市';
UPDATE biz_region SET code = '610204' WHERE name = '耀州区' AND city = '铜川市';
UPDATE biz_region SET code = '610222' WHERE name = '宜君县' AND city = '铜川市';

-- 铜陵市
--------------------------------------------------
UPDATE biz_region SET code = '340705' WHERE name = '铜官区' AND city = '铜陵市';
UPDATE biz_region SET code = '340706' WHERE name = '义安区' AND city = '铜陵市';
UPDATE biz_region SET code = '340711' WHERE name = '郊区' AND city = '铜陵市';
UPDATE biz_region SET code = '340722' WHERE name = '枞阳县' AND city = '铜陵市';

-- 银川市
--------------------------------------------------
UPDATE biz_region SET code = '640104' WHERE name = '兴庆区' AND city = '银川市';
UPDATE biz_region SET code = '640105' WHERE name = '西夏区' AND city = '银川市';
UPDATE biz_region SET code = '640106' WHERE name = '金凤区' AND city = '银川市';
UPDATE biz_region SET code = '640121' WHERE name = '永宁县' AND city = '银川市';
UPDATE biz_region SET code = '640122' WHERE name = '贺兰县' AND city = '银川市';
UPDATE biz_region SET code = '640181' WHERE name = '灵武市' AND city = '银川市';

-- 锡林郭勒盟
--------------------------------------------------
UPDATE biz_region SET code = '152501' WHERE name = '二连浩特市' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152502' WHERE name = '锡林浩特市' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152522' WHERE name = '阿巴嘎旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152523' WHERE name = '苏尼特左旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152524' WHERE name = '苏尼特右旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152525' WHERE name = '东乌珠穆沁旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152526' WHERE name = '西乌珠穆沁旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152527' WHERE name = '太仆寺旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152528' WHERE name = '镶黄旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152529' WHERE name = '正镶白旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152530' WHERE name = '正蓝旗' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152531' WHERE name = '多伦县' AND city = '锡林郭勒盟';
UPDATE biz_region SET code = '152571' WHERE name = '乌拉盖管委会' AND city = '锡林郭勒盟';

-- 锦州市
--------------------------------------------------
UPDATE biz_region SET code = '210702' WHERE name = '古塔区' AND city = '锦州市';
UPDATE biz_region SET code = '210703' WHERE name = '凌河区' AND city = '锦州市';
UPDATE biz_region SET code = '210711' WHERE name = '太和区' AND city = '锦州市';
UPDATE biz_region SET code = '210726' WHERE name = '黑山县' AND city = '锦州市';
UPDATE biz_region SET code = '210727' WHERE name = '义县' AND city = '锦州市';
UPDATE biz_region SET code = '210781' WHERE name = '凌海市' AND city = '锦州市';
UPDATE biz_region SET code = '210782' WHERE name = '北镇市' AND city = '锦州市';

-- 镇江市
--------------------------------------------------
UPDATE biz_region SET code = '321102' WHERE name = '京口区' AND city = '镇江市';
UPDATE biz_region SET code = '321111' WHERE name = '润州区' AND city = '镇江市';
UPDATE biz_region SET code = '321112' WHERE name = '丹徒区' AND city = '镇江市';
UPDATE biz_region SET code = '321171' WHERE name = '镇江新区' AND city = '镇江市';
UPDATE biz_region SET code = '321181' WHERE name = '丹阳市' AND city = '镇江市';
UPDATE biz_region SET code = '321182' WHERE name = '扬中市' AND city = '镇江市';
UPDATE biz_region SET code = '321183' WHERE name = '句容市' AND city = '镇江市';

-- 长春市
--------------------------------------------------
UPDATE biz_region SET code = '220102' WHERE name = '南关区' AND city = '长春市';
UPDATE biz_region SET code = '220103' WHERE name = '宽城区' AND city = '长春市';
UPDATE biz_region SET code = '110105' WHERE name = '朝阳区' AND city = '长春市';
UPDATE biz_region SET code = '220105' WHERE name = '二道区' AND city = '长春市';
UPDATE biz_region SET code = '220106' WHERE name = '绿园区' AND city = '长春市';
UPDATE biz_region SET code = '220112' WHERE name = '双阳区' AND city = '长春市';
UPDATE biz_region SET code = '220113' WHERE name = '九台区' AND city = '长春市';
UPDATE biz_region SET code = '220122' WHERE name = '农安县' AND city = '长春市';
UPDATE biz_region SET code = '220171' WHERE name = '长春经济技术开发区' AND city = '长春市';
UPDATE biz_region SET code = '220172' WHERE name = '长春净月高新技术产业开发区' AND city = '长春市';
UPDATE biz_region SET code = '220173' WHERE name = '长春高新技术产业开发区' AND city = '长春市';
UPDATE biz_region SET code = '220174' WHERE name = '长春汽车经济技术开发区' AND city = '长春市';
UPDATE biz_region SET code = '220182' WHERE name = '榆树市' AND city = '长春市';
UPDATE biz_region SET code = '220183' WHERE name = '德惠市' AND city = '长春市';
UPDATE biz_region SET code = '220184' WHERE name = '公主岭市' AND city = '长春市';

-- 长沙市
--------------------------------------------------
UPDATE biz_region SET code = '430102' WHERE name = '芙蓉区' AND city = '长沙市';
UPDATE biz_region SET code = '430103' WHERE name = '天心区' AND city = '长沙市';
UPDATE biz_region SET code = '430104' WHERE name = '岳麓区' AND city = '长沙市';
UPDATE biz_region SET code = '430105' WHERE name = '开福区' AND city = '长沙市';
UPDATE biz_region SET code = '430111' WHERE name = '雨花区' AND city = '长沙市';
UPDATE biz_region SET code = '430112' WHERE name = '望城区' AND city = '长沙市';
UPDATE biz_region SET code = '430121' WHERE name = '长沙县' AND city = '长沙市';
UPDATE biz_region SET code = '430181' WHERE name = '浏阳市' AND city = '长沙市';
UPDATE biz_region SET code = '430182' WHERE name = '宁乡市' AND city = '长沙市';

-- 长治市
--------------------------------------------------
UPDATE biz_region SET code = '140403' WHERE name = '潞州区' AND city = '长治市';
UPDATE biz_region SET code = '140404' WHERE name = '上党区' AND city = '长治市';
UPDATE biz_region SET code = '140405' WHERE name = '屯留区' AND city = '长治市';
UPDATE biz_region SET code = '140406' WHERE name = '潞城区' AND city = '长治市';
UPDATE biz_region SET code = '140423' WHERE name = '襄垣县' AND city = '长治市';
UPDATE biz_region SET code = '140425' WHERE name = '平顺县' AND city = '长治市';
UPDATE biz_region SET code = '140426' WHERE name = '黎城县' AND city = '长治市';
UPDATE biz_region SET code = '140427' WHERE name = '壶关县' AND city = '长治市';
UPDATE biz_region SET code = '140428' WHERE name = '长子县' AND city = '长治市';
UPDATE biz_region SET code = '140429' WHERE name = '武乡县' AND city = '长治市';
UPDATE biz_region SET code = '140430' WHERE name = '沁县' AND city = '长治市';
UPDATE biz_region SET code = '140431' WHERE name = '沁源县' AND city = '长治市';
UPDATE biz_region SET code = '140471' WHERE name = '山西长治高新技术产业园区' AND city = '长治市';

-- 阜新市
--------------------------------------------------
UPDATE biz_region SET code = '210902' WHERE name = '海州区' AND city = '阜新市';
UPDATE biz_region SET code = '210903' WHERE name = '新邱区' AND city = '阜新市';
UPDATE biz_region SET code = '210904' WHERE name = '太平区' AND city = '阜新市';
UPDATE biz_region SET code = '210905' WHERE name = '清河门区' AND city = '阜新市';
UPDATE biz_region SET code = '210911' WHERE name = '细河区' AND city = '阜新市';
UPDATE biz_region SET code = '210921' WHERE name = '阜新蒙古族自治县' AND city = '阜新市';
UPDATE biz_region SET code = '210922' WHERE name = '彰武县' AND city = '阜新市';

-- 阜阳市
--------------------------------------------------
UPDATE biz_region SET code = '341202' WHERE name = '颍州区' AND city = '阜阳市';
UPDATE biz_region SET code = '341203' WHERE name = '颍东区' AND city = '阜阳市';
UPDATE biz_region SET code = '341204' WHERE name = '颍泉区' AND city = '阜阳市';
UPDATE biz_region SET code = '341221' WHERE name = '临泉县' AND city = '阜阳市';
UPDATE biz_region SET code = '341222' WHERE name = '太和县' AND city = '阜阳市';
UPDATE biz_region SET code = '341225' WHERE name = '阜南县' AND city = '阜阳市';
UPDATE biz_region SET code = '341226' WHERE name = '颍上县' AND city = '阜阳市';
UPDATE biz_region SET code = '341271' WHERE name = '阜阳合肥现代产业园区' AND city = '阜阳市';
UPDATE biz_region SET code = '341272' WHERE name = '阜阳经济技术开发区' AND city = '阜阳市';
UPDATE biz_region SET code = '341282' WHERE name = '界首市' AND city = '阜阳市';

-- 防城港市
--------------------------------------------------
UPDATE biz_region SET code = '450602' WHERE name = '港口区' AND city = '防城港市';
UPDATE biz_region SET code = '450603' WHERE name = '防城区' AND city = '防城港市';
UPDATE biz_region SET code = '450621' WHERE name = '上思县' AND city = '防城港市';
UPDATE biz_region SET code = '450681' WHERE name = '东兴市' AND city = '防城港市';

-- 阳江市
--------------------------------------------------
UPDATE biz_region SET code = '441702' WHERE name = '江城区' AND city = '阳江市';
UPDATE biz_region SET code = '441704' WHERE name = '阳东区' AND city = '阳江市';
UPDATE biz_region SET code = '441721' WHERE name = '阳西县' AND city = '阳江市';
UPDATE biz_region SET code = '441781' WHERE name = '阳春市' AND city = '阳江市';

-- 阳泉市
--------------------------------------------------
UPDATE biz_region SET code = '140302' WHERE name = '城区' AND city = '阳泉市';
UPDATE biz_region SET code = '140303' WHERE name = '矿区' AND city = '阳泉市';
UPDATE biz_region SET code = '140311' WHERE name = '郊区' AND city = '阳泉市';
UPDATE biz_region SET code = '140321' WHERE name = '平定县' AND city = '阳泉市';
UPDATE biz_region SET code = '140322' WHERE name = '盂县' AND city = '阳泉市';

-- 阿克苏地区
--------------------------------------------------
UPDATE biz_region SET code = '652901' WHERE name = '阿克苏市' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652902' WHERE name = '库车市' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652922' WHERE name = '温宿县' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652924' WHERE name = '沙雅县' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652925' WHERE name = '新和县' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652926' WHERE name = '拜城县' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652927' WHERE name = '乌什县' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652928' WHERE name = '阿瓦提县' AND city = '阿克苏地区';
UPDATE biz_region SET code = '652929' WHERE name = '柯坪县' AND city = '阿克苏地区';

-- 阿勒泰地区
--------------------------------------------------
UPDATE biz_region SET code = '654301' WHERE name = '阿勒泰市' AND city = '阿勒泰地区';
UPDATE biz_region SET code = '654321' WHERE name = '布尔津县' AND city = '阿勒泰地区';
UPDATE biz_region SET code = '654322' WHERE name = '富蕴县' AND city = '阿勒泰地区';
UPDATE biz_region SET code = '654323' WHERE name = '福海县' AND city = '阿勒泰地区';
UPDATE biz_region SET code = '654324' WHERE name = '哈巴河县' AND city = '阿勒泰地区';
UPDATE biz_region SET code = '654325' WHERE name = '青河县' AND city = '阿勒泰地区';
UPDATE biz_region SET code = '654326' WHERE name = '吉木乃县' AND city = '阿勒泰地区';

-- 阿坝藏族羌族自治州
--------------------------------------------------
UPDATE biz_region SET code = '513201' WHERE name = '马尔康市' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513221' WHERE name = '汶川县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513222' WHERE name = '理县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513223' WHERE name = '茂县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513224' WHERE name = '松潘县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513225' WHERE name = '九寨沟县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513226' WHERE name = '金川县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513227' WHERE name = '小金县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513228' WHERE name = '黑水县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513230' WHERE name = '壤塘县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513231' WHERE name = '阿坝县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513232' WHERE name = '若尔盖县' AND city = '阿坝藏族羌族自治州';
UPDATE biz_region SET code = '513233' WHERE name = '红原县' AND city = '阿坝藏族羌族自治州';

-- 阿拉善盟
--------------------------------------------------
UPDATE biz_region SET code = '152921' WHERE name = '阿拉善左旗' AND city = '阿拉善盟';
UPDATE biz_region SET code = '152922' WHERE name = '阿拉善右旗' AND city = '阿拉善盟';
UPDATE biz_region SET code = '152923' WHERE name = '额济纳旗' AND city = '阿拉善盟';
UPDATE biz_region SET code = '152971' WHERE name = '内蒙古阿拉善高新技术产业开发区' AND city = '阿拉善盟';

-- 阿里地区
--------------------------------------------------
UPDATE biz_region SET code = '542521' WHERE name = '普兰县' AND city = '阿里地区';
UPDATE biz_region SET code = '542522' WHERE name = '札达县' AND city = '阿里地区';
UPDATE biz_region SET code = '542523' WHERE name = '噶尔县' AND city = '阿里地区';
UPDATE biz_region SET code = '542524' WHERE name = '日土县' AND city = '阿里地区';
UPDATE biz_region SET code = '542525' WHERE name = '革吉县' AND city = '阿里地区';
UPDATE biz_region SET code = '542526' WHERE name = '改则县' AND city = '阿里地区';
UPDATE biz_region SET code = '542527' WHERE name = '措勤县' AND city = '阿里地区';

-- 陇南市
--------------------------------------------------
UPDATE biz_region SET code = '621202' WHERE name = '武都区' AND city = '陇南市';
UPDATE biz_region SET code = '621221' WHERE name = '成县' AND city = '陇南市';
UPDATE biz_region SET code = '621222' WHERE name = '文县' AND city = '陇南市';
UPDATE biz_region SET code = '621223' WHERE name = '宕昌县' AND city = '陇南市';
UPDATE biz_region SET code = '621224' WHERE name = '康县' AND city = '陇南市';
UPDATE biz_region SET code = '621225' WHERE name = '西和县' AND city = '陇南市';
UPDATE biz_region SET code = '621226' WHERE name = '礼县' AND city = '陇南市';
UPDATE biz_region SET code = '621227' WHERE name = '徽县' AND city = '陇南市';
UPDATE biz_region SET code = '621228' WHERE name = '两当县' AND city = '陇南市';

-- 随州市
--------------------------------------------------
UPDATE biz_region SET code = '421303' WHERE name = '曾都区' AND city = '随州市';
UPDATE biz_region SET code = '421321' WHERE name = '随县' AND city = '随州市';
UPDATE biz_region SET code = '421381' WHERE name = '广水市' AND city = '随州市';

-- 雅安市
--------------------------------------------------
UPDATE biz_region SET code = '511802' WHERE name = '雨城区' AND city = '雅安市';
UPDATE biz_region SET code = '511803' WHERE name = '名山区' AND city = '雅安市';
UPDATE biz_region SET code = '511822' WHERE name = '荥经县' AND city = '雅安市';
UPDATE biz_region SET code = '511823' WHERE name = '汉源县' AND city = '雅安市';
UPDATE biz_region SET code = '511824' WHERE name = '石棉县' AND city = '雅安市';
UPDATE biz_region SET code = '511825' WHERE name = '天全县' AND city = '雅安市';
UPDATE biz_region SET code = '511826' WHERE name = '芦山县' AND city = '雅安市';
UPDATE biz_region SET code = '511827' WHERE name = '宝兴县' AND city = '雅安市';

-- 青岛市
--------------------------------------------------
UPDATE biz_region SET code = '370202' WHERE name = '市南区' AND city = '青岛市';
UPDATE biz_region SET code = '370203' WHERE name = '市北区' AND city = '青岛市';
UPDATE biz_region SET code = '370211' WHERE name = '黄岛区' AND city = '青岛市';
UPDATE biz_region SET code = '370212' WHERE name = '崂山区' AND city = '青岛市';
UPDATE biz_region SET code = '370213' WHERE name = '李沧区' AND city = '青岛市';
UPDATE biz_region SET code = '370214' WHERE name = '城阳区' AND city = '青岛市';
UPDATE biz_region SET code = '370215' WHERE name = '即墨区' AND city = '青岛市';
UPDATE biz_region SET code = '370271' WHERE name = '青岛高新技术产业开发区' AND city = '青岛市';
UPDATE biz_region SET code = '370281' WHERE name = '胶州市' AND city = '青岛市';
UPDATE biz_region SET code = '370283' WHERE name = '平度市' AND city = '青岛市';
UPDATE biz_region SET code = '370285' WHERE name = '莱西市' AND city = '青岛市';

-- 鞍山市
--------------------------------------------------
UPDATE biz_region SET code = '210302' WHERE name = '铁东区' AND city = '鞍山市';
UPDATE biz_region SET code = '210303' WHERE name = '铁西区' AND city = '鞍山市';
UPDATE biz_region SET code = '210304' WHERE name = '立山区' AND city = '鞍山市';
UPDATE biz_region SET code = '210311' WHERE name = '千山区' AND city = '鞍山市';
UPDATE biz_region SET code = '210321' WHERE name = '台安县' AND city = '鞍山市';
UPDATE biz_region SET code = '210323' WHERE name = '岫岩满族自治县' AND city = '鞍山市';
UPDATE biz_region SET code = '210381' WHERE name = '海城市' AND city = '鞍山市';

-- 韶关市
--------------------------------------------------
UPDATE biz_region SET code = '440203' WHERE name = '武江区' AND city = '韶关市';
UPDATE biz_region SET code = '440204' WHERE name = '浈江区' AND city = '韶关市';
UPDATE biz_region SET code = '440205' WHERE name = '曲江区' AND city = '韶关市';
UPDATE biz_region SET code = '440222' WHERE name = '始兴县' AND city = '韶关市';
UPDATE biz_region SET code = '440224' WHERE name = '仁化县' AND city = '韶关市';
UPDATE biz_region SET code = '440229' WHERE name = '翁源县' AND city = '韶关市';
UPDATE biz_region SET code = '440232' WHERE name = '乳源瑶族自治县' AND city = '韶关市';
UPDATE biz_region SET code = '440233' WHERE name = '新丰县' AND city = '韶关市';
UPDATE biz_region SET code = '440281' WHERE name = '乐昌市' AND city = '韶关市';
UPDATE biz_region SET code = '440282' WHERE name = '南雄市' AND city = '韶关市';

-- 马鞍山市
--------------------------------------------------
UPDATE biz_region SET code = '340503' WHERE name = '花山区' AND city = '马鞍山市';
UPDATE biz_region SET code = '340504' WHERE name = '雨山区' AND city = '马鞍山市';
UPDATE biz_region SET code = '340506' WHERE name = '博望区' AND city = '马鞍山市';
UPDATE biz_region SET code = '340521' WHERE name = '当涂县' AND city = '马鞍山市';
UPDATE biz_region SET code = '340522' WHERE name = '含山县' AND city = '马鞍山市';
UPDATE biz_region SET code = '340523' WHERE name = '和县' AND city = '马鞍山市';

-- 驻马店市
--------------------------------------------------
UPDATE biz_region SET code = '411702' WHERE name = '驿城区' AND city = '驻马店市';
UPDATE biz_region SET code = '411721' WHERE name = '西平县' AND city = '驻马店市';
UPDATE biz_region SET code = '411722' WHERE name = '上蔡县' AND city = '驻马店市';
UPDATE biz_region SET code = '411723' WHERE name = '平舆县' AND city = '驻马店市';
UPDATE biz_region SET code = '411724' WHERE name = '正阳县' AND city = '驻马店市';
UPDATE biz_region SET code = '411725' WHERE name = '确山县' AND city = '驻马店市';
UPDATE biz_region SET code = '411726' WHERE name = '泌阳县' AND city = '驻马店市';
UPDATE biz_region SET code = '411727' WHERE name = '汝南县' AND city = '驻马店市';
UPDATE biz_region SET code = '411728' WHERE name = '遂平县' AND city = '驻马店市';
UPDATE biz_region SET code = '411729' WHERE name = '新蔡县' AND city = '驻马店市';
UPDATE biz_region SET code = '411771' WHERE name = '河南驻马店经济开发区' AND city = '驻马店市';

-- 鸡西市
--------------------------------------------------
UPDATE biz_region SET code = '230302' WHERE name = '鸡冠区' AND city = '鸡西市';
UPDATE biz_region SET code = '230303' WHERE name = '恒山区' AND city = '鸡西市';
UPDATE biz_region SET code = '230304' WHERE name = '滴道区' AND city = '鸡西市';
UPDATE biz_region SET code = '230305' WHERE name = '梨树区' AND city = '鸡西市';
UPDATE biz_region SET code = '230306' WHERE name = '城子河区' AND city = '鸡西市';
UPDATE biz_region SET code = '230307' WHERE name = '麻山区' AND city = '鸡西市';
UPDATE biz_region SET code = '230321' WHERE name = '鸡东县' AND city = '鸡西市';
UPDATE biz_region SET code = '230381' WHERE name = '虎林市' AND city = '鸡西市';
UPDATE biz_region SET code = '230382' WHERE name = '密山市' AND city = '鸡西市';

-- 鹤壁市
--------------------------------------------------
UPDATE biz_region SET code = '410602' WHERE name = '鹤山区' AND city = '鹤壁市';
UPDATE biz_region SET code = '410603' WHERE name = '山城区' AND city = '鹤壁市';
UPDATE biz_region SET code = '410611' WHERE name = '淇滨区' AND city = '鹤壁市';
UPDATE biz_region SET code = '410621' WHERE name = '浚县' AND city = '鹤壁市';
UPDATE biz_region SET code = '410622' WHERE name = '淇县' AND city = '鹤壁市';
UPDATE biz_region SET code = '410671' WHERE name = '鹤壁经济技术开发区' AND city = '鹤壁市';

-- 鹤岗市
--------------------------------------------------
UPDATE biz_region SET code = '230402' WHERE name = '向阳区' AND city = '鹤岗市';
UPDATE biz_region SET code = '230403' WHERE name = '工农区' AND city = '鹤岗市';
UPDATE biz_region SET code = '230404' WHERE name = '南山区' AND city = '鹤岗市';
UPDATE biz_region SET code = '230405' WHERE name = '兴安区' AND city = '鹤岗市';
UPDATE biz_region SET code = '230406' WHERE name = '东山区' AND city = '鹤岗市';
UPDATE biz_region SET code = '230407' WHERE name = '兴山区' AND city = '鹤岗市';
UPDATE biz_region SET code = '230421' WHERE name = '萝北县' AND city = '鹤岗市';
UPDATE biz_region SET code = '230422' WHERE name = '绥滨县' AND city = '鹤岗市';

-- 鹰潭市
--------------------------------------------------
UPDATE biz_region SET code = '360602' WHERE name = '月湖区' AND city = '鹰潭市';
UPDATE biz_region SET code = '360603' WHERE name = '余江区' AND city = '鹰潭市';
UPDATE biz_region SET code = '360681' WHERE name = '贵溪市' AND city = '鹰潭市';

-- 黄冈市
--------------------------------------------------
UPDATE biz_region SET code = '421102' WHERE name = '黄州区' AND city = '黄冈市';
UPDATE biz_region SET code = '421121' WHERE name = '团风县' AND city = '黄冈市';
UPDATE biz_region SET code = '421122' WHERE name = '红安县' AND city = '黄冈市';
UPDATE biz_region SET code = '421123' WHERE name = '罗田县' AND city = '黄冈市';
UPDATE biz_region SET code = '421124' WHERE name = '英山县' AND city = '黄冈市';
UPDATE biz_region SET code = '421125' WHERE name = '浠水县' AND city = '黄冈市';
UPDATE biz_region SET code = '421126' WHERE name = '蕲春县' AND city = '黄冈市';
UPDATE biz_region SET code = '421127' WHERE name = '黄梅县' AND city = '黄冈市';
UPDATE biz_region SET code = '421171' WHERE name = '龙感湖管理区' AND city = '黄冈市';
UPDATE biz_region SET code = '421181' WHERE name = '麻城市' AND city = '黄冈市';
UPDATE biz_region SET code = '421182' WHERE name = '武穴市' AND city = '黄冈市';

-- 黄南藏族自治州
--------------------------------------------------
UPDATE biz_region SET code = '632301' WHERE name = '同仁市' AND city = '黄南藏族自治州';
UPDATE biz_region SET code = '632322' WHERE name = '尖扎县' AND city = '黄南藏族自治州';
UPDATE biz_region SET code = '632323' WHERE name = '泽库县' AND city = '黄南藏族自治州';
UPDATE biz_region SET code = '632324' WHERE name = '河南蒙古族自治县' AND city = '黄南藏族自治州';

-- 黄山市
--------------------------------------------------
UPDATE biz_region SET code = '341002' WHERE name = '屯溪区' AND city = '黄山市';
UPDATE biz_region SET code = '341003' WHERE name = '黄山区' AND city = '黄山市';
UPDATE biz_region SET code = '341004' WHERE name = '徽州区' AND city = '黄山市';
UPDATE biz_region SET code = '341021' WHERE name = '歙县' AND city = '黄山市';
UPDATE biz_region SET code = '341022' WHERE name = '休宁县' AND city = '黄山市';
UPDATE biz_region SET code = '341023' WHERE name = '黟县' AND city = '黄山市';
UPDATE biz_region SET code = '341024' WHERE name = '祁门县' AND city = '黄山市';

-- 黄石市
--------------------------------------------------
UPDATE biz_region SET code = '420202' WHERE name = '黄石港区' AND city = '黄石市';
UPDATE biz_region SET code = '420203' WHERE name = '西塞山区' AND city = '黄石市';
UPDATE biz_region SET code = '420204' WHERE name = '下陆区' AND city = '黄石市';
UPDATE biz_region SET code = '420205' WHERE name = '铁山区' AND city = '黄石市';
UPDATE biz_region SET code = '420222' WHERE name = '阳新县' AND city = '黄石市';
UPDATE biz_region SET code = '420281' WHERE name = '大冶市' AND city = '黄石市';

-- 黑河市
--------------------------------------------------
UPDATE biz_region SET code = '231102' WHERE name = '爱辉区' AND city = '黑河市';
UPDATE biz_region SET code = '231123' WHERE name = '逊克县' AND city = '黑河市';
UPDATE biz_region SET code = '231124' WHERE name = '孙吴县' AND city = '黑河市';
UPDATE biz_region SET code = '231181' WHERE name = '北安市' AND city = '黑河市';
UPDATE biz_region SET code = '231182' WHERE name = '五大连池市' AND city = '黑河市';
UPDATE biz_region SET code = '231183' WHERE name = '嫩江市' AND city = '黑河市';

-- 黔东南苗族侗族自治州
--------------------------------------------------
UPDATE biz_region SET code = '522601' WHERE name = '凯里市' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522622' WHERE name = '黄平县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522623' WHERE name = '施秉县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522624' WHERE name = '三穗县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522625' WHERE name = '镇远县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522626' WHERE name = '岑巩县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522627' WHERE name = '天柱县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522628' WHERE name = '锦屏县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522629' WHERE name = '剑河县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522630' WHERE name = '台江县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522631' WHERE name = '黎平县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522632' WHERE name = '榕江县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522633' WHERE name = '从江县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522634' WHERE name = '雷山县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522635' WHERE name = '麻江县' AND city = '黔东南苗族侗族自治州';
UPDATE biz_region SET code = '522636' WHERE name = '丹寨县' AND city = '黔东南苗族侗族自治州';

-- 黔南布依族苗族自治州
--------------------------------------------------
UPDATE biz_region SET code = '522701' WHERE name = '都匀市' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522702' WHERE name = '福泉市' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522722' WHERE name = '荔波县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522723' WHERE name = '贵定县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522725' WHERE name = '瓮安县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522726' WHERE name = '独山县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522727' WHERE name = '平塘县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522728' WHERE name = '罗甸县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522729' WHERE name = '长顺县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522730' WHERE name = '龙里县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522731' WHERE name = '惠水县' AND city = '黔南布依族苗族自治州';
UPDATE biz_region SET code = '522732' WHERE name = '三都水族自治县' AND city = '黔南布依族苗族自治州';

-- 黔西南布依族苗族自治州
--------------------------------------------------
UPDATE biz_region SET code = '522301' WHERE name = '兴义市' AND city = '黔西南布依族苗族自治州';
UPDATE biz_region SET code = '522302' WHERE name = '兴仁市' AND city = '黔西南布依族苗族自治州';
UPDATE biz_region SET code = '522323' WHERE name = '普安县' AND city = '黔西南布依族苗族自治州';
UPDATE biz_region SET code = '522324' WHERE name = '晴隆县' AND city = '黔西南布依族苗族自治州';
UPDATE biz_region SET code = '522325' WHERE name = '贞丰县' AND city = '黔西南布依族苗族自治州';
UPDATE biz_region SET code = '522326' WHERE name = '望谟县' AND city = '黔西南布依族苗族自治州';
UPDATE biz_region SET code = '522327' WHERE name = '册亨县' AND city = '黔西南布依族苗族自治州';
UPDATE biz_region SET code = '522328' WHERE name = '安龙县' AND city = '黔西南布依族苗族自治州';

-- 齐齐哈尔市
--------------------------------------------------
UPDATE biz_region SET code = '230202' WHERE name = '龙沙区' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230203' WHERE name = '建华区' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230204' WHERE name = '铁锋区' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230205' WHERE name = '昂昂溪区' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230206' WHERE name = '富拉尔基区' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230207' WHERE name = '碾子山区' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230208' WHERE name = '梅里斯达斡尔族区' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230221' WHERE name = '龙江县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230223' WHERE name = '依安县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230224' WHERE name = '泰来县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230225' WHERE name = '甘南县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230227' WHERE name = '富裕县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230229' WHERE name = '克山县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230230' WHERE name = '克东县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230231' WHERE name = '拜泉县' AND city = '齐齐哈尔市';
UPDATE biz_region SET code = '230281' WHERE name = '讷河市' AND city = '齐齐哈尔市';

-- 龙岩市
--------------------------------------------------
UPDATE biz_region SET code = '350802' WHERE name = '新罗区' AND city = '龙岩市';
UPDATE biz_region SET code = '350803' WHERE name = '永定区' AND city = '龙岩市';
UPDATE biz_region SET code = '350821' WHERE name = '长汀县' AND city = '龙岩市';
UPDATE biz_region SET code = '350823' WHERE name = '上杭县' AND city = '龙岩市';
UPDATE biz_region SET code = '350824' WHERE name = '武平县' AND city = '龙岩市';
UPDATE biz_region SET code = '350825' WHERE name = '连城县' AND city = '龙岩市';
UPDATE biz_region SET code = '350881' WHERE name = '漳平市' AND city = '龙岩市';
-- ==============================================
-- 验证查询
-- ==============================================
SELECT '验证区域编码转换结果' AS 说明, city AS 城市, COUNT(*) AS 数量
FROM biz_region
GROUP BY city
ORDER BY city;

SELECT '转换完成' AS 消息;
