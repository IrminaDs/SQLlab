-- LABY 4

-- 3.1
select s.emp_no, max(salary), min(s.from_date) as hire from salaries s join titles using(emp_no) where s.emp_no not in (select emp_no from titles where title = 'Manager') and s.emp_no in (select emp_no from salaries where to_date is null) group by s.emp_no order by hire asc, max(salary) desc limit 1;
-- 4.1
select a.Nazwa, b.Nazwa from klienci a join klienci b where a.Miejscowosc = b.Miejscowosc and a.Nazwa != b.Nazwa;
-- 4.2
select a.Nazwa, b.Nazwa from klienci a join klienci b where a.Nazwa like 'J%' and b.Nazwa rlike '^[cd]';
-- 4.3
select count(*) from (select a.IDZamowienia, a.IDPudelka, c.Nazwa from artykuly a join zawartosc z using(IDPudelka) join cukierki c using(IDCukierka) where (c.Nazwa rlike 'Piank' or c.Nazwa rlike 'Lizak') and a.IDPudelka not like '%M%' group by IDZamowienia) as sub;
-- 4.4
select a.Nazwa, b.Nazwa from klienci a join klienci b where a.Miejscowosc = b.Miejscowosc and a.Nazwa > b.Nazwa order by a.Nazwa;
