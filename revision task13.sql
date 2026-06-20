create database subqueries;
use subqueries;
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    manager_id INT
);
ALTER TABLE Department
ADD manager_name VARCHAR(50);

UPDATE Department SET manager_name = 'Ravi' WHERE dept_id = 1;
UPDATE Department SET manager_name = 'Sneha' WHERE dept_id = 2;
UPDATE Department SET manager_name = 'Suresh' WHERE dept_id = 3;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    dept_id INT,
    sale_amount DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES
(1,'IT',101),
(2,'HR',106),
(3,'Finance',110);

INSERT INTO Employee VALUES
(101,'Ravi',80000,1,NULL),
(102,'Priya',60000,1,101),
(103,'Kiran',75000,1,101),
(104,'Asha',55000,1,101),
(105,'Vijay',70000,1,101),
(106,'Sneha',85000,2,NULL),
(107,'Rahul',50000,2,106),
(108,'Meena',52000,2,106),
(109,'Arun',48000,2,106),
(110,'Suresh',90000,3,NULL),
(111,'Divya',65000,3,110),
(112,'Ramesh',62000,3,110);

INSERT INTO Sales VALUES
(1,102,1,15000),
(2,103,1,25000),
(3,104,1,12000),
(4,105,1,18000),
(5,107,2,10000),
(6,108,2,22000),
(7,109,2,9000),
(8,111,3,30000),
(9,112,3,28000),
(10,103,1,15000),
(11,108,2,12000),
(12,111,3,15000);

SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Sales;

-- Write a SQL query to retrieve the names of all employees who earn a salary higher than the average salary in their department, 
-- using a subquery.
select e.* from Employee e where salary > (select avg(salary) as avg_sal from Employee where dept_id=e.dept_id);

-- Write a SQL query to get the names of all employees and the names of their corresponding department managers, 
-- using an inner join.
select e.emp_name,d.manager_name from Employee e inner join Department d on e.dept_id=d.dept_id;

-- Write a SQL query to retrieve the names of all employees who do not have a manager assigned,
--  using a left join and a subquery.
SELECT e.emp_name FROM Employee e LEFT JOIN Employee m ON e.manager_id = m.emp_id WHERE e.manager_id IS NULL;
-- Write a SQL query to get the total sales amount for each department,
-- using a subquery to filter departments with sales above a certain threshold.
SELECT *
FROM
(
    SELECT e.dept_id,SUM(s.sale_amount) AS total_sales FROM Employee e
    JOIN Sales s ON e.emp_id = s.emp_id GROUP BY e.dept_id
) as total_sales
WHERE total_sales > 100000;

-- Write a SQL query to retrieve the top 3 employees with the highest total sales in each department, 
-- using a subquery and a join.
SELECT emp_id,
       emp_name,
       dept_id,
       total_sales
FROM
(
    SELECT e.emp_id,
           e.emp_name,
           e.dept_id,
           SUM(s.sale_amount) AS total_sales,
           ROW_NUMBER() OVER
           (
               PARTITION BY e.dept_id
               ORDER BY SUM(s.sale_amount) DESC
           ) AS rn
    FROM Employee e
    JOIN sales s
    ON e.emp_id = s.emp_id
    GROUP BY e.emp_id, e.emp_name, e.dept_id
) t
WHERE rn <= 3;
-- Write a SQL query to get the names of all employees who work in departments that have more than 5 employees, 
-- using a subquery and a join.
SELECT e.emp_name
FROM Employee e
JOIN
(
    SELECT dept_id
    FROM Employee
    GROUP BY dept_id
    HAVING COUNT(*) > 5
) d
ON e.dept_id = d.dept_id;

