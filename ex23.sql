/*
Задание: 23
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker
*/
select distinct p.maker
from Product p join
PC on p.model=PC.model and PC.speed >=750 
intersect
select distinct p.maker
from Product p join
Laptop l on p.model=l.model and l.speed >=750; 