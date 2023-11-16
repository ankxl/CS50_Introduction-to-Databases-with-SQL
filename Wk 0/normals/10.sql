/*
QL query to determine how many points of latitude we have at least one data point for.
(Why might we not have data points for all latitudes?)
*/
SELECT COUNT(DISTINCT "latitude")
FROM "normals"
WHERE "0m" IS NOT NULL;
