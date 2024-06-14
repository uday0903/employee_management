-- Create tables for employees, departments, and salaries
CREATE TABLE IF NOT EXISTS employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT,
    hire_date DATE
);

CREATE TABLE IF NOT EXISTS departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS salaries (
    employee_id INT,
    salary DECIMAL(10, 2),
    from_date DATE,
    to_date DATE
);

-- Insert sample data if needed
-- INSERT INTO departments (department_id, department_name) VALUES
-- (1, 'Engineering'), (2, 'Marketing'), (3, 'Finance');

-- INSERT INTO employees (employee_id, first_name, last_name, department_id, hire_date) VALUES
-- (1, 'John', 'Doe', 1, '2023-05-15'), (2, 'Jane', 'Smith', 2, '2023-08-20');

-- INSERT INTO salaries (employee_id, salary, from_date, to_date) VALUES
-- (1, 60000.00, '2023-05-15', '2024-05-15'), (2, 70000.00, '2023-08-20', '2024-08-20');

-- SQL Queries

-- 1. Find all employees hired in the last year
SELECT *
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);

-- 2. Calculate the total salary expenditure for each department
SELECT d.department_name, SUM(s.salary) AS total_salary_expenditure
FROM departments d
JOIN employees e ON d.department_id = e.department_id
JOIN salaries s ON e.employee_id = s.employee_id
GROUP BY d.department_name;

-- 3. Find the top 5 highest-paid employees along with their department names
SELECT e.first_name, e.last_name, d.department_name, s.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
JOIN salaries s ON e.employee_id = s.employee_id
ORDER BY s.salary DESC
LIMIT 5;
