/*Q.148 
You are given a table of PayPal payments showing the payer, the recipient, and the amount paid. 
A two-way unique relationship is established WHEN two people sEND money back and forth. 
Write a query to find the number of two-way unique relationships in this data.*/

CREATE TABLE payments(
		payer_id INT,
		recipient_id INT,
		amount INT
	);
INSERT INTO payments 
VALUES
		(101,201,30),
		(201,101,10),
		(101,301,20),
		(301,101,80),
		(201,301,70); 
        
WITH payments_cte AS (
                        SELECT DISTINCT p1.payer_id, 
                                p1.recipient_id
                        FROM payments p1 
                        JOIN payments p2
                        ON p1.payer_id = p2.recipient_id 
                        AND p2.payer_id = p1.recipient_id
						AND p1.payer_id < p2.payer_id
					 )

SELECT COUNT(*) unique_relationships
FROM payments_cte;