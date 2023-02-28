/* Q.109 Pivot the Occupation column in OCCUPATIONS so that each Name is sorted alphabetically 
   and displayed underneath its corresponding Occupation. The output column headers should be 
   Doctor, Professor, Singer, and Actor, respectively. */
   
   -- Input table same as previous question i.e. Q108
   SELECT   
     MAX(CASE WHEN occupation = 'DOCTOR' THEN name END) AS DOCTOR,
     MAX(CASE WHEN occupation = 'PROFESSOR' THEN name END) AS PROFESSOR,
     MAX(CASE WHEN occupation = 'SINGER' THEN name END) AS SINGER,
     MAX(CASE WHEN occupation = 'ACTOR' THEN name END) AS ACTOR
   FROM (
          SELECT name,
                 occupation,
                 ROW_NUMBER() OVER(PARTITION BY occupation ORDER BY name) AS rn
		   FROM occupations
		) AS base
   GROUP BY rn;
   
   SELECT 
        MAX(CASE WHEN occupation = 'Doctor' then name END) AS Doctor,
        MAX(CASE WHEN occupation = 'Professor' then name END) AS Professor,
        MAX(CASE WHEN occupation = 'Singer' then name END) AS Singer,
        MAX(CASE WHEN occupation = 'Actor' then name END) AS Actor
FROM 
        (
            SELECT 
                    name,
                    occupation,
                    row_number() over(partition by occupation order by name) AS row_num 
            FROM 
                    occupations
        ) AS base 
GROUP BY 
        row_num;
 