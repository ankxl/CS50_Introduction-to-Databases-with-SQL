-- SQL query to find all teams that Satchel Paige played for.
-- Your query should return a table with a single column, one for the name of the teams.

SELECT DISTINCT teams.name
FROM players
INNER JOIN performances
ON players.id = performances.player_id
INNER JOIN teams
ON teams.id = performances.team_id
WHERE players.first_name = "Satchel" AND
        last_name = "Paige";


