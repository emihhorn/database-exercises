Use employees;

SELECT *
From employees
Where (first_name = 'Irena'
    OR first_name = 'Vidya'
    OR first_name = 'Maya')
    AND gender = 'm';


Select *
From employees
WHERE last_name Like 'E%'
  AND last_name Like '%E';



Select *
From employees
WHERE last_name Like '%q%'AND last_name NOT LIKE '%qu%';