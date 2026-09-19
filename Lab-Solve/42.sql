-- Question 42: Maximum enrollment across all sections in Autumn-2009.
SELECT MAX(enrollment) AS max_enrollment
FROM   (SELECT COUNT(*) AS enrollment
         FROM   takes
         WHERE  semester = 'Fall' AND year = 2009
         GROUP  BY course_id, sec_id);