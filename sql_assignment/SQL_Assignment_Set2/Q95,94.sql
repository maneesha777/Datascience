/* Q.94 Write an SQL Query to report the students (student_id, student_name) being -- Quiet in all exams. 
-- Do not return the student who has never taken any exam. */

CREATE TABLE student_exam(
        student_id INT,
        student_name VARCHAR(20),
        PRIMARY KEY(student_id)
    );
INSERT INTO student_exam 
VALUES 
        (1,'DANIEL'),
        (2,'JADE'),
        (3,'STELLA'),
        (4,'JONATHAN'),
        (5,'WILL');

CREATE TABLE exam_score(
        exam_id INT,
        student_id INT,
        score INT,
        CONSTRAINT pk_exam_score PRIMARY KEY(exam_id,student_id)
    );
 INSERT INTO exam_score 
 VALUES
        (10,1,70),
        (10,2,80),
        (10,3,90),
        (20,1,80),
        (30,1,70),
        (30,3,80),
        (30,4,90),
        (40,1,60),
        (40,2,70),
        (40,4,80);
        
                
WITH highest_lowest AS ( SELECT student_id,
								exam_id,
								score,
								MAX(score) OVER(PARTITION BY exam_id) AS highest_score,
								MIN(score) OVER(PARTITION BY exam_id) AS lowest_score
						FROM exam_score  )
SELECT DISTINCT se.student_id,
		se.student_name
FROM student_exam se 
JOIN  highest_lowest hl
ON se.student_id = hl.student_id                    
WHERE se.student_id NOT IN (SELECT student_id
							FROM highest_lowest                        
							WHERE score  IN (highest_score,lowest_score))