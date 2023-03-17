/* Q.157 
Say you have access to all the transactions for a given merchant acCOUNT. 
Write a query to print the cumulative balance of the merchant acCOUNT at the END of each day, 
WITH the total balance reset back to zero at the END of the month. 
Output the transaction date and cumulative balance.*/


CREATE TABLE transactions_merchant(
		transaction_id INT,
		type ENUM('DEPOSIT','WITHDRAWL'),
		amount FLOAT,
		transaction_date DATETIME
	);
INSERT INTO transactions_merchant 
VALUES
		(19153,'DEPOSIT',65.90,'2022-07-10 10:00:00'),
		(53151,'DEPOSIT',178.55,'2022-07-08 10:00:00'),
		(29776,'WITHDRAWL',25.90,'2022-07-08 10:00:00'),
		(16461,'WITHDRAWL',45.99,'2022-07-08 10:00:00'),
		(77134,'DEPOSIT',32.60,'2022-07-10 10:00:00');
        
SELECT DISTINCT(transaction_date),
		ROUND(SUM(CASE
			WHEN type ='DEPOSIT' THEN amount 
            ELSE -amount 
            END ) OVER(PARTITION BY transaction_date ORDER BY transaction_date), 2) AS balance
FROM transactions_merchant