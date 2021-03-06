create database college;
use college;
create table Student (sid int, sname varchar(100), sex varchar(20), dob date,dno varchar(20));
create table Department(dno varchar(20),dname varchar(100));
create table Faculty (F_id INT  NOT NULL , fname VARCHAR(100), designation VARCHAR(100), salary INT ,dno VARCHAR(20));
create table Course (cid INT NOT NULL, cname VARCHAR(100), credits INT ,dno VARCHAR(20));
create table Register (sid INT NOT NULL,cid INT NOT NULL,sem VARCHAR(30)); 
create table Teaching (f_id INT NOT NULL ,cid INT NOT NULL,sem VARCHAR(30)); 
create table Hostel(hid INT NOT NULL,hname VARCHAR(100),seats INT);

SHOW TABLES;
SELECT *FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA='college'\G
alter table Student add grade VARCHAR(50);

describe course;
insert into course(cid,cname,credits,dno)values(1,'MECH',5,111);
insert into course(cid,cname,credits,dno)values(2,'MCA',4,222);
insert into course(cid,cname,credits,dno)values(3,'MBA',7,322);
insert into course(cid,cname,credits,dno)values(4,'MTECH',3,212);
insert into course(cid,cname,credits,dno)values(5,'CIVIL',6,232);
select * from course;


insert into faculty(F_id,fname,designation,salary,dno)values(412,'Raj','lab-staff',20000,111);
insert into faculty(F_id,fname,designation,salary,dno)values(512,'Lal','Office-staff',27000,222);
insert into faculty(F_id,fname,designation,salary,dno)values(612,'Fousiya','Guest-lectr',50000,322);
insert into faculty(F_id,fname,designation,salary,dno)values(752,'Nadeera','Prof.',75000,212);
insert into faculty(F_id,fname,designation,salary,dno)values(852,'Vaheetha','Prof.',79000,232);
select * from faculty;



insert into register(sid,cid,sem)values(101,1,'I');
insert into register(sid,cid,sem)values(102,2,'III');
insert into register(sid,cid,sem)values(103,3,'II');
insert into register(sid,cid,sem)values(104,4,'IV');
insert into register(sid,cid,sem)values(105,5,'VI');
mysql> select * from REGISTER;


insert into teaching(f_id,cid,sem)values(412,1,'I');
insert into teaching(f_id,cid,sem)values(512,2,'III');
insert into teaching(f_id,cid,sem)values(612,3,'II');
insert into teaching(f_id,cid,sem)values(752,4,'IV');
insert into teaching(f_id,cid,sem)values(852,5,'VI');



insert into hostel(hid,hname,seats)values(1344,'Modern',150);
insert into hostel(hid,hname,seats)values(1675,'Flat',170);
insert into hostel(hid,hname,seats)values(1125,'Old',130);
insert into hostel(hid,hname,seats)values(6525,'Btech-hstl',230);
insert into hostel(hid,hname,seats)values(7885,'Arts-hstl',220);
select * from hostel;



insert into student(sid,sname,sex,dob,dno,grade)values(101,'ANU','F','1998-04-21',232,'A');
insert into student(sid,sname,sex,dob,dno,grade)values(102,'MANU','M','1999-03-11',111,'C');
insert into student(sid,sname,sex,dob,dno,grade)values(103,'SANU','M','1999-08-30',222,'B');
insert into student(sid,sname,sex,dob,dno,grade)values(104,'TINU','M','1998-06-03',212,'C');
insert into student(sid,sname,sex,dob,dno,grade)values(105,'LINU','M','1998-02-22',322,'D');

insert into department(dno,dname)values(111,'MECH');
insert into department(dno,dname)values(222,'MCA');
insert into department(dno,dname)values(232,'MBA');
insert into department(dno,dname)values(212,'MTECH');
insert into department(dno,dname)values(322,'CIVIL');
SELECT * FROM DEPARTMENT;

select * from student order by dob desc;
select * from student where dno=222;
select * from faculty order by salary desc;
select dno,count(*)student from student group by dno;
select fname from faculty where salary >25000;



