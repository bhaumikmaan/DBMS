```
mysql> use mydb;
Database changed
mysql> desc employee;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| empid     | int         | YES  |     | NULL    |       |
| name      | varchar(20) | YES  |     | NULL    |       |
| contactno | bigint      | YES  |     | NULL    |       |
| esal      | bigint      | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> select * from employee;
+-------+---------+------------+-------+
| empid | name    | contactno  | esal  |
+-------+---------+------------+-------+
|   101 | Ankit   | 9812866787 | 10000 |
|   102 | Amit    | 9812869657 | 25000 |
|   103 | ujjwal  | 9818869657 | 30000 |
|   104 | Harshit | 9232869657 | 60000 |
+-------+---------+------------+-------+
4 rows in set (0.00 sec)

              mysql> Delimiter $$
mysql> Drop procedure if exists empcursor $$
Query OK, 0 rows affected (0.01 sec)

mysql> Create procedure empcursor()
    -> Begin
    -> Declare eno int;
    -> Declare ename varchar(20);
    -> Declare esaly int;
    -> Declare flag int default 0;
    -> Declare c1 cursor for select empid, name, esal from employee;
    -> Declare continue handler for not found set flag = 1;
    -> Open c1;
    -> emp_loop :  loop
    ->                            Fetch c1 into eno, ename, esaly;
    ->
    ->    if esaly < 10000 then
    ->    select 'Class IV';
    ->    elseif esaly > 10000 and esaly < 20000 then
    ->    select 'Class I';
    ->    else
    ->                              select 'Class III';
    ->    end if;
    -> select eno, ename,esaly;
    ->  If flag = 1 then
    ->                            Leave emp_loop;
    ->                            End if;
    ->
    ->
    ->
    ->
    -> End loop emp_loop;
    -> Close c1;
    -> End $$
Query OK, 0 rows affected (0.01 sec)

mysql> Delimiter $$
mysql> Drop procedure if exists empcursor $$
Query OK, 0 rows affected (0.01 sec)

mysql> Create procedure empcursor()
    -> Begin
    -> Declare eno int;
    -> Declare ename varchar(20);
    -> Declare esaly int;
    -> Declare flag int default 0;
    -> Declare c1 cursor for select empid, name, esal from employee;
    -> Declare continue handler for not found set flag = 1;
    -> Open c1;
    -> emp_loop :  loop
    ->                            Fetch c1 into eno, ename, esaly;
    ->
    ->    if esaly < 25000 then
    ->    select 'Class IV';
    ->    elseif esaly > 27000 and esaly < 55000 then
    ->    select 'Class I';
    ->    else
    ->                              select 'Class III';
    ->    end if;
    -> select eno, ename,esaly;
    ->  If flag = 1 then
    ->                            Leave emp_loop;
    ->                            End if;
    ->
    ->
    ->
    ->
    -> End loop emp_loop;
    -> Close c1;
    -> End $$
Query OK, 0 rows affected (0.01 sec)

mysql> call empcursor()$$
+----------+
| Class IV |
+----------+
| Class IV |
+----------+
1 row in set (0.00 sec)

+------+-------+-------+
| eno  | ename | esaly |
+------+-------+-------+
|  101 | Ankit | 10000 |
+------+-------+-------+
1 row in set (0.01 sec)

+-----------+
| Class III |
+-----------+
| Class III |
+-----------+
1 row in set (0.03 sec)

+------+-------+-------+
| eno  | ename | esaly |
+------+-------+-------+
|  102 | Amit  | 25000 |
+------+-------+-------+
1 row in set (0.05 sec)

+---------+
| Class I |
+---------+
| Class I |
+---------+
1 row in set (0.07 sec)

+------+--------+-------+
| eno  | ename  | esaly |
+------+--------+-------+
|  103 | ujjwal | 30000 |
+------+--------+-------+
1 row in set (0.07 sec)

+-----------+
| Class III |
+-----------+
| Class III |
+-----------+
1 row in set (0.09 sec)

+------+---------+-------+
| eno  | ename   | esaly |
+------+---------+-------+
|  104 | Harshit | 60000 |
+------+---------+-------+
1 row in set (0.10 sec)

+-----------+
| Class III |
+-----------+
| Class III |
+-----------+
1 row in set (0.11 sec)

+------+---------+-------+
| eno  | ename   | esaly |
+------+---------+-------+
|  104 | Harshit | 60000 |
+------+---------+-------+
1 row in set (0.13 sec)

Query OK, 0 rows affected (0.14 sec)
```
