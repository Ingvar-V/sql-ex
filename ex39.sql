/*
Задание: 39
Найдите корабли, `сохранившиеся для будущих сражений`, т.е. выведенные из строя в одной битве (damaged), они участвовали в другой, произошедшей позже.
*/

with battle_outcome as (select o.*, b.*,
rank() over(partition by o.ship order by b.date desc) as rnk
from Outcomes o join
Battles b on o.battle=b.name
)
select distinct ship from battle_outcome 
where rnk=2 and result ='damaged'
