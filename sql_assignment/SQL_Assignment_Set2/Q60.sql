/* Q.60 
Write an SQL Query to report for every three line segments whether they can form a triangle. 
Return the result table in any order. */

CREATE TABLE triangle(
        x INT,
        y INT,
        z INT,
        CONSTRAINT pk_triangle PRIMARY KEY(x,y,z)
    );
INSERT INTO triangle 
VALUES
        (13,15,30),
        (10,20,15);
SELECT *, 
      IF ( x+y>z AND y+z>x AND z+x>y, 'YES', 'NO') AS Triangle
FROM triangle