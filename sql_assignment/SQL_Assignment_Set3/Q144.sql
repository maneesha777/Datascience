/* Q.144 
Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. 
It is guaranteed that no two students get the same salary offer.*/

CREATE TABLE students4(
		id INT,
		name VARCHAR(20)
	);
INSERT INTO students4 
VALUES
		(1,'ASHLEY'),
		(2,'SAMANTHA'),
		(3,'JULIA'),
		(4,'SCARLET');

CREATE TABLE friends(
		id INT,
		friend_id INT
	);
INSERT INTO friends 
VALUES
		(1,2),
		(2,3),
		(3,4),
		(4,1);

CREATE TABLE packages(
		id INT,
		salary FLOAT
	);

INSERT INTO packages 
VALUES
		(1,15.20),
		(2,10.06),
		(3,11.55),
		(4,12.12);
        
SELECT name
FROM friends f
JOIN packages p1
ON f.id = p1.id
JOIN packages p2
ON f.friend_id = p2.id
JOIN students4 s
ON f.id = s.id
WHERE p2.salary > p1.salary