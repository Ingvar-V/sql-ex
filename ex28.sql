/*
«адание: 28
»спользу€ таблицу Product, определить количество производителей, выпускающих по одной модели. 
*/
with maker_list as (
select maker
from Product
group by maker
having count(model)=1
)

select count(*) as qty from maker_list;

