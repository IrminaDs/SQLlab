-- LABY 3

-- 1.1
select count(*) from employees where first_name rlike '^A' and last_name rlike 'y$';
-- 1.2
select count(*) from (select distinct title from titles
where title like '% %') as sub;
-- 1.3
select count(*) from employees where first_name rlike '[bc]' and first_name not rlike 'e' and first_name rlike '[^n]$';
-- 2.1
select count(*) from employees where first_name rlike '^
s[^aeiouy]*[aeiouy][^aeiouy]*[aeiouy][^aeiouy]*[aeiouy][^aeiouy]*$';
-- 2.2
select count(*) from employees where first_name = reverse(first_name);
-- 2.3
select first_name from employees where first_name rlike '^[^aeiouy]+$';
-- 3.1
select count(*) from employees where hire_date >= '1990-01-01' and hire_date <= '1995-12-31' and emp_no in (select emp_no from titles where title = 'Senior Staff');
-- 3.2
select count(*) from employees where hire_date >= (select from_date from salaries where salary > 120000 order by from_date limit 1);
-- 3.3
select count(*) from titles where title = 'Manager' and to_date is null and emp_no in (select emp_no from employees where hire_date >= (select from_date from salaries where salary > 120000 order by from_date limit 1));
-- 3.4
select count(*) from titles where to_date is null and title in (select distinct title from titles where title != 'Manager' and emp_no in (select emp_no from dept_manager where to_date is null));
