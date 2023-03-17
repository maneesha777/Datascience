/* Q.67 
Write an SQL Query to compute the moving average of how much the customer paid in a seven days window 
(i.e., current day + 6 days before). average_amount should be rounded to two decimal places. 
Return result table ordered by visited_on in ascending order. */

CREATE TABLE customer4(
	customer_id INT,
	name VARCHAR(20),
	visited_on DATE,
	amount INT,
	CONSTRAINT pk_customer4 PRIMARY KEY(customer_id,visited_on)
	);
INSERT INTO customer4 
VALUES 
	(1,'JOHN','2019-01-01',100),
	(2,'DANIEL','2019-01-02',110),
	(3,'JADE','2019-01-03',120),
	(4,'KHALED','2019-01-04',130),
	(5,'WINSTON','2019-01-05',110),
	(6,'ELVIS','2019-01-06',140),
	(7,'ANNA','2019-01-07',150),
	(8,'MARIA','2019-01-08',80),
	(9,'JAZE','2019-01-09',110),
	(1,'JOHN','2019-01-10',130),
	(3,'JADE','2019-01-10',150);

WITH daily_sales AS(
					 SELECT  visited_on,
							sum(amount) AS daily_sales_amount
					 FROM customer4
					 GROUP BY visited_on
                     ORDER BY visited_on
                     )
SELECT visited_on,
		daily_amount,
        average_amount
FROM (
		SELECT visited_on,
				LAG(visited_on, 6) OVER(ORDER BY visited_on) AS visited_on_preceding,
				SUM(daily_sales_amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL '6' day PRECEDING AND CURRENT ROW) AS daily_amount, 
				ROUND(AVG(daily_sales_amount) OVER(ORDER BY visited_on RANGE BETWEEN INTERVAL '6' day PRECEDING AND CURRENT ROW), 2) AS average_amount
				FROM daily_sales
	  ) d1
WHERE visited_on_preceding IS NOT NULL 




