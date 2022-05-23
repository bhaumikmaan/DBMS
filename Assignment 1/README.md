# ASSIGNMENT NO. 1 #
 
## Aim ##
 
Study of Open Source Database (MySQL).
 
## Objective ##
 
To understand basic concepts of open source database.
 
## Theory ##
 ```
What is Database?
A database is a separate application that stores a collection of data. Each database has one or more distinct APIs for creating, accessing,managing, searching and replicating the data it holds. So nowadays, we use relational database management systems (RDBMS) to store and manage huge volume of data. This is called relational database because all the data is stored into different tables and relations are established using primary keys or other keys known as foreign keys.
A Relational DataBase Management System (RDBMS) is a software that:
_ Enables you to implement a database with tables, columns and indexes.
_ Guarantees the Referential Integrity between rows of various tables.
_ Updates the indexes automatically.
_ Interprets an SQL query and combines information from various tables.
RDBMS Terminology:
Before we proceed to explain MySQL database system, let's revise few definitions related to database.
_ Database: A database is a collection of tables, with related data.
_ Table: A table is a matrix with data. A table in a database looks like a simple spreadsheet.
_ Column: One column (data element) contains data of one and the same kind, for example the
column postcode.
_ Row: A row (= tuple, entry or record) is a group of related data, for example the data of one
subscription.
_ Redundancy: Storing data twice, redundantly to make the system faster.
_ Primary Key: A primary key is unique. A key value cannot occur twice in one table. With a key,
you can find at most one row.
_ Foreign Key: A foreign key is the linking pin between two tables.
_ Compound Key: A compound key (composite key) is a key that consists of multiple columns,
because one column is not sufficiently unique.
_ Index: An index in a database resembles an index at the back of a book.
_ Referential Integrity: Referential Integrity makes sure that a foreign key value always points to
an existing row.
 
MySQL is a fast, easy-to-use RDBMS being used for many small and big businesses. MySQL is developed, marketed, and supported by MySQL AB, which is a Swedish company. MySQL is becoming so popular because of many good reasons:
• MySQL is released under an open-source license. So you have nothing to pay to use it.
• MySQL is a very powerful program in its own right. It handles a large subset of the functionality
of the most expensive and powerful database packages.
• MySQL uses a standard form of the well-known SQL data language.
• MySQL works on many operating systems and with many languages including PHP, PERL, C,
C++, JAVA, etc.
• MySQL works very quickly and works well even with large data sets.
• MySQL is very friendly to PHP, the most appreciated language for web development.
• MySQL supports large databases, up to 50 million rows or more in a table. The default file size
limit for a table is 4GB, but you can increase this (if your operating system can handle it) to a
theoretical limit of 8 million terabytes (TB).
• MySQL is customizable. The open-source GPL license allows programmers to modify the
MySQL software to fit their own specific environments.
Creating Tables
To create table we use the CREATE TABLE statement. The typical form is as follows:
1 CREATE TABLE [IF NOT EXISTS] table_name(
2 column_list
3 ) type=table_type
• MySQL supports IF NOT EXISTS after CREATE TABLE statement to prevent you from error of creating table which already exists on the database server.
• table_name is the name of table you would like to create. After that, you can define a set of columns which is usually in this form: column_name data_type(size) [NOT] NULL.
• You can specify the storage engine type you prefer to use for the table. MySQL supports various storage engines such as InnoDB, MyISAM... If you don't explicit declare storage engine type,
MySQL will use MyISAM by default.
In our classicmodels sample database, to create employees table, we can use the CREATE TABLE statement as follows:
 
Showing and Describing Tables in a Database
1 SHOW TABLES
Here is the output of classicmodels database:
```
```
+-------------------------+
| Tables_in_classicmodels |
+-------------------------+
| customers |
| employees |
+--------------------------+
```
2 rows in set (0.00 sec)
In some cases, you need to see the table's metadata, you can use DESCRIBE statement as follows:
1 DESCRIBE table_name;
For instance, we can describe employees table like below query:
1 DESCRIBE employees;
The output return from the database server:
``` 
+----------------+--------------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+----------------+--------------+------+-----+---------+-------+
| employeeNumber | int(11) | NO | PRI | NULL | |
| lastName | varchar(50) | NO | | NULL | |
| firstName | varchar(50) | NO | | NULL | |
| extension | varchar(10) | NO | | NULL | |
| email | varchar(100) | NO | | NULL | |
| officeCode | varchar(10) | NO | | NULL | |
| reportsTo | int(11) | YES | | NULL | |
| jobTitle | varchar(50) | NO | | NULL | |
+----------------+--------------+------+-----+---------+-------+
```
8 rows in set (0.02 sec)
Altering Table Structures
The following illustrates the ALTER TABLE statement syntax:
01 ALTER [IGNORE] TABLE table_name options[, options...]
02 options:
03 ADD [COLUMN] create_definition [FIRST | AFTER col_name ]
04 or ADD [COLUMN] (create_definition, create_definition,...)
05 or ADD INDEX [index_name] (index_col_name,...)
06 or ADD PRIMARY KEY (index_col_name,...)
07 or ADD UNIQUE [index_name] (index_col_name,...)
08 or ADD FULLTEXT [index_name] (index_col_name,...)
09 or ADD [CONSTRAINT symbol] FOREIGN KEY [index_name] (index_col_name,...)
10 [reference_definition]
11 or ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}
12 or CHANGE [COLUMN] old_col_name create_definition
13 [FIRST | AFTER column_name]
14 or MODIFY [COLUMN] create_definition [FIRST | AFTER col_name]
15 or DROP [COLUMN] col_name
16 or DROP PRIMARY KEY
17 or DROP INDEX index_name
18 or DISABLE KEYS
19 or ENABLE KEYS
20 or RENAME [TO] new_table_name
21 or ORDER BY col_name
22 or table_options
Most of these options are obvious. We will explain some here:
• The CHANGE and MODIFY are the same, they allow you to change the definition of the column or its position in the table.
• The DROP COLUMN will drop the column of the table permanently, if the table contain data all the data of the column will be lost.
• The DROP PRIMARY KEY and DROP INDEX only remove the primary key or index of the column.
• The DISABLE and ENABLE KEYS turn off and on updating indexes for MyISAM table only.
 
 
The RENAME Clause allows you the change the table name to the new one.
Deleting Tables
To delete table from the database, you can use DROP TABLE statement:
1 DROP [TEMPORARY] TABLE [IF EXISTS] table_name [, table_name,...]
TEMPORARY keyword is used for deleting temporary tables. MySQL allows you to drop multiple tables at once by listing them and separated each by a comma. IF EXISTS is used to prevent you from deleting
table which does not exist in the database.
Empty Table's Data
1 TRUNCATE TABLE table_name
• TRUNCATE TABLE statement drop table and recreate it therefore it is much faster than DELETE TABLE statement. However it is not transaction-safe.
• The number of deleted rows is not returned like SQL DELETE TABLE statement.
• ON DELETE triggers are not invoked because TRUNCATE does not use DELETE statement.
Changing columns using MySQL ALTER TABLE statement
1 ALTER TABLE tasks
2 CHANGE COLUMN task_id task_id INT(11) NOT NULL AUTO_INCREMENT;
Using MySQL ALTER TABLE to add a new column into a table
1 ALTER TABLE tasks ADD COLUMN 'complete' DECIMAL(2,1) NULL
2 AFTER 'description' ;
Using MySQL ALTER TABLE to drop a column froma table
1 ALTER TABLE tasks
2 DROP COLUMN description ;
Renaming table using MySQL ALTER TABLE statement
1 ALTER TABLE 'tasks'
Managing Database Index in MySQL
Creating Indexes
CREATE [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
USING [BTREE | HASH | RTREE]
ON table_name (column_name [(length)] [ASC | DESC],...)
First you specify the index based on the table types or storage engine:
• UNIQUE means MySQL will create a constraint that all values in the index must be distinct.
Duplicated NULL is allowed in all storage engine except BDB.
• FULLTEXT index is supported only by MyISAM storage engine and only accepted columns which
have data type is CHAR,VARCHAR or TEXT.
• SPATIAL index supports spatial column and available in MyISAM storage engine. In addition, the
column value must not be NULL.
Then you name the index using index types such as BTREE, HASH or RTREE also based on storage
engine. Here is the list:
 
Storage Engine            Allowable Index Types
MyISAM                        BTREE, RTREE
InnoDB                         BTREE
MEMORY/HEAP           HASH, BTREE
NDB                              HASH
CREATE INDEX officeCode ON employees(officeCode)
Removing Indexes
DROP INDEX index_name ON table_name
DROP INDEX officeCode ON employees
 
MySQL SELECT Statement
In order to retrieve data from MySQ
1 SELECT column_name1,col
2 FROM tables
3 [WHERE conditions]
4 [GROUP BY group
5 [HAVING group_condition
6 [ORDER BY sort_columns]
7 [LIMIT limits];
 
 
1.    SELECT * FROM employees;
 
2.    SELECT lastname,firstna
FROM employees;
 
3.    SELECT firstname,lastna
FROM employees
WHERE jobtitle="president”;
 
4.    SELECT DISTINCT jobTitle
FROM employees;
 
5.    SELECT firstname,lastna
FROM employees
ORDER BY firstname ASC, jobtitle DESC;
 
 
6.    SELECT firstname,lastname
FROM employees
LIMIT 5
 
7.     SELECT firstname,lastname
FROM employees
LIMIT 10,5
 
8.    SELECT officeCode, city, phone
FROM offices
WHERE country IN ('USA','France')
 
9.    SELECT officeCode, city, phone
FROM offices
WHERE country NOT IN ('USA','France')
 
10.     SELECT orderNumber
FROM orderDetails
GROUP BY orderNumber
HAVING SUM(quantityOrdered * priceEach) > 60000
11.    SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstName LIKE 'a%'
 
12.    SELECT productCode,ProductName,buyPrice
FROM products
WHERE buyPrice BETWEEN 90 AND 100
ORDER BY buyPrice DESC
 
13.    SELECT employeeNumber, lastName, firstName
FROM employees
WHERE firstname LIKE ''T_m"
 
14.    SELECT customerNumber id, contactLastname name
FROM customers
UNION
SELECT employeeNumber id,firstname name
FROM employees
 
MySQL INNER JOIN
 
 SELECT column_list
 FROM t1
 INNER JOIN t2 ON join_con
 INNER JOIN t3 ON join_con
5 ...
WHERE where_conditions;
 
 
SELECT A.productCode, A
FROM products A
INNER JOIN orderDetails B on A.productCode = B.productCode;
 
MySQL LEFT JOIN
 
SELECT t1.c1, t1.c2,…t2
FROM t1
LEFT JOIN t2 ON t1.c1 = t2.c1 …(join_condition)
WHERE where_condition
 
SELECT c.customerNumber
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber;
 
MySQL GROUP BY with aggregate function
SELECT status, count(*)
FROM orders 
GROUP BY status
 
