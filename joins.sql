create database joins;
use joins;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

CREATE TABLE salaries (
    emp_id INT,
    salary DECIMAL(10,2),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE enrollments (
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO departments VALUES
(1,'IT','Hyderabad'),
(2,'HR','Chennai'),
(3,'Finance','Mumbai');

INSERT INTO employees VALUES
(101,'Ravi',1),
(102,'Priya',2),
(103,'Kiran',1),
(104,'Anil',3);

INSERT INTO salaries VALUES
(101,60000),
(102,45000),
(103,70000),
(104,55000);

INSERT INTO customers VALUES
(1,'Asha'),
(2,'Rahul'),
(3,'Neha');

INSERT INTO orders VALUES
(101,1,6000),
(102,1,7000),
(103,2,4000),
(104,1,5500),
(105,1,6500);

INSERT INTO courses VALUES
(1,'Python'),
(2,'Java');

INSERT INTO students VALUES
(1,'Ram'),
(2,'Sita'),
(3,'Krishna');

INSERT INTO enrollments VALUES
(1,1),
(2,2),
(3,1);

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');

INSERT INTO order_items VALUES
(1,101,1,2),
(2,102,2,5),
(3,103,3,3),
(4,104,1,1),
(5,105,2,2);

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM courses;
SELECT * FROM students;
SELECT * FROM enrollments;
SELECT * FROM products;
SELECT * FROM order_items;

-- EASY LEVEL
-- 1. Show employee names along with their department names.
select e.emp_name,d.dept_name from departments d inner join employees e on d.dept_id=e.dept_id;
-- 2. Display all orders with their corresponding customer names.
select c.customer_name,o.* from customers c inner join orders o on c.customer_id=o.customer_id;
-- 3. List students who are enrolled in any course.
select s.student_name,c.course_name from students s 
inner join enrollments e on s.student_id=e.student_id 
inner join courses c on e.course_id=c.course_id;
-- 4. Show products that are present in orders.
select p.product_name,oi.* from products p inner join order_items oi on p.product_id=oi.product_id;
-- 5. Display employees along with their salary details.
select e.emp_name,s.salary from employees e inner join salaries s on e.emp_id=s.emp_id;

-- MEDIUM LEVEL (INNER JOIN)
-- 6. Find employees who belong to the 'IT' department.
select e.emp_name,d.dept_name from departments d inner join employees e on d.dept_id=e.dept_id where d.dept_name="IT";
-- 7. Show customers who have placed orders worth more than ₹5000.
select c.customer_name,o.order_id,o.order_amount from customers c inner join orders o on c.customer_id=o.customer_id where o.order_amount>5000;
-- 8. Count the number of orders placed by each customer.
select count(o.order_id) as count,c.* from customers c inner join orders o on c.customer_id=o.customer_id group by customer_id,customer_name;
-- 9. List employees whose salary is greater than 50,000.
select e.emp_name,s.salary from employees e inner join salaries s on e.emp_id=s.emp_id where s.salary > 50000;
-- 10. Display students who are enrolled in the 'Python' course.
select s.student_name,c.course_name from students s 
inner join enrollments e on s.student_id=e.student_id 
inner join courses c on e.course_id=c.course_id where c.course_name="Python";

-- HARD LEVEL (INNER JOIN)
-- 11. Find employees who work in departments located in 'Hyderabad'.
select e.emp_name ,d.dept_name,d.location from departments d 
inner join employees e on d.dept_id=e.dept_id where d.location="Hyderabad";
-- 12. Get the highest-paid employee in each department.
SELECT e.emp_name,d.dept_name,s.salary FROM employees e
INNER JOIN departments d ON e.dept_id = d.dept_id
INNER JOIN salaries s ON e.emp_id = s.emp_id
WHERE (e.dept_id, s.salary) IN 
(SELECT e.dept_id,MAX(s.salary) FROM employees e
INNER JOIN salaries s ON e.emp_id = s.emp_id GROUP BY e.dept_id);
-- 13. List customers who have placed more than 3 orders.
select c.customer_id,c.customer_name,count(o.order_id) as order_placed from customers c 
inner join orders o on c.customer_id=o.customer_id
 group by c.customer_id,c.customer_name having count(o.order_id)>3;
 -- 14. Show each product along with the total quantity sold.
 select p.product_name,sum(oi.quantity) as total_quantity from products p 
 inner join order_items oi on p.product_id=oi.product_id group by p.product_name;
-- 15. Find employees whose salary is above the average salary.
select e.emp_name,s.salary from employees e
 inner join salaries s on e.emp_id=s.emp_id where s.salary > (select avg(s.salary) as avg_sal from salaries s ) ;
 
