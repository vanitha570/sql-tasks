create database sales;
use sales;

-- SQL Arithmetic Operators Practice
CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10,2),
    discount DECIMAL(5,2),
    stock_quantity INT
);

CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(100),
    monthly_salary DECIMAL(10,2),
    bonus_percent DECIMAL(5,2)
);

INSERT INTO Products
(product_id, product_name, price, discount, stock_quantity)
VALUES
(101, 'Laptop', 55000, 10, 15),
(102, 'Mouse', 500, 5, 50),
(103, 'Keyboard', 1200, 8, 30),
(104, 'Mobile', 25000, 12, 20),
(105, 'Headphones', 1800, 7, 40),
(106, 'Charger', 900, 4, 35),
(107, 'Smart Watch', 3500, 15, 18),
(108, 'Speaker', 2200, 6, 25);

INSERT INTO Employees
(emp_id, name, monthly_salary, bonus_percent)
VALUES
(1, 'Ravi', 30000, 10),
(2, 'Anu', 35000, 12),
(3, 'Kiran', 28000, 8),
(4, 'Sneha', 40000, 15),
(5, 'Vijay', 32000, 9),
(6, 'Divya', 37000, 11),
(7, 'Arjun', 45000, 18),
(8, 'Meena', 29000, 7);

select * from Products;
select * from Employees;

-- Total Value in Stock Write a query to find the total value of each product in the warehouse.
select *,price*stock_quantity as total_value from Products;
-- Sale Price Calculation Write a query to show the product_name and the price after a $5 flat discount.
select product_name,price,(price-5) as sale_price from Products;
-- Price Increase Projection The store wants to raise all prices by 10%. Write a query to display the new projected price.
select price,(price+(price*0.10)) as new_price from Products;
-- Annual Salary From the Employees table, calculate the annual salary for every employee.
select *,monthly_salary*12 as annual_sal from Employees;
-- Bonus Amount Calculate the specific dollar amount of an employee's bonus based on their monthly_salary and bonus_percent.
select *,(monthly_salary*bonus_percent)/100 as bonus_amt from Employees;
-- Even or Odd ID Using the modulo operator (%), 
-- write a query to return the remainder of the product_id when divided by 2. This helps identify even or odd rows.
select *,product_id%2 as remainder from Products;
-- Shared Stock If you were to split the stock_quantity of each product
-- equally between 4 different warehouse locations, how many items would each location get?
select *,stock_quantity/4 as shared_stock from Products;
-- Profit Margin If every product costs the store $2 to manufacture,calculate the profit for one unit of each product.
select *,price-2 as profit_per_unit from Products;
-- Total Compensation Calculate the total monthly take-home pay by adding the monthly_salary and a flat $200 travel allowance.
select *,monthly_salary+200  as total_comp from Employees;
-- Bulk Order Discount Show the cost of buying 50 units of a product if the user gets a total bulk discount of $100 off the final price.
select *,(price*50)-100 as bulk_order_cost from Products;