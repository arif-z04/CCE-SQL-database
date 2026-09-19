-- Question 22: For every course section offered in 2009 with at least 2 enrolled
-- students, the average total-credits (tot_cred) of those students.
SELECT t.course_id, t.sec_id, AVG(s.tot_cred) AS avg_tot_cred
FROM   takes  t
       JOIN student s ON s.ID = t.ID
WHERE  t.year = 2009
GROUP  BY t.course_id, t.sec_id
HAVING COUNT(*) >= 2;