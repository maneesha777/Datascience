/* Q.49 
Write a SQL query to find the highest grade with its corresponding course for each student. 
In case of a tie, you should find the course with the smallest course_id. Return the result table 
ordered by student_id in ascending order. */
CREATE TABLE enrollments(
		student_id INT,
		course_id INT,
		grade INT,
		CONSTRAINT pk_enrollment PRIMARY KEY(student_id,course_id)
    );
INSERT INTO enrollments 
VALUES 
		(2,2,95),
		(2,3,95),
		(1,1,90),
		(1,2,99),
		(3,1,80),
		(3,2,75),
		(3,3,82);

WITH modi_enrollments AS (
                           SELECT student_id,
                                  course_id,
                                  grade,
                                  ROW_NUMBER() OVER(PARTITION BY student_id ORDER BY grade DESC) AS grade_rank
						   FROM enrollments
                          )
SELECT student_id,
	   course_id,
	   grade
FROM modi_enrollments
WHERE grade_rank =1
ORDER BY course_id
