--  SQL query to find the players among the 10 least expensive players per hit and among the 10 least expensive players per RBI in 2001.
 -- Your query should return a table with two columns, one for the players’ first names and one of their last names.
-- You can calculate a player’s salary per RBI by dividing their 2001 salary by their number of RBIs in 2001.
-- You may assume, for simplicity, that a player will only have one salary and one performance in 2001.
-- Order your results by player ID, least to greatest (or alphabetically by last name, as both are the same in this case!).


SELECT first_name, last_name
FROM players
WHERE id in (
                SELECT salaries.player_id
                FROM performances
                INNER JOIN salaries
                on performances.player_id = salaries.player_id AND
                performances.year = salaries.year
                WHERE salaries.year = 2001 AND
                        performances.year = 2001 AND
                        H > 0
                ORDER BY (salary/H) ASC, performances.player_id ASC
                LIMIT 10
            )
INTERSECT
SELECT first_name, last_name
FROM players
WHERE id in (
                SELECT salaries.player_id
                FROM performances
                INNER JOIN salaries
                on performances.player_id = salaries.player_id AND
                performances.year = salaries.year
                WHERE salaries.year = 2001 AND
                        performances.year = 2001 AND
                        RBI > 0
                ORDER BY (salary/RBI) ASC, performances.player_id ASC
                LIMIT 10
            )
ORDER BY last_name ASC;


