/*
Задание: 18
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price 
Solution 1
*/
with mpp as
(SELECT MIN(price) as price 
 FROM Printer 
 WHERE Color ='y') 
select distinct c.maker, p.price
from Printer p join 
mpp on mpp.price=p.price and p.color='y' join
Product c ON p.model = c.model


/* Solution 2 */
SELECT distinct c.maker,
       a.priceA price
FROM (SELECT MIN(price) priceA 
      FROM Printer 
      WHERE Color ='y'
     ) a INNER JOIN 
     Printer b ON a.priceA = b.price and b.color='y' INNER JOIN 
     Product c ON b.model = c.model
     

/* Solution 3 */
select top 1 with ties p.maker,
r.price as price
from Printer r join 
Product p on r.model=p.model and r.color='y'
group by r.price, p.maker
having r.price=min(r.price)
order by r.price;

