```
mysql> use employee;
Database changed
mysql> select * from employee;
ERROR 1146 (42S02): Table 'employee.employee' doesn't exist
mysql> create table employee(Empid int,EName varchar(20),Address varchar(50),Cintactno bigint,salary int);
Query OK, 0 rows affected (0.04 sec)

mysql> alter table employee add DID int;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table department(DID int primary key,DName varchar(20));
Query OK, 0 rows affected (0.03 sec)

mysql> alter table employee add foreign key(DID) references department(DID);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> Insert into department(DID,DName) values('501','IT');
Query OK, 1 row affected (0.01 sec)

mysql> Insert into department(DID,DName) values('502','comp');
Query OK, 1 row affected (0.00 sec)

mysql>  Insert into department(DID,DName) values('503','Entc');
Query OK, 1 row affected (0.00 sec)

mysql> Insert into department(DID,DName) values('504','Mech');
Query OK, 1 row affected (0.01 sec)

mysql>  Insert into employee(Empid ,EName,Address,Cintactno ,salary,DID) values('101','Ankit','gffhjfjh','7896543210','10000','501');
Query OK, 1 row affected (0.01 sec)

mysql> Insert into employee(Empid ,EName,Address,Cintactno ,salary,DID) values('102','Arun','ghhhjjfjh','7896548210','15000','502');
Query OK, 1 row affected (0.01 sec)

mysql> Insert into employee(Empid ,EName,Address,Cintactno ,salary,DID) values('103','deepak','gfiibbh','7896547210','20000','503');
Query OK, 1 row affected (0.00 sec)

mysql> Insert into employee(Empid ,EName,Address,Cintactno ,salary,DID) values('104','mohit','gffhffghh','7896543217','10678','504');
Query OK, 1 row affected (0.00 sec)

mysql> Insert into employee(Empid ,EName,Address,Cintactno ,salary,DID) values('105','ujjwal','gffhjisgge','7896843210','30000','502');
Query OK, 1 row affected (0.01 sec)

mysql> Insert into employee(Empid ,EName,Address,Cintactno ,salary,DID) values('106','sandeep','gffhjiuggh','7896643210','35000','503');
Query OK, 1 row affected (0.01 sec)

mysql> create view v1 as select EName,Address,salaryfrom employee;
ERROR 1054 (42S22): Unknown column 'EName' in 'field list'
mysql> create view v1 as select EName , Address ,salary from employee;
Query OK, 0 rows affected (0.01 sec)

mysql> select * from v1;
+---------+------------+--------+
| EName   | Address    | salary |
+---------+------------+--------+
| Ankit   | gffhjfjh   |  10000 |
| Arun    | ghhhjjfjh  |  15000 |
| deepak  | gfiibbh    |  20000 |
| mohit   | gffhffghh  |  10678 |
| ujjwal  | gffhjisgge |  30000 |
| sandeep | gffhjiuggh |  35000 |
+---------+------------+--------+
6 rows in set (0.01 sec)

mysql> create view v2 as select EName ,salary from employee ,DName from department where  employee.DID=department.DID;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'from department where  employee.DID=department.DID' at line 1
mysql> create view v2 as select EName ,DName from employee , department where  employee.DID=department.DID;
Query OK, 0 rows affected (0.01 sec)

mysql> select*from v2;
+---------+-------+
| EName   | DName |
+---------+-------+
| Ankit   | IT    |
| Arun    | comp  |
| ujjwal  | comp  |
| deepak  | Entc  |
| sandeep | Entc  |
| mohit   | Mech  |
+---------+-------+
6 rows in set (0.00 sec)

mysql> create view v3 as select DID,sum(salary)from employee group by DID;
Query OK, 0 rows affected (0.01 sec)

mysql> select* v3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'v3' at line 1
mysql> select* from v3;
+------+-------------+
| DID  | sum(salary) |
+------+-------------+
|  501 |       10000 |
|  502 |       45000 |
|  503 |       55000 |
|  504 |       10678 |
+------+-------------+
4 rows in set (0.00 sec)

mysql> create view v4 as select * from Employee where salary in (select max(salary)
    -> from Employee);
Query OK, 0 rows affected (0.01 sec)

mysql> select * from v4;
+-------+---------+------------+------------+--------+------+
| Empid | EName   | Address    | Cintactno  | salary | DID  |
+-------+---------+------------+------------+--------+------+
|   106 | sandeep | gffhjiuggh | 7896643210 |  35000 |  503 |
+-------+---------+------------+------------+--------+------+
1 row in set (0.00 sec)

```
