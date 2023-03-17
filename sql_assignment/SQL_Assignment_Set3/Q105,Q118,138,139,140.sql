/* Q.105 
Write a Query identifying the type of each record in the TRIANGLES table using its three side lengths. */


CREATE TABLE triangle1(
		a INT,
		b INT,
		c INT
	);
INSERT INTO triangle1 
VALUES
		(20,20,23),
		(20,20,20),
		(20,21,22),
		(13,14,30);
        
SELECT *,
      CASE
        WHEN a=b AND b=c THEN 'Equilateral'
        WHEN a=b OR a=c OR b=c THEN 'Isosceles'
        WHEN a!=b AND b!=c AND (a+b>c AND b+c>a AND c+a>a) THEN 'Scalene'
        ELSE 'Not A Triangle' 
        END AS Type_of_Triangle 
FROM triangle1 
