with jobs as 
(
	select distinct JobID 
	from EmployeeJobStatus where EmployeeID in 
		( 
			 select distinct EmployeeID as EmployeeID70_1_ 
			 FROM EmployeeJobStatus
			 where EmployeeID in 
				(
					select this_.ID from Employee this_ where this_.PropertyID= 1 
				)
		)
) 

select max(JobID) as JobID, avg(HourlyRate) as AvgRate from EmployeeJobStatus
where EmployeeJobStatus.JobID in 
	(
		select JobID from jobs
	) and '01/10/2013' between EmployeeJobStatus.StartDate and EmployeeJobStatus.EndDate group by JobID
                   
with jobs as 
(select distinct JobID from EmployeeJobStatus where EmployeeID in 
(396,5259,892,1312,3396,5792,736,4481,1347,870,873,905,2666,866,2498,1095,900,2914,884,844,3378,1504,2016,3903,2366,3531,847,2500,695,2258,1678,2086,5821,1393,3067,421,1686,115,3103,3077,883,147,2875,1041,264,2961,583,345,5816,632,1458,2499,2025,1791,2695,1052,1506,1596,5217,45,46,5817,3314,1585,1996,673,1944,2518,5099,1648,2469,838,4827,166,511,2607,2181,1296,3102,2166,2396,3212,4833,3500,4724,1412,4211,65,1350,1409,1271,5750,3299,924,558,4906,3235,167,3284,5765,2154,708,2373,1962,66,472,3403,3070,14,2285,265,1251,144,298,145,2782,1254,3502,3707,1336,1623,1256,1348,3743,584,684,1102,2493,4212,1480,1111,1017,2964,2452,1965,4840,5426,585,122,1898,123,4907,350,2071,1802,2237,2540,854,703,2072,1466,2966,2918,3348,907,1509,559,4088,1341,5812,219,2146,3399,2075,3277,932,2103,2365,3285,3152,2142,3033,1018,1688,1195,5420,1147,1998,1116,1671,4832,5759,3570,2292,2180,1618,4213,1479,363,438,2042,5766,124,1960,4114,220,2192,148,2098,2259,5094,1099,2015,2213,2229,102,2008,3411,1234,3626,3053,2608,2312,125,1529,3460,509,5216,1433,2135,1343,981,1873,1977,1465,1773,3490,2251,2624,3230,5518,473,2648,2871,1233,1703,1253,1765,1370,3150,3109,126,3420,1329,221,2718,3173,614,4036,5818,2300,1850,1655,1464,551,1924,3143,5214,3958,1384,3866,1600,1243,1352,2485,2919,587,2583,1814,1381,5769,1460,2039,48,1886,1507,1187,896,944,531,910,2219,1096,2231,865,2442,103,1603,1628,5764,2970,2460,899,1231,2047,2066,5852,1913,5822,3497,5421,2306,1615,4556,2198,1427,2280,2435,2779,2185,495,1459,2319,1746,5771,1229,1285,1218,1083,1421,105,2226,3004,1369,2766,242,1359,5795,1534,2020,1171,2447,992,1346,1522,2114,1319,3443,1879,3802,2221,3333,1089,3057,2145,1074,2018,532,5338,3331,1725,2112,2385,2895,5823,5267,2148,196,4070,1782,1758,570,267,2331,2056,1881,4497,1575,3412,3356,3553,4411,1424,5756,3270,2394,1581,1514,1232,540,4109,4963,1528,2104,2045,2186,4235,858,3442,1685,882,544,2507,1054,1476,3302,2513,1320,1010,1680,719,1597,1211,747,2817,3417,1400,107,1770,1405,222,674,2183,150,1564,1413,834,1436,967,1571,2067,1576,3391,1197,4233,1689,3728,561,1613,1650,4465,3127,522,1533,1387,5041,2790,1727,1657,2481,2374,2354,3800,71,986,3387,560,1713,3254,3029,3432,2298,1969,2115,1841,1897,969,3375,957,198,73,2405,1531,1616,2954,5014,1896,1815,2217,2068,1374,243,108,2128,2819,2364,1813,2310,2921,5212,675,837,1165,1378,2102,2118,512,1635,199,1999,1112,1612,2119,2093,2774,5086,2004,1094,721,894,1661,305,1798,2702,4496,2484,1274,497,2585,3018,920,224,201,754,202,109,3749,676,1045,1974,954,402,3283,851,917,523,4824,2418,306,749,3527,1435,2113,1724,3380,1527,1956,1273,2924,1184,2030,203,5824,271,2496,3151,2320,2049,1356,710,2238,3433,403,1257,5849,2731,356,5134,226,307,3313,5848,2890,2199,2868,1861,510,1481,2159,1278,1653,2543,5173,1582,4825,752,4305,18,1854,4068,1057,228,3363,1640,1179,1258,3550,2925,1287,3165,3790,1598,129,152,2343,151,1130,1801,1038,690,1729,5894,3087,2117,3011,1810,1787,1122,5085,4399,20,2116,2303,272,3306,3154,331,5385,562,110,2705,2308,423,75,5763,3479,1403,3997,3163,2225,666,4901,2439,960,424,478,443,50,3035,889,1892,1220,2028,2326,1766,1855,3798,1279,3326,51,1168,4045,859,1391,2057,2328,2528,2823,974,737,5204,229,3253,1587,2140,709,1858,2078,230,1204,2475,727,2529,404,536,2421,2211,1761,1240,1667,1887,1921,3252,5768,480,3381,1539,2899,1308,2952,5797,4709,2525,1461,728,3572,2956,740,1269,2835,1021,3606,1819,2974,3330,4040,3752,1982,554,2368,5435,3701,1972,2958,5825,1446,2807,4693,1632,5820,966,2503,444,1249,154,1368,2094,1440,527,2578,1219,5203,1382,1338,2097,1133,52,2250,4090,1186,863,868,1151,5202,1919,2162,2163,4843,3274,881,2277,481,1105,2293,2359,274,1129,3199,246,2051,1578,677,874,2467,513,5176,1599,1148,2547,3149,275,845,4902,4398,2912,668,174,276,3914,4373,3020,4408,2361,2901,5754,5367,1333,2400,888,1178,2892,131,1181,5767,1250,359,2048,2384,3203,835,2193,3839,1005,4125,1867,985,2133,2425,5815,922,405,2304,360,908,572,373,4409,1227,3014,571,361,499,3249,1439,2555,729,1633,3424,2976,1592,22,2358,1115,936,1672,5120,1864,1607,1752,311,2079,1067,1180,971,3647,1064,5090,2370,3538,1557,2347,3898,5798,2182,23,771,1853,4626,1462,1737,1482,2029,1711,134,734,975,3292,3220,500,2342,1283,231,839,247,76,175,1149,25,406,3726,446,3690,2017,3078,1757,407,678,930,2723,756,1049,77,3050,462,232,2557,3303,857,1563,2430,278,408,1658,484,2053,1925,5272,2101,3108,188,1807,1058,5826,1923,3345,2235,3046,4812,2652,3659,3058,946,5342,3335,1406,409,3552,204,463,2587,502,4969,4234,2479,5733,3085,1852,1642,78,1878,5901,1342,5753,1870,503,248,757,2979,3807,1838,3410,4216,2653,2684,514,4320,959,2314,425,1450,2760,205,374,281,1834,79,1987,5853,2091,1959,2297,1110,619,2837,2663,4882,525,1797,1080,2434,2239,5855,1365,4410,2980,2212,1091,2262,679,1039,2218,426,2505,282,1487,3766,1069,283,142,2351,2353,4100,5886,1150,1208,1383,233,2522,686,178,2417,80,1584,5847,1847,1437,2761,1535,2800,1524,2480,2027,1743,687,53,3320,284,285,1954,2080,1816,313,206,2436,5419,5634,1943,753,362,1532,1570,1011,1272,3010,5318,26,1966,3621,1634,2242,286,2628,1013,5675,1092,3402,5647,4908,1016,1314,27,1098,1066,2352,722,1294,1826,3321,2506,2318,2462,2106,2266,2459,2201,2725,2981,1549,2178,4979,4033,3322,1894,877,1157,3336,2931,3664,1398,4032,5256,208,422,83,209,1434,137,573,2680,3508,1915,2065,1183,1580,1904,2404,688,1397,1416,114,3789,3228,1200,1192,2196,2279,2799,2613,2397,250,2190,2131,5088,211,1093,4876,2290,1643,1022,428,739,5046,913,869,2638,1215,138,367,1084,2802,429,1344,1166,5258,5881,3136,895,724,1492,1490,2858,938,2348,1371,1419,2395,1763,170,212,184,485,1979,1669,2227,2517,156,1088,4743,2305,2845,569,3856,2222,1840,5761,1023,1537,3205,5295,2177,1290,3294,2933,840,84,54,179,3924,1926,1173,1970,1328,2643,2773,988,1071,1448,1212,3074,931,3338,5762,1207,1246,1694,3115,3885,2092,5716,1586,5681,2307,1444,2233,85,2121,5013,3279,430,1876,1707,4966,1708,704,3902,528,1042,875,2856,235,2139,410,3373,377,3435,803,515,2288,1007,2511,3371,2026,3260,223,2935,1349,3473,1206,251,1262,3001,2472,1833,4910,2001,2936,2470,2412,1706,2422,1824,3388,4866,1086,1483,1135,5196,1418,431,4797,556,1306,741,2465,3089,399,1799,70,1828,2967,2960,2822,2797,5851,3346,1205,526,2568,2123,486,1408,2387,977,2268,1501,1779,2077,55,1196,3278,1602,5195,557,2155,1425,2172,1379,2175,2625,537,705,92,369,5801,2951,1132,2803,833,5439,5194,714,1663,3405,56,1163,1389,1345,3159,1872,2246,292,1968,2903,1885,1141,1079,1001,504,1955,253,1884,953,4911,1631,1823,1590,627,3466,336,5321,2687,691,1851,4771,1809,158,2216,3884,1808,2851,1556,5828,2544,1928,1793,5355,912,1579,1775,432,680,1594,3723,1004,465,5751,411,31,1614,2337,2601,1311,375,32,1835,887,886,1975,3627,489,236,2937,2938,1376,1562,5854,5850,2409,1415,185,2050,293,2983,1453,1337,516,1059,2710,1124,5715,2939,4566,2223,1047,3551,1674,1918,3529,1085,2275,1307,758,1055,2595,4105,2220,1513,466,2313,450,2151,3120,315,3428,5695,947,973,1478,3121,3208,2339,517,529,1978,3449,1868,1161,2064,1738,5760,3721,2338,1443,2138,467,4471,597,538,383,1769,2520,2784,760,2454,3386,2206,1006,848,5087,3900,3340,891,3534,2508,3248,2074,2369,1012,2302,2940,1090,378,2888,413,59,1932,3327,1449,964,3129,5802,598,256,5080,4494,270,187,2332,5694,1736,1629,956,257,3929,2942,1555,2149,2656,2558,1056,1772,1906,258,2985,3023,3537,1265,2257,116,385,518,3482,2671,5192,5084,5191,3778,1297,1264,87,4437,1291,2317,1912,1511,1259,215,1394,2230,1726,414,4753,5829,1468,1304,1073,3374,2943,468,5263,1973,3536,990,2639,2132,2267,3256,3535,1895,3213,89,918,5947,1029,490,539,1750,36,1902,117,1035,1097,190,1477,39,2247,1210,2591,2491,5287,259,995,3452,2023,2463,3777,853,5189,2944,1569,118,3453,216,3034,2069,3454,3600,5889,2179,452,340,1660,2311,1646,1332,491,2487,4711,3359,1937,1367,3408,1520,435,5703,3476,1174,3319,3430,1295,4027,3266,5472,1221,1728,2038,1472,2006,2024,3325,2514,715,2603,3812,1445,2043,1031,2244,240,2243,669,161,2282,1401,3498,4750,3398,40,5187,2147,1339,139,4721,2549,2872,1893,1172,1324,5219,2035,2167,1430,260,1245,3267,519,3431,3342,2160,2444,436,3347,1627,1158,2095,3441,1053,1759,2627,1684,2194,911,2165,1830,1242,2110,1493,549,3515,1126,2770,3244,2322,390,4903,2168,4049,2070,1009,1803,2622,4487,4488,4489,1040,261,550,2827,296,2765,1266,3318,2127,2403,4419,1668,2401,2240,2254,91,2399,2495,2857,1426,1789,2099,3440,1236,1447,5186,1182,386,1043,1608,3297,2813,1821,1162,2477,1363,2945,1561,1560,1224,2908,2946,2468,3298,2286,2287,1185,2471,2158,1984,2445,2501,3437,1964,4815,1203,341,928,321,1070,2411,1225,2489,846,5946,5331,3970,1457,2538,1015,3972,3175,387,876,856,880,862,3063,2088,2574,5185,3455,1428,2510,3679,140,1645,1495,2947,3064,545,3025,2276,1390,3236,2860,3311,611,2474,1947,694,3394,2130,1101,521,2948,2083,1755,1989,453,1142,1900,389,5570,3176,2261,2164,263,2203,1540,239,4549,2539,1475,1422,2826,1134,2677,731,564,2910,2012,299,94,2157,3772,5314,700,1764,5184,192,3880,1545,547,1164,418,1907,95,1455,2191,3511,42,972,3026,3027,4237,393,1159,1786,1617,43,1844,2037,1741,3439,5422,391,97,1538,1862,906,2950,701,1994,1284,193,1331,984,3741,2408,471,300,1392,2659,2994,1399,1484,1515,2150,3392,3068,1683,5315,3471,2000,194,394,5806,3475,5758,2108,342,1909,2642,395,5182,4814,4014,2681,2686,1637,44,1626,3700,1544,2153,1945,141,2984,1767,4309,98,1988,2519,1748,120,2052,3523,2278,1666,3489,507,530,683,3495,1687,3273,217,1364,1270,1929,2450,4905,1908,2283,2284,1935,419,1313,1103,1785,5807,1423,3698,1866,1033,1063,1003,672,420,2061,3843,456,3708,301,508,63,2002,494,99,2214,100,344)) 
select max(JobID) as JobID, avg(HourlyRate) as AvgRate from EmployeeJobStatus where EmployeeJobStatus.JobID in (select JobID from jobs) and '2012-09-23' between EmployeeJobStatus.StartDate and EmployeeJobStatus.EndDate group by JobID                   
                   
                     
                     

 
 select employeejo0_.EmployeeID as EmployeeID70_1_, employeejo0_.ID as ID1_, employeejo0_.ID as ID90_0_, employeejo0_.annualBased as annualBa2_90_0_, 
 employeejo0_.annualRate as annualRate90_0_, employeejo0_.contractDays as contract4_90_0_, employeejo0_.contractHours as contract5_90_0_, 
 employeejo0_.EmployeeID as EmployeeID90_0_, employeejo0_.endDate as endDate90_0_, employeejo0_.home as home90_0_, employeejo0_.hourlyRate as hourlyRate90_0_, 
 employeejo0_.JobID as JobID90_0_, employeejo0_.PayRateReasonID as PayRate18_90_0_, employeejo0_.PaytypeCode as PaytypeC9_90_0_, employeejo0_.pieceRate as pieceRate90_0_, 
 employeejo0_.rank as rank90_0_, employeejo0_.ReconcileCodeID as Reconci19_90_0_, employeejo0_.SalaryDistID as SalaryD20_90_0_, 
 employeejo0_.scheduleOrder as schedul12_90_0_, employeejo0_.seniorityDate as seniori13_90_0_, employeejo0_.startDate as startDate90_0_, 
 employeejo0_.subOnly as subOnly90_0_ 
 from EmployeeJobStatus employeejo0_ where employeejo0_.EmployeeID in (select this_.ID from Employee this_ where this_.PropertyID= 1 ) 
 order by employeejo0_.startDate asc