/*  Q.158 
Assume you are given the table below containing information on 
Amazon customers and their spend on products belonging to various categories. 
Identify the top two highest-grossing products within each category in 2022. 
Output the category, product, and total spend. */

CREATE TABLE product_spend(
		category VARCHAR(20),
		product VARCHAR(20),
		user_id INT,
		spend FLOAT,
		transaction_date DATETIME
	);
INSERT INTO product_spend 
VALUES
		('APPLIANCE','REFRIGERATOR',165,246.00,'2021-12-26 12:00:00'),
		('APPLIANCE','REFRIGERATOR',123,299.99,'2022-03-02 12:00:00'),
		('APPLIANCE','WASHING MACHINE',123,219.80,'2022-03-02 12:00:00'),
		('ELECTRONICS','VACUUM',178,152.00,'2022-04-05 12:00:00'),
		('ELECTRONICS','WIRELESS HEADSET',156,249.90,'2022-07-08 12:00:00'),
		('ELECTRONICS','VACUUM',145,189.00,'2022-07-15 12:00:00');
SELECT category,
		product,
        total_spend
FROM ( 
		SELECT category,
				product,
				ROUND(SUM(spend),2) AS total_spend,
				DENSE_RANK() OVER(PARTITION BY category ORDER BY SUM(spend)  DESC) AS rnk
		FROM product_spend
        WHERE DATE_FORMAT(transaction_date,'%Y') = 2022
        GROUP BY category,
				product
	) a
WHERE rnk<=2
