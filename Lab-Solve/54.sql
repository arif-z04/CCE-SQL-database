-- Question 54: Student with the maximum tot_cred in each department.
SELECT s.dept_name, s.ID, s.name, s.tot_cred
FROM   student s
WHERE  s.tot_cred = (SELECT MAX(tot_cred)
                     FROM   student s2
                     WHERE  s2.dept_name = s.dept_name);