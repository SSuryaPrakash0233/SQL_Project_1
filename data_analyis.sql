create database Data_Analytics;
use  Data_Analytics;
SET Sql_safe_updates=0;
create TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'HR', 'Chennai'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Mumbai'),
(104, 'Sales', 'Delhi'),
(105, 'Support', 'Hyderabad'),
(106, 'R&D', 'Pune');


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

SELECT customer_id as customer1_id from customers;


INSERT INTO customers VALUES
(201, 'Raj', 'Chennai', '2022-01-01'),
(202, 'Meena', 'Mumbai', '2021-05-12'),
(203, 'Karthik', 'Bangalore', '2023-02-18'),
(204, 'Divya', 'Delhi', '2020-07-22'),
(205, 'Sanjay', 'Hyderabad', '2021-09-09'),
(206, 'Pallavi', 'Chennai', '2022-11-11'),
(207, 'Ajay', 'Pune', '2023-03-03'),
(208, 'Ritu', 'Mumbai', '2020-12-12'),
(209, 'Suman', 'Kolkatai', '2021-08-08'),
(210, 'Neeraj', 'Bangalore', '2024-01-10'),
(211, 'Anu', 'Chennai', '2024-02-14'),
(212, 'Kiran', 'Mumbai', '2023-05-05'),
(213, 'Vikas', 'Delhi', '2022-06-06'),
(214, 'Harsha', 'Hyderabad', '2021-07-07'),
(215, 'Rohit', 'Pune', '2020-03-03'),
(216, 'Swati', 'Mumbai', '2024-04-01'),
(217, 'Aman', 'Chennai', '2023-10-10'),
(218, 'Priyanka', 'Bangalore', '2022-12-12'),
(219, 'Sunil', NULL, '2021-01-01'),
(220, 'Nisha', 'Delhi', '2023-09-09');



CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    manager_id INT,
    salary INT,
    hire_date DATE,
    city VARCHAR(50),
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO employees VALUES
(1, 'Arun', 102, NULL, 120000, '2018-05-10', 'Bangalore'),
(2, 'Ravi', 102, 1, 80000, '2021-03-12', 'Chennai'),
(3, 'Anita', 101, 1, 60000, '2019-07-01', 'Chennai'),
(4, 'Kiran', 103, 1, 95000, '2017-11-23', 'Mumbai'),
(5, 'Suresh', 104, 4, 40000, '2022-01-10', 'Delhi'),
(6, 'Amit', 104, 4, 30000, '2023-06-15', 'Delhi'),
(7, 'Neha', 101, 3, 55000, '2020-02-19', 'Chennai'),
(8, 'Pooja', 105, 4, 25000, '2021-08-09', 'Hyderabad'),
(9, 'Vijay', 105, 8, 20000, '2019-09-18', NULL),
(10, 'Akash', 106, 1, 130000, '2016-04-05', 'Pune'),
(11, 'Rahul', 106, 10, 90000, '2022-12-12', 'Pune'),
(12, 'Sneha', 103, 4, 70000, '2020-10-30', 'Mumbai'),
(13, 'Deepak', 103, 4, 50000, '2021-01-01', 'Mumbai'),
(14, 'Asha', 101, 3, 65000, '2023-03-03', 'Chennai'),
(15, 'Nikhil', 102, 2, 75000, '2020-06-06', 'Bangalore'),
(16, 'Priya', 104, 5, 48000, '2022-09-09', 'Delhi'),
(17, 'Manoj', 105, 8, 22000, '2021-11-11', 'Hyderabad'),
(18, 'Kavya', 102, 2, 82000, '2019-12-12', NULL),
(19, 'Ramesh', NULL, NULL, 45000, '2020-05-05', 'Chennai'),
(20, 'Anil', 106, 10, 140000, '2015-01-01', 'Pune');

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount DECIMAL(10,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products VALUES
(301, 'iPhone Pro', 'Electronics', 120000),
(302, 'Laptop Pro', 'Electronics', 90000),
(303, 'Bluetooth Speaker', 'Electronics', 5000),
(304, 'Office Chair', 'Furniture', 7000),
(305, 'Study Table', 'Furniture', 15000),
(306, 'Washing Machine', 'Appliances', 35000),
(307, 'Refrigerator', 'Appliances', 45000),
(308, 'Smart TV', 'Electronics', 55000),
(309, 'Headphones Pro', 'Electronics', 8000),
(310, 'Notebook', 'Stationery', 100),
(311, 'Pen Pack', 'Stationery', 200),
(312, 'Tablet Pro', 'Electronics', 60000),
(313, 'Camera', 'Electronics', 75000),
(314, 'Microwave', 'Appliances', 22000),
(315, 'Printer', 'Electronics', 18000);


INSERT INTO orders VALUES
(401, 201, '2024-01-05', 150000.00, 'Completed'),
(402, 202, '2023-12-12', 45000.00, 'Completed'),
(403, 203, '2024-02-20', 90000.00, 'Completed'),
(404, 204, '2024-03-15', 30000.00, 'Cancelled'),
(405, 205, '2023-11-11', 7000.00, 'Completed'),
(406, 206, '2024-04-01', 55000.00, 'Completed'),
(407, 207, '2023-10-10', 120000.00, 'Completed'),
(408, 208, '2022-08-08', 35000.00, 'Completed'),
(409, 209, '2021-06-06', 15000.00, 'Cancelled'),
(410, 210, '2024-05-05', 8000.00, 'Completed'),
(411, 211, CURRENT_DATE, 60000.00, 'Completed'),
(412, 212, '2024-01-01', 75000.00, 'Completed'),
(413, 213, '2023-09-09', 18000.00, 'Completed'),
(414, 214, '2024-02-02', 22000.00, 'Completed'),
(415, 215, '2022-02-02', 100.00, 'Completed'),
(416, 216, '2024-03-03', 5000.00, 'Completed'),
(417, 217, '2024-04-04', 90000.00, 'Completed'),
(418, 218, '2023-05-05', 45000.00, 'Completed'),
(419, 219, '2024-06-06', 7000.00, 'Completed'),
(420, 220, '2024-07-07', 120000.00, 'Completed');


INSERT INTO order_items VALUES
(501, 401, 301, 1),
(502, 401, 309, 2),
(503, 402, 307, 1),
(504, 403, 302, 1),
(505, 404, 304, 2),
(506, 405, 304, 1),
(507, 406, 308, 1),
(508, 407, 301, 1),
(509, 408, 306, 1),
(510, 410, 309, 1),
(511, 411, 312, 1),
(512, 412, 313, 1),
(513, 413, 315, 1),
(514, 414, 314, 1),
(515, 415, 310, 5),
(516, 416, 303, 1),
(517, 417, 302, 1),
(518, 418, 307, 1),
(519, 419, 305, 1),
(520, 420, 301, 1);


A) DDL (CREATE, ALTER, DROP) – Q1 to Q10

