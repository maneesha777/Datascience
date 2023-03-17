/* Q.101 
Write an SQL query to show the second most recent activity of each user.
If the user only hAS one activity, return that one. A user cannot perform more than one activity at the same time.
Return the result table in any order. */

CREATE TABLE user_activity(
		username VARCHAR(20),
		activity VARCHAR(20),
		start_date DATE,
		end_date DATE
	);
INSERT INTO user_activity 
VALUES
		('ALICE','TRAVEL','2020-02-12','2020-02-20'),
		('ALICE','DANCING','2020-02-21','2020-02-23'),
		('ALICE','TRAVEL','2020-02-24','2020-02-28'),
		('BOB','TRAVEL','2020-02-11','2020-02-18'); 
SELECT username,
		activity,
        start_date,
        end_date
FROM ( SELECT *,
			DENSE_RANK() OVER(PARTITION BY username ORDER BY start_date DESC) AS rnk,
            COUNT(username) OVER(PARTITION BY username )   AS count_activity
		FROM user_activity) u
WHERE (IF(count_activity > 1,rnk = 2, rnk =1))

