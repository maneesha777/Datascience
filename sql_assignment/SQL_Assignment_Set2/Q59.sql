/* 
Q.59 Write an SQL Query to report the names of all the salespersons who did not have any 
-- orders related to the company with the name "RED". */

CREATE TABLE sales_person(
        sales_id INT,
        name VARCHAR(20),
        salary INT,
        commission_rate INT,
        hire_date VARCHAR(25),
        PRIMARY KEY(sales_id)
    );
INSERT INTO sales_person 
VALUES
        (1,'JOHN',100000,6,'4/1/2006'),
        (2,'AMY',12000,5,'5/1/2010'),
        (3,'MARK',65000,12,'12/25/2008'),
        (4,'PAM',25000,25,'1/1/2005'),
        (5,'ALEX',5000,10,'2/3/2007');

CREATE TABLE company(
        company_id INT,
        name VARCHAR(20),
        city VARCHAR(10),
        PRIMARY KEY(company_id)
    );
INSERT INTO company 
VALUES
        (1,'RED','BOSTON'),
        (2,'ORANGE','NEW YORK'),
        (3,'YELLOW','BOSTON'),
        (4,'GREEN','AUSTIN');

CREATE TABLE orders2(
        order_id INT,
        order_date DATE,
        company_id INT,
        sales_id INT,
        amount INT,
        PRIMARY KEY(order_id),
        CONSTRAINT company_fk FOREIGN KEY (company_id) REFERENCES company(company_id),
        CONSTRAINT sales_fk FOREIGN KEY (sales_id) REFERENCES sales_person(sales_id)
    );
INSERT INTO orders2 
VALUES
        (1, '2014-01-01', 3, 4, 10000),
        (2, '2014-02-01', 4, 5, 5000),
        (3, '2014-03-01', 1, 1, 50000),
        (4, '2014-04-01', 1, 4, 25000); 
SELECT name
FROM sales_person
WHERE sales_id NOT IN (
               SELECT o2.sales_id
               FROM orders2 o2 
               JOIN company c 
               ON o2.company_id = c.company_id
               WHERE c.name = 'RED' );