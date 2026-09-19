-- Question 14: Distinct courses taught in BOTH Fall-2009 AND Spring-2010.
SELECT course_id
FROM   teaches
WHERE  semester = 'Fall'   AND year = 2009
INTERSECT
SELECT course_id
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;