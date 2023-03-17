/* Q.76 
Write an SQL Query to find the salaries of the employees after applying taxes. 
Round the salary to the nearest integer. */

CREATE TABLE salaries(
        company_id INT,
        employee_id INT,
        employee_name VARCHAR(20),
        salary INT,
        CONSTRAINT pk_salaries PRIMARY KEY(company_id, employee_id)
    );
INSERT INTO salaries 
VALUES    
        (1,1,'TONY',2000),
        (1,2,'PRONUB',21300),
        (1,3,'TYRROX',10800),
        (2,1,'PAM',300),
        (2,7,'BASSEM',450),
        (2,9,'HERMIONE',700),
        (3,7,'BOCABEN',100),
        (3,2,'OGNJEN',2200),
        (3,13,'NYAN CAT',3300),
        (3,15,'MORNING CAT',7777);
SELECT company_id,
		employee_id,
        employee_name,
        ROUND(CASE
            WHEN max_company_salary BETWEEN 1000 AND 10000 THEN (salary - salary*24/100)
            WHEN max_company_salary > 10000 THEN (salary - salary*49/100)
            ELSE salary
            END,0)  AS salary
FROM (
		SELECT *,
			  MAX(salary) OVER(PARTITION BY company_id) AS max_company_salary
		FROM salaries
	) m
