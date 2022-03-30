/*
Задание: 18
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price 
*/
select top 1 with ties p.maker,
r.price as price
from Printer r join 
Product p on r.model=p.model and r.color='y'
group by r.price, p.maker
having r.price=min(r.price)
order by r.price

