# View is a virtual table based on the result set of a SQL query.
# eg - We have created a table which has 20 columns.
# Of the twenty columns, I need the inf of only 5 columns.
# I will write a query and store it in my view. So whenever I want to access the inf of 
# five cols, I will use select * from "view", and a virtual table will be returned to me.
# A separate table is not created here.

# Used for getting some information from a large database table. So that a junior developer will not create a query which will 
# remove some values or columns or insert some other values.

use jio;
show tables;
select * from person;
drop table person;
show tables;
create table freshers(
emp_id integer auto_increment,
first_name varchar(25) not null,
last_name varchar(25) not null,
age integer,
primary key(emp_id)
);
select * from freshers;
desc freshers;
insert into freshers values(1, "Krishna", "Yadav", 16),
(2, "Jagannath", "Yadav", 16),
(3, "Balaram", "Yadav", 20),
(4, "Haladhara", "Vrsni", 20);
select * from freshers;
create table department(
empid integer auto_increment,
department_name varchar(25) not null,
constraint fk_emp_id foreign key(emp_id) references freshers(emp_id)
);

desc department;
insert into department values (1, "Electronics"),
(2, "Telecommunication"),
(3, "Data Science"),
(4, "Machine Learning");

select * from department;
select * from freshers;

# Creating a view
create view student_info as
# slight glimpse of INNER JOIN
select first_name, last_name, age from freshers inner join department
using(emp_id);

select * from student_info;
# So you do not have to run the complete above statement. You can just use th
# view student_info. It is not a real table but it is a virtual table
drop view student_info;
# If we have to perform commands like update, alter, aggregate in view, left join, right join these commands will not work.
# Commands like inner_join will work in view