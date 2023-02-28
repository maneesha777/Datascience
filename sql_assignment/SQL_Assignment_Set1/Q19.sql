/*
Q19.
Table: Delivery
Column Name Type
delivery_id int
customer_id int
order_date date
customer_pref_delivery_date date

delivery_id is the primary key of this table.
The table holds information about food delivery to customers that make orders at some date and specify a preferred delivery date (on the same order date or after it).
If the customer's preferred delivery date is the same as the order date, then the order is called
immediately; otherwise, it is called scheduled.
Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal
places.
The query result format is in the following example. */

CREATE TABLE delivery(
delivery_id INT,
customer_id INT,
order_date DATE,
customer_pref_delivery_date DATE,
PRIMARY KEY(delivery_id) 
);
INSERT INTO delivery(delivery_id, customer_id, order_date, customer_pref_delivery_date)
VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 5, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-11'),
(4, 3, '2019-08-24', '2019-08-26'),
(5, 4, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');


SELECT ROUND(100 * d2.Immediate_order_count / COUNT(d1.delivery_id), 2) AS Immediate_percentage
FROM delivery d1,
    (SELECT COUNT(order_date ) AS Immediate_order_count, delivery_id
    FROM delivery d1
    WHERE order_date = customer_pref_delivery_date) d2
GROUP BY d1.product_id;
    
SELECT ROUND(100 * d2.Immediate_order_count / COUNT(*), 2) AS Immediate_percentage
FROM delivery
WHERE (order_date = customer_pref_delivery_date) ;
    


