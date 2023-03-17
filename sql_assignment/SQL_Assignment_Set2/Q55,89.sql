/* Q.55 
A telecommunications company wants to invest in new countries. The company intends to invest in
the countries where the average call duration of the calls in this country is strictly greater than the
global average call duration.
Write an SQL Query to find the countries where this company can invest .
Return the result table in any order .
*/

CREATE TABLE person(
        id INT,
        name VARCHAR(20),
        phone_number VARCHAR(20),
        PRIMARY KEY(id)
    );
INSERT INTO person 
VALUES 
        (3,'JONATHON','051-1234567'),
        (12,'ELVIS','051-7654321'),
        (1,'MONCEF','212-1234567'),
        (2,'MAROUA','212-6523651'),
        (7,'MEIR','972-1234567'),
        (9,'RACHEL','972-0011100');

CREATE TABLE country(
        name VARCHAR(20),
        country_code VARCHAR(20),
        PRIMARY KEY(country_code)
    );
INSERT INTO country 
VALUES 
        ('PERU','51'),
        ('ISRAEL','972'),
        ('MOROCCO','212'),
        ('GERMANY','49'),
        ('ETHIOPIA','251');

CREATE TABLE calls1(
        caller_id INT,
        callee_id INT,
        duration INT
    );
INSERT INTO calls1 
VALUES 
        (1,9,33),
        (2,9,4),
        (1,2,59),
        (3,12,102),
        (3,12,330),
        (12,3,5),
        (7,9,13),
        (7,1,3),
        (9,7,1),
        (1,7,7);
SELECT 



