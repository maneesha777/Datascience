/* Q.21 
Write an SQL query to find the team size of each of the employees. */

CREATE TABLE employee(
employee_id INT,
team_id INT,
PRIMARY KEY (employee_id)
 );
 INSERT INTO employee(employee_id, team_id)
VALUES
(1, 8),
(2, 8),
(3, 8),
(4, 7),
(5, 9),
(6, 9);

SELECT employee_id, 
       COUNT(team_id) OVER(PARTITION BY team_id) AS team_ize
FROM employee 
ORDER BY employee_id

