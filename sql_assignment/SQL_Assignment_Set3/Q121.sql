/* Q.82 Write a Query to obtain the active user retention in July 2022. 
    Output the month (in numerical format 1, 2, 3) and the number of monthly active users (MAUs). */

CREATE TABLE user_actions(
        user_id INT,
        event_id INT,
        event_type ENUM('SIGN-IN','LIKE','COMMENT'),
        event_date DATETIME
    );
INSERT INTO user_actions 
VALUES
        (445,7765,'SIGN-IN','2022-05-31 12:00:00'),
        (742,6458,'SIGN-IN','2022-06-03 12:00:00'),
        (445,3634,'LIKE','2022-06-05 12:00:00'),
        (742,1374,'COMMENT','2022-06-05 12:00:00'),
        (648,3124,'LIKE','2022-06-18 12:00:00');
 
WITH cte AS (
				 SELECT *,
						DATE_FORMAT(event_date, '%m') AS months
				 FROM user_actions
				 WHERE event_type IN ('SIGN-IN','LIKE','COMMENT')
			),
     cte1 AS (
				SELECT user_id,
						months,
                        event_type,
						LAG(months)OVER(PARTITION BY user_id ORDER BY event_date) AS lag_month
                 FROM cte       
				)
     
     SELECT months,
			COUNT(user_id)OVER() AS monthly_active_users
	 FROM cte1
     WHERE event_type IN ('SIGN-IN','LIKE','COMMENT') AND (months -lag_month) =1;   