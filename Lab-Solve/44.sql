-- Question 44: All students who have not taken a single course.
SELECT s.ID, s.name
FROM   student s
       LEFT JOIN takes t ON t.ID = s.ID
WHERE  t.course_id IS NULL;