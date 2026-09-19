-- Question 38: Distinct IDs of students taught by an instructor named 'Einstein'.
SELECT DISTINCT t.ID
FROM   takes  t
       JOIN teaches te ON te.course_id = t.course_id
                       AND te.sec_id    = t.sec_id
                       AND te.semester  = t.semester
                       AND te.year      = t.year
       JOIN instructor i ON i.ID = te.ID
WHERE  i.name = 'Einstein';