create database strings;
use strings;
DROP TABLE master_customers;
-- 1. UPPER()
-- Q1: Standardize emails to uppercase before loading?
create table master_customers(customer_id int ,email varchar(50));
INSERT INTO master_customers VALUES
(1,'john@gmail.com'),
(2,'Alice@yahoo.com'),
(3,'TeSt@outlook.com'),
(4,'raVi@gmail.com'),
(5,'sNeHa@yahoo.com');
INSERT INTO master_customers(customer_id,email)
SELECT customer_id,
       UPPER(email)
FROM master_customers;
select * from master_customers;
-- Q2: Count unique categories ignoring case.
SELECT COUNT(DISTINCT UPPER(email)) FROM master_customers;
-- Q3: What is the result of UPPER(NULL)?  
-- NULL
-- 2. LOWER()
-- Q1: Convert all emails to lowercase.
SET SQL_SAFE_UPDATES=0;
UPDATE master_customers SET email = LOWER(email);
-- Q2: Case-insensitive login.
SELECT * FROM master_customers WHERE LOWER(email)=LOWER('ravi@gmail.com');
-- Q3: Why store emails in lowercase?
/*Prevent duplicates
Faster searches
Consistent data storage*/
-- 3. LPAD()
-- Q1: Make invoice numbers 10 digits.
SELECT LPAD(invoice_id,10,'0') FROM invoices;
-- Q2: What happens if string length exceeds LPAD length?
SELECT LPAD('ABCDEFG',5,'0');
-- Q3: Postal code 1234 should become 01234.
SELECT LPAD('vswq1234567',5,'0');
-- 4. RPAD()
-- Q1: Product description should be 50 chars.
SELECT RPAD('description',50,' ');
-- Q2: Create dotted menu.
SELECT RPAD('cold coffee',4,'.');
-- Q3: Difference between LPAD and RPAD?
/*  LPAD       	     RPAD
Pads Left	   Pads Right
Right Align	   Left Align*/
-- 5. SUBSTRING()
-- Q1: Extract year from ORD-2024-001.
SELECT SUBSTRING('vasngrghju45656',5,4);
-- Q2: Extract domain from email.
SELECT SUBSTRING(email, POSITION('@' IN email)+1) FROM master_customers;
-- Q3: Difference?
select SUBSTRING('HELLO',2);
select SUBSTRING('HELLO',2,3);
-- 6. TRIM()
-- Q1: Remove leading and trailing spaces.
SELECT TRIM(email) FROM master_customers;
-- Q2: Remove leading zeros.
SELECT TRIM(LEADING '0' FROM code);
-- Q3: Does TRIM remove middle spaces?
select TRIM('  A B C  ');
-- 7. CHAR()
-- Q1: Return character for ASCII 65.
SELECT CHAR(65);
-- Q2: Insert tab character.
SELECT CHAR(9);
-- Q3: Build TSV export.
SELECT CONCAT(fname,CHAR(9),lname);
-- 8. ASCII()
-- Q1: ASCII value of A.
SELECT ASCII('A');
-- Q2: Check first character is uppercase.
SELECT ASCII('A') BETWEEN 65 AND 90;
-- Q3: Detect digit.
-- WHERE ASCII(code) BETWEEN 48 AND 57;
-- 9. LTRIM()
-- Q1: Remove leading spaces.
SELECT LTRIM('     vanitha');
-- Q2: Clean account numbers.
UPDATE accounts SET account_no=LTRIM(account_no);
-- Q3: Difference from TRIM?
/*TRIM	         LTRIM
Both sides	Left side only*/
-- 10. RTRIM()
-- Q1: Remove trailing spaces.
SELECT RTRIM('department    ');
-- Q2: Why important for CHAR columns?
-- CHAR columns automatically store trailing spaces.
-- Q3:RTRIM('ABC   ')
-- Output:ABC
-- 11. LENGTH()
-- Q1: Find phone numbers not 10 digits.
SELECT * FROM master_customers WHERE LENGTH(email)<>10;
-- Q2: Length of Hello.
SELECT LENGTH('Hello');
-- Q3: LENGTH(NULL)
-- Output:NULL
  -- 12. CONCAT()
-- Q1: Create full name.
SELECT CONCAT('Vadlakonda',' ','Vanitha');
-- Q2: Generate company email.
SELECT CONCAT(LOWER('VADLAKONDA'),'.',LOWER('VANITHA'),'@company.com');
-- Q3: Build greeting.
SELECT CONCAT('Dear ','Vadlakonda',', Your order ',678854,' is ready.');
-- 13. REVERSE()
-- Q1: Reverse string.
SELECT REVERSE('HELLO');
-- Q2: Find palindromes.
SELECT email from master_customers where email=REVERSE(email);
-- Q3: REVERSE(NULL)
-- 14. REPEAT()
-- Q1: Generate stars.
SELECT REPEAT('*',5);
-- Q2: Mask card number.
SELECT CONCAT(REPEAT('*',12),RIGHT(12234,4));
-- Q3: REPEAT('AB',3)
-- 15. POSITION() / INSTR()
-- Q1: Find @ in email.
SELECT POSITION('@' IN email) FROM master_customers;
-- Q2: Extract email domain.
SELECT SUBSTRING(email,POSITION('@' IN email)+1) FROM master_customers;
-- Q3: If substring not found?
-- 0
-- 16. GROUP_CONCAT()
-- Q1: List products per order.
SELECT order_id, GROUP_CONCAT(product_name) FROM order_items GROUP BY order_id;
-- Q2: Unique categories.
SELECT customer_id,GROUP_CONCAT(DISTINCT category) FROM orders GROUP BY customer_id;
-- Q3: Are NULLs included?
-- Answer: No, NULL values are skipped.
-- 17. LEFT()
-- Q1: First 3 characters.
SELECT LEFT(134465,3);
-- Q2: Extract year.
SELECT LEFT('2026-06-26',4);
-- Q3: Oracle equivalent.
select SUBSTR('application',1,4);
-- 18. RIGHT()
-- Q1: Last 4 digits of card.
select RIGHT(6870045830,4);
-- Q2: Extract file extension.
SELECT RIGHT('application.html',4);
-- Q3: Oracle equivalent.
select SUBSTR('application',-4)