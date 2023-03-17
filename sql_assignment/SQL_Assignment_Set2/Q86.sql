/* Q.86 Sometimes, payment transactions are repeated by accident; it could be due to user error, 
 API failure or a retry error that causes a credit card to be charged twice.
Using the transactions table, identify any payments made at the same merchant with the 
same credit card for the same amount within 10 minutes of each other. Count such repeated payments.*/


CREATE TABLE transaction_table(
        transaction_id INT,
        merchant_id INT,
        credit_card_id INT,
        amount INT,
        transaction_timestamp DATETIME
    );

INSERT INTO transaction_table 
VALUES
        (1,101,1,100,'2022-09-25 12:00:00'),
        (2,101,1,100,'2022-09-25 12:08:00'),
        (3,101,1,100,'2022-09-25 12:28:00'),
        (4,102,2,300,'2022-09-25 12:00:00'),
        (6,102,2,400,'2022-09-25 14:00:00');
        
WITH repeated_txn AS(
						SELECT 
							merchant_id,
							credit_card_id,
							amount,
							transaction_timestamp,
							count(*) OVER(PARTITION BY merchant_id,credit_card_id,amount
										  ORDER BY transaction_timestamp
										  RANGE BETWEEN INTERVAL '10' MINUTE PRECEDING AND CURRENT ROW
							             )AS repeat_count
						  FROM transaction_table) 
							
SELECT COUNT(*) as payment_count
FROM repeated_txn
WHERE repeat_count > 1 ;    