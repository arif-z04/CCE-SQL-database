-- Question 57: Room number and building for courses that a student from Fall-2009
-- can take (i.e. sections offered in Fall-2009).
SELECT DISTINCT sec.building, sec.room_number
FROM   section sec
WHERE  sec.semester = 'Fall'
       AND sec.year     = 2009;