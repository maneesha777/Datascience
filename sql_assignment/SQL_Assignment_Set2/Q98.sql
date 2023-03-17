/* Q.98 
Calculate the 3-day rolling average of tweets published by each user for each date 
 that a tweet was posted. Output the user id, tweet date, and rolling averages rounded to 2 decimal places. */

CREATE TABLE tweets(
	tweet_id INT,
	user_id INT,
	tweet_date DATETIME
	);
INSERT INTO tweets 
VALUES
	(214252,111,'2022-06-01 12:00:00'),
	(739252,111,'2022-06-01 12:00:00'),
	(846402,111,'2022-06-02 12:00:00'),
	(241425,254,'2022-06-02 12:00:00'),
	(137374,111,'2022-06-04 12:00:00');
    
    WITH tweets_per_day AS(SELECT user_id,
								  tweet_date,
                                  COUNT(*) AS tweet_count
						   FROM tweets
                           GROUP BY user_id, tweet_date
                           ORDER BY tweet_date)
  SELECT user_id,
		 tweet_date,
		 ROUND(AVG(tweet_count ) OVER(PARTITION BY user_id ROWS BETWEEN 2 PRECEDING and CURRENT ROW), 2) AS rolling_avg_3days
  FROM tweets_per_day
  