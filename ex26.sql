/*
Задание: 26
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена. 
*/
with PS_Laptop_models as (select model, type
from Product
where maker = 'A' and type in ('PC', 'Laptop')),
prices as (select price from PC where model in (select model from PS_Laptop_models where type='PC')
union all
select price from Laptop where model in (select model from PS_Laptop_models where type='Laptop'))
select avg(price) from prices
