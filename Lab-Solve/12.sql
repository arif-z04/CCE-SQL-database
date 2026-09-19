-- Question 12: Distinct courses taught in Fall-2009.
SELECT DISTINCT course_id
FROM   teaches
WHERE  semester = 'Fall' AND year = 2009;