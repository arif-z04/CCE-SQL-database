-- Question 17: Average salary in the Finance department.
SELECT AVG(salary) AS avg_salary
FROM   instructor
WHERE  dept_name = 'Finance';