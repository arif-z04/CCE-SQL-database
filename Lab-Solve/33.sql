-- Question 33: Courses offered at least twice in 2009.
SELECT course_id
FROM   section
WHERE  year = 2009
GROUP  BY course_id
HAVING COUNT(*) >= 2;