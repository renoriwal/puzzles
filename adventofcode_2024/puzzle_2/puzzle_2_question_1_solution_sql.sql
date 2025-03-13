
--
-- script : 
-- résolution de la question 2 du puzzle : https://adventofcode.com/2024/day/2
-- traitée sur bigquery
--
-- résumé : 
-- on calcul la différence entre la valeur actuel et la valeur précédente. 
-- la différence doit toujours être comprise entre 1 et 3 et la série doittoujours être strictement croissante ou strictement décroissante
-- 


with DATA_SPLIT as 
-- split des données pour obtenir un array
(
select 
     col_0 as serie
    ,split(col_0,' ') as data_split
from PROJET.SCHEMA.PUZZLE_INPUT
)
,DATA_PREP as 
-- pivot sur l'array pour obtenir une ligne par valeur. On rajoute le rank pour bien garder l'ordre
(
select 
     serie
    ,cast(DATA_UNNEST as integer) as valeur
    ,row_number() over (partition by serie) as rank
from DATA_SPLIT
left join unnest(DATA_SPLIT.data_split) DATA_UNNEST
)
,DATA_DIFF as 
-- maintenant que les données sont bien formatées, on commence à les travailler. le but sera de créer les colonnes qui permettront de filtrer selon les reègles du jeu
-- on calcule la différence entre la ligne actuel et la ligne précédente.
(
select 
     serie
    ,valeur
    ,rank
    ,valeur - lag(valeur) over (partition by serie order by rank) as diff
from DATA_PREP
)
,DATA_DIFF_ENRICHIE as 
-- on calcule les colonnes qui permettront de filtrer sur les règles imposées : 
-- ecart_min_entre_2_valeurs et ecart_max_entre_2_valeurs permet de vérifier qu'entre deux valeurs, on a bien un écart entre 1 et 3
-- ecart_min, ecart_max permettront de vérifier que la série est soit strictement croissante soit strictement décroissante
(
select 
     serie
    ,valeur
    ,rank
    ,diff
    ,min(abs(diff)) over (partition by serie) as ecart_min_entre_2_valeurs
    ,max(abs(diff)) over (partition by serie) as ecart_max_entre_2_valeurs
    ,min(    diff ) over (partition by serie) as ecart_min
    ,max(    diff ) over (partition by serie) as ecart_max
from DATA_DIFF
)
-- il ne reste qu'à filtrer sur les bonnes séries et à les compter
select 
     count(distinct serie) as reponse_puzzle_2_question_1
from DATA_DIFF_ENRICHIE
where true
    and diff is not null -- élimination de la première ligne de chaque série qui n'a plus rien a apporter
    and ecart_min_entre_2_valeurs between 1 and 3 -- règle : entre 1 et 3 d'écart entre 2 valeurs
    and ecart_max_entre_2_valeurs between 1 and 3 -- règle : entre 1 et 3 d'écart entre 2 valeurs
    and ecart_min * ecart_max > 0 -- règle : série strictement croissante ou décroissante
     

