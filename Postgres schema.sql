CREATE TABLE titles (
	title_id char(5) NOT NULL PRIMARY KEY,
	title varchar NOT NULL);
	
CREATE TABLE employees (
	emp_no int NOT NULL PRIMARY KEY,
	emp_title char(5) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles (title_id),
	birth_date date NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex char NOT NULL,
	hire_date date NOT NULL);
	
CREATE TABLE departments (
	dept_no char(4) NOT NULL PRIMARY KEY,
	dept_name varchar NOT NULL);
	
CREATE TABLE salaries (
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no), REFERENCES employees (emp_no),
	salary money NOT NULL);
	
CREATE TABLE dept_emp (
	emp_no int NOT NULL PRIMARY KEY,
	dept_no char(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no));
	
CREATE TABLE dept_manager (
	dept_no char(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES department (dept_no),
	emp_no int NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (dept_no, emp_no))