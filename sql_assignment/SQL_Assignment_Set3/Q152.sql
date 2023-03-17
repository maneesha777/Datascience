/*Q.152 
The Airbnb Booking RecommENDations team is trying to understand the "substitutability" of two rentals and whether one rental is a good substitute for another. 
They want you to,
write a query to find the unique combination of two Airbnb rentals WITH the same exact amenities offered.
Output the COUNT of the unique combination of Airbnb rentals. */

CREATE TABLE rental_amenities(
		rental_id INT,
		amenity VARCHAR(20)
	);
INSERT INTO rental_amenities 
VALUES
		(123,'POOL'),
		(123,'KITCHEN'),
		(234,'HOT TUB'),
		(234,'FIREPLACE'),
		(345,'KITCHEN'),
		(345,'POOL'),
		(456,'POOL');
WITH cte_amenities AS(
						SELECT rental_id,
								GROUP_CONCAT(amenity ORDER BY amenity) AS amenities
						FROM rental_amenities
                        GROUP BY rental_id
					)
   SELECT COUNT(DISTINCT amenities) AS matching_airbnb
   FROM cte_amenities
   GROUP BY amenities
   HAVING COUNT(DISTINCT rental_id) > 1
                                        