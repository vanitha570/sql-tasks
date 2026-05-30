create database task;
use task;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO orders VALUES
(1,101,'2025-01-01',1000),
(2,101,'2025-01-02',1200),
(3,101,'2025-01-03',1500),
(4,101,'2025-01-04',1800),
(5,102,'2025-01-05',2000),
(6,102,'2025-01-06',2500),
(7,103,'2025-01-07',3000),
(8,103,'2025-01-08',3500),
(9,103,'2025-01-09',4000),
(10,103,'2025-01-10',4500),
(11,104,'2025-01-11',5000),
(12,105,'2025-01-12',5500);

select * from orders;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(1,'Laptop','Electronics',60000),
(2,'Mobile','Electronics',30000),
(3,'TV','Electronics',45000),
(4,'Sofa','Furniture',25000),
(5,'Table','Furniture',15000),
(6,'Chair','Furniture',12000),
(7,'Refrigerator','Appliances',40000),
(8,'Washing Machine','Appliances',35000),
(9,'Microwave','Appliances',15000),
(10,'AC','Appliances',50000);

select * from products;

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    salesperson_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE
);

INSERT INTO sales VALUES
(1,201,1,40,'2025-01-01'),
(2,201,2,30,'2025-01-02'),
(3,201,3,35,'2025-01-03'),
(4,202,1,20,'2025-01-04'),
(5,202,2,25,'2025-01-05'),
(6,203,1,50,'2025-01-06'),
(7,203,2,30,'2025-01-07'),
(8,203,3,40,'2025-01-08'),
(9,203,4,20,'2025-01-09');

select * from sales;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees VALUES
(1,'Ravi','Engineering',90000),
(2,'Priya','Engineering',85000),
(3,'Kiran','Engineering',95000),
(4,'Sneha','HR',60000),
(5,'Arjun','Sales',70000),
(6,'Divya','Engineering',88000),
(7,'Manoj','Finance',65000),
(8,'Pooja','Marketing',72000),
(9,'Vijay','Engineering',99000);

select * from employees;

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(50),
    grade CHAR(1),
    score INT
);

INSERT INTO students VALUES
(1,'Anu','A',95),
(2,'Balu','A',90),
(3,'Charan','B',88),
(4,'Deepa','B',NULL),
(5,'Esha','A',85),
(6,'Farhan','C',75),
(7,'Gopi','C',80),
(8,'Hari','B',92),
(9,'Indu','A',NULL),
(10,'John','C',70),
(11,'Kavya','B',89),
(12,'Latha','A',91);

select * from students;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'Ramesh','Hyderabad'),
(102,'Suresh','Vijayawada'),
(103,'Mahesh','Guntur'),
(104,'Naresh','Warangal'),
(105,'Rajesh','Nellore'),
(106,'Kiran','Kurnool'),
(107,'Anil','Vizag'),
(108,'Ravi','Tirupati'),
(109,'Hari','Kadapa'),
(110,'Teja','Ongole');

select * from customers;

select customer_id,count(order_id) as order_placed from orders group by customer_id having count(order_id)>3;

select category,sum(price) as total_price from products group by category having sum(price)>50000;

select salesperson_id from sales group by salesperson_id having count(distinct product_id)>=3 and sum(quantity)>100;

select * from employees order by salary desc;

select product_name,price,price-(price*0.15) as discounted_price from products order by discounted_price;

select * from students order by grade asc, score desc;

select * from customers limit 5;


select product_name,price from products order by price desc limit 3;

select * from employees where department="Engineering" order by salary desc limit 3;

select * from students limit 5 offset 5 ;

select * from products limit 8 offset 24 ;

--  OFFSET = (Page_Number - 1) * Records_Per_Page
select * from orders order by order_date desc limit 10 offset 20;