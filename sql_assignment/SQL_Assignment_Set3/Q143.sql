/* Q.143 
Write a query to output all such symmetric pairs in ascending order by the value of X. 
List the rows such that X1 ≤ Y1.*/

CREATE TABLE functions(
		x INT,
		y INT
	);
INSERT INTO functions 
VALUES
		(20,20),
		(20,20),
		(20,21),
		(23,22),
		(22,23),
		(21,20);

WITH serial_number AS(
						SELECT *,
								ROW_NUMBER()OVER(ORDER BY x, y) AS n
						FROM functions
					)
SELECT DISTINCT s1.x,
       s1.y
FROM serial_number s1
JOIN serial_number s2
ON  s1.x = s2.y 
AND s1.y = s2.x 

WHERE s1.x <= s1.y AND s1.n != s2.n