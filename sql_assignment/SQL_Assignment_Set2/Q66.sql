/* Q.66 
Write an SQL Query that reports the buyers who have bought S8 but not iphone. Note that S8 and iphone 
are products present in the product table. Return the result table in any order. */
 
-- Same input table as for previous question i.e. 65 and Q17. 

CREATE TABLE Sales_table1 (
seller_id INT,
product_id INT,
buyer_id INT,
sale_date DATE,
quantity INT, 
price INT,
CONSTRAINT fk_product FOREIGN KEY(product_id) REFERENCES product_table(product_id)
);
INSERT INTO Sales_table1(seller_id, product_id, buyer_id, sale_date, quantity, price)
VALUES 
(1, 1, 1, '2019-01-21', 2, 2000),
(1, 2, 2, '2019-02-17', 1, 800),
(2, 1, 3, '2019-06-02', 1, 800),
(3, 3, 3, '2019-05-13', 2, 2800);

SELECT st1.buyer_id
FROM product_table pt
JOIN sales_table1 st1 
ON st1.product_id = pt.product_id
WHERE pt.product_name = 'S8' AND st1.buyer_id NOT IN 
                             ( SELECT st1.buyer_id
                             FROM product_table pt
                             JOIN sales_table1 st1 
                             ON st1.product_id = pt.product_id
                             WHERE pt.product_name = 'IPHONE');
