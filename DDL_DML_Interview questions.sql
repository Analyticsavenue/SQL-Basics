1. How to insert multiple records in a table in sql ?
use internship;	
INSERT INTO dtypes
(ID, tiny_int, int_column, bigint_column, float_column, double_column, varchar_column, char_column, date_column, datetime_column)
VALUEs
(1, 127, 2147483647, 9223372036854775807, 3.14, 3.141592653589793238, 'Sample Text', 'ABC', '2022-05-10', '2022-05-10 12:34:56'),
(2, -128, -2147483648, -9223372036854775808, 2.718, 2.718281828459045235, 'Another Text', 'XYZ', '2022-05-11', '2022-05-11 09:12:34');
==============================================================================================================================		
2. How to add additional column in a table?		
show tables;
select * from  employees
Alter table <tablename> add column <columnname> <datatype>
Alter table employees add column location varchar(15)
Insert into employees (EmployeeId, Name, Age,Department, Location)
value
(8,'Subramani Arumugam',25,'AIDS','Chennai')
=============================================================================================================================
3. how to change the constraint in a table?		
drop table if exists voting_kpis
CREATE TABLE voting_kpis (
  id INT PRIMARY KEY,
  candidate_name VARCHAR(100),
  votes_received INT,
  property_value_lakhs  DECIMAL(5, 2),
  CONSTRAINT check_property_value_lakhs CHECK (property_value_lakhs > 50 AND votes_received >100)
);
INSERT INTO voting_kpis (id, candidate_name, votes_received, property_value_lakhs)
VALUES
  (1, 'Candidate A', 2500, 75.2),
  (2, 'Candidate B', 3500, 65.8),
  (3, 'Candidate C', 1800, 80.5),
  (4, 'Candidate D', 4200, 71.2),
  (5, 'Candidate E', 3100, 68.9),
  (6, 'Candidate F', 2800, 73.6),
  (7, 'Candidate G', 3900, 66.4),
  (8, 'Candidate H', 2200, 78.1),
  (9, 'Candidate I', 2700, 74.9),
  (10, 'Candidate J', 3300, 69.7);
  
  ---To change the constraint
  a)--to drop
  Alter table voting_kpis
  drop constraint check_property_value_lakhs 
  b) --add new constarint
  Alter table voting_kpis
 add constraint check_data CHECK (property_value_lakhs > 20 AND votes_received >100)
 c) --checking for the new values
INSERT INTO voting_kpis (id, candidate_name, votes_received, property_value_lakhs)
VALUE
  (11, 'Candidate K', 2500, 75.2)
  select * from voting_kpis
  ==================================================================================
4. How to alter the column name in a table?		
Alter table voting_kpis rename column id to candidate_id
 select * from voting_kpis
 =====================================================================================
5. How to change the table name in sql?
Alter table voting_kpis rename to voting_metrics
=========================================================================================
6. How to change a particular value inside a table		
 select * from voting_metrics
--DML
update voting_metrics set votes_received = 5000 where candidate_id = 1
=========================================================================================
