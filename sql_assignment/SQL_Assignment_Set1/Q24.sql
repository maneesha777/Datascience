/* Q.24 
Write an SQL query to report the first login date for each player. 
Return the result table in any order. */
CREATE TABLE activity1(
			player_id INT,
			device_id INT,
			event_date DATE,
			games_played INT, 
            CONSTRAINT pk_activity1 PRIMARY KEY(player_id, event_date)
            );
INSERT INTO activity1
VALUES 
        (1,2,'2016-03-01',5),
        (1,2,'2016-05-02',6),
        (2,3,'2017-06-25',1),
        (3,1,'2016-03-02',0),
        (3,4,'2018-07-03',5);

SELECT a1.player_id,
       a1.event_date AS first_login
FROM (
		SELECT player_id,
				event_date,
				ROW_NUMBER() OVER(PARTITION BY player_id ORDER BY event_date) AS rnk
		FROM activity1) AS a1
WHERE rnk =1
