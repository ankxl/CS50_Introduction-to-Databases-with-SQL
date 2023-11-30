-- SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).



SELECT name
FROM districts
INNER JOIN expenditures
on districts.id = expenditures.district_id
WHERE expenditures.pupils = (
                        SELECT pupils
                        FROM expenditures
                        ORDER BY pupils ASC
                        LIMIT 1
                    );
