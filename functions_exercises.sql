use employees;

SELECT *
FROM employees
WHERE first_name IN ('Irena' , 'Vidya', 'Maya')
  AND gender = 'M'
ORDER BY last_name DESC, first_name ASC;

SELECT CONCAT(first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE '%e'
ORDER BY last_name;

SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

SELECT CONCAT(first_name, ' ', last_name), DATEDIFF(curdate(), hire_date)
FROM employees
WHERE birth_date LIKE '%-12-25'
  AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY DATEDIFF(curdate(), hire_date);


SELECT DISTINCT *
FROM employees
WHERE last_name LIKE '%q%'
ORDER BY last_name;