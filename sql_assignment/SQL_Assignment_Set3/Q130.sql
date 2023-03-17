/* Q.91 Write an SQL Query to report the comparison result (higher/lower/same) of the average salary of 
-- employees in a department to the companys average salary. Return the result table in any order. */

CREATE TABLE salary(
        id INT,
        employee_id INT,
        amount INT,
        paydate DATE,
        PRIMARY KEY(id)
    );
 INSERT INTO salary 
 VALUES
        (1,1,9000,'2017-03-31'),
        (2,2,6000,'2017-03-31'),
        (3,3,10000,'2017-03-31'),
        (4,1,7000,'2017-02-28'),
        (5,2,6000,'2017-02-28'),
        (6,3,8000,'2017-02-28');   

CREATE TABLE employee_dep(
        employee_id INT,
        department_id INT,
        PRIMARY KEY(employee_id)
    );
INSERT INTO employee_dep
VALUES
        (1,1),
        (2,2),
        (3,2);


	WITH avg_salary AS (SELECT s.employee_id,
								s.amount,
								ed.department_id,
								DATE_FORMAT(s.paydate,' %Y- %m') AS pay_month,
								AVG(s.amount) OVER(PARTITION BY ed.department_id, s.paydate ORDER BY s.paydate, ed.employee_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) AS avg_dep_pay,
								AVG(s.amount) OVER(PARTITION BY s.paydate ORDER BY s.paydate, ed.employee_id RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING ) AS avg_comp_pay
						FROM salary s
						JOIN employee_dep ed 
						ON s.employee_id = ed.employee_id
                        )
SELECT DISTINCT pay_month,
		department_id,
		CASE
           WHEN avg_dep_pay = avg_comp_pay THEN 'same'
           WHEN avg_dep_pay > avg_comp_pay THEN 'higher'
           ELSE 'lower'
           END AS comparison
FROM avg_salary
ORDER BY department_id


