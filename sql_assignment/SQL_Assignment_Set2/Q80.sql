/* Q.80 
Write a Query to obtain the year-on-year growth rate for the total spend of each product for each year. */

CREATE TABLE user_transactions(
        transaction_id INT,
        product_id INT,
        spend FLOAT,
        transaction_date DATETIME
    );
INSERT INTO user_transactions 
VALUES
        (1341,123424,1500.60,'2019-12-31 12:00:00'),
        (1423,123424,1000.20,'2020-12-31 12:00:00'),
        (1623,123424,1246.44,'2021-12-31 12:00:00'),
        (1322,123424,2145.32,'2022-12-31 12:00:00');

SELECT EXTRACT(YEAR FROM transaction_date ) AS year,
		product_id,
        spend AS curr_year_spend,
		pre_year_spend,
        IFNULL(ROUND(diff_spend * 100 / pre_year_spend,2),0) AS yoy_rate  
 FROM (
		SELECT *,
				LAG(spend,1,0) OVER(PARTITION BY product_id) AS pre_year_spend,
				(spend - LAG(spend) OVER(PARTITION BY product_id)) AS  diff_spend 
        FROM user_transactions
	   ) t1