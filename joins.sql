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
 
--  EASY LEVEL (Basic Understanding)(LJ)

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

INSERT INTO department VALUES
(1,'IT'),
(2,'HR'),
(3,'Finance');

INSERT INTO employee VALUES
(101,'Ravi',1),
(102,'Priya',2),
(103,'Kiran',1),
(104,'Anil',NULL);

-- 2. Orders and Payments
CREATE TABLE order1 (
    order_id INT PRIMARY KEY,
    order_date DATE
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES order1(order_id)
);

INSERT INTO order1 VALUES
(1,'2025-01-10'),
(2,'2025-01-12'),
(3,'2025-01-15');

INSERT INTO payments VALUES
(101,1,5000),
(102,2,3000);

-- 3. Customers and Contacts
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

CREATE TABLE contacts (
    customer_id INT,
    phone_no VARCHAR(15),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

INSERT INTO customer VALUES
(1,'Asha'),
(2,'Rahul'),
(3,'Neha');

INSERT INTO contacts VALUES
(1,'9876543210'),
(2,'8765432109');

-- 4. Categories and Products
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE product1 (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Accessories');

INSERT INTO product1 VALUES
(1,'Laptop',1),
(2,'Mouse',2),
(3,'Keyboard',NULL);

-- 5. Students and Attendance
CREATE TABLE student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES student(student_id)
);

INSERT INTO student VALUES
(1,'Ram'),
(2,'Sita'),
(3,'Krishna');

INSERT INTO attendance VALUES
(101,1,'2025-01-10','Present'),
(102,2,'2025-01-10','Absent');

-- 6. Suppliers and Products
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50)
);

CREATE TABLE product_suppliers (
    product_id INT,
    supplier_id INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

INSERT INTO suppliers VALUES
(1,'ABC Traders'),
(2,'XYZ Suppliers');

INSERT INTO product_suppliers VALUES
(1,1),
(2,2);

-- 7. Projects and Employee Projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(50)
);

CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

INSERT INTO projects VALUES
(1,'ERP System'),
(2,'HR Portal');

INSERT INTO employee_projects VALUES
(101,1),
(101,2),
(102,1);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    sales_amount DECIMAL(10,2) NOT NULL,
    sale_date DATE
);

INSERT INTO sales (sale_id, product_id, customer_id, sales_amount, sale_date)
VALUES
(1, 101, 201, 5000.00, '2026-01-10'),
(2, 102, 202, 7500.50, '2026-01-15'),
(3, 103, 203, 3200.00, '2026-02-05'),
(4, 104, 204, 9800.75, '2026-02-20'),
(5, 105, 205, 4500.00, '2026-03-01'),
(6, 101, 206, 6100.25, '2026-03-12'),
(7, 102, 207, 8900.00, '2026-04-08'),
(8, 103, 208, 2750.50, '2026-04-25');

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM department;
SELECT * FROM employee;
SELECT * FROM salaries;
SELECT * FROM order1;
SELECT * FROM payments;
SELECT * FROM customer;
SELECT * FROM contacts;
SELECT * FROM categories;
SELECT * FROM product1;
select * from sales;
SELECT * FROM student;
SELECT * FROM attendance;
SELECT * FROM suppliers;
SELECT * FROM product_suppliers;
SELECT * FROM projects;
SELECT * FROM employee_projects;

-- 1. Show all employees along with their department names, even if some employees are
-- not assigned to any department.
select e.emp_name,d.dept_name from employee e left join department d on e.dept_id=d.dept_id;

-- 2. Display all orders and their corresponding payment details, even if payment has not
-- been made.
select o.*,p.* from order1 o left join payments p on o.order_id=p.order_id;

-- 3. List all customers and their contact details, even if some customers have not provided
-- phone numbers.
select c.customer_id,c.customer_name,con.phone_no from customer c left join contacts con on c.customer_id=con.customer_id ;

-- 4. Show all products and their categories, even if some products are not assigned to any
-- category.
select p.product_id,p.product_name,c.category_name from product1 p left join categories c on p.category_id=c.category_id ;

-- 5. Display all students and their attendance records, even if attendance is missing.
select s.student_id,s.student_name,a.attendance_date,a.status from student s 
left join attendance a on s.student_id=a.student_id ;

-- MEDIUM LEVEL (Concept Clarity + Filtering)
-- 6. Find all employees who do NOT have a department assigned.
select e.*,d.dept_name from employee e left join department d on e.dept_id=d.dept_id where d.dept_id is null;

