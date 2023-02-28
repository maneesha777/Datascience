/* Q.63 
Write an SQL Query that reports the product_name, year, and price for each sale_id in
the sales table. Return the resulting table in any order. */

CREATE TABLE sales1(
        sale_id INT,
        product_id INT,
        year INT,
        Quantity INT,
        price INT,
        CONSTRAINT pk_sales PRIMARY KEY(sale_id, year)
    );
INSERT INTO sales1 
VALUES 
        (1,100,2008,10,5000),
        (2,100,2009,12,5000),
        (7,200,2011,15,9000);

CREATE TABLE product3(
        product_id INT,
        product_name VARCHAR(20),
        PRIMARY KEY(product_id)
    );
INSERT INTO product3 
VALUES
        (100,'NOKIA'),
        (200,'APPLE'),
        (300,'SAMSUNG');
        
SELECT p3.product_name, s1.year, s1.price
FROM sales1 s1 
JOIN product3 p3 
ON p3.product_id = s1.product_id 
