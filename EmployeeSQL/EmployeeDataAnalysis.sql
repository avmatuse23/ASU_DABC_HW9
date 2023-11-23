--Data Analysis

-- 1.List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, last_name, first_name, sex, salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no;

-- 2.List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE date_part('year', hire_date) = 1986;

-- 3.List the manager of each department along with their department number, department name,
--   employee number, last name, and first name.
SELECT departments.dept_no, departments.dept_name, employees.emp_no, 
		employees.last_name AS manager_last_name, employees.first_name AS manager_first_name
FROM departments
LEFT JOIN dept_manager 
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_manager.emp_no = employees.emp_no;

-- 4.List the department number for each employee along with that employee’s employee number,
--	 last name, first name, and department name.
SELECT departments.dept_no, employees.emp_no,
	   employees.last_name AS employee_last_name, employees.first_name AS employee_first_name,
	   departments.dept_name		
FROM departments
LEFT JOIN dept_emp 
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no;

-- 5.List first name, last name, and sex of each employee whose first name is Hercules and
--   whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

-- 6.List each employee in the Sales department, including their employee number, last name, and first name.
SELECT departments.dept_name, employees.emp_no,
	   employees.last_name AS employee_last_name, employees.first_name AS employee_first_name		
FROM departments
LEFT JOIN dept_emp 
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name = 'Sales';

-- 7.List each employee in the Sales and Development departments, 
--   including their employee number, last name, first name, and department name.
SELECT employees.emp_no,
	   employees.last_name AS employee_last_name, employees.first_name AS employee_first_name,
	   departments.dept_name
FROM departments
LEFT JOIN dept_emp 
ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees
ON dept_emp.emp_no = employees.emp_no
WHERE departments.dept_name IN  ('Sales', 'Development')
ORDER BY departments.dept_name DESC;

--8.List the frequency counts, in descending order, of all the employee last names 
--  (that is, how many employees share each last name).
SELECT last_name AS employee_last_name, COUNT(last_name) AS frequency_count
FROM employees
GROUP BY last_name
ORDER BY frequency_count DESC;


