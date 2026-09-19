-- Question 53: Student names who earned more than a B+ in any of their courses.
SELECT DISTINCT s.name
FROM   student s
       JOIN takes t ON t.ID = s.ID
WHERE  t.grade IN ('A-','A','A+','B');