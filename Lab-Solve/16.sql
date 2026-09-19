-- Question 16: Instructors with NULL salary values.
SELECT *
FROM   instructor
WHERE  salary IS NULL;