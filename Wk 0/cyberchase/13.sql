/*

*/
SELECT "title", "season","episode_in_season"
FROM "episodes"
WHERE ("season" = 6) OR ("season" = 8 AND "title" LIKE '%g%');