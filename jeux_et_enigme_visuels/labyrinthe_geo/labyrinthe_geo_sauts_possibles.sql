


-- création de la table contenant tous les sauts possibles selon les règles du jeu
create or replace table `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo_croisement as
-- première partie : on prend les intersection qui valent un point (mais pas le point de début ou fin de ligne)
select 
     -- on stock le point de départ et d'arrivée du saut
     st_endpoint(p.path) as end_point_previous
    ,st_startpoint(n.path) as start_point_next
from `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo as p -- point de départ du saut
join `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo as n -- point d'arrivée du saut
    on  (round(st_x(st_endpoint(p.path))) = round(st_x(st_startpoint(n.path))) or round(st_y(st_endpoint(p.path))) = round(st_y(st_startpoint(n.path))))
    and p.end_form = n.start_form 
    and st_astext(p.path) <> st_astext(n.path)
cross join `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo as c -- jointure sur toutes les autres lignes du puzzle
where  
    -- on veut au moins un croisement
    st_intersects(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path)
    -- les points pour la ligne de saut sont sur des lignes cohérentes
    and p.is_line_ok = 1
    and n.is_line_ok = 1
    -- on veux que le croisement soit un point pour appliquer les règles ci-dessous
    and st_geometrytype(st_intersection(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path)) = 'ST_Point' 
    -- on enlève les ligne qui sont cross join avec elle même
    and st_astext(st_endpoint(p.path  )) <> st_astext(st_endpoint(  c.path)) 
    and st_astext(st_startpoint(n.path)) <> st_astext(st_startpoint(c.path)) 
    -- on enlève les points qui commencent ou terminent une ligne. on souhaite que deux lignes se coupent en plein milieu
    -- le start point pour commencer
    and (
         round(st_x(st_intersection(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path))) <> round(st_x(st_startpoint(c.path))) 
         OR
         round(st_y(st_intersection(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path))) <> round(st_y(st_startpoint(c.path)))
        )
    -- puis le end point
    and (
         round(st_x(st_intersection(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path))) <> round(st_x(st_endpoint(c.path))) 
         OR
         round(st_y(st_intersection(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path))) <> round(st_y(st_endpoint(c.path)))
        )
union all
-- deuxième partie : on prend toutes les intersections qui valent plus qu'un point
select 
     -- on stock le point de départ et d'arrivée du saut
     st_endpoint(p.path) as end_point_previous
    ,st_startpoint(n.path) as start_point_next
from `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo as p -- point de départ du saut
join `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo as n -- point d'arrivée du saut
    on  (round(st_x(st_endpoint(p.path))) = round(st_x(st_startpoint(n.path))) or round(st_y(st_endpoint(p.path))) = round(st_y(st_startpoint(n.path))))
    and p.end_form = n.start_form 
    and st_astext(p.path) <> st_astext(n.path)
cross join `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo as c -- jointure sur toutes les autres lignes du puzzle
where  
    -- on veut au moins un croisement
    st_intersects(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path)
    -- les points pour la ligne de saut sont sur des lignes cohérentes
    and p.is_line_ok = 1
    and n.is_line_ok = 1
    -- on veux que le croisement soit un point pour appliquer les règles ci-dessous
    and st_geometrytype(st_intersection(st_makeline([st_endpoint(p.path),st_startpoint(n.path)]),c.path)) <> 'ST_Point' 
    -- on enlève les ligne qui sont cross join avec elle même
    and st_astext(st_endpoint(p.path  )) <> st_astext(st_endpoint(  c.path)) 
    and st_astext(st_startpoint(n.path)) <> st_astext(st_startpoint(c.path)) 