-- 7. Display all orders where payment has NOT been completed.
select o.*,p.payment_id,p.amount from order1 o left join payments p on o.order_id=p.order_id where p.payment_id is null;

-- 8. List all customers who have never placed an order.
select c.*,o.* from customers c left join orders o on c.customer_id=o.customer_id where o.customer_id is null;

-- 9. Show all products that are NOT linked to any supplier.
select p.*,ps.* from product1 p left join product_suppliers ps on p.product_id=ps.product_id where ps.product_id is null;

-- 10. Display all employees and count how many projects they are assigned to, including
-- employees with zero projects.
select e.emp_id,e.emp_name,count(ep.project_id) as project_count from employee e 
left join employee_projects ep on e.emp_id=ep.emp_id group by e.emp_id,e.emp_name;
 
-- HARD LEVEL (Interview + Real-time Thinking)
-- 11. Find all customers who placed orders but never made any payment.
SELECT c.customer_id,c.customer_name FROM customers c 
INNER JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN payments p ON o.order_id = p.order_id WHERE p.payment_id IS NULL;

ALTER TABLE salaries
ADD salary_date DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE product1 SET product_id = 101 WHERE  product_name = "Laptop";
UPDATE product1 SET  product_id = 102 WHERE product_name = "Mouse";
UPDATE product1 SET  product_id = 103 WHERE product_name = "Keyboard";

UPDATE salaries SET salary_date = '2025-01-01' WHERE emp_id = 101;
UPDATE salaries SET salary_date = '2025-02-01' WHERE emp_id = 102;
UPDATE salaries SET salary_date = '2025-03-01' WHERE emp_id = 103;
UPDATE salaries SET salary_date = '2025-04-01' WHERE emp_id = 104;
select * from salaries;

-- 12. Display all employees and their latest salary, even if some employees don’t have salary
-- records.
SELECT e.emp_id,e.emp_name,s.salary FROM employee e
LEFT JOIN salaries s ON e.emp_id = s.emp_id
AND s.salary_date = (SELECT MAX(s.salary_date) FROM salaries s WHERE s.emp_id = e.emp_id);

-- 13. List all products along with total sales amount, including products that were never sold.
select p.product_id,p.product_name ,sum(s.sales_amount) as total_sales_amt from product1 p 
left join sales s on p.product_id=s.product_id group by p.product_id,p.product_name;

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    signup_date DATE
);

CREATE TABLE logins (
    login_id INT PRIMARY KEY,
    user_id INT,
    login_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users VALUES
(1, 'Ravi', '2026-01-01'),
(2, 'Priya', '2026-01-05'),
(3, 'Kiran', '2026-01-10'),
(4, 'Anu', '2026-01-15'),
(5, 'Rahul', '2026-01-20');

INSERT INTO logins VALUES
(101, 1, '2026-01-02'),
(102, 2, '2026-01-06'),
(103, 5, '2026-01-21');

select * from users;
select * from logins;
-- 14. Find all users who signed up but never logged in.
SELECT u.user_id,u.user_name FROM users u
LEFT JOIN logins l ON u.user_id = l.user_id WHERE l.user_id IS NULL;
-- 15. Display all departments and the number of employees in each department, including
-- departments with zero employees.
select d.dept_id,d.dept_name ,count(e.emp_id) as emp_count from departments d 
left join employees e on d.dept_id=e.dept_id
group by d.dept_id,d.dept_name;
 
 
 CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    amount DECIMAL(10,2)
);

CREATE TABLE invoices (
    invoice_id INT PRIMARY KEY,
    order_id INT,
    invoice_amount DECIMAL(10,2)
);
CREATE TABLE attendance1 (
    attendance_id INT PRIMARY KEY,
    emp_id INT,
    attendance_date DATE
);

CREATE TABLE shipments (
    shipment_id INT PRIMARY KEY,
    order_id INT,
    shipment_date DATE
);

CREATE TABLE refunds (
    refund_id INT PRIMARY KEY,
    order_id INT,
    refund_amount DECIMAL(10,2)
);

CREATE TABLE systems (
    system_id INT PRIMARY KEY,
    system_name VARCHAR(50)
);

CREATE TABLE logs (
    log_id INT PRIMARY KEY,
    system_id INT,
    log_message VARCHAR(100)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    booking_date DATE
);

INSERT INTO transactions VALUES
(201,1,1000),
(202,2,1500),
(203,5,2000);

