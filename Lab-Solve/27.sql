-- Question 27: Names & IDs of instructors whose salary is greater than at least
-- one instructor in History.
SELECT ID, name
FROM   instructor
WHERE  salary > (SELECT MIN(salary)
                 FROM   instructor
                 WHERE  dept_name = 'History');