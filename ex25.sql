/*
�������: 25
������� �������������� ���������, ������� ���������� �� � ���������� ������� RAM � � ����� ������� ����������� ����� ���� ��, ������� ���������� ����� RAM. �������: Maker
*/

with pc_with_min_ram as (
select model, speed 
from PC
where ram = (select min(ram) from PC)
),

pc_with_minram_maxspeed as (
select model
from pc_with_min_ram
where speed = (select max(speed) from pc_with_min_ram)
),

printer_maker as (
select maker 
from Product
where type='Printer'
group by maker
)

select distinct maker 
from Product
where model in (select * from pc_with_minram_maxspeed)
and maker in (select * from printer_maker)