/* Q.96 
Write a query to output the user id, song id, and cumulative count of song plays as of 4 August 2022 
 sorted in descending order. */

CREATE TABLE songs_history(
	history_id INT,
	user_id INT,
	song_id INT,
	song_plays INT
	);
INSERT INTO songs_history 
VALUES
	(10011,777,1238,11),
	(12452,695,4520,1);

CREATE TABLE songs_weekly(
	user_id INT,
	song_id INT,
	listen_time DATETIME
	);

INSERT INTO songs_weekly 
VALUES
	(777,1238,'2022-08-01 12:00:00'),
	(695,4520,'2022-08-04 08:00:00'),
	(125,9630,'2022-08-04 16:00:00'),
	(695,9852,'2022-08-07 12:00:00');

 WITH count_songs AS (
                        SELECT 
                                user_id, 
                                song_id, 
                                song_plays
                        FROM 
                                songs_history

                        UNION ALL

                        SELECT 
                                user_id, 
                                song_id, 
                                count(*) AS song_plays
                        FROM 
                                songs_weekly
                         WHERE 
			        listen_time <= '2022-08-04 23:59:59'
                        GROUP by 
                                user_id, 
                                song_id
                )

SELECT 
        user_id, 
        song_id, 
        SUM(song_plays) as song_plays
FROM 
        count_songs
GROUP BY 
        user_id, 
        song_id
ORDER BY 
        song_plays DESC;
