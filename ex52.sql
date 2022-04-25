/*
Задание: 52
Определить названия всех кораблей из таблицы Ships, которые могут быть линейным японским кораблем,
имеющим число главных орудий не менее девяти, калибр орудий менее 19 дюймов и водоизмещение не более 65 тыс.тонн
*/

select s.name
from Ships s join
Classes c on s.class=c.class
where  (c.numGuns >=9 or c.numGuns is null)
      and (c.bore<19 or c.bore is null)
      and (c.displacement<=65000 or c.displacement is null)
      and (c.type='bb' and c.country='Japan');
