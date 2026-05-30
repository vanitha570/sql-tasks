create database emp_details;
use emp_details;
CREATE TABLE emp (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    job_role VARCHAR(50),
    salary DECIMAL(10,2)
);
INSERT INTO emp (emp_id, name, age, department, job_role, salary)
VALUES
(123, 'Ravi', 25, 'HR', 'HR Executive', 30000),
(234, 'Priya', 28, 'Finance', 'Accountant', 45000),
(345, 'Kiran', 30, 'IT', 'Software Engineer', 60000),
(456, 'Sneha', 27, 'Marketing', null, 40000),
(567, 'Arjun', 32, 'Sales', 'Sales Manager', 55000),
(678, 'Divya', 29, 'IT', 'System Analyst', 65000),
(789, 'Manoj', 26, 'HR', 'Recruiter', 35000),
(890, 'Pooja', 31, 'Finance', 'Financial Analyst', 50000),
(901, 'Vijay', 35, 'Management', 'Project Manager', 80000);

select * from emp;
desc emp;

-- Fetch all employees who earn more than ₹40,000
select * from emp where salary>40000;

-- Get all employees whose names start with the letter 'A'.
select name from emp where name like'A%';

-- Retrieve all employees where the department is either 'HR' or 'Finance'.
select name,department from emp where department ="HR" or department="Finance";

-- Find all employees where the manager field has no value (is NULL).
select name,job_role from emp where job_role is null;

-- Count the number of employees in each department, but only include
-- employees earning more than ₹30,000
select department,count(*) as emp_count from emp where salary>30000 group by department;

-- Find the average salary for each job_role in the 'IT' department.
select job_role,avg(salary) as avg_sal from emp where department="IT" group by job_role;

-- Show the total salary paid per department and 
-- per job_role for employees aged under 35.
select department,job_role,sum(salary) as total_sal from emp where age<35 group by department,job_role;

-- Find the total salary paid to employees in each department. 
select department,sum(salary) as total_sal from emp group by department;

-- Count the total number of employees in each department
select department,count(emp_id) as total_emp from emp group by department;

-- Find the average salary of employees in each department.
select department,avg(salary) as avg_sal from emp group by department;

-- Show the count of employees for each department and job_role combination.
select department,job_role,count(emp_id) as emp_count from emp group by department,job_role;