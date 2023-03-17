/* Q.97 
Write a query to find the confirmation rate of users who confirmed their signups with text messages. 
 Round the result to 2 decimal places. */

CREATE TABLE emails(
	email_id INT,
	user_id INT,
	signup_date DATETIME
	);
INSERT INTO emails 
VALUES
	(125,7771,'2022-06-14 00:00:00'),
	(236,6950,'2022-07-01 00:00:00'),
	(433,1052,'2022-07-09 00:00:00');

CREATE TABLE texts(
	text_id INT,
	email_id INT,
	signup_action VARCHAR(20)
	);
INSERT INTO texts 
VALUES
	(6878,125,'CONFIRMED'),
	(6920,236,'NOT CONFIRMED'),
	(6994,236,'CONFIRMED');
 WITH confirmation AS( SELECT t.email_id,
		IF (signup_action = 'CONFIRMED', 1,0) AS confirmed_users
 FROM emails e 
 JOIN texts t
 ON e.email_id = t.email_id)
 
 SELECT ROUND(SUM(confirmed_users)/COUNT(email_id),2) AS confirm_rate
 FROM confirmation