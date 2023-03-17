/* Q.69 
Write an SQL Query to find the start and end number of continuous ranges in the table logs. 
Return the result table ordered by start_id. */

CREATE TABLE logs(
        log_id INT,
        PRIMARY KEY(log_id)
    );
INSERT INTO logs 
VALUES
        (1),
        (2),
        (3),
        (7),
        (8),
        (10);

WITH modi_logs AS (
					SELECT log_id,
							ROW_NUMBER() OVER() as row_num
					FROM logs
                    )
SELECT MIN(log_id) AS start_id,
		MAX(log_id) AS end_id
FROM (
		SELECT log_id, 
				(log_id - row_num)  AS diff
		FROM modi_logs
        ) l1
GROUP BY diff;
 
 
 