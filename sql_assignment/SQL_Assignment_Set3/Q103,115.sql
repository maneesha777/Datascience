/* Q.103 
Query the name of any student in students who scored higher than 75 Marks. Order your output 
by the last three characters of each name. If two or more students both have names ending in the same 
last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending id. */

CREATE TABLE student2(
		id INT,
		name VARCHAR(20),
		marks INT
	);
INSERT INTO student2 
VALUES
		(1,'ASHLEY',81),
		(2,'SAMANTHA',75),
        (3,'BELVET',84),
		(4,'JULIA',76);
	
    SELECT name 
    FROM student2 
    WHERE marks>75 
    ORDER BY RIGHT(name,3), id;
    