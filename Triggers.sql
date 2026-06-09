-- Create a trigger that automatically updates the updated_at timestamp column 
-- whenever a row in the employees table is modified.
use task10;
create table employee(empid int,empname varchar(50),salary decimal(10,2),updated_at timestamp);
insert into employee (empid,empname,salary,updated_at)
values(101,"Sanvey",50000,'2026-06-09 12:00:00'),(102,"Vaishu",40000,'2026-06-09 11:00:00'),(103,"Vanitha",30000,'2025-06-09 12:40:00');
select * from employee;

delimiter //
create trigger updated_timestamp
before update
on employee
for each row
begin
     set new.updated_at=now();
end //
delimiter ;
set sql_safe_updates=0;

update employee set salary=45000 where empid=103;

-- Design a trigger that prevents 
-- insertion of duplicate records in the products table based on the product_name and product_code columns.
create table products(product_id int,product_name varchar(50),product_code varchar(20));

delimiter ##
create trigger prevent_duplicates
before insert
on products
for each row
begin
	declare v_count int;
     select count(*) into v_count from products 
     where product_name = NEW.product_name AND product_code = NEW.product_code;
	 if v_count>0 then
         SIGNAL SQLSTATE '45000'
         set MESSAGE_TEXT="Duplicate product not allowed";
	 end if;
end ##
delimiter ;

select * from products;

INSERT INTO products VALUES (1, 'Laptop', 'L101');
INSERT INTO products VALUES (2, 'Laptop', 'L101');
    

-- Develop a trigger that sets a default value for the salary column in the employees table
--  if no value is provided during the insertion of a new employee record.

create table emp(id int,name varchar(20),sal decimal(10,2));
insert into emp (id,name)values(1,"vimala"),(2,"Kittu"),(3,"Karthik"),(4,"Mithra");
select * from emp;

delimiter $$
create trigger default_sal
before insert
on emp
for each row
begin
     if new.sal is null then
        set new.sal=25000.00;
     end if;
end $$
delimiter ;
