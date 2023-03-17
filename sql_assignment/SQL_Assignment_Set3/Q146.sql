/* Q.146 
Write a query to output the start and END dates of projects listed by the number of days it took to complete the project in ascending order. 
If there is more than one project that have the same numberof completion days, 
then order by the start date of the project. */

CREATE TABLE projects(
		task_id INT,
		start_date DATE,
		end_date DATE
	);
INSERT INTO projects 
VALUES
		(1,'2015-10-01','2015-10-02'),
		(2,'2015-10-02','2015-10-03'),
		(3,'2015-10-03','2015-10-04'),
		(4,'2015-10-13','2015-10-14'),
		(5,'2015-10-14','2015-10-15'),
		(6,'2015-10-28','2015-10-29'),
		(7,'2015-10-30','2015-10-31');


WITH temp_project AS (
                        SELECT start_date, 
                                end_date,
                                DATE_SUB(start_date, INTERVAL rnk DAY) AS new_date
                        FROM (
                                SELECT start_date, 
                                        end_date,
                                        ROW_NUMBER() OVER (ORDER BY start_date) AS rnk
                                FROM projects
							 ) temp
						)

SELECT MIN(start_date) AS project_start_date,
	   MAX(end_date) AS project_end_date
FROM temp_project
GROUP BY new_date
ORDER BY DATEDIFF(MAX(end_date),MIN(start_date))