/* Q.90 Write an SQL Query to report the median of all the numbers in the database 
-- after decompressing the numbers table. Round the median to one decimal point.*/

CREATE TABLE numbers(
        num INT,
        frequency INT,
        PRIMARY KEY(num)
    );
INSERT INTO numbers 
VALUES  
        (0,7),
        (1,1),
        (2,3),
        (3,1);
        
 
WITH RECURSIVE cte AS ( SELECT num,
							   frequency,1 AS cnt
						FROM numbers
                        UNION ALL
                        SELECT num,
							   frequency,
                               (cnt + 1) AS cnt
						FROM cte
                        WHERE cnt < frequency
					  ),
modi_cte AS (SELECT *,
	   COUNT(*) OVER() AS total_count,
       ROW_NUMBER() OVER() AS row_num
FROM cte
ORDER BY num)

SELECT ROUND(AVG(num),1) AS median
FROM modi_cte
WHERE row_num BETWEEN CEIL(total_count / 2) AND FLOOR((total_count / 2 )+1) 
