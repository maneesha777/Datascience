/* Q.111 
Given the table schemas below,
write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, 
total number of managers, and total number of employees. Order your output by ascending company_code. */

CREATE TABLE company1(
		company_code VARCHAR(20),
		founder VARCHAR(20)
	);
INSERT INTO company1 
VALUES
		('C1','MONIKA'),
		('C2','SAMANTHA');

CREATE TABLE lead_manager(
		lead_manager_code VARCHAR(20),
		company_code VARCHAR(20)
	);
INSERT INTO lead_manager 
VALUES
		('LM1','C1'),
		('LM2','C2');

CREATE TABLE senior_manager(
		senior_manager_code VARCHAR(20),
		lead_manager_code VARCHAR(20),
		company_code VARCHAR(20)
	);
INSERT INTO senior_manager 
VALUES
		('SM1','LM1','C1'),
		('SM2','LM1','C1'),
		('SM3','LM2','C2');  
        
CREATE TABLE manager(
		manager_code VARCHAR(20),
		senior_manager_code VARCHAR(20),
		lead_manager_code VARCHAR(20),
		company_code VARCHAR(20)
	);
INSERT INTO manager 
VALUES
		('M1','SM1','LM1','C1'),
		('M2','SM3','LM2','C2'),
		('M3','SM3','LM2','C2');  

CREATE TABLE employ(
		employee_code VARCHAR(20),
		manager_code VARCHAR(20),
		senior_manager_code VARCHAR(20),
		lead_manager_code VARCHAR(20),
		company_code VARCHAR(20)
	);
INSERT INTO employ
VALUES
		('E1','M1','SM1','LM1','C1'),
		('E2','M1','SM1','LM1','C1'),
		('E3','M2','SM3','LM2','C2'),
		('E4','M3','SM3','LM2','C2');

SELECT
  c.company_code,
  c.founder,
  COUNT(DISTINCT lm.lead_manager_code)AS lead_manager_count,
  COUNT(DISTINCT sm.senior_manager_code)AS senior_manager_count,
  COUNT(DISTINCT m.manager_code) AS manager_count,
  COUNT(DISTINCT e.employee_code) AS employeee_count
FROM lead_manager lm
LEFT JOIN senior_manager sm 
ON lm.lead_manager_code = sm.lead_manager_code
  
LEFT JOIN manager m 
ON m.senior_manager_code = sm.senior_manager_code
  
LEFT JOIN employ e 
ON e.manager_code = m.manager_code
  
LEFT JOIN company1 c 
ON c.company_code = lm.company_code
GROUP BY 
		c.company_code, 
		c.founder
ORDER BY c.company_code