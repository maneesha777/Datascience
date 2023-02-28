/* Q.107 
Write a query to find the maximum total earnings for all employees as
well as the total number of employees who have maximum total earnings. 
Then print these values as 2 space-separated integers. */

-- The input table is same as Q79.
SELECT  CONCAT(MAX(salary * months), ' ', COUNT(*)) AS 'Total_earnings Total_employees'
FROM employee4 
WHERE (salary * months) =( 
                        SELECT  MAX(salary * months) 
                         FROM employee4 
                         );
 

