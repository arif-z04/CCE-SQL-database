-- Question 46: Student names who take any Spring-2010 course held in Watson building.
SELECT DISTINCT s.name
FROM   student s
       JOIN takes   t  ON t.ID = s.ID
       JOIN section sec ON sec.course_id = t.course_id
                         AND sec.sec_id    = t.sec_id
                         AND sec.semester  = t.semester
                         AND sec.year      = t.year
WHERE  sec.semester = 'Spring'
       AND sec.year     = 2010
       AND sec.building = 'Watson';