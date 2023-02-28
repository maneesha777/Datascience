/*
Q.41 Write an SQL query to report the number of cubic feet of volume the inventory 
occupies in each warehouse. Return the result table in any order. */

CREATE TABLE warehouse(
		name VARCHAR(25),
		product_id INT,
		units INT,
		CONSTRAINT pk_warehouse PRIMARY KEY(name,product_id)
	);
INSERT INTO warehouse 
VALUES
		('LCHOUSE1',1,1),
		('LCHOUSE1',2,10),
		('LCHOUSE1',3,5),
		('LCHOUSE2',1,2),
		('LCHOUSE2',2,2),
		('LCHOUSE3',4,1);

CREATE TABLE IF NOT EXISTS products1(
		product_id INT,
		product_name VARCHAR(25),
		width INT,
		length INT,
		height INT,
		PRIMARY KEY(product_id)
	);
INSERT INTO products1 
VALUES
		(1,'LC-TV',5,50,40),
		(2,'LC-KEYCHAIN',5,5,5),
		(3,'LC-PHONE',2,10,10),
		(4,'LC-T-SHIRT',4,10,20);
SELECT w.name AS warehoue_name,
	   SUM(p1.width*p1.length*p1.height*w.units) AS volume
FROM warehouse w 
JOIN products1 p1
ON w.product_id = p1.product_id
GROUP BY w.name

