=====================================================Major Veification=====================================================
show databases
create database internship
use internship
=====================================================Create table=====================================================
'''listing the tables'''
show tables
drop table if exists batch_6
create table batch_6 
(
name varchar(100) , 
id int not null , 
college varchar(100), 
status boolean, 
email_id varchar(100), 
contact int,
dob date, 
cgpa double() not null
);


select * from batch_6
'''Viewing the records'''
=====================================================Table structure=====================================================
desc batch_6

=====================================================constraints=====================================================
use internship
CREATE TABLE Employees (
  EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Age INT CHECK (Age >= 18),
  Department VARCHAR(50) DEFAULT 'IT'
);

INSERT INTO Employees (Name, Age, Department) VALUES
  ('John Doe', 25, 'Sales'),
  ('Jane Smith', 30, 'HR'),
  ('Mark Johnson', 22, 'IT'),
  ('Emily Davis', 27, 'Marketing'),
  ('Michael Brown', 35,'IT');
  
  INSERT INTO Employees (Name, Age) VALUES
  ('Emily', 26),
  ('Michael', 35);
  
  select * from Employees
  
  INSERT INTO Employees (Name, Age) VALUE ('Esa', 7)
  =====================================================data types=====================================================
create table dtypes(
  ID INT PRIMARY KEY,
  tiny_int TINYINT,
  int_column INT,
  bigint_column BIGINT,
  float_column FLOAT,
  double_column DOUBLE,
  varchar_column VARCHAR(50),
  char_column CHAR(10),
  date_column DATE,
  datetime_column DATETIME
);
INSERT INTO dtypes
(ID, tiny_int, int_column, bigint_column, float_column, double_column, varchar_column, char_column, date_column, datetime_column)
VALUES
(1, 127, 2147483647, 9223372036854775807, 3.14, 3.141592653589793238, 'Sample Text', 'ABC', '2022-05-10', '2022-05-10 12:34:56'),
(2, -128, -2147483648, -9223372036854775808, 2.718, 2.718281828459045235, 'Another Text', 'XYZ', '2022-05-11', '2022-05-11 09:12:34');
select * from dtypes
 =====================================================PK AND FK=====================================================
 
 CREATE TABLE Emp (
  EmployeeID INT PRIMARY KEY,
  Name VARCHAR(50) NOT NULL,
  Department VARCHAR(50),
  Experience tiny int
);

 CREATE TABLE Bonus(
  bonus_code INT PRIMARY KEY,
  bonus_value tiny int NOT NULL,
  empid int,
  FOREIGN KEY(empid) REFERENCES emp(EmployeeID )
);
