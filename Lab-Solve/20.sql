-- Question 20: Number of instructors per department who teach in Spring-2010.
SELECT i.dept_name, COUNT(DISTINCT i.ID) AS instructor_count
FROM   instructor i
       JOIN teaches t ON t.ID = i.ID
WHERE  t.semester = 'Spring' AND t.year = 2010
GROUP  BY i.dept_name;