-- Question 19: Average salary in each department.
SELECT dept_name, AVG(salary) AS avg_salary
FROM   instructor
GROUP  BY dept_name;