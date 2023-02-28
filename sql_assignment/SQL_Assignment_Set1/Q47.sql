/* Q.47 
Write an SQL query that reports the most experienced employees in each project. In case of a tie, 
report all employees with the maximum number of experience years. Return the result table in any order. */

CREATE TABLE employee6(
		employee_id INT,
		name VARCHAR(20),
		experience_years INT,
		PRIMARY KEY(employee_id)
	);
INSERT INTO employee6 
VALUES 
		(1,'KHALED',3),
		(2,'ALI',2),
		(3,'JOHN',3),
		(4,'DOE',2);
        
CREATE TABLE project1(
        project_id INT,
        employee_id INT,
        CONSTRAINT pk_project1 PRIMARY KEY(project_id, employee_id),
        CONSTRAINT fk_project1 FOREIGN KEY(employee_id) REFERENCES employee3(employee_id)
    );
INSERT INTO project1 
VALUES 
        (1,1),
        (1,2),
        (1,3),
        (2,1),
        (2,4);
SELECT project_id, 
       employee_id
FROM
      (
       SELECT e6.employee_id,
             p1.project_id,
             DENSE_RANK() OVER (PARTITION BY p1.project_id ORDER BY e6.experience_years DESC) AS rank_employee
       FROM employee6 e6 
       JOIN project1 p1 
	   ON p1.employee_id = e6.employee_id
       ) AS modi_employee6
WHERE rank_employee = 1 ;

