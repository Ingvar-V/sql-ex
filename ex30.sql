/*
Задание: 30
В предположении, что приход и расход денег на каждом пункте приема фиксируется произвольное число раз
(первичным ключом в таблицах является столбец code), требуется получить таблицу, в которой каждому пункту
за каждую дату выполнения операций будет соответствовать одна строка.
Вывод: point, date, суммарный расход пункта за день (out), суммарный приход пункта за день (inc).
Отсутствующие значения считать неопределенными (NULL). 

*/

with punkt_date as (
select distinct code, point,date from Income
union
select distinct code, point,date from Outcome
)
select pd.point, pd.date, sum(o.out) as outcome, sum(i.inc)as income 
from punkt_date pd left join
Outcome o on pd.code=o.code and pd.date=o.date  and pd.point=o.point left join
Income i on pd.code=i.code and pd.date=i.date  and pd.point=i.point 
group by pd.point, pd.date
order by pd.point