/*
Задание: 45
Найдите названия всех кораблей в базе данных, состоящие из трех и более слов (например, King George V).
Считать, что слова в названиях разделяются единичными пробелами, и нет концевых пробелов.
*/
with ships_set as (
select name from ships
union
select ship from outcomes
)
-- названия кораблей содержащих 2 и более пробелов
SELECT name
FROM ships_set
where LEN(name + '@') - LEN(REPLACE(name, ' ', '') + '@') > 1
