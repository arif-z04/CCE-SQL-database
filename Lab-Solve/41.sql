-- Question 41: Enrollment of every section that was offered in Autumn-2009.
SELECT course_id, sec_id, COUNT(*) AS enrollment
FROM   takes
WHERE  semester = 'Fall' AND year = 2009
GROUP  BY course_id, sec_id;