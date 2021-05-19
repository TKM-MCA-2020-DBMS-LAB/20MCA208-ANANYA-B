CREATE DATABASE COMPANY;
SHOW databases;
use COMPANY;
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

 CREATE table department(dept_no VARCHAR(20),
 dept_name VARCHAR(50),
 location VARCHAR(100),
PRIMARY KEY(dept_no)
 );

 SHOW tables;
 describe employee;
 describe department;
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (1,'Arun','1970-5-08','Alappuzha','2020-05-21',9879356333,712,45000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (2,'Bipin','1980-6-02','Kollam','2020-05-12',8265473982,133,34000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (3,'Chinnu','1988-4-18','Malappuram','2020-05-22',9875640932,112,32000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (4,'David','1983-9-16','Kochi','2020-07-20',8745368021,212,35000);
insert into employee(emp_no,emp_name,DOB, address, doj, mobile_no, dept_no, salary) values (5,'Aliya','1985-3-19','Alua','2020-04-02',9678543729,101,40000);

select * from employee;
insert into department(dept_no, dept_name, location) values (712,'A','First-floor');
insert into department(dept_no, dept_name, location) values (133,'B','Second-floor');
insert into department(dept_no, dept_name, location) values (112,'c','Third-floor');
insert into department(dept_no, dept_name, location) values (212,'D','Third-floor');
insert into department(dept_no, dept_name, location) values (101,'E','Second-floor');

 ALTER TABLE employee  ADD Designation VARCHAR(100);
ALTER TABLE department  DROP COLUMN location;

DROP TABLE employee;
DROP TABLE department;
DROP DATABASE COMPANY;

 
 
 
 
 
 
 
 
 


