-- Question 37: Titles of Comp. Sci. courses worth 3 credits.
SELECT title
FROM   course
WHERE  dept_name = 'Comp. Sci.'
       AND credits = 3;