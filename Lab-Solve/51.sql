-- Question 51: Course titles whose start-time is between 10:00 and 12:00.
SELECT DISTINCT c.title
FROM   course    c
       JOIN section  sec ON sec.course_id = c.course_id
       JOIN time_slot ts ON ts.time_slot_id = sec.time_slot_id
WHERE  ts.start_hr = 10
    OR (ts.start_hr = 11 AND ts.start_min = 0)
    OR (ts.start_hr = 12 AND ts.start_min = 0);