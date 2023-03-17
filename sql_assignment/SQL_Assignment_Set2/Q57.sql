/* Q.57 
Write an SQL Query to find the customer_number for the customer who has placed the largest number of orders. */

CREATE TABLE order4(
        order_number INT,
        customer_number INT,
        PRIMARY KEY(order_number)
    );
INSERT INTO order4 
VALUES
        (1,1),
        (2,2),
        (3,3),
        (4,3);

SELECT customer_number
FROM (
		SELECT DISTINCT customer_number,
				COUNT(order_number) OVER(PARTITION BY customer_number) AS total_orders
		FROM order4
	) AS o4
ORDER BY total_orders DESC
LIMIT 1