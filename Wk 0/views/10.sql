/*

*/
SELECT "english_title", "artist",ROUND("brightness"/"contrast",2) AS "Brightness to Contrast Ratio"
FROM "views"
WHERE "japanese_title" IS NOT NULL
ORDER BY "entropy" DESC;
