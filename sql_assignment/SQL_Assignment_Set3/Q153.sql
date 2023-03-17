/* Q.153 
Write a query to calculate the return on ad spend (ROAS) for each advertiser across all ad campaigns. 
Round your answer to 2 decimal places, and order your output by the advertiser_id. */

CREATE TABLE ad_campaigns(
		campaign_id INT,
		spend INT,
		revenue FLOAT,
		advertiser_id INT
	);
INSERT INTO ad_campaigns 
VALUES
		(1,5000,7500,3),
		(2,1000,900,1),
		(3,3000,12000,2),
		(4,500,2000,4),
		(5,100,400,4);
        
SELECT advertiser_id,
		ROUND(total_revenue/total_spend, 2) AS ROAS
FROM (
		SELECT advertiser_id,
		SUM(spend) AS total_spend,
		SUM(revenue) AS total_revenue
		FROM ad_campaigns
		GROUP BY advertiser_id
	  )c
ORDER BY advertiser_id