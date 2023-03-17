/* Q.159 
Facebook is analysing its user signup data for June 2022. 
Write a query to generate the churn rate by week in June 2022. 
Output the week number (1, 2, 3, 4, ...) and the corresponding churn rate rounded to 2 decimal places. */

CREATE TABLE users_facebook(
		user_id INT,
		signup_date DATETIME,
		last_login DATETIME
	);
INSERT INTO users_facebook 
VALUES
		(1001,'2022-06-01 12:00:00','2022-07-05 12:00:00'),
		(1002,'2022-06-03 12:00:00','2022-06-15 12:00:00'),
		(1004,'2022-06-02 12:00:00','2022-06-15 12:00:00'),
		(1006,'2022-06-15 12:00:00','2022-06-27 12:00:00'),
		(1012,'2022-06-16 12:00:00','2022-07-22 12:00:00');
        
WITH fb_signup AS (
					SELECT *,
							CASE
								WHEN DATEDIFF(last_login, signup_date) < 28 THEN 'YES' ELSE 'NO' END AS churn,
							CASE
								WHEN signup_date BETWEEN '2022-05-30' AND '2022-06-05' THEN 1
								WHEN signup_date BETWEEN '2022-06-06' AND '2022-06-12' THEN 2
								ELSE 3
								END AS signup_week            
					FROM users_facebook
				   )
SELECT signup_week,
		ROUND(COUNT(CASE
						WHEN churn = 'yes'THEN user_id END)*100.00/COUNT(*), 2) AS churn_rate
FROM fb_signup
GROUP BY signup_week