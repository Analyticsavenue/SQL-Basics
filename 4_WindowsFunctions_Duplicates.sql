CREATE TABLE Employee (
    id INT,
    salary DECIMAL(10, 2),
    age INT,
    phone_number VARCHAR(15),
    email_id VARCHAR(255),
    location VARCHAR(100)
);

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (1, 50000, 30, '123-456-7890', 'john@example.com', 'London');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (2, 60000, 35, '987-654-3210', 'sarah@example.com', 'Paris');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (3, 75000, 42, '555-123-4567', 'mike@example.com', 'New York');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (4, 40000, 28, '111-222-3333', 'anna@example.com', 'Berlin');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (5, 55000, 31, '444-555-6666', 'david@example.com', 'Sydney');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (1, 65000, 36, '777-888-9999', 'laura@example.com', 'Tokyo');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (7, 70000, 39, '222-333-4444', 'peter@example.com', 'Berlin');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (8, 45000, 27, '888-999-0000', 'emily@example.com', 'London');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (9, 52000, 33, '333-444-5555', 'megan@example.com', 'New York');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (10, 58000, 37, '666-777-8888', 'alex@example.com', 'Paris');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (2, 60000, 35, '555-666-7777', 'samantha@example.com', 'London');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (12, 48000, 26, '777-888-9999', 'daniel@example.com', 'Tokyo');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (13, 62000, 32, '444-555-6666', 'lisa@example.com', 'New York');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (5, 56000, 30, '222-333-4444', 'jennifer@example.com', 'Berlin');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (15, 70000, 35, '111-222-3333', 'matthew@example.com', 'London');

INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (12, 53000, 31, '888-999-0000', 'natalie@example.com', 'Paris');


----To know how partition works
with cte_phonedup AS
(
select
id,
phone_number,
location,
ROW_NUMBER()
over (partition by phone_number,location) as ph_lc
from employee
)
select * from cte_phonedup

---duplicates for 2 columns
with cte_phonedup AS
(
select
id,
phone_number,
location,
ROW_NUMBER()
over (partition by phone_number,location) as ph_lc
from employee
)
select * from cte_phonedup where ph=1 ---to remove the duplicates

-----to get the duplicates
with cte_phonedup AS
(
select
id,
phone_number,
location,
ROW_NUMBER()
over (partition by phone_number,location) as ph_lc
from employee
)
select * from cte_phonedup where ph=2

'''Explore about Row_id and how you implement the same using Row_id'''

--Recent changes
INSERT INTO Employee (id, salary, age, phone_number, email_id, location)
VALUES (17, 70000, 31, '888-999-0000', 'natalie@example.com', 'London');

update employee set salary = 60000 where id = 15
----Pick the employee with nth highest salary in each location
with location_salary_order_desc as
(
select id,
salary,
location,
dense_rank()
over
(partition by location order by salary desc) as increasing_order
from
employee
)

select * from location_salary_order_desc where increasing_order=4
