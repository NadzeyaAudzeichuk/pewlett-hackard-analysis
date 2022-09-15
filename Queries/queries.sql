SELECT * FROM departments;

SELECT * FROM employees;
SELECT * FROM titles;

SELECT count(emp_no)
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

SELECT r.emp_no, r.first_name, r.last_name, de.to_date
FROM retirement_info as r
LEFT JOIN dept_emp as de
ON r.emp_no=de.emp_no;

SELECT d.dept_name,dm.emp_no,dm.from_date,dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT r.emp_no, r.first_name, r.last_name, de.to_date
INTO current_emp
FROM retirement_info as r
LEFT JOIN dept_emp as de
ON r.emp_no=de.emp_no
WHERE de.to_date=('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no) as Emplyee_count, de.dept_no
INTO currrent_emp_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no=de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

-- Employee Information eligible to retire 
SELECT e.emp_no, e.first_name, e.last_name, e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	 AND (de.to_date = '9999-01-01');

-- List of managers per department
SELECT dm.dept_no, 
	d.dept_name, 
    ce.first_name, ce.last_name,
	dm.from_date, dm.to_date
INTO manager_info
FROM dept_manager as dm
	INNER JOIN departments as d
	ON (dm.dept_no=d.dept_no)
	INNER JOIN current_emp as ce
	ON (dm.emp_no=ce.emp_no)

--Department Retirees: An updated current_emp list 
--that includes everything it currently has, but also the employee's departments
SELECT ce.emp_no, ce.first_name, ce.last_name,
	d.dept_name
INTO dept_info
FROM current_emp as ce
	INNER JOIN dept_emp AS de
	ON (ce.emp_no = de.emp_no)
	INNER JOIN departments AS d
	ON (de.dept_no = d.dept_no);

-- Retire employee from Sales and Development dept
SELECT ce.emp_no, ce.first_name, ce.last_name,
	d.dept_name
INTO retire_sales_developmente
FROM current_emp as ce
	INNER JOIN dept_emp as de
	ON (ce.emp_no=de.emp_no)
	INNER JOIN departments as d
	ON (de.dept_no=d.dept_no)
WHERE dept_name IN ('Sales','Development');
