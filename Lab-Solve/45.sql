-- Question 45: Physics sections offered in Fall-2009, with building and room number.
SELECT sec.course_id, sec.sec_id, sec.building, sec.room_number
FROM   section sec
       JOIN course c ON c.course_id = sec.course_id
WHERE  c.dept_name = 'Physics'
       AND sec.semester = 'Fall'
       AND sec.year     = 2009;