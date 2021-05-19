CREATE DATABASE COMPANY;
SHOW databases;
use COMPANY;
CREATE table department(dept_no VARCHAR(20),
 dept_name VARCHAR(50),
 location VARCHAR(100),
PRIMARY KEY(dept_no)
 );
CREATE table employee(emp_no INT NOT NULL,
emp_name VARCHAR(20) NOT NULL,
DOB date NOT NULL, 
address varchar(50) NOT NULL,
doj date NOT NULL,
 mobile_no numeric,
 dept_no varchar(20),
 salary INT NOT NULL,
 PRIMARY KEY(emp_no),
FOREIGN KEY (dept_no) REFERENCES department(dept_no)
 );

//1.inserting 5 rows
insert into department(dept_no, dept_name, location) values (712,'A','First-floor');
insert into department(dept_no, dept_name, location) values (133,'B','Second-floor');
insert into department(dept_no, dept_name, location) values (112,'c','Third-floor');
insert into department(dept_no, dept_name, location) values (212,'D','Third-floor');
insert into department(dept_no, dept_name, location) values (101,'E','Second-floor');

insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (1,'Arun','1970-5-08','Alappuzha','2020-05-21',9879356333,712,45000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (2,'Bipin','1980-6-02','Kollam','2020-05-12',8265473982,133,34000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (3,'Chinnu','1988-4-18','Malappuram','2020-05-22',9875640932,112,32000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (4,'David','1983-9-16','Kochi','2020-07-20',8745368021,212,35000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (5,'Aliya','1985-3-19','Alua','2020-04-02',9678543729,101,40000);
//2.display all records
select * from employee;
select * from department;
//3.Display the empno and name of all the employees from department no2
select emp_no,emp_name from employee where dept_no =212;
//4.Display empno,name,designation,dept no and salary in the descending order of salary
 select emp_no,emp_name,dept_no,salary,Designation from employee order by salary desc;
//5.Display the empno and name of all employees whose salary is between 2000 and 5000
 select emp_no,emp_name from employee where salary between 34000 and 45000;
//6.Display all designations without duplicate values
select distinct Designation from employee;
//7.Display the dept name and total salary of employees of each department
select dept_no,sum(salary) from employee group by dept_no;
//8.Change the salary of employees to 25000 whose designation is ‘Accountant’
update employee set salary =25000 where designation ="Accountant";
//9.Change the mobile no of employee named ‘David’
 update employee set mobile_no=8685765745 where emp_name = "David";
//10.Delete all employees whose salaries are equal to Rs.25000
delete from employee where salary =25000;
//11.Select the department that has total salary paid for its employees more than 25000
 select dept_no,sum(salary) from employee group by dept_no having sum(salary)>25000;