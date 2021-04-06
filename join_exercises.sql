USE employees;

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments as d
  ON d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01'
order by dept_name;

SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name
FROM employees as e
JOIN dept_manager as dm
  ON dm.emp_no = e.emp_no
JOIN departments d on d.dept_no = dm.dept_no
WHERE dm.to_date = '9999-01-01' AND e.gender = 'F'
ORDER BY dept_name;

SELECT t.title AS Title, COUNT(t.emp_no) AS Count
 From titles AS t
 Join dept_emp as de
   ON t.emp_no = de.emp_no
JOIN departments d on d.dept_no = de.dept_no
WHERE de.dept_no = 'd009'
  AND t.to_date = '9999-01-01'
  AND de.to_date = '9999-01-01'
GROUP BY t.title;


SELECT d.dept_name, CONCAT(e.first_name, ' ', e.last_name) AS full_name, salary
FROM employees as e
JOIN dept_manager as dm on dm.emp_no = e.emp_no
JOIN departments as d on d.dept_no = dm.dept_no
JOIN salaries s on e.emp_no = s.emp_no
WHERE dm.to_date = '9999-01-01'
  AND s.to_date = '9999-01-01'
ORDER BY dept_name;


#Bonus
select concat(employees.first_name, ' ', employees.last_name) as Employee,
       concat(departments.dept_name) as Department,
       concat(e.first_name, ' ', e.last_name) as Manager
from employees
         join dept_emp on dept_emp.emp_no = employees.emp_no
         join departments on departments.dept_no = dept_emp.dept_no
         join dept_manager on dept_manager.dept_no = departments.dept_no
         join employees as e on e.emp_no = dept_manager.emp_no
where dept_emp.to_date > now()
  and dept_manager.to_date > now()
order by departments.dept_name;



