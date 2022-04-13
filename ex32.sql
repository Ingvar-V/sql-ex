/*
Задание: 32
Одной из характеристик корабля является половина куба калибра его главных орудий (mw).
С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных.
*/

with ship_set as (select c.country, c.bore, s.name
from Classes c left join
Ships s on c.class=s.class
where s.name is not null
union
select distinct  c.country, c.bore, o.ship
from outcomes o left join
Ships s on o.ship=s.name left join
Classes c on o.ship=c.class
where c.country is not null)

select country,
       cast(avg(power(bore, 3)/2) as dec (12,2)) as mw_avg
from ship_set 
group by country
