/*
�������: 23
������� ��������������, ������� ����������� �� ��� ��
�� ��������� �� ����� 750 ���, ��� � ��-�������� �� ��������� �� ����� 750 ���.
�������: Maker
*/
select distinct p.maker
from Product p join
PC on p.model=PC.model and PC.speed >=750 
intersect
select distinct p.maker
from Product p join
Laptop l on p.model=l.model and l.speed >=750; 