-- Question 56: Building(s) where the student takes the course 'Image Processing'.
SELECT DISTINCT sec.building
FROM   section sec
       JOIN course c ON c.course_id = sec.course_id
WHERE  c.title = 'Image Processing';