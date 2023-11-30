-- SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”.
-- Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary. Sort the results
-- first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).



SELECT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary
FROM districts
INNER JOIN expenditures
on districts.id = expenditures.district_id
INNER JOIN staff_evaluations
on staff_evaluations.district_id = districts.id
WHERE staff_evaluations.exemplary > (
                                        SELECT AVG(exemplary)
                                        FROM staff_evaluations
                                    ) AND
        expenditures.per_pupil_expenditure >(
                                                SELECT AVG(per_pupil_expenditure)
                                                FROM expenditures
                                            ) AND
        districts.type = "Public School District"
ORDER BY staff_evaluations.exemplary DESC, expenditures.per_pupil_expenditure DESC;


