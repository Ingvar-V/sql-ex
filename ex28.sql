/*
�������: 28
��������� ������� Product, ���������� ���������� ��������������, ����������� �� ����� ������. 
*/
with maker_list as (
select maker
from Product
group by maker
having count(model)=1
)

select count(*) as qty from maker_list;

