/* Q.77 
Write an SQL Query to evaluate the boolean expressions in Expressions table. 
Return the result table in any order. */

CREATE TABLE variables1(
        name VARCHAR(2),
        value INT,
        PRIMARY KEY(name)
    );
INSERT INTO variables1 
VALUES    
        ('x',66),
        ('y',77);
       
CREATE TABLE expressions(
        left_operand VARCHAR(2),
        operator ENUM('<','=','>'),
        right_operand VARCHAR(2),
        CONSTRAINT pk_expressions PRIMARY KEY(left_operand, operator, right_operand)
    );
INSERT INTO expressions 
VALUES    
        ('x','>','y'),
        ('x','<','y'),
        ('x','=','y'),
        ('y','>','x'),
        ('y','<','x'),
        ('x','=','x');

SELECT e.left_operand,
		e.operator,
		e.right_operand,
        CASE
			WHEN e.operator = '>' THEN (IF (lt.value > rt.value, 'TRUE', 'FALSE'))
            WHEN e.operator = '<' THEN (IF (lt.value < rt.value, 'TRUE', 'FALSE'))
            WHEN e.operator = '=' THEN (IF (lt.value = rt.value, 'TRUE', 'FALSE'))
            ELSE 0
            END AS VALUE
FROM expressions e 
JOIN variables1 lt
ON 	e.left_operand = lt.name 
JOIN variables1 rt
ON e.right_operand = rt.name;