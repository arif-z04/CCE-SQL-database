-- Question 55: Student IDs and grades for any course taken in Spring-2009.
SELECT ID, grade
FROM   takes
WHERE  semester = 'Spring' AND year = 2009;