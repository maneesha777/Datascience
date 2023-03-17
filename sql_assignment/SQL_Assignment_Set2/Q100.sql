/* Q.100 
Write a query to return the IDs of these LinkedIn power creators in ascending order. 
This means that if someone's Linkedin page has more followers than all the companies they work for, we can safely assume that person is a Power Creator. 
Keep in mind that if aperson works at multiple companies, we should take into account the company with the most followers.*/

CREATE TABLE personal_profiles(
	profile_id INT,
	name VARCHAR(20),
	followers INT
	);
INSERT INTO personal_profiles 
VALUES
	(1,'NICK SINGH',92000),
	(2,'ZACH WILSON',199000),
	(3,'DALIANA LIU',171000),
	(4,'RAVIT JAIN',107000),
	(5,'VIN VASHISHTA',139000),
	(6,'SUSAN WOJCICKI',39000);

CREATE TABLE employee_company(
	personal_profile_id INT,
	company_id INT
	);
INSERT INTO employee_company 
VALUES
	(1,4),
	(1,9),
	(2,2),
	(3,1),
	(4,3),
	(5,6),
	(6,5);

CREATE TABLE company_pages(
	company_id INT,
	name VARCHAR(30),
	followers INT
	);
INSERT INTO company_pages 
VALUES
	(1,'THE DATA SCIENCE PODCAST',8000),
	(2,'AIRBNB',700000),
	(3,'THE RAVIT SHOW',6000),
	(4,'DATA LEMUR',200),
	(5,'YOUTUBE',16000000),
	(6,'DATASCIENCE.VIN',4500),
	(9,'ACE THE DATA SCIENCE INTERVIEW',4479);
 
 WITH modi_table AS ( SELECT pp.profile_id,
							pp.followers,
							MAX(cp.followers) OVER(PARTITION BY pp.profile_id) AS max_followers
					FROM employee_company ec
                    JOIN company_pages cp
					ON ec.company_id = cp.company_id
                    JOIN personal_profiles pp 
                    ON pp.profile_id = ec.personal_profile_id
                    )
 SELECT DISTINCT mt.profile_id
FROM modi_table mt
WHERE mt.followers > mt.max_followers;

