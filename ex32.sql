/*
Задание: 32
Одной из характеристик корабля является половина куба калибра его главных орудий (mw).
С точностью до 2 десятичных знаков определите среднее значение mw для кораблей каждой страны, у которой есть корабли в базе данных.
*/

select c.country, cast(avg(power(c.bore, 3)/2) as dec (12,2)) as mw_avg
from Classes c left join
Ships s on c.class=s.class
group by c.country
