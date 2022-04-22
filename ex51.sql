/*
Задание: 51
Найдите названия кораблей, имеющих наибольшее число орудий среди всех имеющихся кораблей такого же водоизмещения (учесть корабли из таблицы Outcomes).
*/
with all_ships as(
select s.name, numGuns, displacement from Classes c join Ships s on c.class=s.class
union
select o.ship as name, numGuns, displacement from Classes c join Outcomes o on c.class=o.ship),
ships_set as (select name, numGuns, displacement,
rank() over (partition by displacement order by numGuns desc) as rnk
from all_ships)
select name from ships_set where rnk=1;
