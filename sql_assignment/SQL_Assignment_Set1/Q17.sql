/* Q17. Write an SQL query that reports the products that were only sold in the first quarter of 2019. That is,
between 2019-01-01 and 2019-03-31 inclusive.
Return the result table in any order.
Explanation:
The product with id 1 was only sold in the spring of 2019.
The product with id 2 was sold in the spring of 2019 but was also sold after the spring of 2019.
The product with id 3 was sold after spring 2019.
We return only product 1 as it is the product that was only sold in the spring of 2019
*/

CREATE TABLE Product_table (
product_id INT,
product_name VARCHAR(50),
unit_price INT,
PRIMARY KEY(product_id)
);
INSERT INTO Product_table(product_id, product_name, unit_price)
VALUES 
(1, 'S8', 1000),
(2, 'G4', 800),
(3, 'iPhone', 1400);



CREATE TABLE Sales_table (
seller_id INT,
product_id INT,
buyer_id INT,
sale_date DATE,
quantity INT, 
price INT,
CONSTRAINT fk_productsales FOREIGN KEY(product_id) REFERENCES Product_table(product_id)
);
INSERT INTO Sales_table(seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES 
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 2, 3, '2019-06-02', 1, 800),
(3, 3, 4, '2019-05-13', 2, 2800);


SELECT p.product_id, p.product_name
FROM product_table p
LEFT JOIN sales_table s
ON p.product_id = s.product_id
GROUP BY p.product_id
HAVING MIN(sale_date) >= '2019-01-01' AND MAX(sale_date) <= '2019-03-31';
    



