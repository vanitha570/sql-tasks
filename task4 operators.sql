-- Comparison Operators
-- Task: Given a products table with columns product_name, price, and stock_quantity:
use company_db;
show tables;
select * from products;

-- Find all products where price is exactly 500
select * from products where price=500;

-- Find products where stock_quantity is less than 10
alter table products rename column quantity_sold to stock_quantity;
select * from products where stock_quantity<10;


-- Find products where price is greater than 1000
select * from products where price>1000;


-- Find products where price is less than or equal to 250
select * from products where price<=250;


-- Find products where stock_quantity is greater than or equal to 50
select * from products where stock_quantity>=50;


-- Find products where product_name is not 'Pen'
select * from products where p_name<>'Pen';

-- Logical Operators
-- Task: Given an employees table with columns name, salary, department, and city:
-- Create Employee table
CREATE TABLE Employee (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    city VARCHAR(30)
);

-- Insert values
INSERT INTO Employee VALUES
(101, 'Ravi',   'Sales',    45000, 'Hyderabad'),
(102, 'Priya',  'Finance',  55000, 'Chennai'),
(103, 'Kiran',  'Sales',    38000, 'Mumbai'),
(104, 'Anjali', 'HR',       65000, 'Hyderabad'),
(105, 'Suresh', 'Finance',  70000, 'Delhi'),
(106, 'Meena',  'Marketing',42000, 'Bangalore'),
(107, 'Arjun',  'Sales',    50000, 'Pune');

select * from Employee;
-- Find employees in the 'Sales' department whose salary is greater than 40000
select * from Employee where department="Sales" and salary>40000;


-- Find employees who are either from 'Hyderabad' or have a salary greater than 60000
select * from Employee where city="Hyderabad" or salary>60000;

-- Find all employees who do not belong to the 'Finance' department
select * from Employee where department<>"Finance";
-- Special Operators
-- Task: Given a students table with columns name, city, marks, and email:
CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    city VARCHAR(30),
    marks INT,
    email VARCHAR(100)
);

INSERT INTO Students VALUES
(1, 'Rahul',  'Mumbai',   85, 'rahul@gmail.com'),
(2, 'Priya',  'Delhi',    78, 'priya@gmail.com'),
(3, 'Kiran',  'Pune',     92, NULL),
(4, 'Anjali', 'Kolkata',  88, 'anjali@gmail.com'),
(5, 'Suresh', 'Chennai',  75, NULL),
(6, 'Meena',  'Hyderabad',90, 'meena@gmail.com');

select * from Students;
-- Find students who are from 'Mumbai', 'Pune', or 'Kolkata'
select * from Students where city ="Mumbai"or city="Pune" or city="Kolkata";

-- Find students who are not from 'Delhi' or 'Chennai'
select * from Students where city not in ("Delhi","Chennai");

-- Find students whose email is not filled in (NULL)
select * from Students where email is null;

-- Special operators

INSERT INTO Students VALUES
(7, 'Sita',  'Pune',      81, 'sita@gmail.com'),
(8, 'Rama',  'Mumbai',    76, 'rama@gmail.com'),
(9, 'Sara',  'Kolkata',   89, NULL),
(10, 'John', 'Delhi',     72, 'john@gmail.com'),
(11, 'Mina', 'Chennai',   84, 'mina@gmail.com'),
(12, 'Raj',  'Hyderabad', 91, NULL);
-- Find students who have an email address
select * from Students where email is not null;

-- Find students whose name starts with 'S'
select * from Students where name like "S%";

-- Find students whose name ends with 'a'
select * from Students where name like "%a";

-- Find students whose name has exactly 4 letters
select * from Students where name like "____";

-- Find students whose name does not start with 'R'
select * from Students where name not like "R%";

