/* Create a database for an employee management system with tables for departments, employees, projects, employee-project assignments, and salaries. */

CREATE DATABASE employee_db;

USE employee_db;

/* Department Table */
CREATE TABLE departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL
);


/* Employee Table */
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_name VARCHAR(100),
    dept_id INT,
    manager_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);


/* Project Table */
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100)
);


/* Employee-Project Assignment Table */
CREATE TABLE employee_projects (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);


/* Salary Table */
CREATE TABLE salaries (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    salary DECIMAL(10,2),
    effective_date DATE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);



/* Inserting Records: */

INSERT INTO departments (dept_name) VALUES
('HR'),
('IT'),
('Finance');

INSERT INTO employees (emp_name, dept_id, manager_id, hire_date) VALUES
('Zeel', 2, NULL, '2022-01-10'),    
('Dhruv', 2, 1, '2022-03-15'),        
('Khwahish', 1, NULL, '2021-07-20'),  
('Harsh', 2, 1, '2023-02-01'),       
('Janvi', 3, NULL, '2020-11-05');     


INSERT INTO projects (project_name) VALUES
('Website Development'),
('Mobile App'),
('Payroll System');

INSERT INTO employee_projects (emp_id, project_id) VALUES
(1, 1), 
(1, 2),  
(2, 1),  
(2, 2),  
(3, 3),  
(4, 1),  
(5, 3);  

INSERT INTO salaries (emp_id, salary, effective_date) VALUES
(1, 90000, '2024-01-01'),
(2, 60000, '2024-01-01'),
(3, 70000, '2024-01-01'),
(4, 55000, '2024-01-01'),
(5, 80000, '2024-01-01');
