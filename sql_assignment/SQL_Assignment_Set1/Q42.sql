/* Q.42 
Write an SQL query to report the difference between the number of 
apples and oranges sold each day. Return the result table ordered by sale_date. */

CREATE TABLE sales(
		sale_date DATE,
		fruit ENUM('APPLES','ORANGES'),
		sold_num INT,
		CONSTRAINT pk_sales PRIMARY KEY(sale_date,fruit)
	);
INSERT INTO sales 
VALUES
		('2020-05-01','APPLES',10),
		('2020-05-01','ORANGES',8),
		('2020-05-02','APPLES',15),
		('2020-05-02','ORANGES',15),
		('2020-05-03','APPLES',20),
		('2020-05-03','ORANGES',0),
		('2020-05-04','APPLES',15),
		('2020-05-04','ORANGES',16);
SELECT sale_date, SUM(IF(fruit='APPLES', sold_num, -sold_num)) AS Diff
FROM sales
GROUP BY sale_date