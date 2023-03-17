/*Q.62 
Write a SQL Query for a report that provides the pairs (actor_id, director_id) where the actor has 
cooperated with the director at least three times. Return the result table in any order. */

CREATE TABLE actor_director(
        actor_id INT,
        director_id INT,
        timestamp INT,
	    PRIMARY KEY(timestamp)
    );
INSERT INTO actor_director 
VALUES 
        (1,1,0),
        (1,1,1),
        (1,1,2),
        (1,2,3),
        (1,2,4),
        (2,1,5),
        (2,1,6); 

SELECT actor_id,
	   director_id
FROM actor_director
GROUP BY actor_id,
         director_id
HAVING count(*) >= 3