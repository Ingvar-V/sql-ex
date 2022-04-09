select c.country, cast(avg(power(c.bore, 3)/2) as dec (12,2)) as mw_avg
from Classes c left join
Ships s on c.class=s.class
group by c.country
