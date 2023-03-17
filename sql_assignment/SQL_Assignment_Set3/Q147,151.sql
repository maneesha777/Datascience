/* Q.147 
In an effort to identify high-value customers, Amazon asked for your help to obtain data about users who go on shopping sprees. 
A shopping spree occurs when a user makes purchASes on 3 or more consecutive days. 
List the user IDs who have gone on at leASt 1 shopping spree in ascending order. */

CREATE TABLE transaction_amazon(
		user_id INT,
		amount FLOAT,
		transaction_date DATETIME
	);
INSERT INTO transaction_amazon 
VALUES
		(1,9.99,'2022-08-01 10:00:00'),
		(1,55,'2022-08-17 10:00:00'),
		(2,149.5,'2022-08-05 10:00:00'),
		(2,4.89,'2022-08-06 10:00:00'),
		(2,34,'2022-08-07 10:00:00');
        
WITH t1 AS (
				SELECT user_id,
						DATE_FORMAT(transaction_date,'%Y-%m-%d')AS transaction_date,
						ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS num
				FROM transaction_amazon
			),
	t2 AS  (   
            SELECT user_id,
                    DATE_SUB(transaction_date, INTERVAL num DAY) AS difference
				FROM t1
			)
SELECT user_id
FROM t2
GROUP BY user_id
HAVING COUNT(difference) >=3        