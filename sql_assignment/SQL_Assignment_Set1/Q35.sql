/* Q.35 Write an SQL query to:
   ● Find the name of the user who has rated the greatest number of movies. In case of a tie,
     return the lexicographically smaller user name.
   ● Find the movie name with the highest average rating in February 2020. In case of a tie, 
     return the lexicographically smaller movie name. */

CREATE TABLE IF NOT EXISTS  users1(
		user_id INT,
		name VARCHAR(50),
		PRIMARY KEY(user_id)
	);
INSERT INTO users1 
VALUES
      (1,'DANIEL'),
      (2,'MONICA'),
      (3,'MARIA'),
      (4,'JAMES');

CREATE TABLE IF NOT EXISTS movies(
		movie_id INT,
		title VARCHAR(50),
		PRIMARY KEY(movie_id)
	);
INSERT INTO movies
VALUES
		(1,'AVENGERS'),
		(2,'FROZEN 2'),
		(3,'JOKER');

CREATE TABLE movie_rating(
		movie_id INT,
		user_id INT,
		rating INT,
		created_at DATE,
		CONSTRAINT pK_movie PRIMARY KEY(movie_id, user_id)
	);
INSERT INTO movie_rating 
VALUES
		(1,1,3,'2020-01-12'),
		(1,2,4,'2020-02-11'),
		(1,3,2,'2020-02-12'),
		(1,4,1,'2020-01-01'),
		(2,1,5,'2020-02-17'),
		(2,2,2,'2020-02-01'),
		(2,3,2,'2020-03-01'),
		(3,1,3,'2020-02-22'),
		(3,2,4,'2020-02-25');

(
SELECT u.name AS Results
FROM  users1 u
JOIN movie_rating mr
ON u.user_id = mr.user_id
GROUP BY mr.user_id
ORDER BY u.name 
LIMIT 1)
UNION
(
SELECT m.title AS Results
FROM movies m 
JOIN movie_rating mr 
ON m.movie_id = mr.movie_id
WHERE DATE_FORMAT(mr.created_at, '%Y-%m') = '2020-02'
ORDER BY mr.rating DESC, m.title ASC
LIMIT 1)














