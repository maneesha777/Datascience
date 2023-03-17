/* Q.83 Write a Query to report the median of searches made by a user. 
    Round the median to one decimal point. */

CREATE TABLE search_frequency(
        searches INT,
        num_users INT
    );
INSERT INTO search_frequency 
VALUES
        (1,2),
        (2,2),
        (3,3),
        (4,1);
        
 WITH RECURSIVE cte AS(
						SELECT searches,
								num_users, 1 AS cnt
						FROM search_frequency
                        UNION ALL
                        SELECT searches,
								num_users,
								(cnt+1) AS cnt
						FROM cte
                        WHERE cnt < num_users
					),
modi_cte AS (
				SELECT *,
					   COUNT(*) OVER() AS total_count,
					   ROW_NUMBER() OVER() AS row_num
				FROM cte
				ORDER BY searches
			)

SELECT ROUND(AVG(searches),1) AS median
FROM modi_cte
WHERE row_num BETWEEN CEIL(total_count / 2) AND FLOOR((total_count / 2 )+1)  
