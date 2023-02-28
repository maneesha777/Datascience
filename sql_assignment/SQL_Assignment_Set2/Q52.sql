/* Q.52 
Write an SQL Query to report the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order. */

CREATE TABLE customer1(
	id INT,
	name VARCHAR(10),
	refree_id INT,
	PRIMARY KEY(id)
	);
INSERT INTO customer1 
VALUES 
	(1,'Will',NULL),
	(2,'Jane',NULL),
	(3,'Alex',2),
	(4,'Bill',NULL),
	(5,'Zack',1),
	(6,'Mark',2);
SELECT name 
FROM customer1 
WHERE refree_id != 2 OR refree_id IS NULL;