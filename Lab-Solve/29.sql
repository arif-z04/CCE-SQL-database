-- Question 29: Departments with the highest average salary.
SELECT dept_name
FROM   instructor
GROUP  BY dept_name
HAVING AVG(salary) = (SELECT MAX(dept_avg)
                       FROM   (SELECT AVG(salary) AS dept_avg
                                FROM   instructor
                                GROUP  BY dept_name));