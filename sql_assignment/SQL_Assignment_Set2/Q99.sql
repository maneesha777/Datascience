/* Q.99 Write a query to obtain a breakdown of the time spent sending vs. opening snaps 
-- (as a percentage of total time spent on these activities) for each age group. */

CREATE TABLE activities(
	activity_id INT,
	user_id INT,
	activity_type ENUM('SEND','OPEN','CHAT'),
	time_spent FLOAT,
	activity_date DATETIME
	);
INSERT INTO activities 
VALUES
	(7274,123,'OPEN',4.50,'2022-06-22 12:00:00'),
	(2425,123,'SEND',3.50,'2022-06-22 12:00:00'),
	(1413,456,'SEND',5.67,'2022-06-23 12:00:00'),
	(1414,789,'CHAT',11.00,'2022-06-25 12:00:00'),
	(2536,456,'OPEN',3.00,'2022-06-25 12:00:00');

CREATE TABLE age_breakdown(
        user_id INT,
        age_bucket ENUM('21-25','26-30','31-35')
	);
INSERT INTO age_breakdown 
VALUES
        (123,'31-35'),
        (456,'26-30'),
        (789,'21-25');
  
WITH modi_activity AS (
							SELECT user_id, 
								activity_type,
								ROUND(SUM(time_spent),2) AS time_spent,
								IF (activity_type = 'SEND', SUM(time_spent), 0) AS send_sum,
								IF (activity_type = 'OPEN',SUM(time_spent) ,0) AS open_sum
							FROM activities  
							WHERE activity_type IN ('OPEN','SEND') 
							GROUP BY activity_type,user_id
						)
  
  SELECT ab.age_bucket,
		ROUND(SUM(ma.send_sum)*100/SUM(ma.time_spent),2) AS send_per,
		ROUND(SUM(ma.open_sum)*100 /SUM(ma.time_spent),2) AS open_per
  FROM modi_activity ma 
  JOIN age_breakdown ab
  ON ma.user_id = ab.user_id
  GROUP BY ab.age_bucket
  ORDER BY ab.age_bucket