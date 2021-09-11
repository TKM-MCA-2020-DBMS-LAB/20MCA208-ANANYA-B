//1. VIEWS


mysql> use company;
Database changed
mysql> show tables;
+-------------------+
| Tables_in_company |
+-------------------+
| department        |
| employee          |
+-------------------+

mysql> describe department;
+-----------+--------------+------+-----+---------+-------+
| Field     | Type         | Null | Key | Default | Extra |
+-----------+--------------+------+-----+---------+-------+
| dept_no   | varchar(20)  | NO   | PRI | NULL    |       |
| dept_name | varchar(50)  | YES  |     | NULL    |       |
| location  | varchar(100) | YES  |     | NULL    |       |
+-----------+--------------+------+-----+---------+-------+

mysql> select * from department;
+---------+-----------+--------------+
| dept_no | dept_name | location     |
+---------+-----------+--------------+
| 101     | E         | Second-floor |
| 112     | c         | Third-floor  |
| 133     | B         | Second-floor |
| 212     | D         | Third-floor  |
| 712     | A         | First-floor  |
+---------+-----------+--------------+

mysql> select * from employee;
+--------+----------+------------+-----------+------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address   | doj        | mobile_no  | dept_no | salary | Designation |
+--------+----------+------------+-----------+------------+------------+---------+--------+-------------+
|      1 | Arun     | 1970-05-08 | Alappuzha | 2020-05-21 | 9879356333 | 712     |  45000 | Staff       |
|      2 | Bipin    | 1980-06-02 | Kollam    | 2020-05-12 | 8265473982 | 133     |  34000 | CEO         |
|      4 | David    | 1983-09-16 | Kochi     | 2020-07-20 | 8685765745 | 212     |  35000 | Staff       |
|      5 | Aliya    | 1985-03-19 | Alua      | 2020-04-02 | 9678543729 | 101     |  40000 | Manager     |
+--------+----------+------------+-----------+------------+------------+---------+--------+-------------+

 create view Manager as SELECT  emp_name,DOB,salary,location from employee,department;
mysql> select  distinct e.emp_name from employee e ,Manager m where e.salary >m.salary;
+----------+
| emp_name |
+----------+
| Arun     |
| David    |
| Aliya    |
+----------+

mysql> DROP VIEW MANAGER;
Query OK, 0 rows affected (0.41 sec)

//2.UPDATE VIEW
mysql> update manager set salary = 1.1 * salary where location ="Third-floor";
Query OK, 4 rows affected (0.65 sec)
Rows matched: 4  Changed: 4  Warnings: 0



//3.PROCEDURE


mysql> create table deptsal as select dept_no , 0 as totalsalary from department;
Query OK, 5 rows affected (10.94 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> delimiter //
mysql> create procedure updatesal(IN Param1 int)
    -> begin
    -> update deptsal
    -> set totalsalary= (select sum(salary)from employee  where dept_no=Param1)
    -> where dept_no =param1;
    -> end; //
Query OK, 0 rows affected (1.37 sec)
mysql> delimiter ;
mysql> call updatesal(101);
Query OK, 0 rows affected (0.00 sec)
mysql> call updatesal(133);
Query OK, 1 row affected (0.22 sec)

mysql> call updatesal(212);
Query OK, 1 row affected (0.24 sec)



mysql> select * from deptsal;
+---------+-------------+
| dept_no | totalsalary |
+---------+-------------+
| 101     |       44000 |
| 112     |           0 |
| 133     |       37400 |
| 212     |       38500 |
| 712     |       49500 |
+---------+-------------+
5 rows in set (0.00 sec)



show procedure status;
mysql> drop procedure updatesal;
Query OK, 0 rows affected (3.54 sec)


//4.STORED PROCEDURES


mysql> DELIMITER //
mysql> CREATE PROCEDURE Getdetails()
    -> BEGIN
    -> select * from employee;
    -> END //
Query OK, 0 rows affected (0.13 sec)

mysql> DELIMITER ;
mysql> CALL Getdetails();
+--------+----------+------------+-----------+------------+------------+---------+--------+-------------+
| emp_no | emp_name | DOB        | address   | doj        | mobile_no  | dept_no | salary | Designation |
+--------+----------+------------+-----------+------------+------------+---------+--------+-------------+
|      1 | Arun     | 1970-05-08 | Alappuzha | 2020-05-21 | 9879356333 | 712     |  49500 | Staff       |
|      2 | Bipin    | 1980-06-02 | Kollam    | 2020-05-12 | 8265473982 | 133     |  37400 | CEO         |
|      4 | David    | 1983-09-16 | Kochi     | 2020-07-20 | 8685765745 | 212     |  38500 | Staff       |
|      5 | Aliya    | 1985-03-19 | Alua      | 2020-04-02 | 9678543729 | 101     |  44000 | Manager     |
+--------+----------+------------+-----------+------------+------------+---------+--------+-------------+
4 rows in set (0.21 sec)

Query OK, 0 rows affected (0.26 sec)