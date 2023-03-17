/* Q.87 Write a SQL Query to find the bad experience rate in the first 14 days for new users who signed 
-- up in June 2022. Output the percentage of bad experience rounded to 2 decimal places. */

CREATE TABLE orders_table(
        order_id INT,
        customer_id INT,
        trip_id INT,
        status ENUM('COMPLETED SUCCESSFULLY','COMPLETED INCORRECTLY','NEVER_RECEIVED'),
        order_timestamp TIMESTAMP
    );
INSERT INTO orders_table 
VALUES  
        (727424,8472,100463,'COMPLETED SUCCESSFULLY','2022-06-05 09:12:00'),
        (242513,2341,100482,'COMPLETED INCORRECTLY','2022-06-05 14:40:00'),
        (141367,1314,100362,'COMPLETED INCORRECTLY','2022-06-07 15:03:00'),
        (582193,5421,100657,'NEVER_RECEIVED','2022-07-07 15:22:00'),
        (253613,1314,100213,'COMPLETED SUCCESSFULLY','2022-06-12 13:43:00');


CREATE TABLE trips(
        dasher_id INT,
        trip_id INT,
        estimated_delivery_timestamp TIMESTAMP,
        actual_delivery_timestamp TIMESTAMP
    );
INSERT INTO trips
VALUES 
        (101,100463,'2022-06-05 09:42:00','2022-06-05 09:38:00'),
        (102,100482,'2022-06-05 15:10:00','2022-06-05 15:46:00'),
        (101,100362,'2022-06-07 15:33:00','2022-06-07 16:45:00'),
        (102,100657,'2022-07-07 15:52:00',NULL),
        (103,100213,'2022-06-12 14:13:00','2022-06-12 14:10:00');


CREATE TABLE customer_table(
        customer_id INT,
        signup_timestamp TIMESTAMP
    );
INSERT INTO customer_table 
VALUES    
        (8472,'2022-05-30 00:00:00'),
        (2341,'2022-06-01 00:00:00'),
        (1314,'2022-06-03 00:00:00'),
        (1435,'2022-06-05 00:00:00'),
        (5421,'2022-06-07 00:00:00');
 
 SELECT 
		ROUND((SUM(
						CASE
							WHEN (ot.status !='COMPLETED SUCCESSFULLY') 
							THEN 1 ELSE 0
							END)*100.00/COUNT(*)),2) AS bad_experience_rate
 FROM orders_table ot
 JOIN customer_table ct
 ON ct.customer_id = ot.customer_id
 WHERE TIMESTAMPDIFF(DAY,ot.order_timestamp, ct.signup_timestamp) <14
		AND DATE_FORMAT(ct.signup_timestamp, '%Y-%m') = '2022-06';
        
        
        
        
 