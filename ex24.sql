/*
Задание: 24
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции. 
*/
with collection as (
select model, price from Laptop where price=(select max(price) from Laptop)
union
select model, price from PC where price=(select max(price) from PC)
union
select model, price from Printer where price=(select max(price) from Printer)),

maxprice as(select max(price) as mp from collection)

select model from collection, maxprice where price=mp



