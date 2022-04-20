/*
Задание: 47
Определить страны, которые потеряли в сражениях все свои корабли.
*/

with ships_set as (
select country, count(name) as cnt 
from (select c.country, s.name
from Ships s join
Classes c on s.class=c.class
union
select c.country, o.ship
from Classes c join
Outcomes o on c.class=o.ship) t1
group by country),

out_set as ( select country, count(name) as cnt
from (select c.country, s.name
      from Classes c join
      Ships s on c.class=s.class and s.name in (select ship from Outcomes where result='sunk') 
union
select c.country, c.class 
from Classes c join
Outcomes o on c.class=o.ship and o.result='sunk') t2
group by country)

select s.country
from ships_set s join
out_set o on s.country = o.country and s.cnt=o.cnt; 
