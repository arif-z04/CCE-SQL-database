-- Question 49: Number of students taking the course titled 'Intro. to Computer Science'.
SELECT COUNT(DISTINCT t.ID) AS student_count
FROM   takes t
       JOIN course c ON c.course_id = t.course_id
WHERE  c.title = 'Intro. to Computer Science';