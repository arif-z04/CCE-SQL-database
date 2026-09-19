-- Question 43: Salaries after a 10% raise for instructors in Comp. Sci.
SELECT ID, name, salary * 1.10 AS new_salary
FROM   instructor
WHERE  dept_name = 'Comp. Sci.';