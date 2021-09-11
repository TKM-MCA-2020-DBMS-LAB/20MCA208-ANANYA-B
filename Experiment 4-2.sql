mysql> create database emp;
Query OK, 1 row affected (1.01 sec)

mysql> use emp;
Database changed
mysql> CREATE TABLE employee(
    ->     name varchar(45) NOT NULL,
    ->     occupation varchar(35) NOT NULL,
    ->     working_date date,
    ->     working_hours varchar(10)
    -> );
Query OK, 0 rows affected (3.25 sec)

mysql> INSERT INTO employee VALUES
    -> ('Robin', 'Scientist', '2020-10-04', 12),
    -> ('Warner', 'Engineer', '2020-10-04', 10),
    -> ('Peter', 'Actor', '2020-10-04', 13),
    -> ('Marco', 'Doctor', '2020-10-04', 14),
    -> ('Brayden', 'Teacher', '2020-10-04', 12),
    -> ('Antonio', 'Business', '2020-10-04', 11);
Query OK, 6 rows affected (0.40 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> select * from employee;
+---------+------------+--------------+---------------+
| name    | occupation | working_date | working_hours |
+---------+------------+--------------+---------------+
| Robin   | Scientist  | 2020-10-04   | 12            |
| Warner  | Engineer   | 2020-10-04   | 10            |
| Peter   | Actor      | 2020-10-04   | 13            |
| Marco   | Doctor     | 2020-10-04   | 14            |
| Brayden | Teacher    | 2020-10-04   | 12            |
| Antonio | Business   | 2020-10-04   | 11            |
+---------+------------+--------------+---------------+
6 rows in set (0.11 sec)

mysql> DELIMITER //
mysql> Create Trigger Before_insert_emploworkinghours
    -> BEFORE INSERT ON employee FOR EACH ROW
    -> IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
    -> END IF;
    -> END;//
Query OK, 0 rows affected (0.40 sec)
mysql> delimiter ;
mysql> INSERT INTO employee VALUES ('Markus', 'Former', '2020-10-08', 14);
Query OK, 1 row affected (0.18 sec)

mysql> INSERT INTO employee VALUES  ('Alexander', 'Actor', '2020-10-012', -13);
Query OK, 1 row affected (0.14 sec)

mysql> select * from employee;
+-----------+------------+--------------+---------------+
| name      | occupation | working_date | working_hours |
+-----------+------------+--------------+---------------+
| Robin     | Scientist  | 2020-10-04   | 12            |
| Warner    | Engineer   | 2020-10-04   | 10            |
| Peter     | Actor      | 2020-10-04   | 13            |
| Marco     | Doctor     | 2020-10-04   | 14            |
| Brayden   | Teacher    | 2020-10-04   | 12            |
| Antonio   | Business   | 2020-10-04   | 11            |
| Markus    | Former     | 2020-10-08   | 14            |
| Alexander | Actor      | 2020-10-12   | 0             |
+-----------+------------+--------------+---------------+
8 rows in set (0.00 sec)

mysql>  SHOW TRIGGERS;
+---------------------------------+--------+----------+-------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| Trigger                         | Event  | Table    | Statement                                                         | Timing | Created                | sql_mode                                   | Definer        | character_set_client | collation_connection | Database Collation |
+---------------------------------+--------+----------+-------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
| before_insert_empworkinghours   | INSERT | employee | IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
END IF | BEFORE | 2021-06-10 10:35:06.71 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| bef_insert_empworkinghours      | INSERT | employee | IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
END IF | BEFORE | 2021-06-10 10:39:22.22 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| bfre_insert_empworkinghours     | INSERT | employee | IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
END IF | BEFORE | 2021-06-10 10:41:50.23 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
| Before_insert_emploworkinghours | INSERT | employee | IF NEW.working_hours < 0 THEN SET NEW.working_hours = 0;
END IF | BEFORE | 2021-06-10 10:44:43.55 | STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION | root@localhost | cp850                | cp850_general_ci     | utf8mb4_0900_ai_ci |
+---------------------------------+--------+----------+-------------------------------------------------------------------+--------+------------------------+--------------------------------------------+----------------+----------------------+----------------------+--------------------+
4 rows in set (0.62 sec)
