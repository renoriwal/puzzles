
/*
 script : 
 résolution de la question 2 du puzzle : https://adventofcode.com/2024/day/1  

résumé :
Pour chaque valeur différente de la première colonne 1 par le nombre de fois qu'apparît ce nombre dans la colonne 2, puis on somme la totalité.  
*/

with 
DATA_PREP as 
-- préparation des données : séparation des colonnes. un substring classique suffit car la longueur de chaîne de caractère est toujours la même
(
select 
     cast(substring(T.data,1,5           ) as integer) as col_1
    ,cast(substring(T.data,6,length(data)) as integer) as col_2
from PROJET.SCHEMA.TABLE_PUZZLE as T
)
,COMPTAGE as 
(
select
     C1.col_1
    ,count(*) as nb_apparition
from DATA_PREP C1
join DATA_PREP C2
    on C1.col_1 = C2.col_2
group by all
)
select 
    sum(COMPTAGE.col_1 * COMPTAGE.nb_apparition) as reponse_puzzle_1_question_2
from COMPTAGE