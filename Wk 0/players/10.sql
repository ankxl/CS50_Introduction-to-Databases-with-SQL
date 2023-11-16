/*

*/

SELECT "first_name","last_name",ROUND("height"/"weight",2) AS "Height To Weight Ratio"
FROM "players"
WHERE "bats" = 'R' AND "throws" = 'L'
ORDER BY "Height To Weight Ratio" DESC, "first_name" ASC, "last_name";
