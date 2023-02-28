/* Q.48 
Write an SQL query that reports the books that have sold less than 10 copies in the last year, 
excluding books that have been available for less than one month from today. Assume today is 2019-06-23.
Return the result table in any order. */

CREATE TABLE books(
		book_id INT,
		name VARCHAR(20),
		available_from DATE,
		PRIMARY KEY(book_id)
	);
INSERT INTO books 
VALUES 
		(1,"Kalila And Demna",'2010-01-01'),
		(2,"28 Letters",'2012-05-12'),
		(3,"The Hobbit",'2019-06-10'),
		(4,"13 Reasons Why",'2019-06-01'),
		(5,"The Hunger Games",'2008-09-21');
    
CREATE TABLE orders1(
		order_id INT,
		book_id INT,
		quantity INT,
		dispatch_date DATE,
		CONSTRAINT prime_key PRIMARY KEY(order_id),
		CONSTRAINT foriegn_key FOREIGN KEY(book_id) REFERENCES books(book_id)
	);
INSERT INTO orders1 
VALUES 
		(1,1,2,'2018-07-26'),
		(2,1,1,'2018-11-05'),
		(3,3,8,'2019-06-11'), 
		(4,4,6,'2019-06-05'), 
		(5,4,5,'2019-06-20'), 
		(6,5,9,'2009-02-02'), 
		(7,5,8,'2010-04-13');
