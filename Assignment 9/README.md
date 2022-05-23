```
mysql> use employee;
Database changed
mysql> select* from employee;
+-------+---------+------------+------------+--------+------+------+
| Empid | EName   | Address    | Cintactno  | salary | DID  | PID  |
+-------+---------+------------+------------+--------+------+------+
|   101 | Ankit   | gffhjfjh   | 7896543210 |  10000 |  501 |    1 |
|   102 | Arun    | ghhhjjfjh  | 7896548210 |  15000 |  502 |    2 |
|   103 | deepak  | gfiibbh    | 7896547210 |  20000 |  503 |    3 |
|   104 | mohit   | gffhffghh  | 7896543217 |  10678 |  504 |    2 |
|   105 | ujjwal  | gffhjisgge | 7896843210 |  30000 |  502 |    2 |
|   106 | sandeep | gffhjiuggh | 7896643210 |  35000 |  503 |    3 |
+-------+---------+------------+------------+--------+------+------+
6 rows in set (0.00 sec)

mysql> Delimiter  $$
mysql> drop procedure if exists empclass $$
Query OK, 0 rows affected, 1 warning (0.05 sec)

mysql> create procedure empclass (eid int)
    -> begin
    -> declare sal int;
    -> select salary into sal from employee where Empid=eid;
    -> if sal <=65000 then
    -> select "class III";
    -> elseif sal>65000 and sal<=85000 then
    -> select "class II";
    -> elseif sal>85000 then
    -> select "class II";
    -> else
    -> select "class I";
    -> end if;
    -> end $$
Query OK, 0 rows affected (0.01 sec)

mysql> call empclass(103) $$
+-----------+
| class III |
+-----------+
| class III |
+-----------+
1 row in set (0.01 sec)

Query OK, 0 rows affected (0.01 sec)

mysql> Delimiter $$
mysql>  drop function if exists empclass$$
Query OK, 0 rows affected, 1 warning (0.00 sec)

mysql> create function empclass(eid int)
    ->  returns varchar(20)
    -> deterministic
    ->
    -> begin
    -> declare sal int;
    -> declare res varchar(20);
    ->  select salary into sal from employee where Empid=eid;
    -> if salary <=20000 then
    -> set res ="class IV";
    -> elseif sal>20000 and sal<=8000 then
    -> set res ="class III";
    -> elseif sal>8000 and sal<=15000 then
    -> set res="class II";
    -> else
    -> set res ="class I";
    -> end if;
    -> return res;
    -> end $$
Query OK, 0 rows affected (0.01 sec)

mysql> call empclass(104) $$
+-----------+
| class III |
+-----------+
| class III |
+-----------+
1 row in set (0.00 sec)

Query OK, 0 rows affected (0.01 sec)

```
