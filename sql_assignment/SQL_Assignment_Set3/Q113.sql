/* Q.113
Write a query to print the pattern P(20). 
*
* *
* * *
* * * *
* * * * *
*/

WITH RECURSIVE pattern AS (
							SELECT 1 AS n
							UNION 
                            SELECT n+1
							FROM pattern
                            WHERE n<20
						  ) 
SELECT REPEAT('* ', n) AS pattern
FROM pattern
                            