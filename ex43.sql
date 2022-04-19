/*
Задание: 43
Укажите сражения, которые произошли в годы, не совпадающие ни с одним из годов спуска кораблей на воду.
*/

select name 
from Battles
where year(date) in (select year(date) from Battles
                     except
                     select launched from Ships);
