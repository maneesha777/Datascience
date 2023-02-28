/* Q.108 
a. Query an alphabetically ordered list of all names in OCCUPATIONS, immediately followed 
   by the first letter of each profession AS a parenthetical (i.e.: enclosed in parentheses). 

b. WHERE [occupation_COUNT] is the number of occurrences of an occupation in OCCUPATIONS and [occupation] 
   is the lowerCASE occupation name. If more than one Occupation hAS the same [occupation_COUNT], 
   they should be ordered alphabetically. */

CREATE TABLE occupations(
		name VARCHAR(20),
		occupation VARCHAR(20)
	);
INSERT INTO occupations 
VALUES
		('SAMNATHA','DOCTOR'),
		('JULIA','ACTOR'),
		('MARIA','ACTOR'),
		('MEERA','SINGER'),
		('ASHLEY','PROFESSOR'),
		('KETTY','PROFESSOR'),
		('CHRISTEEN','PROFESSOR'),
		('JANE','ACTOR'),
		('JENNY','DOCTOR'),
		('PRIYA','SINGER');
-- a--
SELECT CONCAT(name, '(',substring(occupation, 1, 1),')') as `name(occupation)`
FROM occupations 
ORDER BY name;

-- b --
SELECT CONCAT('There are a total of ', COUNT(occupation),' ', LOWER(occupation),'s.') AS ' '
FROM occupations 
GROUP BY occupation
ORDER BY COUNT(occupation), occupation