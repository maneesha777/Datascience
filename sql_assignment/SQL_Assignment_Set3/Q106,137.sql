/* Q.106 
Write a query calculating the amount of error (i.e.: actual - miscalculated average monthly salaries), 
and round it up to the next integer. */
CREATE TABLE employee5(
		id INT,
		name VARCHAR(20),
		salary INT
	);
INSERT INTO employee5 
VALUES
		(1,'KRISTEEN',1420),
		(2,'ASHLEY',2006),
		(3,'JULIA',2210),
		(4,'MARIA',3000);
SELECT CEIL(AVG(salary)- AVG(REPLACE(salary, '0', ''))) AS Error
FROM employee5