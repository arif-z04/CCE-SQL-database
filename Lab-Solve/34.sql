-- Question 34: Average instructor salary for departments with avg salary > $42,000.
SELECT dept_name, AVG(salary) AS avg_salary
FROM   instructor
GROUP  BY dept_name
HAVING AVG(salary) > 42000;