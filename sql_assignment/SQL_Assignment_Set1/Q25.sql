/* Q.25 
Write an SQL query to report the device that is first logged in for each player. 
Return the result table in any order. */
SELECT a1.player_id,
       a1.device_id
FROM (
		SELECT player_id,
				device_id,
				ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rnk
		FROM activity1) AS a1
WHERE rnk =1
