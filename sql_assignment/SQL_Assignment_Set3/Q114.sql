/* Q.114
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* * * * *
* * * *
* * *
* *
*
Write a query to print the pattern P(20).*/ 

WITH RECURSIVE pattern AS (
							SELECT 20 AS n
							UNION 
                            SELECT n-1
							FROM pattern
                            WHERE n>1
						  ) 
SELECT REPEAT('* ', n) AS pattern
FROM pattern
                            