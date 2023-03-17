/* Q.112 
Write a query to print all prime numbers less than or equal to 1000. 
Print your result on a single line, and use the ampersand () character as your separator (instead of a space).*/

WITH RECURSIVE numbers AS (
						SELECT 1 AS n
                        UNION
                        SELECT  n +1
                        FROM numbers
                        WHERE n<1000
					),
                    
	prime_number AS (
						SELECT n1.n AS num
						FROM numbers n1
						JOIN numbers n2
						ON MOD(n1.n, n2.n) = 0
						GROUP BY n1.n
						HAVING COUNT(n1.n) = 2
                    )

SELECT  GROUP_CONCAT(num ORDER BY num SEPARATOR '&') AS prime_numbers
FROM prime_number                 