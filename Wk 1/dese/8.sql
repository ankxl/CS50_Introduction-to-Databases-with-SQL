-- SQL query to display the names of all school districts and the number of pupils enrolled in each.

SELECT name, pupils
FROM districts
INNER JOIN expenditures
on districts.id = expenditures.district_id;

