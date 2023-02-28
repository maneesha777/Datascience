/* Q.104 
Write a Query that prints a list of employee names (i.e.: the name attribute) 
for employees in employee HAVING a salary greater than $2000 per month who have 
been employees for less than 10 months. Sort your result by ascending employee_id. */

-- Table is sames as input for Q79. i.e. employee4
SELECT name 
FROM employee4 
WHERE salary> 2000 AND months<10
ORDER BY employee_id
