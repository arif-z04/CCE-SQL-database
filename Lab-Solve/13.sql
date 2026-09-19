-- Question 13: Distinct courses taught in Fall-2009 OR Spring-2010.
SELECT DISTINCT course_id
FROM   teaches
WHERE  (semester = 'Fall'   AND year = 2009)
    OR (semester = 'Spring' AND year = 2010);