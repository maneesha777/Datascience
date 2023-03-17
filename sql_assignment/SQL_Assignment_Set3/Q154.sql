/* Q.154 
Write a query that shows the following data for each compensation outlier: 
employee ID, salary, and whether they are potentially overpaid or potentially underpaid */

CREATE TABLE employee_pay(
		employee_id INT,
		salary INT,
		title VARCHAR(20)
	);
INSERT INTO employee_pay 
VALUES
		(101,80000,'DATA ANALYST'),
		(102,90000,'DATA ANALYST'),
		(103,100000,'DATA ANALYST'),
		(104,30000,'DATA ANALYST'),
		(105,120000,'DATA SCIENTIST'),
		(106,100000,'DATA SCIENTIST'),
		(107,80000,'DATA SCIENTIST'),
		(108,310000,'DATA SCIENTIST');
        
WITH pay_cte AS (
					SELECT employee_id,
							salary,
							CASE
								WHEN salary > 2*avg_salary THEN 'OVER PAID'
								WHEN salary < avg_salary/2 THEN 'UNDER PAID'
								END AS status
					FROM (
							SELECT *,
									AVG(salary)OVER(PARTITION BY title) AS avg_salary
							FROM employee_pay )e
				)
SELECT employee_id,
		salary,
		status	
FROM pay_cte
WHERE status IS NOT NULL