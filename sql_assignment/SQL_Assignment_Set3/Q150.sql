/* Q.150 
Write a query to obtain the SUM of the odd-numbered and even-numbered meASurements on a particular day, 
in two different columns. */

CREATE TABLE measurments(
		measurment_id INT,
		measurment_value FLOAT,
		measurment_time DATETIME
	);
INSERT INTO measurments 
VALUES
		(131233,1109.51,'2022-07-10 09:00:00'),
		(135211,1662.74,'2022-07-10 11:00:00'),
		(523542,1246.24,'2022-07-10 13:15:00'),
		(143562,1124.50,'2022-07-11 15:00:00'),
		(346462,1234.14,'2022-07-11 16:45:00');
        
WITH daily_cte AS(        
					SELECT *,
							DATE_FORMAT(measurment_time, '%Y-%m-%d 00:00:00') AS measurment_day,
							ROW_NUMBER() OVER(PARTITION BY DATE_FORMAT(measurment_time, '%Y-%m-%d 00:00:00')) AS rn
					FROM measurments
				)
SELECT measurment_day,
		ROUND(SUM(CASE WHEN MOD(rn,2) !=0 THEN measurment_value END), 2) AS odd_sum,
        ROUND(SUM(CASE WHEN MOD(rn,2) =0 THEN measurment_value END), 2) AS even_sum
FROM daily_cte
GROUP BY measurment_day