/* Q.45 
Write an SQL query to report the respective department name and number of students majoring in 
each department for all departments in the department table (even ones with no current students). 
Return the result table ordered by student_number in descending order. In case of a tie, order them by dept_name alphabetically
*/
CREATE TABLE department1(
		dept_id INT,
		department_name VARCHAR(20),
		PRIMARY KEY(dept_id)
	);
INSERT INTO department1 
VALUES 
		(1,'ENGINEERING'),
		(2,'SCIENCE'),
		(3,'LAW');

CREATE TABLE student1(
		student_id INT,
		student_name VARCHAR(20),
		gender VARCHAR(6),
		dept_id INT,
		PRIMARY KEY(student_id),
		CONSTRAINT fk_depstu FOREIGN KEY(dept_id) REFERENCES department1(dept_id)
	);
INSERT INTO student1 
VALUES 
		(1,'JACK','M',1),
		(2,'JANE','F',1),
		(3,'MARK','M',2);
SELECT d1.department_name, COUNT(s1.student_id) AS student_number
FROM department1 d1
LEFT JOIN student1 s1
ON d1.dept_id = s1.dept_id
GROUP BY d1.department_names
ORDER BY student_number DESC, d1.department_name;