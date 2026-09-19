-- Question 5: For every instructor who has taught some course, list their names
-- and the course IDs of all courses they taught.
SELECT DISTINCT i.name, t.course_id
FROM   instructor i
       JOIN teaches t ON t.ID = i.ID;