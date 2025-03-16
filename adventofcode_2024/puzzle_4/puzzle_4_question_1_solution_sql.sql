
--
-- script : 
-- exécuté sur bigquery
--
-- on calcule le nombre de fois qu'apparaît le mot "XMAS" dans le tableau. il peut être écrite horizontalement, verticalement, diagonalement et à l'endroit ou à l'envers. 
-- 
-- on va créer une table contenant la position de chaque lettre. il suffira ensuite de créer toutes les combinaisons possibles et de compter combien de fois apparaît le mot "XMAS"
-- 


with DATA_CONCAT as
-- on rajoute un rank pour être sûr de travailler la donnée dans le bon ordre. le rank est sur les lignes. 
(
select
     col_0 as ligne
    ,row_number() over () as rank_ligne
from PROJET.SCHEMA.PUZZLE_INPUT
)
,DATA_SPLIT as 
-- on split pour séparer tous les caractères 1 par 1. On rajoute le rank pour être sûr de garder l'ordre des colonnes. 
(
select 
     ligne
    ,rank_ligne
    ,split(ligne,'') as value
from DATA_CONCAT
)
,DATA_UNNEST as 
-- pivot sur l'array pour obtenir une ligne par caractère. les colonnes rank_ligne et rank_colonne permettent maintenant d'obtenir la position exacte du caractère
-- cela donne en quelque sorte une matrice que l'on manipulera à notre guise. 
(
select 
     ligne
    ,rank_ligne
    ,row_number() over (partition by ligne) as rank_colonne
    ,DATA_UNNEST as value
from DATA_SPLIT
left join unnest(DATA_SPLIT.value) DATA_UNNEST
)
-- à partir de maintenant, il n'y a plus qu'à créer toutes les combinaisons possibles de 4 lettres : 
-- 1 : horizontalement, de gauche à droite
-- 2 : verticalement, de haut en bas
-- 3 : diagonalement, de gauche à droite et de bas en haut
-- 4 : diagonalement, de gauche à droite et de haut en bas
-- pour rechercher le mot "XMAS" dans les autres sens, on recherchera juste le mot "SAMX" dans les 4 opérations citées ci-dessus
-- 
-- les 4 tables contenant tous les mots possibles : 
,XMAS_HORIZONTAL as 
(
select 
     LETTRE_1.ligne
    ,LETTRE_1.rank_ligne
    ,LETTRE_1.rank_colonne
    ,LETTRE_1.value
    ,LETTRE_1.value as lettre_1
    ,LETTRE_2.value as lettre_2
    ,LETTRE_3.value as lettre_3
    ,LETTRE_4.value as lettre_4
from DATA_UNNEST as LETTRE_1
left join DATA_UNNEST as LETTRE_2
    on  LETTRE_1.rank_ligne   = LETTRE_2.rank_ligne
    and LETTRE_1.rank_colonne = LETTRE_2.rank_colonne - 1
left join DATA_UNNEST as LETTRE_3
    on  LETTRE_1.rank_ligne   = LETTRE_3.rank_ligne
    and LETTRE_1.rank_colonne = LETTRE_3.rank_colonne - 2
left join DATA_UNNEST as LETTRE_4
    on  LETTRE_1.rank_ligne   = LETTRE_4.rank_ligne
    and LETTRE_1.rank_colonne = LETTRE_4.rank_colonne - 3
)
,XMAS_VERTICAL as 
(
select 
     LETTRE_1.ligne
    ,LETTRE_1.rank_ligne
    ,LETTRE_1.rank_colonne
    ,LETTRE_1.value
    ,LETTRE_1.value as lettre_1
    ,LETTRE_2.value as lettre_2
    ,LETTRE_3.value as lettre_3
    ,LETTRE_4.value as lettre_4
from DATA_UNNEST as LETTRE_1
left join DATA_UNNEST as LETTRE_2
    on  LETTRE_1.rank_ligne   = LETTRE_2.rank_ligne - 1
    and LETTRE_1.rank_colonne = LETTRE_2.rank_colonne
left join DATA_UNNEST as LETTRE_3
    on  LETTRE_1.rank_ligne   = LETTRE_3.rank_ligne - 2
    and LETTRE_1.rank_colonne = LETTRE_3.rank_colonne
left join DATA_UNNEST as LETTRE_4
    on  LETTRE_1.rank_ligne   = LETTRE_4.rank_ligne - 3
    and LETTRE_1.rank_colonne = LETTRE_4.rank_colonne
)
,XMAS_DIAGONAL_HAUT as 
(
select 
     LETTRE_1.ligne
    ,LETTRE_1.rank_ligne
    ,LETTRE_1.rank_colonne
    ,LETTRE_1.value
    ,LETTRE_1.value as lettre_1
    ,LETTRE_2.value as lettre_2
    ,LETTRE_3.value as lettre_3
    ,LETTRE_4.value as lettre_4
from DATA_UNNEST as LETTRE_1
left join DATA_UNNEST as LETTRE_2
    on  LETTRE_1.rank_ligne   = LETTRE_2.rank_ligne + 1
    and LETTRE_1.rank_colonne = LETTRE_2.rank_colonne - 1
left join DATA_UNNEST as LETTRE_3
    on  LETTRE_1.rank_ligne   = LETTRE_3.rank_ligne + 2
    and LETTRE_1.rank_colonne = LETTRE_3.rank_colonne - 2
left join DATA_UNNEST as LETTRE_4
    on  LETTRE_1.rank_ligne   = LETTRE_4.rank_ligne + 3
    and LETTRE_1.rank_colonne = LETTRE_4.rank_colonne - 3
)
,XMAS_DIAGONAL_BAS as 
(
select 
     LETTRE_1.ligne
    ,LETTRE_1.rank_ligne
    ,LETTRE_1.rank_colonne
    ,LETTRE_1.value
    ,LETTRE_1.value as lettre_1
    ,LETTRE_2.value as lettre_2
    ,LETTRE_3.value as lettre_3
    ,LETTRE_4.value as lettre_4
from DATA_UNNEST as LETTRE_1
left join DATA_UNNEST as LETTRE_2
    on  LETTRE_1.rank_ligne   = LETTRE_2.rank_ligne - 1
    and LETTRE_1.rank_colonne = LETTRE_2.rank_colonne - 1
left join DATA_UNNEST as LETTRE_3
    on  LETTRE_1.rank_ligne   = LETTRE_3.rank_ligne - 2
    and LETTRE_1.rank_colonne = LETTRE_3.rank_colonne - 2
left join DATA_UNNEST as LETTRE_4
    on  LETTRE_1.rank_ligne   = LETTRE_4.rank_ligne - 3
    and LETTRE_1.rank_colonne = LETTRE_4.rank_colonne - 3
)
,ALL_XMAS as 
-- on récupère tous les mots possibles des 4 tables : 
(
select lettre_1||lettre_2||lettre_3||lettre_4 as mot from XMAS_HORIZONTAL    union all
select lettre_1||lettre_2||lettre_3||lettre_4 as mot from XMAS_VERTICAL      union all
select lettre_1||lettre_2||lettre_3||lettre_4 as mot from XMAS_DIAGONAL_HAUT union all
select lettre_1||lettre_2||lettre_3||lettre_4 as mot from XMAS_DIAGONAL_BAS  
)
-- il ne reste plus qu'à compter le nombre de fois qu'apparaît "XMAS" et "SAMX"
select 
    count(*)
from ALL_XMAS
where mot in ('XMAS','SAMX')
    
    