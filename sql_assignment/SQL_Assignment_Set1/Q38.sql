/* Q.38 
Write an SQL query to find the id and the name of all students who are enrolled 
in departments that no longer exist. Return the result table in any order.*/
CREATE TABLE departments(
		id INT,
		name VARCHAR(50),
		PRIMARY KEY(id)
	);
INSERT INTO departments 
VALUES
		(1,'ELECTRICAL ENGINEERING'),
		(7,'COMPUTER ENGINEERING'),
		(13,'BUSINESS ADMINISTRATION');

CREATE TABLE students(
		id INT,
		name VARCHAR(50),
		department_id INT,
		PRIMARY KEY(id)
	);
INSERT INTO students 
VALUES
		(23,'ALICE',1),
		(1,'BOB',7),
		(5,'JENNIFER',13),
		(2,'JOHN',14),
		(4,'JASMINE',77),
		(3,'STEVE',74),
		(6,'LUIS',1),
		(8,'JONATHON',7),
		(7,'DAIANA',33),
		(11,'MADELYNN',1);

SELECT s.id, s.name
FROM departments d 
RIGHT OUTER JOIN students s 
ON d.id = s.department_id 
WHERE d.id IS NULL;

-- Another method
SELECT id, name
FROM students
WHERE department_id 
NOT IN(
      SELECT id
      FROM departments
      );
                 













