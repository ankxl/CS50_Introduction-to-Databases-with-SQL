-- SQL query to find the 50 players paid the least in 2001.
-- Sort players by salary, lowest to highest.
-- If two players have the same salary, sort alphabetically by first name and then by last name.
-- If two players have the same first and last name, sort by player ID.
-- Your query should return three columns, one for players’ first names, one for their last names, and one for their salaries.

SELECT first_name, last_name, salary
FROM salaries
INNER JOIN players
ON players.id = salaries.player_id
WHERE year = 2001
ORDER BY salary ASC, first_name ASC, last_name ASC, players.id
LIMIT 50;


