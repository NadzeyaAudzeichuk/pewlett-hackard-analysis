--Retirement Titles table that holds all the titles of employees
--ready to retire
SELECT e.emp_no, e.first_name, e.last_name,
	t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
	ON e.emp_no=t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

-- Unique (the most recent titles) of each retiring employee
-- Grouped by title
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO retirement_unique_titles
FROM retirement_titles
WHERE to_date='9999-01-01'
ORDER BY emp_no, to_date DESC;

--Number of employees who are about to retire by job title
SELECT COUNT(emp_no) as emp_count, title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(emp_no) DESC;

-- Employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees as e
	INNER JOIN dept_emp as de
	ON e.emp_no=de.emp_no
	INNER JOIN titles as t
	ON e.emp_no=t.emp_no
WHERE de.to_date='9999-01-01' AND 
	(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31' )
ORDER BY emp_no;

-- Employees who are eligible to participate in a mentorship program including born in 1964
SELECT DISTINCT ON (e.emp_no) e.emp_no, e.first_name, e.last_name, e.birth_date,
	de.from_date, de.to_date,
	d.dept_name,t.title
INTO DEPT_TITLE_MENTOR
FROM employees as e
	INNER JOIN dept_emp as de
	ON e.emp_no=de.emp_no
	INNER JOIN departments as d
	ON de.dept_no=d.dept_no
	INNER JOIN titles as t
	ON e.emp_no=t.emp_no
WHERE de.to_date='9999-01-01' AND 
	(e.birth_date BETWEEN '1964-01-01' AND '1965-12-31' )
ORDER BY emp_no;

SELECT dept_name, count(emp_no) 
FROM DEPT_TITLE_MENTOR
group by dept_name
order by count(emp_no) desc;



