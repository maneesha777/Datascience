/* Q.44 
Write an SQL query to report the managers with at least five direct reports.
Return the result table in any order.
 */

CREATE TABLE employee1(
		id INT,
		name VARCHAR(50),
		department VARCHAR(50),
		manager_id INT,
		PRIMARY KEY(id)
	);
INSERT INTO employee1 
VALUES 
		(101,'JOHN','A',NULL),
		(102,'DAN','A',101),
		(103,'JAMES','A',101),
		(104,'AMY','A',101),
		(105,'ANNE','A',101),
		(106,'RON','B',101);
SELECT e1.name AS manager_name
FROM employee1 e1
JOIN  employee1 m 
ON e1.id = m.manager_id
GROUP BY e1.name