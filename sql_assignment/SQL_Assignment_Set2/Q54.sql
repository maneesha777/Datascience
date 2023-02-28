/* Q.54 
Write an SQL Query to find the team size of each of the employees. 
Return result table in any order. */

CREATE TABLE employee2(
        employee_id INT,
        team_id INT,
        PRIMARY KEY(employee_id)
    );
INSERT INTO employee2 
VALUES 
        (1,8),
        (2,8),
        (3,8),
        (4,7),
        (5,9),
        (6,9);
SELECT employee_id, 
       COUNT(team_id) OVER (PARTITION BY team_id) AS team_size
FROM employee2
ORDER BY employee_id 
