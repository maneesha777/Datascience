/* Q.39 
Write an SQL query to report the number of calls and the total call duration between each pair of distinct persons (person1, person2) where person1 < person2.
Return the result table in any order. */

CREATE TABLE calls(
		from_id INT,
		to_id INT,
		duration INT
	);
INSERT INTO calls VALUES
		(1,2,59),
		(2,1,11),
		(1,3,20),
		(3,4,100),
		(3,4,200),
		(3,4,200),
		(4,3,499);
SELECT LEAST(from_id, to_id) AS person1,
	   GREATEST(from_id, to_id) AS person2,
       COUNT(*) AS call_count,
       SUM(duration) AS total_duration
FROM calls
GROUP BY person1, person2;