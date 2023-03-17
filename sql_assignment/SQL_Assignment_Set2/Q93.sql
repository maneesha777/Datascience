/* Q.50 
Write an SQL query to find the winner in each group. Return the result table in any order. */

CREATE TABLE matches(
		match_id INT,
		first_player INT,
		second_player INT,
		first_score INT,
		second_score INT,
		PRIMARY KEY(match_id)
	);
INSERT INTO matches 
VALUES 
		(1,15,45,3,0),
		(2,30,25,1,2),
		(3,30,15,2,0),
		(4,40,20,5,2),
		(5,35,50,1,1);

CREATE TABLE players(
		player_id INT,
		group_id INT,
		PRIMARY KEY(player_id)
    );
INSERT INTO players 
VALUES 
		(15,1),
		(25,1),
		(30,1),
		(45,1),
		(10,2),
		(35,2),
		(50,2),
		(20,3),
		(40,3);
SELECT group_id,
	   player_id
FROM (
		SELECT p.player_id,
			   p.group_id,
			   SUM(p1.score) AS total_score,
               ROW_NUMBER() OVER(PARTITION BY group_id ORDER BY SUM(p1.score) DESC) AS rnk
		FROM players p 
		JOIN (
				SELECT first_player AS player_id, 
						first_score  AS score 
				FROM matches 
				UNION ALL 
				SELECT second_player AS player_id,
						second_score  AS score
				FROM matches
			) AS p1
		ON p.player_id = p1.player_id
		GROUP BY p1.player_id
		ORDER  BY p.group_id,total_score DESC
	) AS score_chart
WHERE rnk =1