
--
-- script : 
-- exécuté sur bigquery
--
-- on a une chaîne de caractère. le but est de repéré le pattern suivant : mu(nnn,mmm), avec nnn et mmm qui sont des nombres. 
-- une fois repéré, il suffit de sommer le produit des deux chiffres. 
--
-- difficultés : 
-- la fonction regexp_extract de bq ne permet pas d'extraire en une fois plusieurs suites, notemment repérer le chiffre nnn et le chiffre mmm en même temps. 
-- du coup pour parer à cela, je décompose en plusieurs étapes ce calcul. 
-- si cela avait fonctionné, on aurait utilisé ceci : regex_extract(value, r'\((\d+),(\d+)\)')
--

with DATA_SPLIT as 
-- split des données pour obtenir un array
(
select 
     col_0 as data
    ,regexp_extract_all(col_0, r'mul\([0-9]+,[0-9]+\)')  as all_mul
from PROJET.SCHEMA.PUZZLE_INPUT
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
sum(cast(element_1 as integer)*cast(element_2 as integer))
from DATA_EXTRACT_ELEMENT