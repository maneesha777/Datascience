/* Q.79 Q.116
Write a Query that prints a list of employee names (i.e.: the name attribute) 
from the employee table in alphabetical order. */

CREATE TABLE employee4(
        employee_id INT,
        name VARCHAR(20),
        months INT,
        salary INT
    );
INSERT INTO employee4 
VALUES
        (12228,'ROSE',15,1968),
        (33645,'ANGELA',1,3443),
        (45692,'FRANK',17,1608),
        (56118,'PATRIK',7,1345),
        (59725, 'LISA', 11, 2330),
        (74197,'KINBERLY',16,4372),
        (78454,'BONNIE',8,1771),
        (83565,'MICHAEL',6,2017),
        (98607,'TODD',5,3396),
        (99989,'JOE',9,3573);
	
    SELECT name 
    FROM employee4
    ORDER BY name;
    