1. Create employees table with emp_id as primary key.
Created

2. Create departments table with dept_id as primary key.
Created

3. Add a foreign key from employees.dept_id to departments.dept_id.
Added

4. Add a city column to employees.
Added

5. Rename column emp_name to employee_name.
ALTER TABLE employees RENAME COLUMN emp_name TO employee_name;

6. Drop column city from employees.
ALTER TABLE employees DROP city;

7. Create orders table with amount having 2 decimal points.
Created

8. Drop the products table.
DROP TABLE products;

9. Truncate the order_items table.
TRUNCATE order_items;

10. Modify salary column to BIGINT;
ALTER TABLE employees modify salary BIGINT;


B) DML (INSERT, UPDATE, DELETE) – Q11 to Q25

11. Insert 5 records into employees.
INSERT INTO employees
(emp_id, employee_name, dept_id, manager_id, salary, hire_date)
VALUES
(21, 'Ajith', 102, 1, 65000, '2021-04-12'); 
INSERT INTO employees
(emp_id, employee_name, dept_id, manager_id, salary, hire_date)
VALUES
(22, 'Bhavya', 101, 3, 58000, '2020-08-25'),
(23, 'Chetan', 103, 4, 72000, '2019-11-18'),
(24, 'Dinesh', 104, 5, 46000, '2022-02-10'),
(25, 'Ananya', 106, 10, 90000, '2023-06-05');

SELECT * FROM employees; 


12. Insert multiple records into customers.
INSERT INTO customers (customer_id, customer_name, city, signup_date) VALUES
(221, 'Raghav', 'Chennai', '2022-02-15'),
(222, 'Ishita', 'Mumbai', '2021-07-20'),
(223, 'Arjun', 'Bangalore', '2023-01-10'),
(224, 'Neelam', NULL, '2020-11-05'),
(225, 'Siddharth', 'Delhi', '2024-03-18');

13. Update salary of employees working in dept 101.

UPDATE 
14. Increase salary by 10% for all employees.

UPDATE employees
SET salary = salary * 1.10;

15. Delete employees with salary < 20000.

DELETE FROM employees
WHERE salary < 20000;

16. Update city as ‘Bangalore’ for all customers.

UPDATE customers
SET city = 'Bangalore';

17. Delete orders with status = 'Cancelled'.

DELETE FROM order_items
WHERE order_id IN (
    SELECT order_id
    FROM orders
    WHERE status = 'Cancelled'
);

DELETE FROM orders
WHERE status = 'Cancelled';

18. Insert data into orders using SELECT.

INSERT INTO orders (order_id, customer_id, order_date, amount, status)
SELECT 421, customer_id, CURRENT_DATE, 50000.00, 'Completed'
FROM customers
WHERE customer_id = 201;

19. Update department for a specific employee.

UPDATE employees
SET dept_id = 102
WHERE emp_id = 5;

20. Delete all records from order_items.
DELETE FROM order_items;


21. Insert today’s date into order_date.

INSERT INTO orders
(order_id, customer_id, order_date, amount, status)
VALUES
(422, 201, CURRENT_DATE, 25000.00, 'Completed');



22. Update NULL city values as ‘Unknown’.

UPDATE customers
SET city = 'Unknown'
WHERE city IS NULL;

23. Delete duplicate records from employees.

DELETE e1
FROM employees e1
JOIN employees e2
ON e1.employee_name = e2.employee_name
AND e1.dept_id = e2.dept_id
AND e1.hire_date = e2.hire_date
AND e1.emp_id > e2.emp_id;

24. Insert data respecting foreign key constraints.

INSERT INTO employees
(emp_id, employee_name, dept_id, manager_id, salary, hire_date, city)
VALUES
(26, 'Varun', 102, 1, 70000, '2024-01-15', 'Bangalore');

25. Roll back a delete operation (using transaction).
START TRANSACTION;

DELETE FROM employees
WHERE salary < 50000;

ROLLBACK;
