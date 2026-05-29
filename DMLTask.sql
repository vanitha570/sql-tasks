create database hospital;
SET SQL_SAFE_UPDATES = 0;


-- date and time datatype tasks:
create table appointments
(id int,patient_name varchar(50),
appointment_date date,
appointment_time time);

create table orders(order_id int,
item varchar(50),
ordered_at datetime,
shipped_at timestamp);


-- Insert command practice tasks:
create table students(id int,
name varchar(50),
age int,
city varchar(100));

insert into students (id,name,age,city) 
values(1,"vanitha",24,"hyderabad"),
(2,"Sanvey",20,"chennai"),
(3,"Vaishu",25,"Delhi");

create table employees( emp_id int ,
emp_name varchar(100),
emp_sal int,
emp_dept varchar(50));

insert into employees values(123,"Sanvey",12000,"HR");
create table products(p_id int,
p_name varchar(30),
p_price int);

insert into products 
values(123,"gold drop oil",174),
(234,"milk",40),
(345,"sugar",42);

insert into appointments 
values(1,"vidhya",'2023-05-29','01:45:05');

insert into orders values(1011,"laptop",'2025-05-29 01:45:05','2025-05-29 04:20:00'),
(1022,"Headphones",'2026-04-20 02:30:05',null);


-- UPDATE Command Practice Tasks
update students set city="Bangalore" where id=2;
update employees set emp_sal=emp_sal+5000 where emp_dept="HR";
update products set p_price=0;
update appointments set appointment_date='2024-07-20' where id=1;

-- DELETE Command Practice Tasks
delete from students where id=3;
insert into employees values(345,"vaishu",15000,"sales"),(678,"viha",26000,"finance");
delete from employees where emp_dept="finance";
delete from products;
delete from appointments where appointment_date<'2024-06-01';
delete from orders where shipped_at is null;
select * from appointments;
select * from orders;
select * from students;
select * from employees;
select * from products;
