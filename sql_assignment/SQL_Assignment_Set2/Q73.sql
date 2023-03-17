/* Q.73 
Write an SQL Query to find the average daily percentage of posts that got 
removed after being reported as spam, rounded to 2 decimal places. */

CREATE TABLE actions(
        user_id INT,
        post_id INT,
        action_date DATE,
        action ENUM ('VIEW','LIKE','REACTION','COMMENT','REPORT','SHARE'),
        extra VARCHAR(20)
    );
INSERT INTO actions 
VALUES
        (1,1,'2019-07-01','VIEW','NULL'),
        (1,1,'2019-07-01','LIKE','NULL'),
        (1,1,'2019-07-01','SHARE','NULL'),
        (2,2,'2019-07-04','VIEW','NULL'),
        (2,2,'2019-07-04','REPORT','SPAM'),
        (3,4,'2019-07-04','VIEW','NULL'),
        (3,4,'2019-07-04','REPORT','SPAM'),
        (4,3,'2019-07-02','VIEW','NULL'),
        (4,3,'2019-07-02','REPORT','SPAM'),
        (5,2,'2019-07-03','VIEW','NULL'),
        (5,2,'2019-07-03','REPORT','RACISM'),
        (5,5,'2019-07-03','VIEW','NULL'),
        (5,5,'2019-07-03','REPORT','RACISM');

CREATE TABLE removals(
        post_id INT,
        remove_date DATE,
        PRIMARY KEY(post_id)
    );
INSERT INTO removals 
VALUES
        (2,'2019-07-20'),
        (3,'2019-07-18');
        
WITH modi_actions AS (        
						SELECT COUNT(extra) OVER(PARTITION BY action_date) num_reported_spam,
								action_date,
								post_id
						FROM actions
                        WHERE extra = 'SPAM'
					)
SELECT ROUND(AVG(percentage),2 )AS avg_daily_percent 
FROM (					
		SELECT ma.action_date,
		       ROUND((COUNT(ma.post_id)/ma.num_reported_spam) * 100, 2) AS percentage
		FROM modi_actions ma
		JOIN removals r
		ON ma.post_id = r.post_id
		GROUP BY ma.action_date
	) p