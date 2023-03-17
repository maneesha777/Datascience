/* Q.71 
Write an SQL Query to find employee_id of all employees that directly or indirectly 
report their work to the head of the company. The indirect relation between managers will not exceed 
three managers as the company is small. Return the result table in any order. */
CREATE TABLE employee_manager(
        employee_id INT,
        employee_name VARCHAR(20),
        manager_id INT,
        PRIMARY KEY(employee_id)
    );
INSERT INTO employee_manager 
VALUES    
        (1,'BOSS',1),
        (3,'ALICE',3),
        (2,'BOB',1),
        (4,'DANIEL',2),
        (7,'LUIS',4),
        (8,'JHON',3),
        (9,'ANGELA',8),
        (77,'ROBERT',1);


WITH RECURSIVE report_head AS(
									SELECT employee_id, 
											manager_id,
                                             0 AS lvl
									FROM employee_manager 
									WHERE employee_id = 1
											
									UNION 

									SELECT e.employee_id, 
											e.manager_id,
                                             r.lvl + 1 AS lvl
									FROM report_head r
									JOIN  employee_manager e
								    ON  r.employee_id = e.manager_id
                                    WHERE e.employee_id != 1
								)
 SELECT employee_id
FROM report_head 
WHERE lvl < 4 AND employee_id != 1;