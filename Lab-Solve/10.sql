-- Question 10: Names of instructors earning between $90,000 and $100,000.
SELECT name
FROM   instructor
WHERE  salary BETWEEN 90000 AND 100000;