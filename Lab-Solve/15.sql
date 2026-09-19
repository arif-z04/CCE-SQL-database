-- Question 15: Distinct courses taught in Fall-2009 but NOT in Spring-2010.
SELECT course_id
FROM   teaches
WHERE  semester = 'Fall'   AND year = 2009
EXCEPT
SELECT course_id
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;