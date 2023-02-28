/*Q.46 
Write an SQL query to report the customer ids from the Customer table that bought 
all the products in the product table. Return the result table in any order. */
CREATE TABLE customer(
		customer_id INT,
		product_key INT
	);
INSERT INTO customer 
VALUES 
		(1,5),
		(2,6),
		(3,5),
		(3,6),
		(1,6);

CREATE TABLE product2(
		product_key INT,
		PRIMARY KEY(product_key)
	);
INSERT INTO product2 
VALUES 
		(5),
		(6);
-- ONE METHOD
        
SELECT customer_id 
FROM customer c
JOIN product2 p2
ON c.product_key = p2.product_key 
GROUP BY customer_id
HAVING COUNT(DISTINCT p2.product_key) = (SELECT COUNT(*) FROM product2 p2);

-- ANOTHER METHOD

SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT( DISTINCT product_key) = (SELECT COUNT(*) FROM product2);