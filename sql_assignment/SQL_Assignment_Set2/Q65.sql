/* Q.65 
Write an SQL Query that reports the best seller by total sales price, If there is a tie, 
report them all. Return the result table in any order. */

WITH s1 AS  (SELECT DISTINCT seller_id,
							SUM(price) OVER(PARTITION BY seller_id) AS total_price
		    FROM sales_table
	       ) 
SELECT seller_id
FROM s1
WHERE total_price = (
						SELECT MAX(total_price)
                        FROM s1
					);