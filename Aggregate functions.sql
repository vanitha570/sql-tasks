use company;
select * from emp;
desc emp;
alter table emp add dept_name varchar(50);
UPDATE emp SET dept_name = 'HR' WHERE e_id = 123;
UPDATE emp SET dept_name = 'Finance' WHERE e_id = 234;
UPDATE emp SET dept_name = 'IT' WHERE e_id = 345;
UPDATE emp SET dept_name = 'Marketing' WHERE e_id = 456;
UPDATE emp SET dept_name = 'Sales' WHERE e_id = 567;
UPDATE emp SET dept_name = 'IT' WHERE e_id = 678;
UPDATE emp SET dept_name = 'HR' WHERE e_id = 789;
UPDATE emp SET dept_name = 'Finance' WHERE e_id = 890;
UPDATE emp SET dept_name = 'Management' WHERE e_id = 901;

ALTER TABLE emp
ADD bonus INT;
UPDATE emp SET bonus = 5000 WHERE e_id = 123;
UPDATE emp SET bonus = 7000 WHERE e_id = 234;
UPDATE emp SET bonus = 8000 WHERE e_id = 345;
UPDATE emp SET bonus = 6000 WHERE e_id = 456;
UPDATE emp SET bonus = 7500 WHERE e_id = 567;
UPDATE emp SET bonus = 9000 WHERE e_id = 678;
UPDATE emp SET bonus = 5500 WHERE e_id = 789;
UPDATE emp SET bonus = 6500 WHERE e_id = 890;
UPDATE emp SET bonus = 10000 WHERE e_id = 901;
-- Write a query to count total number of employees.
select count(*) as total_emp from emp;

-- Count how many employees have salary. 
select count(sal) from emp;

-- Find number of unique departments
select count(distinct(dept_name)) from emp;

-- Find total salary paid to all employees.
select sum(sal) as total_sal from emp;

-- Find average salary.
select avg(sal) as avg_sal from emp;

-- Calculate total of distinct bonus values.
select sum(distinct(bonus)) as distinct_bonus from emp;

-- Find highest salary. 
select max(sal) as highest_sal from emp;

-- Find lowest salary. 
select min(sal) as lowest_sal from emp;

-- Calculate total payout (salary + bonus) for all employees. 
select sum(sal+bonus) as payout from emp;

-- Find average salary after deducting tax (10%).
select avg(sal-(sal*0.10)) as avg_sal_after_tax from emp;