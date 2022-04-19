/*
Задание: 46
Для каждого корабля, участвовавшего в сражении при Гвадалканале (Guadalcanal), вывести название, водоизмещение и число орудий.
*/

select o.ship, 
       coalesce (c.displacement, (select displacement from Classes where class=o.ship)) as displacement, 
       coalesce (c.numGuns, (select numGuns from Classes where class=o.ship)) as numGuns
from Outcomes o left join
Ships s on o.ship=s.name left join
Classes c on s.class=c.class
where o.battle='Guadalcanal';
