/* Q.149 
Write a query to obtain the list of customers whose first transaction was valued at $50 or more.
Output the number of users. */

CREATE TABLE user_transactions1(
		transaction_id INT,
		user_id INT,
		spend FLOAT,
		transaction_date TIMESTAMP
	);
INSERT INTO user_transactions1 
VALUES
		(759274,111,49.50,'2022-02-03 00:00:00'),
		(850371,111,51.00,'2022-03-15 00:00:00'),
		(615348,145,36.30,'2022-03-22 00:00:00'),
		(137424,156,151.00,'2022-04-04 00:00:00'),
		(248475,156,87.00,'2022-04-16 00:00:00');

SELECT COUNT(*) AS users
FROM (
		SELECT *,
				DENSE_RANK()OVER(PARTITION BY user_id ORDER BY transaction_date ) as rnk
		FROM user_transactions1
		) a
WHERE rnk =1 AND spend > 50
