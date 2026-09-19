-- Question 28: Names of instructors whose salary is greater than every instructor
-- in the Biology department.
SELECT name
FROM   instructor
WHERE  salary > (SELECT MAX(salary)
                 FROM   instructor
                 WHERE  dept_name = 'Biology');