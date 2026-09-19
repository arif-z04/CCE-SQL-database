-- Question 6: Names of instructors whose salary is greater than at least one
-- instructor in the Biology department.
SELECT name
FROM   instructor
WHERE  salary > (SELECT MIN(salary)
                 FROM   instructor
                 WHERE  dept_name = 'Biology');