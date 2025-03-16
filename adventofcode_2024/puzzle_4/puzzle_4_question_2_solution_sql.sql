
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
-- on cherche à calculer les croix formées par le mot MAS. 
-- il y a 4 possibilités : les M sont à gauche, à droite, en haut ou en bas. 
-- les 4 tables contenant les croix  : 
,X_BAS as -- les "M" sont en bas
(
select 
     LETTRE_A.ligne
    ,LETTRE_A.rank_ligne
    ,LETTRE_A.rank_colonne
    ,LETTRE_A.value
    ,LETTRE_A.value  as lettre_a
    ,LETTRE_M1.value as lettre_m1
    ,LETTRE_M2.value as lettre_m2
    ,LETTRE_S1.value as lettre_s1
    ,LETTRE_S2.value as lettre_s2
from DATA_UNNEST as LETTRE_A
join DATA_UNNEST as LETTRE_M1
    on  LETTRE_A.rank_ligne   = LETTRE_M1.rank_ligne - 1
    and LETTRE_A.rank_colonne = LETTRE_M1.rank_colonne - 1 -- bas droit
    and LETTRE_M1.value = 'M'
join DATA_UNNEST as LETTRE_M2
    on  LETTRE_A.rank_ligne   = LETTRE_M2.rank_ligne - 1
    and LETTRE_A.rank_colonne = LETTRE_M2.rank_colonne + 1 -- bas gauche
    and LETTRE_M2.value = 'M'
join DATA_UNNEST as LETTRE_S1
    on  LETTRE_A.rank_ligne   = LETTRE_S1.rank_ligne + 1
    and LETTRE_A.rank_colonne = LETTRE_S1.rank_colonne - 1 -- haut droit
    and LETTRE_S1.value = 'S'
join DATA_UNNEST as LETTRE_S2
    on  LETTRE_A.rank_ligne   = LETTRE_S2.rank_ligne + 1 
    and LETTRE_A.rank_colonne = LETTRE_S2.rank_colonne + 1  -- haut gauche
    and LETTRE_S2.value = 'S'
where true
    and LETTRE_A.value = 'A' -- le A est au centre de la croix
)
,X_HAUT as -- les "M" sont en haut
(
select 
     LETTRE_A.ligne
    ,LETTRE_A.rank_ligne
    ,LETTRE_A.rank_colonne
    ,LETTRE_A.value
    ,LETTRE_A.value  as lettre_a
    ,LETTRE_M1.value as lettre_m1
    ,LETTRE_M2.value as lettre_m2
    ,LETTRE_S1.value as lettre_s1
    ,LETTRE_S2.value as lettre_s2
from DATA_UNNEST as LETTRE_A
join DATA_UNNEST as LETTRE_M1
    on  LETTRE_A.rank_ligne   = LETTRE_M1.rank_ligne + 1
    and LETTRE_A.rank_colonne = LETTRE_M1.rank_colonne - 1 
    and LETTRE_M1.value = 'M'
join DATA_UNNEST as LETTRE_M2
    on  LETTRE_A.rank_ligne   = LETTRE_M2.rank_ligne + 1
    and LETTRE_A.rank_colonne = LETTRE_M2.rank_colonne + 1 
    and LETTRE_M2.value = 'M'
join DATA_UNNEST as LETTRE_S1
    on  LETTRE_A.rank_ligne   = LETTRE_S1.rank_ligne - 1
    and LETTRE_A.rank_colonne = LETTRE_S1.rank_colonne - 1
    and LETTRE_S1.value = 'S'
join DATA_UNNEST as LETTRE_S2
    on  LETTRE_A.rank_ligne   = LETTRE_S2.rank_ligne - 1 
    and LETTRE_A.rank_colonne = LETTRE_S2.rank_colonne + 1  
    and LETTRE_S2.value = 'S'
where true
    and LETTRE_A.value = 'A' -- le A est au centre de la croix
)
,X_GAUCHE as -- les "M" sont à gauche
(
select 
     LETTRE_A.ligne
    ,LETTRE_A.rank_ligne
    ,LETTRE_A.rank_colonne
    ,LETTRE_A.value
    ,LETTRE_A.value  as lettre_a
    ,LETTRE_M1.value as lettre_m1
    ,LETTRE_M2.value as lettre_m2
    ,LETTRE_S1.value as lettre_s1
    ,LETTRE_S2.value as lettre_s2
from DATA_UNNEST as LETTRE_A
join DATA_UNNEST as LETTRE_M1
    on  LETTRE_A.rank_ligne   = LETTRE_M1.rank_ligne - 1
    and LETTRE_A.rank_colonne = LETTRE_M1.rank_colonne + 1 
    and LETTRE_M1.value = 'M'
join DATA_UNNEST as LETTRE_M2
    on  LETTRE_A.rank_ligne   = LETTRE_M2.rank_ligne + 1
    and LETTRE_A.rank_colonne = LETTRE_M2.rank_colonne + 1 
    and LETTRE_M2.value = 'M'
join DATA_UNNEST as LETTRE_S1
    on  LETTRE_A.rank_ligne   = LETTRE_S1.rank_ligne - 1
    and LETTRE_A.rank_colonne = LETTRE_S1.rank_colonne - 1 
    and LETTRE_S1.value = 'S'
join DATA_UNNEST as LETTRE_S2
    on  LETTRE_A.rank_ligne   = LETTRE_S2.rank_ligne + 1 
    and LETTRE_A.rank_colonne = LETTRE_S2.rank_colonne - 1  
    and LETTRE_S2.value = 'S'
where true
    and LETTRE_A.value = 'A' -- le A est au centre de la croix
)
,X_DROIT as -- les "M" sont à droite
(
select 
     LETTRE_A.ligne
    ,LETTRE_A.rank_ligne
    ,LETTRE_A.rank_colonne
    ,LETTRE_A.value
    ,LETTRE_A.value  as lettre_a
    ,LETTRE_M1.value as lettre_m1
    ,LETTRE_M2.value as lettre_m2
    ,LETTRE_S1.value as lettre_s1
    ,LETTRE_S2.value as lettre_s2
from DATA_UNNEST as LETTRE_A
join DATA_UNNEST as LETTRE_M1
    on  LETTRE_A.rank_ligne   = LETTRE_M1.rank_ligne - 1
    and LETTRE_A.rank_colonne = LETTRE_M1.rank_colonne - 1 
    and LETTRE_M1.value = 'M'
join DATA_UNNEST as LETTRE_M2
    on  LETTRE_A.rank_ligne   = LETTRE_M2.rank_ligne + 1
    and LETTRE_A.rank_colonne = LETTRE_M2.rank_colonne - 1 
    and LETTRE_M2.value = 'M'
join DATA_UNNEST as LETTRE_S1
    on  LETTRE_A.rank_ligne   = LETTRE_S1.rank_ligne - 1
    and LETTRE_A.rank_colonne = LETTRE_S1.rank_colonne + 1 
    and LETTRE_S1.value = 'S'
join DATA_UNNEST as LETTRE_S2
    on  LETTRE_A.rank_ligne   = LETTRE_S2.rank_ligne + 1 
    and LETTRE_A.rank_colonne = LETTRE_S2.rank_colonne + 1  
    and LETTRE_S2.value = 'S'
where true
    and LETTRE_A.value = 'A' -- le A est au centre de la croix
)
,ALL_XMAS as 
-- on récupère les données des 4 tables
(
select * from X_BAS    union all by name
select * from X_HAUT   union all by name
select * from X_GAUCHE union all by name
select * from X_DROIT
)
-- il ne reste qu'à compter le nombre de croix que l'on a obtenu. une par ligne.
select 
     count(*) as reponse_puzzle_4_question_1
from ALL_XMAS