/* Q.68 
Write an SQL Query to find the total score for each gender on each day.
Return the result table ordered by gender and day in ascending order. */

CREATE TABLE scores(
        player_name VARCHAR(20),
        gender VARCHAR(20),
        day DATE,
        score_points INT,
        CONSTRAINT pK_scores PRIMARY KEY(gender,day)
    );
INSERT INTO scores 
VALUES
        ('ARON','F','2020-01-01',17),
        ('ALICE','F','2020-01-07',23),
        ('BAJRANG','M','2020-01-07',7),
        ('KHALI','M','2019-12-25',11),
        ('SLAMAN','M','2019-12-30',13),
        ('JOE','M','2019-12-31',3),
        ('JOSE','M','2019-12-18',2),
        ('PRIYA','F','2019-12-31',23),
        ('PRIYANKA','F','2019-12-30',17);

SELECT gender,
		day,
        SUM(score_points) OVER(PARTITION BY gender ORDER BY day) AS total
FROM scores