-- Question 52: Courses whose prerequisite is CS-101.
SELECT course_id
FROM   prereq
WHERE  prereq_id = 'CS-101';