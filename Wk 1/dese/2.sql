-- SELECT the names of the districts that are non-operational i.e. (non-op) in their name
SELECT name
FROM districts
WHERE name LIKE "%(non-op)";
