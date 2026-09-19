-- Question 4: Names of Computer Science instructors earning more than $70,000.
SELECT name
FROM   instructor
WHERE  dept_name = 'Comp. Sci.'
       AND salary > 70000;