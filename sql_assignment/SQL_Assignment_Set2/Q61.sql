/* Q.61 
Write an SQL Query to report the shortest distance between any two points from the Point table. */
CREATE TABLE point(
        x INT,
        PRIMARY KEY(x)
    );
INSERT INTO point 
VALUES
        (-1),
        (0),
        (2);
SELECT MIN(ABS(p1.x-p2.x)) AS Shortest
FROM point p1 
JOIN point p2
ON p1.x != p2.x;
