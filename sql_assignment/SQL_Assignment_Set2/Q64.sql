/*  Q.64 
Write an SQL Query that reports the average experience years of all the employees for each project, 
rounded to 2 digits. Return the result table in any order. */

CREATE TABLE employee3(
        employee_id INT,
        name VARCHAR(20),
        experience_years INT,
        PRIMARY KEY(employee_id)
        );
INSERT INTO employee3 
VALUES 
        (1,'KHALED',3),
        (2,'ALI',2),
        (3,'JOHN',1),
        (4,'DOE',2);

CREATE TABLE project(
        project_id INT,
        employee_id INT,
        CONSTRAINT pk_project PRIMARY KEY(project_id, employee_id),
        CONSTRAINT fk_project FOREIGN KEY(employee_id) REFERENCES employee3(employee_id)
    );
INSERT INTO project 
VALUES 
        (1,1),
        (1,2),
        (1,3),
        (2,1),
        (2,4);
	

SELECT p.project_id, ROUND(SUM(e3.experience_years )/COUNT(e3.experience_years),2) AS Average_years
FROM employee3 e3 
JOIN project p 
ON e3.employee_id = p.employee_id
GROUP BY p.project_id;

-- Another Method
SELECT p.project_id, ROUND(AVG(e3.experience_years ),2) AS Average_years
FROM employee3 e3 
JOIN project p 
ON e3.employee_id = p.employee_id
GROUP BY p.project_id;
