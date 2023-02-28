/*
Table: Users
Column Name Type
user_id int
name varchar
mail varchar

user_id is the primary key for this table.
This table contains information of the users signed up in a website. Some emails are invalid.

Write an SQL query to find the users who have valid emails.
A valid e-mail has a prefix name and a domain where:
● The prefix name is a string that may contain letters (upper or lower case), digits, underscore
'_', period '.', and/or dash '-'. The prefix name must start with a letter.
● The domain is '@leetcode.com'.
Return the result table in any order.
The query result format is in the following example */

CREATE TABLE users(
		user_id INT,
		name VARCHAR(25),
		mail VARCHAR(100),
		PRIMARY KEY(user_id)
	);

INSERT INTO users 
VALUES 
        (1,'WINSTON','winston@leetcode.com'),
        (2,'JONATHAN','jonathonisgreat'),
        (3,'ANNABELLE','bella-@leetcode.com'),
        (4,'SALLY','sally.come@leetcode.com'),
        (5,'MARWAN','quarz#2020@leetcode.com'),
        (6,'DAVID','david69@gmail.com'),
        (7,'SHAPIRO','.shapo@leetcode.com');

SELECT user_id, name, mail
FROM users
WHERE mail REGEXP '^[A-Z]+[A-Z 0-9 \_ \. \-]*@leetcode.com$';
