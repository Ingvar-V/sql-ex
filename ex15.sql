/*
�������: 15
������� ������� ������� ������, ����������� � ���� � ����� PC. �������: HD
*/
SELECT hd
FROM PC
GROUP BY hd
HAVING COUNT(hd) > 1

