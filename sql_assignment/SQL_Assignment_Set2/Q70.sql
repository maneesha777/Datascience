/* Q.70 
Write an SQL Query to find the number of times each student attended each exam. 
Return the result table ordered by student_id and subject_name. */

CREATE TABLE student3(
        student_id INT,
        student_name VARCHAR(20),
        PRIMARY KEY(student_id)
    );
INSERT INTO student3 
VALUES
        (1,'ALICE'),
        (2,'BOB'),
        (13,'JOHN'),
        (6,'ALEX');

CREATE TABLE subjects(
        subject_name VARCHAR(20),
        PRIMARY KEY(subject_name)
    );
INSERT INTO subjects 
VALUES
        ('MATH'),
        ('PHYSICS'),
        ('PROGRAMMING');

CREATE TABLE exams(
        student_id INT,
        subject_name VARCHAR(20)
    );
INSERT INTO exams 
VALUES    
        (1,'MATH'),
        (1,'PHYSICS'),
        (1,'PROGRAMMING'),
        (2,'PROGRAMMING'),
        (1,'PHYSICS'),
        (1,'MATH'),
        (13,'MATH'),
        (13,'PROGRAMMING'),
        (13,'PHYSICS'),
        (2,'MATH'),
        (1,'MATH');

         
WITH modi_student AS (
						SELECT student_id, 
								student_name, 
								subject_name  
						FROM student3, 
							 subjects
					),
	modi_exams AS (
					SELECT student_id, 
							subject_name, 
							COUNT(*) AS no_of_attended_exam 
					FROM exams
					GROUP BY student_id, 
							 subject_name
					)

SELECT su.student_id,
		su.subject_name,
        su.student_name,
        COALESCE(me.no_of_attended_exam,0) AS attended_exams
FROM modi_exams me
RIGHT JOIN modi_student su
ON su.student_id = me.student_id AND
   su.subject_name = me.subject_name
ORDER BY su.student_id, 
         su.subject_name;




    
