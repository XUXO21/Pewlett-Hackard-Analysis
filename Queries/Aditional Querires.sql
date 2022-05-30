--Unique Title and Departament: 

SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO titles_department
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT * FROM title_department

-- Roles that will be needed to be fill title and department

SELECT td.dept_name, td.title, COUNT(td.title) 
INTO roles_to_fill
FROM (SELECT title, dept_name from title_and_department) as td
GROUP BY td.dept_name, td.title
ORDER BY td.dept_name DESC;

SELECT * FROM roles_to_fill
