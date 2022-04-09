/*
Задание: 29
В предположении, что приход и расход денег на каждом пункте приема фиксируется не чаще одного раза в день
[т.е. первичный ключ (пункт, дата)], написать запрос с выходными данными (пункт, дата, приход, расход).
Использовать таблицы Income_o и Outcome_o. 
*/

with punkt_date as (
select distinct point,date from Income_o
union
select distinct point,date from Outcome_o
)
select pd.point, pd.date, i.inc, o.out
from punkt_date pd left join
Outcome_o o on pd.date=o.date and pd.point=o.point  left join
Income_o i on pd.date=i.date and pd.point=i.point
