/*
Задание: 27
Найдите средний размер диска ПК каждого из тех производителей,
которые выпускают и принтеры. Вывести: maker, средний размер HD. 
*/
with pc_printer_maker_list as (
select maker, p.type
from Product p
where p.type not like ('Laptop')
group by maker, p.type
),
maker_list as (select maker, count(maker) as cnt
from pc_printer_maker_list
group by maker
having count(maker) > 1),
pc_list as (select maker, model
from Product
where maker in (select maker from maker_list) and type='PC'
)
select pl.maker,
       avg(PC.hd) as avg_hd
from pc_list pl join
PC on pl.model=PC.model
group by pl.maker
