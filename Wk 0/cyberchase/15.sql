/*
SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode
*/
SELECT SUBSTR("air_date",1,4) AS "year", MIN(SUBSTR("air_date",6,10)) AS "Month-Date"
FROM "episodes"
GROUP BY SUBSTR("air_date",1,4);