INSERT INTO invoices VALUES
(301,1,5000),
(302,2,3000),
(303,7,2500);

INSERT INTO attendance1 VALUES
(401,1,'2026-01-01'),
(402,2,'2026-01-01'),
(403,5,'2026-01-01');

INSERT INTO shipments VALUES
(501,1,'2026-01-05'),
(502,2,'2026-01-06'),
(503,8,'2026-01-07');

INSERT INTO refunds VALUES
(601,1,500),
(602,9,700);

INSERT INTO systems VALUES
(1,'Server-A'),
(2,'Server-B');

INSERT INTO logs VALUES
(701,1,'Login Success'),
(702,2,'Backup Complete'),
(703,5,'Unknown System');

INSERT INTO bookings VALUES
(801,1,'2026-01-10'),
(802,2,'2026-01-11'),
(803,5,'2026-01-12');

SELECT * FROM order1;
SELECT * FROM payments;
SELECT * FROM customers;
SELECT * FROM transactions;
SELECT * FROM invoices;
SELECT * FROM employees;
SELECT * FROM attendance1;
SELECT * FROM shipments;
SELECT * FROM refunds;
SELECT * FROM systems;
SELECT * FROM logs;
SELECT * FROM users;
SELECT * FROM bookings;

-- EASY (5 Questions)(RJ)
-- 1. Show all payments, even if there is no matching order.
SELECT p.*, o.* FROM orders o RIGHT JOIN payments p ON o.order_id = p.order_id;
-- 2. Display all transactions even if customer details are missing.
select c.*,t.* from customers c right join transactions t on c.customer_id=t.customer_id;
-- 3. List all invoices, even if invoice is not linked to any order.
select o.*,i.* from order1 o right join invoices i on o.order_id=i.order_id;
-- 4. Show all attendance records, even if employee details are not available.
select e.*,a.* from employees e right join attendance1 a on e.emp_id=a.emp_id;
-- 5. Display all shipment records, even if order information is missing.
select o.order_id,s.* from order1 o right join shipments s on o.order_id=s.order_id;

-- MEDIUM (5 Questions)
-- 6. Show all payments and their corresponding order details; include payments without
-- orders.
SELECT o.*, p.* FROM orders o RIGHT JOIN payments p ON o.order_id = p.order_id;
-- 7. List all transactions with customer names; include transactions where customer is not
-- found.
select c.customer_name,t.* from customers c right join transactions t on c.customer_id=t.customer_id;
-- 8. Display all refund records along with order details; include refunds without orders.
select o.*,r.* from order1 o right join refunds r on o.order_id=r.order_id;
-- 9. Show all logs with system details; include logs where system info is missing.
select l.*,s.* from systems s right join logs l on s.system_id=l.system_id;
-- 10. List all booking records along with user details; include bookings without users.
select u.*,b.* from users u right join bookings b on u.user_id=b.user_id;

-- HARD (5 Questions)
-- 11. Show all payments that do not have matching orders along with available order data if
-- present.
SELECT p.*, o.* FROM orders o RIGHT JOIN payments p ON o.order_id = p.order_id WHERE o.order_id IS NULL;
-- 12. Retrieve all transactions and identify which ones are not linked to any customer.
SELECT t.*,c.customer_name,
       CASE 
           WHEN c.customer_id IS NULL THEN 'Not Linked'
           ELSE 'Linked'
       END AS status
FROM customers c RIGHT JOIN transactions t ON c.customer_id = t.customer_id;
-- 13. Display all audit logs and indicate missing system references for each record.
SELECT l.*,s.system_name,
       CASE
           WHEN s.system_id IS NULL THEN 'Missing System Reference'
           ELSE 'System Available'
       END AS status
FROM systems s RIGHT JOIN logs l ON s.system_id = l.system_id;
-- 14. List all invoices and highlight those where no corresponding order exists.
SELECT i.*,o.order_date,
       CASE
           WHEN o.order_id IS NULL THEN 'No Order Found'
           ELSE 'Order Exists'
       END AS status
FROM order1 o RIGHT JOIN invoices i ON o.order_id = i.order_id;
-- 15. Show all shipment records and classify them based on whether order details are
-- available or not.
select s.shipment_id,s.order_id,s.shipment_date,o.order_date,
     case
         when o.order_id is null then "Not Available"
         else "Available"
	end as status
FROM order1 o RIGHT JOIN shipments s ON o.order_id = s.order_id;

