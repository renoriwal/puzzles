

create or replace table  `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo as 
select st_geogfromtext('multilinestring(( 6  1, 9  1,11  3,13  3            ))') as path, 'R' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((11  1,12  2                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 9  3, 8  2                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14  7,14  2,12  0, 8  0            ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((24  1,23  0,18  0,16  2            ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 9  4, 8  4, 6  2, 4  2, 2  4, 2  7))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 6  3, 5  3, 3  5                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 0  3, 1  3, 2  2                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 0  9, 0  4                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 1  5, 1  8                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15  3,17  3,19  1,21  1,22  2,22  4))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((17  5,20  2                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((21  6,21  3                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((23  3,23  6,25  8                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((24  4,24  2                        ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((24  5,25  6                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((13  6,12  5, 6  5                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 4  5, 4  6, 6  8, 6  9            ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 3  6, 5  8, 5 11                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 4  9, 3  8                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((11  6, 9  6, 7  8                  ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14 10,14  9,12  7,12  6            ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((10  7,11  7                        ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15  6,19  6,21  8                  ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((22  7,22 14                        ))') as path, 'C' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((23  8,23 13                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((24 12,24 10                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((20 13,20  9,18  7                  ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((18 10,18 13                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((17 14,17  8                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((22 17,22 18,20 20,18 20,16 18,16  7))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15  8,15 10                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((25  9,25 13,23 15,21 15,20 14      ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((12  9,13 10                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((10  8,10  9,12 11,12 12            ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 6 11, 9  8                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 4 10, 4 12                        ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 3 13, 3 10, 2  9                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 2 16, 2 11, 1 10                  ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 7 11, 8 12                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 9 11,11 13,12 13                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((13 11,15 11                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 6 16, 6 22, 4 24, 2 24, 0 22, 0 11))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 7 13, 4 13                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 4 14, 6 14, 7 15                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((10 15, 8 13                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((11 15,12 15,14 13,14 12            ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15 15,15 13                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((20 15,17 15                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((25 16,25 15                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((25 20,25 18,23 16,20 16            ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((20 18,20 17                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((18 16,18 17,19 18,19 19            ))') as path, 'R' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 5 15, 3 15                        ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 8 21, 8 15                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((11 18,14 15                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((17 16,17 17                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15 18,15 16                        ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 9 18, 9 16                        ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 5 20, 5 16                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 4 19, 4 16                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 3 18, 3 16                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 1 21, 1 17                        ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14 17,14 20,16 22                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 4 22, 4 21, 2 19, 2 18            ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 3 23, 2 22, 2 21                  ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 8 22,11 19                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((12 23,12 19                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((13 20,13 18                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15 19,16 20                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((23 18,23 21,25 23                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((24 19,24 20                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((22 21,18 21                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15 25,15 24,13 22,13 21            ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((10 25,10 22,11 21                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 5 26, 5 25, 7 23, 8 23            ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 8 24, 9 25                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 7 25, 6 26                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((13 23,13 24                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((16 23,16 24                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((16 25,18 23,18 22                  ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((19 22,19 24,15 28,15 38            ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((20 27,20 22                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((21 22,21 23                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((23 23,25 25,25 30,24 31            ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((21 24,21 27                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((19 26,18 27                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14 25,12 25,11 24                  ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 5 29, 5 27, 3 25, 0 25            ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((23 29,23 24                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((13 26,15 26                        ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 6 29, 6 28, 8 26,11 26            ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 2 26, 0 28                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 1 29, 3 27                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((11 27,14 27                        ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((22 37,22 27                        ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((16 29,16 32                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((19 31,21 31                        ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((21 33,19 33,17 31,17 30            ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((13 33,13 28                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14 35,14 30                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((10 30,10 31                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((12 34,12 30,10 28, 8 28            ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 6 35, 6 31, 8 29                  ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 5 35, 5 30                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 4 28, 2 30, 2 35, 4 37, 6 37      ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 3 31, 3 34                        ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 1 35, 1 30                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 0 36, 0 30                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 0 38, 1 37                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((11 32, 9 32, 8 31                  ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 9 33,11 33                        ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 8 34,11 34                        ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((23 32,23 40                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((24 33,24 38                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((16 35,17 36,19 36                  ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 6 40, 0 40                        ))') as path, 'R' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 7 39, 4 39, 2 37                  ))') as path, 'H' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 8 41, 7 40                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((10 39,10 41, 9 42, 7 42            ))') as path, 'R' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 8 39, 8 37, 7 36, 5 36            ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring(( 9 36, 9 40                        ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14 39,14 37,12 35, 9 35            ))') as path, 'C' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((11 36,11 41                        ))') as path, 'R' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((12 37,13 38                        ))') as path, 'R' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((21 38,21 36,19 34,17 34            ))') as path, 'C' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((20 39,17 39                        ))') as path, 'R' as start_form, 'C' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((21 39,21 41,19 43,18 43            ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((19 40,19 41                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((18 42,18 41                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((22 42,22 39                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((25 41,25 42,24 43,20 43            ))') as path, 'H' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((15 40,18 40                        ))') as path, 'C' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((17 41,13 41,12 40,12 39            ))') as path, 'C' as start_form, 'R' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14 43, 8 43                        ))') as path, 'H' as start_form, 'H' as end_form, 1 as is_line_ok union all
select st_geogfromtext('multilinestring((14  0,15  1,16  0                  ))') as path, 'R' as start_form, 'R' as end_form, 0 as is_line_ok union all
select st_geogfromtext('multilinestring((17 29,21 29                        ))') as path, 'R' as start_form, 'H' as end_form, 0 as is_line_ok union all
select st_geogfromtext('multilinestring((25 35,25 40                        ))') as path, 'R' as start_form, 'H' as end_form, 0 as is_line_ok union all
select st_geogfromtext('multilinestring((20 37,17 37,15 39                  ))') as path, 'H' as start_form, 'H' as end_form, 0 as is_line_ok union all
select st_geogfromtext('multilinestring((17 43,16 42,11 42                  ))') as path, 'H' as start_form, 'R' as end_form, 0 as is_line_ok 



























