-- Question 18: Total number of instructors who teach a course in Spring-2010.
SELECT COUNT(DISTINCT ID) AS instructor_count
FROM   teaches
WHERE  semester = 'Spring' AND year = 2010;