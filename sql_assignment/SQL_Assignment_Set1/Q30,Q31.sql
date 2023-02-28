/*
Q30.
Table: NPV
Column Name Type
id int
year int
npv int
(id, year) is the primary key of this table.
The table has information about the id and the year of each inventory and the corresponding net present value.

Table: Queries
Column Name Type
id int
year int
(id, year) is the primary key of this table.
The table has information about the id and the year of each inventory query.

Write an SQL query to find the npv of each query of the Queries table.
Return the result table in any order */

CREATE TABLE npv(
        id INT,
        year INT,
        npv INT,
	    CONSTRAINT pK_npv PRIMARY KEY(id, year)
	);
INSERT INTO npv 
VALUES
        (1,2018,100),
        (7,2020,30),
        (13,2019,40),
        (1,2019,113),
        (2,2008,121),
        (3,2009,12),
        (11,2020,99),
        (7,2019,0);

CREATE TABLE queries(
        id INT,
        year INT,
        CONSTRAINT pk_queries PRIMARY KEY(id, year)
	);

INSERT INTO queries 
VALUES
        (1,2019),
        (2,2008),
        (3,2009),
        (7,2018),
        (7,2019),
        (7,2020),
        (13,2019);
SELECT q.id, q.year, IFNULL(n.npv,0 ) AS npv
FROM npv n
RIGHT JOIN queries q
    ON n.id = q.id AND n.year = q.year;
    


