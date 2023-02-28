/* Q.58 Write an SQL Query to report all the consecutive available seats in the cinema.
Return the result table ordered by seat_id in ascending order.
The test cases are generated so that more than two seats are consecutively available.*/
CREATE TABLE cinema(
        seat_id INT AUTO_INCREMENT,
        free BOOLEAN,
        PRIMARY KEY(seat_id)
    );
INSERT INTO cinema (free) 
VALUES 
        (TRUE),
        (FALSE),
        (TRUE),
        (TRUE),
        (TRUE);
SELECT DISTINCT c1.seat_id 
FROM cinema c1
JOIN cinema c2
ON ABS(c1.seat_id - c2.seat_id) = 1
   AND (c1.free = 1 AND c2.free = 1)
ORDER BY c1.seat_id