
--
-- script : 
-- exécuté sur bigquery
--
-- on ne calcule que les mul(X,Y) si une instruction "do()" est présente avant. si la dernière instruction est un "don't()", on ne calcule rien. 
-- le but sera de commencer par garder les bout de code valide, donc ceux qui sont compris entre un "do()" et un "don't()"
--


with DATA_CONCAT as
-- on retravaille la data qui était sur 6 lignes pour tout avoir en seul bloc : 
(
select
     string_agg(col_0,'') as data
from PROJET.SCHEMA.PUZZLE_INPUT
)
,DATA_SPLIT_DO as 
-- split des données pour obtenir un array
-- le but est d'utiliser l'instruction do() comme séparateur. on pourra ainsi compter tous les mul car ils seront valides, et on s'arrêtera au premier "don't() trouvé
(
select 
     data
    ,split(data,'do()') as value
from DATA_CONCAT
)
,DATA_UNNEST_DO as 
-- pivot sur l'array pour obtenir une ligne par valeur.
(
select 
     data
    ,DATA_UNNEST as value
from DATA_SPLIT_DO
left join unnest(DATA_SPLIT_DO.value) DATA_UNNEST
)
,DATA_FILTRE_DO as
-- on extrait la donnée jusqu'au premier "don't()" que l'on trouve. s'il n'y en a pas, on prend toute la valeur.
-- en faisant cela, on récupère bien la donnée qui est après un "do()" (on garde aussi le début du dataset même s'il ne commence pas par "do()" et qui est avant un "don't()"
(
select 
     case when instr(value,'don\'t()') = 0 then value else substring(value, 1, instr(value,'don\'t()')) end as value
from DATA_UNNEST_DO
)
-- à partir de ce moment, il suffit de refaire tourner l'algo créé précédemment :
,DATA_SPLIT as 
-- split des données pour obtenir un array
(
select 
     value as data
    ,regexp_extract_all(value, r'mul\([0-9]+,[0-9]+\)')  as all_mul
from DATA_FILTRE_DO
)
,DATA_UNNEST as 
(
select 
    mul
from DATA_SPLIT
join unnest (DATA_SPLIT.all_mul) as mul
)
,DATA_EXTRACT_ELEMENT as 
(
select 
     mul
    ,substring(mul,5               ,instr(mul,',')-5                ) as element_1 -- extraction du premier  élément
    ,substring(mul,instr(mul,',')+1,(length(mul) - instr(mul,','))-1) as element_2 -- extraction du deuxième élément
from DATA_UNNEST
)
select 
sum(cast(element_1 as integer)*cast(element_2 as integer)) as reponse_puzzle_3_question_2
from DATA_EXTRACT_ELEMENT

