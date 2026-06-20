use practice;
-- 1. Define Data and Explain Different Types of Data.
/*Data is a collection of raw facts,figures (information)
Types of Data:
Numeric Data – Numbers (100, 5000, 45.6)
Character/String Data – ("Vanitha", "India")
Date and Time Data – '2025-06-20', '10:30:00'
Boolean Data – TRUE/FALSE, 1/0
Binary Data – Images, audio, videos, files*/

-- 2. What is a Database?

/*A database is an organized collection of related data stored electronically for easy access, management, and retrieval.

Example: Student Management Database storing student details.*/

-- 3. What is DBMS? Explain its Purpose.

/*DBMS (Database Management System) is software used to create, manage, and manipulate databases.
Purpose:
Store data efficiently
Retrieve data quickly
Maintain security
Reduce redundancy
Support multiple users

Examples:
MySQL
Oracle
SQL Server
PostgreSQL*/

-- 4. Types of DBMS
/*1. Hierarchical DBMS- Data organized in tree structure.

2. Network DBMS- Data organized as graph structure.

3. Relational DBMS (RDBMS)- Data stored in tables.

Examples:
MySQL
Oracle
SQL Server*/

-- 4. Object-Oriented DBMS
-- Stores objects instead of tables.

-- 5. What is MySQL?
-- MySQL is an open-source Relational Database Management System (RDBMS) that uses SQL for managing databases.

-- 6. What is SQL?
/*SQL (Structured Query Language) is used to:
Create databases
Insert data
Update data
Delete data
Retrieve data*/

-- 7. Why is MySQL Mostly Used?
/*Open Source
Fast Performance
Easy to Learn
Secure
Cross Platform
Large Community Support*/

-- 8. What is a Query in SQL?
-- A query is a SQL statement used to interact with a database.
-- Example: SELECT * FROM employees;
-- 9. What is a Table?
-- A table is a collection of rows and columns used to store related data.
-- 10. What is a Record?
/* A single row in a table.
Example:
id	name
1	Ravi
This row is a record.*/

-- 11. What is a Column?
/*A field/attribute of a table.
Example: id	name
"id" and "name" are columns.*/
-- 12. Types of SQL Command Languages
/*DDL (Data Definition Language):
CREATE
ALTER
DROP
TRUNCATE
RENAME
DML (Data Manipulation Language):
INSERT
UPDATE
DELETE
DQL (Data Query Language)
SELECT
DCL (Data Control Language)
GRANT
REVOKE
TCL (Transaction Control Language)
COMMIT
ROLLBACK
SAVEPOINT*/

-- 13. Create Table
CREATE TABLE employee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sno INT UNIQUE,
    salary DECIMAL(10,2),
    address TEXT,
    status BOOLEAN,
    department VARCHAR(50)
);
-- 14. Insert 8 Records
INSERT INTO employee
(sno,salary,address,status,department)VALUES
(1,25000,'Hyderabad',1,'IT'),
(2,30000,'Chennai',1,'HR'),
(3,18000,'Mumbai',0,'IT'),
(4,45000,'Delhi',1,'Finance'),
(5,22000,'Pune',1,'IT'),
(6,50000,'Bangalore',1,'HR'),
(7,17000,'Kolkata',0,'Finance'),
(8,35000,'Vizag',1,'IT');
-- 15. Add Bonus of 1000
SET SQL_SAFE_UPDATES = 0;
UPDATE employee SET salary = salary + 1000 WHERE salary > 20000;
-- 16. Rename Table
RENAME TABLE employee TO employees;
-- 17. Add Email Column
ALTER TABLE employees ADD email VARCHAR(100);
-- 18. Update Email Using CASE
UPDATE employees
SET email =
CASE
    WHEN id = 1 THEN 'ravi@gmail.com'
    WHEN id = 2 THEN 'sneha@gmail.com'
    WHEN id = 3 THEN 'suresh@gmail.com'
    WHEN id = 4 THEN 'kiran@gmail.com'
    WHEN id = 5 THEN 'anita@gmail.com'
    WHEN id = 6 THEN 'raju@gmail.com'
    WHEN id = 7 THEN 'priya@gmail.com'
    WHEN id = 8 THEN 'deepa@gmail.com'
END;
-- 19. Modify Status Column
ALTER TABLE employees MODIFY status VARCHAR(20);

-- 20. ALTER vs UPDATE
/*ALTER- Changes structure,UPDATE-Changes data
DDL- Affects columns,DML-Affects rows
Example:
ALTER TABLE emp ADD age INT;
UPDATE emp SET age=25;*/

-- 21. DROP vs TRUNCATE
/*DROP	              TRUNCATE
Deletes table	    Deletes data only
Structure removed	Structure remains
Cannot rollback   	Cannot rollback (MySQL)
DROP TABLE emp;     TRUNCATE TABLE emp;*/

-- 22. Delete Employees Earning Less Than Department Average
DELETE e1 FROM employees e1 JOIN
(
    SELECT department,
           AVG(salary) avg_sal
    FROM employees
    GROUP BY department
) e2
ON e1.department=e2.department WHERE e1.salary < e2.avg_sal;
-- 23. GROUP BY vs HAVING
/*GROUP BY	            HAVING
Creates groups	    Filters groups
Used before HAVING	Used after GROUP BY
Example:
SELECT department,COUNT(*) FROM employees GROUP BY department;
SELECT department, COUNT(*) FROM employees GROUP BY department HAVING COUNT(*) > 2;*/

-- 24. Count Employees in Each Department
SELECT department, COUNT(*) AS total_employees FROM employees GROUP BY department;

-- 25. Count Employees in IT Department
SELECT COUNT(*) AS total FROM employees WHERE department='IT';

-- 26. ENUM Data Type Syntax
CREATE TABLE students(id INT,gender ENUM('Male','Female','Other'));

-- 27. SET Data Type Syntax
CREATE TABLE skills(id INT,technologies SET('Python','Java','SQL','HTML'));

-- 28. Retrieve Second Highest Salary
SELECT MAX(salary)
FROM employees
WHERE salary <
(
    SELECT MAX(salary)
    FROM employees
);

-- 29. FOREIGN KEY Syntax
CREATE TABLE department(dept_id INT PRIMARY KEY,dept_name VARCHAR(50));

CREATE TABLE employee(emp_id INT PRIMARY KEY,emp_name VARCHAR(50),dept_id INT,FOREIGN KEY (dept_id)REFERENCES department(dept_id));
-- 30. How can i Find Data Types of All Columns in a Table
DESC employees;
