```
mysql> create table product(id int, pname varchar(20), price int);
//Query OK, 0 rows affected (0.09 sec)

mysql> insert into product values(1, 'TV', 5000);
//Query OK, 1 row affected (0.03 sec)

mysql> insert into product values(2, 'Washing Machine', 11000);
//Query OK, 1 row affected (0.02 sec)

mysql> select * from product;
+------+-----------------+-------+
| id   | pname           | price |
+------+-----------------+-------+
|    1 | TV              |  5000 |
|    2 | Washing Machine | 11000 |
+------+-----------------+-------+
```
2 rows in set (0.00 sec)
## Procedure to calculate discount
```
create procedure discount(pid int)
    -> begin
    -> declare temp int;
    -> select price into temp from product where id = pid ;
    -> if temp<=5000 then
    -> select 'Discount is 500';
    -> else
    -> select 'Discount is 1000';
    -> end if;
    -> end$$
```
Query OK, 0 rows affected (0.03 sec)
```
mysql> call discount(1)$$
+-----------------+
| Discount is 500 |
+-----------------+
| Discount is 500 |
+-----------------+
1 row in set (0.01 sec)
```



## Function to calculate discount
```
create function discount(pid int)
    ->  returns int
    ->  deterministic
    ->   begin
    ->   declare temp int;
    ->   select price into temp from product where id=pid;
    ->    if temp<=5000 then
    ->    return 500;
    ->    else
    ->    return 1000;
    ->    end if;
    ->     end$$
   ```
Query OK, 0 rows affected (0.01 sec)
```
mysql> select discount(id) from product$$
+--------------+
| discount(id) |
+--------------+
|          500 |
|         1000 |
+--------------+
2 rows in set (0.00 sec)
```

/* -------------------------------------------------------------------------- */



# Trigger Examples
## Trigger to set Maximum salary 100000
```
create trigger Trg1
before update on employee
for each row
begin
if new.salary>100000 then
set new.salary=100000;
end if;
end$$
```


## Trigger to demonstrate foreign key on delete cascade
```
create trigger Trg2
before delete on Department
for each row
begin
    delete from employee where did=old.did;
end$$
```

## Trigger to demonstrate foreign key on update cascade
```
create trigger Trg3
before update on Department
for each row
begin
    update employee set did=new.did where did=old.did;
end$$
```
