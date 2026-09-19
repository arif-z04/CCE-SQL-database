

-- Question 50: Total salary of Comp. Sci. instructors who teach a course in the
-- Watson building.
SELECT SUM(DISTINCT i.salary) AS total_salary
FROM   instructor i
       JOIN teaches   te ON te.ID = i.ID
       JOIN section   sec ON sec.course_id = te.course_id
                          AND sec.sec_id    = te.sec_id
                          AND sec.semester  = te.semester
                          AND sec.year      = te.year
WHERE  i.dept_name = 'Comp. Sci.'
       AND sec.building = 'Watson';