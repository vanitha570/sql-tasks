create database revision;
use revision;
-- Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2),
    dept_id INT,
    experience INT,
    hire_date DATE,
    first_name VARCHAR(30),
    last_name VARCHAR(30)
);

INSERT INTO employees VALUES
(1,'Ravi',60000,101,5,'2024-01-15','Ravi','Kumar'),
(2,'Suresh',75000,102,8,'2023-05-10','Suresh','Reddy'),
(3,'Sunil',90000,101,10,'2024-03-20','Sunil','Sharma'),
(4,'Anitha',45000,103,2,'2022-08-11','Anitha','Devi'),
(5,'Sita',90000,102,12,'2024-06-01','Sita','Rao');

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1,'Laptop','Electronics',50000),
(2,'Mobile','Electronics',25000),
(3,'Table','Furniture',10000),
(4,'Chair','Furniture',5000);

-- Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
(1,'Raj',85),
(2,'Priya',92),
(3,'Kiran',65),
(4,'Deepa',78);

-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    email VARCHAR(100)
);

INSERT INTO customers VALUES
(1,'Ramesh','ramesh@gmail.com'),
(2,'Geetha','geetha@gmail.com'),
(3,'Vijay','vijay@yahoo.com');

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    delivery_date DATE
);

INSERT INTO orders VALUES
(101,1,'2024-05-01','2024-05-05'),
(102,2,'2024-06-10','2024-06-15');

-- Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1,'2024-01-01',1000),
(2,'2024-01-02',1500),
(3,'2024-01-03',2000),
(4,'2024-01-04',1200);

SELECT * FROM employees;
SELECT * FROM products;
SELECT * FROM students;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM sales;

-- 1.Display employees whose salary is greater than the average salary of all employees.
select emp_name,salary from employees where salary>(select avg(salary) as avg_sal from employees);
-- 2. Find employees who work in the same department as employee 'Ravi'.
select emp_name,dept_id from employees where dept_id in (select dept_id from employees where emp_name="Ravi");
-- 3. Display products whose price is higher than the minimum product price.
select product_name,price from products where price>(select min(price) as minimum_price from products);
-- 4. Find students who scored more than the average marks.
select student_name,marks from students where marks>(select avg(marks) as avg_marks from students);
-- 5. Display employees whose salary is equal to the highest salary.
select emp_name,salary from employees where salary=(select max(salary) as highest_sal from employees);
-- 6. Find customers who placed at least one order.
select c.customer_name,count(o.order_id) as order_count from customers c 
inner join orders o on c.customer_id=o.customer_id group by c.customer_name having order_count>=1;
-- 7. Display employees who are not working in department 101.
select emp_name,dept_id from employees where not dept_id = 101;
-- 8. Find products that belong to the same category as product 'Laptop'.
select p.* from products p where product_name="Laptop";
-- 9. Display employees whose experience is greater than the minimum experience.
select emp_name,experience from employees where experience>(select min(experience) as min_exp from employees);
-- 10. Find departments where the average salary is greater than 50000.
select dept_id,avg(salary) as avg_sal from employees group by dept_id having avg(salary)>50000;
-- 11. Display employee names in uppercase using a string function.
select upper(emp_name) from employees;
-- 12. Display the first 3 characters of each product name.
select substring(product_name,1,3) from products;
-- 13. Find the length of each customer name.
select length(customer_name) from customers;
-- 14. Replace 'gmail.com' with 'yahoo.com' in customer emails.
select replace(email,'gmail.com','yahoo.com') from customers;
-- 15. Display employee names after removing leading and trailing spaces.
select trim(emp_name) from employees;
-- 16. Concatenate first name and last name as full name.
select concat(first_name,last_name) from employees;
-- 17. Display product names in lowercase.
select lower(product_name) from products;
-- 18. Find employees whose names start with letter 'S'.
select emp_name from employees where emp_name like "S%";
-- 19. Display current system date.
select curdate();
-- 20. Find employees hired in the year 2024.
select emp_name,year(hire_date) from employees where year(hire_date)=2024;
-- 21. Display the month from each order date.
select month(order_date) from orders;
-- 22. Find the difference in days between order date and delivery date.
select datediff(delivery_date,order_date) from orders;
-- 23. Display current date and current time separately.
select curdate() as currentdate,curtime() as currenttime;
-- 24. Find employees who joined in the current month.
select emp_name,hire_date from employees where month(hire_date)=month(curdate()); 
-- 25. Assign row numbers to employees based on salary in descending order.
select *,row_number() over(order by salary desc) as row_no from employees;
-- 26. Assign ranks to students based on marks.
select *,rank() over(order by marks desc) as rank_no from students;
-- 27. Assign dense ranks to employees based on salary.
select *,dense_rank() over(order by salary desc) as rank_no from employees;
-- 28. Display the total salary of all employees beside each employee record using a window function.
select *,sum(salary) over() as total_sal from employees;
-- 29. Display department-wise average salary beside each employee.
select *,avg(salary) over(partition by dept_id) as avg_sal from employees;
-- 30. Find cumulative sales total ordered by sale date.
select * ,sum(amount) over(order  by sale_date) as cumulative_sales from sales;

