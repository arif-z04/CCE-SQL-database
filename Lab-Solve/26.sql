-- Question 26: Total number of distinct students taught by instructor ID 110011.
SELECT COUNT(DISTINCT t.ID) AS student_count
FROM   takes  t
       JOIN teaches te ON te.course_id = t.course_id
                       AND te.sec_id    = t.sec_id
                       AND te.semester  = t.semester
                       AND te.year      = t.year
WHERE  te.ID = 110011;