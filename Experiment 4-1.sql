
// user defined functions in sql

mysql> CREATE FUNCTION hello (s CHAR(20))
    -> RETURNS CHAR(50) DETERMINISTIC
    -> RETURN CONCAT('Hello, ',s,'!');
Query OK, 0 rows affected (0.54 sec)

mysql>  SELECT hello('world');
+----------------+
| hello('world') |
+----------------+
| Hello, world!  |
+----------------+
1 row in set (0.17 sec)

mysql> create database cus;
Query OK, 1 row affected (1.30 sec)

mysql> use cus;
Database changed
mysql> create table customer(cust_id int NOT NULL,name varchar(50),occupation varchar(50),age int,PRIMARY KEY(cust_id));
Query OK, 0 rows affected (2.17 sec)
mysql> INSERT INTO customer (cust_id, name, occupation, age)VALUES (101, 'Peter', 'Engineer', 32);
Query OK, 1 row affected (0.43 sec)

mysql> INSERT INTO customer VALUES
    -> (102, 'Joseph', 'Developer', 30),
    -> (103, 'Mike', 'Leader', 28),
    -> (104, 'Stephen', 'Scientist', 45);
Query OK, 3 rows affected (0.09 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> DELIMITER $$
mysql> CREATE FUNCTION Customer_Occupation(
    ->     age int
    -> )
    -> RETURNS VARCHAR(20)
    -> DETERMINISTIC
    -> BEGIN
    ->     DECLARE customer_occupation VARCHAR(20);
    ->     IF age > 35 THEN
    ->         SET customer_occupation = 'Scientist';
    ->     ELSEIF (age <= 35 AND
    ->             age >= 30) THEN
    ->         SET customer_occupation = 'Engineer';
    ->     ELSEIF age < 30 THEN
    ->         SET customer_occupation = 'Actor';
    ->     END IF;
    ->     -- return the customer occupation
    ->     RETURN (customer_occupation);
    -> END$$
Query OK, 0 rows affected (1.49 sec)
mysql> DELIMITER ;
mysql> SHOW FUNCTION STATUS WHERE db = 'cus';
+------+---------------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| Db   | Name                | Type     | Definer        | Modified            | Created             | Security_type | Comment | character_set_client | collation_connection | Database Collation |
+------+---------------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
| cus  | Customer_Occupation | FUNCTION | root@localhost | 2021-06-13 19:17:29 | 2021-06-13 19:17:29 | DEFINER       |         | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+------+---------------------+----------+----------------+---------------------+---------------------+---------------+---------+----------------------+----------------------+--------------------+
1 row in set (0.70 sec)

mysql> SELECT name, age, Customer_Occupation(age)
    -> FROM customer ORDER BY age;
+---------+------+--------------------------+
| name    | age  | Customer_Occupation(age) |
+---------+------+--------------------------+
| Mike    |   28 | Actor                    |
| Joseph  |   30 | Engineer                 |
| Peter   |   32 | Engineer                 |
| Stephen |   45 | Scientist                |
+---------+------+--------------------------+
4 rows in set (0.17 sec)
mysql> DELIMITER $$
mysql> CREATE PROCEDURE GetCustomerDetail()
    -> BEGIN
    ->     SELECT name, age, Customer_Occupation(age) FROM customer ORDER BY age;
    -> END$$
Query OK, 0 rows affected (1.01 sec)

mysql> DELIMITER ;
mysql> CALL GetCustomerDetail();
+---------+------+--------------------------+
| name    | age  | Customer_Occupation(age) |
+---------+------+--------------------------+
| Mike    |   28 | Actor                    |
| Joseph  |   30 | Engineer                 |
| Peter   |   32 | Engineer                 |
| Stephen |   45 | Scientist                |
+---------+------+--------------------------+
4 rows in set (0.03 sec)

Query OK, 0 rows affected (0.05 sec)
