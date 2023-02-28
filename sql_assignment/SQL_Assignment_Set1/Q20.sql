/* Q.20 
Write an SQL query to find the ctr of each Ad. Round ctr to two decimal points.
Return the result table ordered by ctr in descending order 
and by ad_id in ascending order in case of a tie. */

CREATE TABLE ads(
        ad_id INT,
        user_id INT,
        action ENUM('CLICKED','VIEWED','IGNORED'),
        CONSTRAINT pk_ads PRIMARY KEY(ad_id, user_id)        
	);
INSERT INTO ads 
VALUES
        (1,1,'CLICKED'),
        (2,2,'CLICKED'),
        (3,3,'VIEWED'),
        (5,5,'IGNORED'),
        (1,7,'IGNORED'),
        (2,7,'VIEWED'),
        (3,5,'CLICKED'),
        (1,4,'VIEWED'),
        (2,11,'VIEWED'),
        (1,2,'CLICKED');

WITH modi_ads AS(
					SELECT ad_id,
							COUNT(CASE
									WHEN action ='CLICKED' THEN ad_id
									END) AS total_clicks,
							COUNT(CASE
									WHEN action ='VIEWED' THEN ad_id
									END) AS total_views 
					FROM ads
					GROUP BY ad_id
				)

SELECT ad_id,
       CASE
			WHEN (total_clicks+ total_views) = 0 THEN '0'
			ELSE ROUND(total_clicks * 100 / (total_clicks+ total_views), 2) END AS ctr
FROM modi_ads
ORDER BY ctr DESC, ad_id;