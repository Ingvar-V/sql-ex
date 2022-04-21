/*
Задание: 49
Найдите названия кораблей с орудиями калибра 16 дюймов (учесть корабли из таблицы Outcomes).
*/

select s.name
from Classes c join
Ships s on c.class=s.class 
where bore=16
union
select o.ship
from Classes c join
Outcomes o on c.class=o.ship
where c.bore=16;
