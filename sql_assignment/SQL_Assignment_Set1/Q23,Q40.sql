/* Q.23 Write an SQL query to find the average selling price for each product. 
   average_price should be rounded to 2 decimal places. */
CREATE TABLE prices(
        product_id INT,
        start_date DATE,
        end_date DATE,
        price INT,
        CONSTRAINT pk_prices PRIMARY KEY(product_id, start_date, end_date)
	);
INSERT INTO prices 
VALUES
        (1,'2019-02-17','2019-02-28',5),
        (1,'2019-03-01','2019-03-22',20),
        (2,'2019-02-01','2019-02-20',15),
        (2,'2019-02-21','2019-03-31',30);

CREATE TABLE units_sold(
        product_id INT,
        purchase_date DATE,
        units INT
	);
INSERT INTO units_sold 
VALUES
        (1,'2019-02-25',100),
        (1,'2019-03-01',15),
        (2,'2019-02-10',200),
        (2,'2019-03-22',30);
SELECT p.product_id, 
       ROUND(SUM(us.units*p.price)/ SUM(us.units), 2) AS average_price
FROM prices p 
JOIN units_sold us 
ON (p.product_id = us.product_id
     AND us.purchase_date BETWEEN p.start_date AND p.end_date)
GROUP BY product_id


