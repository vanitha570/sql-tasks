-- Tasks on constraints
-- Create a user table with columns id and phone. Apply UNIQUE at the column level
-- so no two users can share the same phone number.
create database details;
use details;

create table user (user_id int primary key,
phn_no varchar(20) unique);

desc user;

-- Add a unique constraint to an existing table (here table is already created).
CREATE TABLE user1 (
    user_id INT,
    user_name VARCHAR(100),
    phone_no varchar(10)
);

desc user1;

ALTER TABLE user1 ADD UNIQUE (phone_no);

-- Create a students table where name and roll_no are mandatory.
create table students(std_name varchar(50) not null,
 roll_no varchar (50) not null, 
 address varchar(100));
 
 desc students;
 
 -- Make the address column NOT NULL in an existing table.
 alter table students modify address varchar(100) not null;
 
 -- : Create a books table with a primary key.
 create table books(book_id int primary key,
 book_name varchar(50),
 book_price decimal(10,2));
 
 desc books;
 
 -- Add a primary key to an existing table.
 alter table user1 add primary key (user_id);
 
 -- Create an employees table with age validation.
 create table employees(emp_name varchar(50),
 age int check(age>21));
 
 desc employees;
 
 -- Add a check constraint to an existing table.
 alter table books add constraint chk_price check (book_price>0);