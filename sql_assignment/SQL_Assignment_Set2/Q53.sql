 /* Q.53 
 Write an SQL Query to report all customers who never order anything. 
-- Return the result table in any order . */
CREATE TABLE customers2(
        id INT,
        name VARCHAR(20),
        PRIMARY KEY(id)
    );
INSERT INTO customers2 
VALUES 
        (1,'JOE'),
        (2,'HENRY'),
        (3,'SAM'),
        (4,'MAX');
        
CREATE TABLE orders1(
        id INT,
        customer_id INT,
        PRIMARY KEY(id),
        CONSTRAINT fk_order_customer FOREIGN KEY(customer_id) REFERENCES customers2(id)
    );
INSERT INTO orders1 
VALUES 
        (1,3),
        (2,1);
-- ONE METHOD
SELECT c2.name AS customers
FROM customers2 c2 
LEFT JOIN orders1 o1 
ON c2.id = o1.customer_id
WHERE o1.customer_id IS NULL;

-- ANOTHER METHOD
SELECT name AS customers
FROM customers2 
WHERE id NOT IN 
               (SELECT customer_id
				FROM orders1);
