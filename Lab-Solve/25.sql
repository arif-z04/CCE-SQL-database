-- Question 25: Names of instructors whose names are neither 'Mozart' nor 'Einstein'.
SELECT name
FROM   instructor
WHERE  name <> 'Mozart' AND name <> 'Einstein';