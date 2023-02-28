-- Q5. Query all attributes of every Japanese city in the CITY table.The COUNTRYCODE for Japan is JPN
SELECT *
FROM city_table
WHERE COUNTRYCODE = 'JPN';