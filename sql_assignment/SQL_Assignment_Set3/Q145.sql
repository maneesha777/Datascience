/*  Q.145 
Write a query to print the respective hacker_id and name of hackers who achieved full scores for  more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in the same number of challenges, then sort them by ascending hacker_id. */

CREATE TABLE hackers(
		hacker_id INT,
		name VARCHAR(20)
	);
INSERT INTO hackers 
VALUES
		(5580,'ROSE'),
		(8439,'ANGELA'),
		(27205,'FRANK'),
		(52243,'PATRICK'),
		(52348,'LISA'),
		(57645,'KIMBERLY'),
		(77726,'BONNIE'),
		(83082,'MICHAEL'),
		(86870,'TODD'),
		(90411,'JOE');

CREATE TABLE difficulty(
		difficulty_level INT,
		score INT
	);
INSERT INTO difficulty 
VALUES
		(1,20),
		(2,30),
		(3,40),
		(4,60),
		(5,80),
		(6,100),
		(7,120);

CREATE TABLE challenges(
		challenge_id INT,
		hacker_id INT,
		difficulty_level INT
	);
INSERT INTO challenges 
VALUES
		(4810,77726,4),
		(21089,27205,1),
		(36566,5580,7),
		(66730,52243,6),
		(71055,52243,2);

CREATE TABLE submissions(
		submission_id INT,
		hacker_id INT,
		challenge_id INT,
		score INT
	);
    INSERT INTO submissions 
    VALUES
			(68628, 77726, 36566, 30),
			(65300, 77726, 21089, 10),
			(40326, 52243, 36566, 77),
			(8941, 27205, 4810, 4),
			(83554, 77726, 66730, 30),
			(43353, 52243, 66730, 0),
			(55385, 52348, 71055, 20),
			(39784, 27205, 71055, 23),
			(94613, 86870, 71055, 30),
			(45788, 52348, 36566, 0),
			(93058, 86870, 36566, 30),
			(7344, 8439, 66730, 92),
			(2721, 8439, 4810, 36),
			(523, 5580, 71055, 4),
			(49105, 52348, 66730, 0),
			(55877, 57645, 66730, 80),
			(38355, 27205, 66730, 35),
			(3924, 8439, 36566, 80),
			(97397, 90411, 66730, 100),
			(84162, 83082, 4810, 40),
			(97431, 90411, 71055, 30);

SELECT h.hacker_id,
         h.name
FROM submissions s
JOIN challenges c 
ON c.challenge_id = s.challenge_id 
JOIN difficulty d 
ON d.difficulty_level = c.difficulty_level
JOIN hackers h 
ON h.hacker_id = s.hacker_id
WHERE s.score = d.score
GROUP BY h.hacker_id,
         h.name
HAVING COUNT(s.score) > 1         
ORDER BY COUNT(*) DESC,
         h.hacker_id


