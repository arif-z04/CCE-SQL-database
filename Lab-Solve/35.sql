-- Question 35: Maximum total salary across all departments.
SELECT MAX(dept_total) AS max_total_salary
FROM   (SELECT SUM(salary) AS dept_total
         FROM   instructor
         GROUP  BY dept_name);