/*
Q26.
Table: Products
Column Name Type
product_id int
product_name varchar
product_category varchar

product_id is the primary key for this table.
This table contains data about the company's products.

Table: Orders
Column Name Type
product_id int
order_date date
unit int
There is no primary key for this table. It may have duplicate rows.
product_id is a foreign key to the Products table.
unit is the number of products ordered in order_date.

Write an SQL query to get the names of products that have at least 100 units ordered in February 2020
and their amount.
Return result table in any order */

CREATE TABLE products(
product_id INT,
product_name VARCHAR(100),
product_category VARCHAR(100),
PRIMARY KEY(product_id)
);
INSERT INTO products(product_id, product_name, product_category)
VALUES 
        (1,'LEETCODE SOLUTIONS','BOOK'),
        (2,'JEWELS OF STRINGOLOGY','BOOK'),
        (3,'HP','LAPTOP'),
        (4,'LENOVO','LAPTOP'),
        (5,'LEETCODE KIT','T-SHIRT');

CREATE TABLE orders(
product_id INT,
order_date DATE,
unit INT,
CONSTRAINT fk_productorders FOREIGN KEY(product_id) REFERENCES Products(product_id)
);
INSERT INTO orders(product_id, order_date, unit)
VALUES
        (1,'2020-02-05',60),
        (1,'2020-02-05',70),
        (2,'2020-01-05',30),
        (2,'2020-02-05',80),
        (3,'2020-02-05',2),
        (3,'2020-02-05',3),
        (4,'2020-03-05',20),
        (4,'2020-03-05',30),
        (4,'2020-03-05',60),
        (5,'2020-02-05',50),
        (5,'2020-02-05',50),
        (5,'2020-03-05',50);
SELECT p.product_name, SUM(o.unit) AS total_unit
FROM products p 
JOIN orders o
on p.product_id = o.product_id
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-28'
GROUP BY p.product_id
HAVING SUM(o.unit) >= 100;





