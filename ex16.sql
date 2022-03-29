/*
Задание: 16
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i),
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
*/ 
select distinct p.model,
                l.model,
		p.speed,
		p.ram
from pc p join
(select speed,
        ram
from pc
group by speed, ram
having count(*)>1) as r
on r.speed=p.speed and r.ram=p.ram join
pc l on r.speed=l.speed and r.ram=l.ram and p.model>l.model
