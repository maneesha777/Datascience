/*Q.28 
Write an SQL query to report the customer_id and customer_name of customers who have spent 
at least $100 in each month of June and July 2020. Return the result table in any order. */

CREATE TABLE customer3(
        customer_id INT,
        name VARCHAR(20),
        country VARCHAR(20),
        PRIMARY KEY(customer_id)
	);
INSERT INTO customer3 
VALUES 
        (1,'WINSTON','USA'),
        (2,'JONATHON','PERU'),
        (3,'MOUSTAFA','EGYPT');

CREATE TABLE order3(
        order_id INT,
        customer_id INT,
        product_id INT,
        order_date DATE,
        quantity INT,
        PRIMARY KEY(order_id)
	);
INSERT INTO order3 
VALUES 
        (1,1,10,'2020-06-10',1),
        (2,1,20,'2020-07-01',1),
        (3,1,30,'2020-07-08',2),
        (4,2,10,'2020-06-15',2),
        (5,2,40,'2020-07-01',10),
        (6,3,20,'2020-06-24',2),
        (7,3,30,'2020-06-25',2),
        (9,3,30,'2020-05-08',3);

CREATE TABLE product4(
        product_id INT,
        description VARCHAR(20),
        price INT,
        PRIMARY KEY(product_id)
	);
INSERT INTO product4 
VALUES 
        (10,'LC PHONE',300),
        (20,'LC T-SHIRT',10),
        (30,'LC BOOK',45),
        (40,'LC KEYCHAIN',2);

SELECT c3.customer_id, c3.name
FROM order3 o3 
JOIN customer3 c3 
ON o3.customer_id = c3.customer_id 
JOIN product4 p4 
ON o3.product_id = p4.product_id
WHERE o3.order_date BETWEEN '2020-06-01' AND '2020-07-31'
GROUP BY  c3.customer_id
HAVING
(
      SUM(CASE 
             WHEN o3.order_date LIKE '2020-06%' THEN o3.quantity * p4.price ELSE 0 END) >= 100
	  AND
	   SUM(CASE
             WHEN o3.order_date LIKE '2020-07%' THEN o3.quantity * p4.price ELSE 0 END) >= 100
);

-- Another method

SELECT c3.customer_id, c3.name
FROM customer3 c3
WHERE customer_id IN (
                       SELECT o3.customer_id 
                       FROM order3 o3
                       JOIN product4 p4 
                       ON o3.product_id = p4.product_id
					   WHERE o3.order_date BETWEEN '2020-06-01' AND '2020-06-30'
                       GROUP BY o3.customer_id
                       HAVING SUM(o3.quantity * p4.price) >= 100
                       )
AND 
	 customer_id IN (
				     SELECT o3.customer_id 
				     FROM order3 o3
                     JOIN product4 p4 
                     ON o3.product_id = p4.product_id
                     WHERE o3.order_date BETWEEN '2020-07-01' AND '2020-07-31'
                     GROUP BY o3.customer_id
                     HAVING SUM(o3.quantity * p4.price) >= 100
);

 