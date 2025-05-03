


declare current_iteration INT64 default 0;

-- initialisation de la solution du puzzle
create or replace table `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution as
select st_geogpoint( 6,  1) as start_point, st_geogpoint( 7, 42) as end_point, st_astext(st_geogpoint(15,  3)) as solution;

repeat
  set current_iteration = current_iteration + 1;

create or replace table `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution_temp as
-- boucle sur les chemins faisables
select 
     --n.start_point, st_startpoint(p.path), st_endpoint(p.path), p.path, p.end_form, n.path, 'n', n.*
      st_startpoint(n.path) as start_point
     ,s.end_point
     ,concat(s.solution,', ', st_astext(st_startpoint(n.path))) as solution
from `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution s -- start
-- récupération du point end of path
join `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo p -- preceding
    on  st_x(s.start_point) = st_x(st_startpoint(p.path))
    and st_y(s.start_point) = st_y(st_startpoint(p.path))
-- jointure pour récupérer le start of path suivant. plusieurs chemins possibles. 
join `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo n -- next
    on  (round(st_x(st_endpoint(p.path))) = round(st_x(st_startpoint(n.path))) OR round(st_y(st_endpoint(p.path))) = round(st_y(st_startpoint(n.path))))
    and p.end_form = n.start_form 
    -- on retire les chemins déjà utilisés
    and NOT (REGEXP_CONTAINS(s.solution,st_astext(st_startpoint(n.path))))
    -- on ne prend que les lignes valides
    and p.is_line_ok = 1
-- on filtre sur les règles du jeu
where exists (select 1
                from `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.data_geo_croisement c -- croisement
                where   st_astext(c.end_point_previous) = st_astext(st_endpoint(p.path)) 
                    and st_astext(c.start_point_next  ) = st_astext(st_startpoint(n.path)) 
             );

drop table `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution;

create or replace table `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution as
select * from `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution_temp;

drop table `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution_temp;

  UNTIL current_iteration = 30 or exists (select 1 from `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution where solution like'%(7,42)%')
end repeat;


select * from `lv-gcp-dcx-int-data4csc-ww`.`lv_bqd_int_dp_data4csc_working`.requete_geo_solution;




