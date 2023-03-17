/* Q.72 
Write an SQL Query to find for each month and country, the number of transactions and their total amount, 
the number of approved transactions and their total amount. Return the result table in any order. */

CREATE TABLE transactions(
        id INT,
        country VARCHAR(20),
        state ENUM ('APPROVED','DECLINED'),
        amount INT,
        trans_date DATE,
        PRIMARY KEY(id)
    );
INSERT INTO transactions 
VALUES 
        (121,'US','APPROVED',1000,'2018-12-18'),
        (122,'US','DECLINED',2000,'2018-12-19'),
        (123,'US','APPROVED',2000,'2019-01-01'),
        (124,'DE','APPROVED',2000,'2019-01-07');

WITH modi_transaction AS (SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month, 
		                        country,
								amount,
								state
								FROM transactions)
SELECT month,
		country,
        COUNT(IF (state = 'APPROVED',1, NULL)) AS approved_count,
        COUNT(*) AS trans_count,
        SUM(amount) AS trans_total_amount,
        SUM(IF (state = 'APPROVED',amount, NULL)) AS approved_total_amount
FROM modi_transaction
GROUP BY country, month