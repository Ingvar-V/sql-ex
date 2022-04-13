/*
Задание: 37
Найдите классы, в которые входит только один корабль из базы данных (учесть также корабли в Outcomes).
*/

with ship_set as (select c.class, s.name 
from Classes c join
Ships s on c.class=s.class 
union
select c.class, o.ship
from Outcomes o join
Classes c on o.ship=c.class)

select class
from ship_set
group by class
having count(name) = 1
