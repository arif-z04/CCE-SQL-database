-- Question 40: All instructors earning the highest salary.
SELECT *
FROM   instructor
WHERE  salary = (SELECT MAX(salary) FROM instructor);