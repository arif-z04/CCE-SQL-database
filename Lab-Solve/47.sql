-- Question 47: Students who take a course taught by 'Brandt'.
SELECT DISTINCT s.ID, s.name
FROM   student s
       JOIN takes   t  ON t.ID = s.ID
       JOIN teaches te ON te.ID = (SELECT ID FROM instructor WHERE name = 'Brandt')
                        AND te.course_id = t.course_id
                        AND te.sec_id    = t.sec_id
                        AND te.semester  = t.semester
                        AND te.year      = t.year;