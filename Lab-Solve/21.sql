-- Question 21: Departments where the average instructor salary is greater than $42,000.
SELECT dept_name
FROM   instructor
GROUP  BY dept_name
HAVING AVG(salary) > 42000;