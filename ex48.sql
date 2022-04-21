/*
Задание: 48
Найдите классы кораблей, в которых хотя бы один корабль был потоплен в сражении.

*/

select distinct coalesce(s.class, c.class) as class
from Outcomes o left join
Ships s on o.ship=s.name left join
Classes c on o.ship=c.class
where o.result='sunk' and coalesce(s.class, c.class) is not null;
