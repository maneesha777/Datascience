/* Q.43 
Write an SQL query to report the fraction of players that logged in again on the day after the day 
they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players 
that logged in for at least two consecutive days starting from their first login date, 
then divide that number by the total number of players. */


 WITH modi_activity AS (
                          SELECT player_id,
                                 LEAD(event_date) OVER (PARTITION BY player_id ORDER BY event_date) - event_date AS diff_event_date
				          FROM activity
						),
	 modi_activity1 AS (
                         SELECT COUNT(DISTINCT player_id) AS player_count
                         FROM modi_activity
                         WHERE diff_event_date =1
                         GROUP BY player_id
                         )
   SELECT 
		ROUND(COUNT(*) / (SELECT COUNT(DISTINCT player_id) FROM activity), 2) AS fraction
FROM 
		modi_activity1;              