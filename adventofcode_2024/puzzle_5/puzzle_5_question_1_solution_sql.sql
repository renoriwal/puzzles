
--
-- script : 
-- exécuté sur bigquery
--
-- but : vérifier que les orders ne transgresent pas les différentes règles données
--



with DATA_RANK as
-- on rajoute un rank pour pourvoir séparer les rules des orders 
(
select
     col_0 as ligne
    ,row_number() over () as rank
from PROJET.SCHEMA.PUZZLE_INPUT
)
,DATA_RULES as 
-- on filtre sur la première partie de l'input : il s'agit des règles que l'on appliquera sur les ordres (partie 2 du fichier)
-- on en profite pour séparer les règles en deux colonnes pour faciliter les calculs plus tard
(
select 
     ligne
    ,substring(ligne,1                 ,instr(ligne,'|')-1              ) as rules_1
    ,substring(ligne,instr(ligne,'|')+1,length(ligne) - instr(ligne,'|')) as rules_2
from DATA_RANK
where rank < (select rank from DATA_RANK where ligne is null) 
)
,DATA_ORDERS_ARRAY as 
-- on filtre sur la deuxièe partie du dataset, c'est à dire les orders. 
(
select 
     ligne
    ,split(ligne,',') as orders_array
from DATA_RANK
where rank > (select rank from DATA_RANK where ligne is null) 
)
,DATA_ORDERS as 
-- unnest des orders + rank pour pouvoir les travailler plus facilement. 
(
select 
    DATA_ORDERS_ARRAY.ligne
    ,ORDERS as orders
    ,row_number() over (partition by DATA_ORDERS_ARRAY.ligne) as rank
from DATA_ORDERS_ARRAY
join unnest (DATA_ORDERS_ARRAY.orders_array) as ORDERS
)
,DATA_ORDERS_ALL_COMBI as
-- depuis la tables des orders, on crée une table contenant toutes les combinaisons possibles en prenant les élément deux à deux. chaque élément sera vérifier dans les réègles par la suite.
(
select
     ORDER_1.ligne
    ,ORDER_1.orders as order_1
    ,ORDER_1.rank   as rank_1
    ,ORDER_2.orders as order_2
    ,ORDER_2.rank   as rank_2
from DATA_ORDERS as ORDER_1
join DATA_ORDERS as ORDER_2
    on  ORDER_1.ligne = ORDER_2.ligne
    and ORDER_1.rank  < ORDER_2.rank
)
,DATA_TRANSGRESSION as
-- on vient rajouter un tag sur chaque combinaison pour savoir si elle transgresse une des règles. 
-- pour cela, on vient vérifier si on retrouve au moins une règles écrite à l'envers (on inverse les coordonnées). Si c'est le cas, alors il ne faudrat pas prednre la ligne
(
select 
     ORDERS.ligne
    ,ORDERS.order_1
    ,ORDERS.rank_1
    ,ORDERS.order_2
    ,ORDERS.rank_2
    ,case when RULES.ligne is not null then 1 else 0 end as is_transgression
from DATA_ORDERS_ALL_COMBI ORDERS
left join DATA_RULES RULES
    on  ORDERS.order_1 = RULES.rules_2
    and ORDERS.order_2 = RULES.rules_1
)
,DATA_TRANSGRESSION_FILTRE as 
-- on rajoute 2 colonnes qui permettront de filtrer selon les règles du jeu : 
-- 1 - on le prend pas en compte les lignes qui contiennent une transgression
-- 2 - on sommera la valeur située au milieu de l'order
(
select
     ligne
    ,order_1
    ,rank_1
    ,order_2
    ,rank_2
    ,is_transgression
    ,max(is_transgression ) over (partition by ligne)        as ligne_avec_transagression -- 1 si la ligne contient une transagression
    ,(max(rank_1          ) over (partition by ligne) +2) /2 as filtre_rank -- numéro du rank du milieu de l'order
from DATA_TRANSGRESSION
)
,DATA_DISTINCT as 
(
-- on filtre grâce aux colones calculées précédemment et on rajoute un distinct pour ne prendre qu'une seule fois la valeur du milieu de l'order (en créant toutes les combinaison, on a créé des doublons)
select distinct
     ligne
    ,order_1 
from DATA_TRANSGRESSION_FILTRE
where true
    and ligne_avec_transagression = 0
    and filtre_rank = rank_1
)
select 
    sum(cast(order_1 as integer)) as reponse_puzzle_5_question_1
from DATA_DISTINCT

