-- Question 36: All departments along with the number of instructors in each.
SELECT d.dept_name, COUNT(i.ID) AS instructor_count
FROM   department d
       LEFT JOIN instructor i ON i.dept_name = d.dept_name
GROUP  BY d.dept_name;