USE employees;

SELECT emp_no, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees AS e
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );

SELECT title, COUNT(title)
FROM titles
WHERE emp_no IN (SELECT emp_no
                 FROM employees
                 WHERE first_name = 'Aamod')
group by title;


SELECT first_name, last_name
FROM employees e
WHERE e.gender = 'F'
  And emp_no IN (SELECT emp_no
                 FROM dept_manager
                 WHERE to_date > NOW());



SELECT dept_name
FROM departments as d
         JOIN dept_manager as dm on dm.dept_no= d.dept_no
WHERE dm.emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE gender ='f'
      AND to_date > NOW()
);





SELECT dept_name
FROM employees as e
JOIN dept_manager as dm on dm.emp_no = e.emp_no
JOIN departments as d on d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
  AND e.gender = 'F'
ORDER BY dept_name;


SELECT first_name, last_name
FROM employees as e
         JOIN salaries s
              ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
ORDER BY salary DESC
LIMIT 1;




