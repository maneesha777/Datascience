/*
Q32.
Table: Employees
Column Name Type
id int
name varchar
id is the primary key for this table.
Each row of this table contains the id and the name of an employee in a company.

Table: EmployeeUNI
Column Name Type
id int
unique_id int
(id, unique_id) is the primary key for this table.
Each row of this table contains the id and the corresponding unique id of an employee in the company.

Write an SQL query to show the unique ID of each user, If a user does not have a unique ID replace just
show null.
Return the result table in any order. */

CREATE TABLE IF NOT EXISTS employees
(
    id INT,
    name VARCHAR(50),
    PRIMARY KEY (id)
);

INSERT INTO employees 
VALUES 
      (1,'Alice'),
      (7,'Bob'),
      (11,'Meir'),
      (90,'Winston'),
      (3,'Jonathan');

CREATE TABLE IF NOT EXISTS employeeUNI
(
    id INT,
    unique_id INT,
    constraint pk_uni PRIMARY KEY (id, unique_id)
);
INSERT INTO employeeUNI 
VALUES 
      (3,1),
      (11,2),
      (90,3);

SELECT  eu.unique_id, e.name
FROM employees e 
LEFT JOIN employeeuni eu 
ON e.id = eu.id
ORDER BY unique_id
