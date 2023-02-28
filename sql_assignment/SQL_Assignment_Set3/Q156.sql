/* Q.156 
Assume you are given the table below containing information on user
purchASes. Write a query to obtain the number of users who purchASed the 
same product on two or more different days. Output the number of unique users. */

CREATE TABLE purchases(
		user_id INT,
		product_id INT,
		quantity INT,
		purchase_date DATETIME
	);
INSERT INTO purchases 
VALUES
		(536,3223,6,'2022-01-11 12:33:44'),
		(827,3585,35,'2022-02-20 14:05:26'),
		(536,3223,5,'2022-03-02 09:33:28'),
		(536,1435,10,'2022-03-02 08:40:00'),
		(827,2452,45,'2022-04-09 00:00:00');
