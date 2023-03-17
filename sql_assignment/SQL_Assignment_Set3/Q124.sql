/* Q.85 Write a SQL Query that calculates the total time that the fleet of 
   servers was running. The output should be in units of full days. */

CREATE TABLE server_utilization(
        server_id INT,
        session_status VARCHAR(20),
        status_time TIMESTAMP
    );

INSERT INTO server_utilization 
VALUES
        (1,'start','2022-08-02 10:00:00'),
        (1,'stop','2022-08-04 10:00:00'),
        (2,'start','2022-08-17 10:00:00'),
        (2,'stop','2022-08-24 10:00:00');
 
 
WITH up_time AS( 
					SELECT *,
								TIMESTAMPDIFF(DAY, status_time,end_time ) AS days
						FROM (
								SELECT *,
										LEAD(status_time)OVER(PARTITION BY server_id ORDER BY status_time) AS end_time
								FROM server_utilization
							)b
						
				)
SELECT
		SUM(days) AS total_uptime_days
FROM up_time