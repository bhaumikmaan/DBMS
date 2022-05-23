```
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

mysql> select*from department;
+-----+-------+
| DID | DName |
+-----+-------+
| 501 | IT    |
| 502 | comp  |
| 503 | Entc  |
| 504 | Mech  |
+-----+-------+
4 rows in set (0.00 sec)

mysql> select*from project;
+-----+-----------------+----------+
| PID | Pname           | Location |
+-----+-----------------+----------+
|   1 | machin learning | Noida    |
|   2 | webdevelopment  | Jaipur   |
|   3 | Programming     | Delhi    |
+-----+-----------------+----------+
3 rows in set (0.00 sec)

mysql> select *from employee where salary >=15000;
+-------+---------+------------+------------+--------+------+------+
| Empid | EName   | Address    | Cintactno  | salary | DID  | PID  |
+-------+---------+------------+------------+--------+------+------+
|   102 | Arun    | ghhhjjfjh  | 7896548210 |  15000 |  502 |    2 |
|   103 | deepak  | gfiibbh    | 7896547210 |  20000 |  503 |    3 |
|   105 | ujjwal  | gffhjisgge | 7896843210 |  30000 |  502 |    2 |
|   106 | sandeep | gffhjiuggh | 7896643210 |  35000 |  503 |    3 |
+-------+---------+------------+------------+--------+------+------+
4 rows in set (0.00 sec)

mysql> select *from employee where salary >=15000 and PID=2;
+-------+--------+------------+------------+--------+------+------+
| Empid | EName  | Address    | Cintactno  | salary | DID  | PID  |
+-------+--------+------------+------------+--------+------+------+
|   102 | Arun   | ghhhjjfjh  | 7896548210 |  15000 |  502 |    2 |
|   105 | ujjwal | gffhjisgge | 7896843210 |  30000 |  502 |    2 |
+-------+--------+------------+------------+--------+------+------+
2 rows in set (0.00 sec)

mysql> select *from employee where Address like'Noida';
Empty set (0.00 sec)

mysql> select * from employee where EName like'_n%';
+-------+-------+----------+------------+--------+------+------+
| Empid | EName | Address  | Cintactno  | salary | DID  | PID  |
+-------+-------+----------+------------+--------+------+------+
|   101 | Ankit | gffhjfjh | 7896543210 |  10000 |  501 |    1 |
+-------+-------+----------+------------+--------+------+------+
1 row in set (0.00 sec)

mysql> select * from employee while Ename not like 'Arun';
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'while Ename not like 'Arun'' at line 1
mysql> select * from employee where Ename not like 'Arun';
+-------+---------+------------+------------+--------+------+------+
| Empid | EName   | Address    | Cintactno  | salary | DID  | PID  |
+-------+---------+------------+------------+--------+------+------+
|   101 | Ankit   | gffhjfjh   | 7896543210 |  10000 |  501 |    1 |
|   103 | deepak  | gfiibbh    | 7896547210 |  20000 |  503 |    3 |
|   104 | mohit   | gffhffghh  | 7896543217 |  10678 |  504 |    2 |
|   105 | ujjwal  | gffhjisgge | 7896843210 |  30000 |  502 |    2 |
|   106 | sandeep | gffhjiuggh | 7896643210 |  35000 |  503 |    3 |
+-------+---------+------------+------------+--------+------+------+
5 rows in set (0.00 sec)

mysql> select length(EName) from employee;
+---------------+
| length(EName) |
+---------------+
|             5 |
|             4 |
|             6 |
|             5 |
|             6 |
|             7 |
+---------------+
6 rows in set (0.00 sec)

mysql>  select lcase(EName) from Employee;
+--------------+
| lcase(EName) |
+--------------+
| ankit        |
| arun         |
| deepak       |
| mohit        |
| ujjwal       |
| sandeep      |
+--------------+
6 rows in set (0.00 sec)

mysql> select sum(Salary) from Employee;
+-------------+
| sum(Salary) |
+-------------+
|      120678 |
+-------------+
1 row in set (0.00 sec)

mysql> select DId, sum(salary) from Employee group by DId;
+------+-------------+
| DId  | sum(salary) |
+------+-------------+
|  501 |       10000 |
|  502 |       45000 |
|  503 |       55000 |
|  504 |       10678 |
+------+-------------+
4 rows in set (0.00 sec)

mysql> select DId, sum(salary) as totalsal from Employee where DOJ <= now() group
    -> by DId;
ERROR 1054 (42S22): Unknown column 'DOJ' in 'where clause'
mysql> select DId, sum(salary) as totalsal from Employee where DOJ <= now() group
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '' at line 1
mysql> select DName, sum(Salary) as totalsal from Employee, Department where
    -> Employee.DID=Department.DID group by DName;
+-------+----------+
| DName | totalsal |
+-------+----------+
| IT    |    10000 |
| comp  |    45000 |
| Entc  |    55000 |
| Mech  |    10678 |
+-------+----------+
4 rows in set (0.00 sec)

mysql> select * from employee where Salary not in (select max(Salary) from
    -> employee);
+-------+--------+------------+------------+--------+------+------+
| Empid | EName  | Address    | Cintactno  | salary | DID  | PID  |
+-------+--------+------------+------------+--------+------+------+
|   101 | Ankit  | gffhjfjh   | 7896543210 |  10000 |  501 |    1 |
|   102 | Arun   | ghhhjjfjh  | 7896548210 |  15000 |  502 |    2 |
|   103 | deepak | gfiibbh    | 7896547210 |  20000 |  503 |    3 |
|   104 | mohit  | gffhffghh  | 7896543217 |  10678 |  504 |    2 |
|   105 | ujjwal | gffhjisgge | 7896843210 |  30000 |  502 |    2 |
+-------+--------+------------+------------+--------+------+------+
5 rows in set (0.00 sec)

mysql> select Salary from employee where Salary > any (select e.Salary from
    -> employee as e where e.did=501);
+--------+
| Salary |
+--------+
|  15000 |
|  20000 |
|  10678 |
|  30000 |
|  35000 |
+--------+
5 rows in set (0.00 sec)

mysql> select Salary from employee where not exists (select e.Salary from employee
    -> as e where e.did=502 and e.did=employee.did);
+--------+
| Salary |
+--------+
|  10000 |
|  20000 |
|  10678 |
|  35000 |
+--------+
4 rows in set (0.00 sec)

mysql> select * from Employee natural join Department;
+------+-------+---------+------------+------------+--------+------+-------+
| DID  | Empid | EName   | Address    | Cintactno  | salary | PID  | DName |
+------+-------+---------+------------+------------+--------+------+-------+
|  501 |   101 | Ankit   | gffhjfjh   | 7896543210 |  10000 |    1 | IT    |
|  502 |   102 | Arun    | ghhhjjfjh  | 7896548210 |  15000 |    2 | comp  |
|  502 |   105 | ujjwal  | gffhjisgge | 7896843210 |  30000 |    2 | comp  |
|  503 |   103 | deepak  | gfiibbh    | 7896547210 |  20000 |    3 | Entc  |
|  503 |   106 | sandeep | gffhjiuggh | 7896643210 |  35000 |    3 | Entc  |
|  504 |   104 | mohit   | gffhffghh  | 7896543217 |  10678 |    2 | Mech  |
+------+-------+---------+------------+------------+--------+------+-------+
6 rows in set (0.00 sec)

mysql> select * from Employee inner join Department on Employee.DID=Department.DID;
+-------+---------+------------+------------+--------+------+------+-----+-------+
| Empid | EName   | Address    | Cintactno  | salary | DID  | PID  | DID | DName |
+-------+---------+------------+------------+--------+------+------+-----+-------+
|   101 | Ankit   | gffhjfjh   | 7896543210 |  10000 |  501 |    1 | 501 | IT    |
|   102 | Arun    | ghhhjjfjh  | 7896548210 |  15000 |  502 |    2 | 502 | comp  |
|   105 | ujjwal  | gffhjisgge | 7896843210 |  30000 |  502 |    2 | 502 | comp  |
|   103 | deepak  | gfiibbh    | 7896547210 |  20000 |  503 |    3 | 503 | Entc  |
|   106 | sandeep | gffhjiuggh | 7896643210 |  35000 |  503 |    3 | 503 | Entc  |
|   104 | mohit   | gffhffghh  | 7896543217 |  10678 |  504 |    2 | 504 | Mech  |
+-------+---------+------------+------------+--------+------+------+-----+-------+
6 rows in set (0.00 sec)

mysql> select * from Employee right join Department on Employee.DID=Department.DID;
+-------+---------+------------+------------+--------+------+------+-----+-------+
| Empid | EName   | Address    | Cintactno  | salary | DID  | PID  | DID | DName |
+-------+---------+------------+------------+--------+------+------+-----+-------+
|   101 | Ankit   | gffhjfjh   | 7896543210 |  10000 |  501 |    1 | 501 | IT    |
|   102 | Arun    | ghhhjjfjh  | 7896548210 |  15000 |  502 |    2 | 502 | comp  |
|   105 | ujjwal  | gffhjisgge | 7896843210 |  30000 |  502 |    2 | 502 | comp  |
|   103 | deepak  | gfiibbh    | 7896547210 |  20000 |  503 |    3 | 503 | Entc  |
|   106 | sandeep | gffhjiuggh | 7896643210 |  35000 |  503 |    3 | 503 | Entc  |
|   104 | mohit   | gffhffghh  | 7896543217 |  10678 |  504 |    2 | 504 | Mech  |
+-------+---------+------------+------------+--------+------+------+-----+-------+
6 rows in set (0.00 sec)
```
