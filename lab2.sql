-- LABY 2

-- 2.1
select first_name, last_name, birth_date from employees order by last_name desc;
-- 2.2
select first_name, last_name from employees where gender = 'F';
-- 2.3
select first_name, last_name, birth_date from employees order by last_name asc, birth_date asc;
-- 2.4
select distinct title as 'Company titles' from titles order by title asc;
-- 3.1
select year(birth_date) from employees order by birth_date asc limit 1;
-- 3.2
select count(*) from employees where day(hire_date) = 29 and month(hire_date) = 2;
-- 3.3
select count(*) from employees where first_name like 'S%';
-- 3.4
select count(*) from employees where day(hire_date) = day(birth_date) and month(hire_date) = month(birth_date);
-- 3.5
select count(*) from titles where to_date is null;
-- 4.1
select count(*) from (select emp_no, min(salary) from salaries where salary < 100000 group by emp_no) as sub;
-- 4.2
select count(*) from employees where gender = 'F' and dayofweek(hire_date) = 2 and (first_name like 'M%' or last_name like 'K%') and year(hire_date) > 1986;
-- 4.3
select max(if(to_date is not null, year(to_date) - year(from_date), year(curdate()) - year(from_date))) as years from titles;
