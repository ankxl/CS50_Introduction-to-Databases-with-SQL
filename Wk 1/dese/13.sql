--

SELECT *
FROM districts
INNER JOIN staff_evaluations
ON staff_evaluations.district_id = districts.id
WHERE needs_improvement > (
                            SELECT AVG(needs_improvement)
                            FROM staff_evaluations
                            ) AND
        unsatisfactory > 0;

