/*Q33.
Table: Users
Column Name Type
id int
name varchar
id is the primary key for this table.
name is the name of the user.

Table: Rides
Column Name Type
id int
user_id int
distance int
id is the primary key for this table.
user_id is the id of the user who travelled the distance "distance".

Write an SQL query to report the distance travelled by each user.
Return the result table ordered by travelled_distance in descending order, if two or more users
travelled the same distance, order them by their name in ascending order */
CREATE TABLE users_table(
		id INT,
		name VARCHAR(50),
		PRIMARY KEY(id)
	);
INSERT INTO users_table 
VALUES
		(1,'ALICE'),
		(2,'BOB'),
		(3,'ALEX'),
		(4,'DONALD'),
		(7,'LEE'),
		(13,'JONATHON'),
		(19,'ELVIS');

CREATE TABLE rides(
        id INT,
        user_id INT,
        distance INT,
        PRIMARY KEY(id)
	);
INSERT INTO rides 
VALUES
	   (1,1,120),
	   (2,2,317),
       (3,3,222),
	   (4,7,100),
       (5,13,312),
       (6,19,50),
       (7,7,120),
       (8,19,400),
       (9,7,230);
SELECT ut.name, SUM(IFNULL(r.distance,0)) AS travelled_distance
FROM users_table ut 
LEFT JOIN rides r 
ON ut.id = r.user_id
GROUP BY ut.name
ORDER BY travelled_distance DESC, ut.name ASC
