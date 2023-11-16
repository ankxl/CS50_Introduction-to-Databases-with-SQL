/*
SQL query to find the titles of episodes that have aired during the holiday season, usually in December in the United States
*/
SELECT "title"
FROM "episodes"
WHERE "air_date" LIKE "____-12-__";