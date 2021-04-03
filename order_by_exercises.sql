Use employees;

SELECT *
From employees
Where first_name IN ('Irena', 'Vidya')
    AND last_name IN ('Reutenauer', 'Demeyer')
    ORDER BY last_name ASC,
             first_name DESC ;


SELECT * , CONCAT (first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;

SELECT *
FROM employees
WHERE first_name IN ('Irene', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

Select *
From employees
WHERE last_name Like '%q%'AND last_name NOT LIKE '%qu%';

SELECT *, DATEDIFF(NOW(),hire_date) AS 'Days Employed'
FROM employees
WHERE MONTH(birth_date) = 12
AND DAY(birth_date) = 25
AND (
    YEAR (hire_date) BETWEEN 1990 AND 1999
    )
ORDER BY birth_date, hire_date DESC;






SELECT CONCAT(first_name,' ', last_name)
FROM employees
LIMIT 100;

SELECT DAYOFMONTH (birth_date)
FROM employees
LIMIT 100;

SELECT NOW();

SELECT UNIX_TIMESTAMP();

#INSERT INTO myTable (name, created_date)
#VALUES ('Emily', NOW());


