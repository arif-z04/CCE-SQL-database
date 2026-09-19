-- Question 31: Find every student who has taken all courses offered by the
-- Biology department.
SELECT s.ID, s.name
FROM   student s
WHERE  NOT EXISTS (SELECT c.course_id
                    FROM   course c
                    WHERE  c.dept_name = 'Biology'
                    AND    NOT EXISTS (SELECT 1
                                        FROM   takes t
                                        WHERE  t.ID = s.ID
                                        AND    t.course_id = c.course_id));