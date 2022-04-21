/*
Задание: 50 
Найдите сражения, в которых участвовали корабли класса Kongo из таблицы Ships.
*/

select distinct o.battle
from Ships s join 
Outcomes o on s.name=o.ship
where s.class='Kongo';
