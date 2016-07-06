

-- � ������ ������� �� ������� PC, ��������������� �� ������� code (�� �����������) ����� ������� �������� ���� ��� ������ �������� ������ ������ ��.
-- �����: �������� code, ������� �������� ������ � ������ �� ����� �����, ������� �������� ���� � ������.


-- cost 0.0071139801293612 operations 21 
with t1 as (
	select row_number() over(order by [code]) as rno,
		[code],
		avg([price]) over (order by [code] rows between current row and 5 following) as ap
		from PC)
select code, ap 
from t1 
where t1.rno <= (select count(*) from t1) - 5

