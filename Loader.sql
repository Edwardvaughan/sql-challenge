-- This program loads each table from its corresponding CSV file. --

/* To load into table titles, to avoid an error, first create a temporary table of
the same format.  Load into the temporary table first, then select from it unique
values of title_id and load into titles. */

CREATE TEMP TABLE temp_table_1 ON COMMIT DROP AS SELECT * FROM titles WITH NO DATA;
COPY temp_table_1 FROM 'C:\Program Files\PostgreSQL\14\data\titles.csv' DELIMITER ',' CSV HEADER;
INSERT INTO titles SELECT DISTINCT ON (title_id) * FROM temp_table_1 ORDER BY (title_id);

-- To avoid another error, set the DateStyle for table employees. --

SET DateStyle = 'ISO, mdy';
COPY employees FROM 'C:\Program Files\PostgreSQL\14\data\employees.csv' DELIMITER ',' CSV HEADER;

COPY departments FROM 'C:\Program Files\PostgreSQL\14\data\departments.csv' DELIMITER ',' CSV HEADER;

COPY salaries FROM 'C:\Program Files\PostgreSQL\14\data\salaries.csv' DELIMITER ',' CSV HEADER;

-- Table dept_emp is treated in a similar way to table titles. --

CREATE TEMP TABLE temp_table_2 ON COMMIT DROP AS SELECT * FROM dept_emp WITH NO DATA;
COPY temp_table_2 FROM 'C:\Program Files\PostgreSQL\14\data\dept_emp.csv' DELIMITER ',' CSV HEADER;
INSERT INTO dept_emp SELECT DISTINCT ON (emp_no) * FROM temp_table_2 ORDER BY (emp_no);

COPY dept_manager FROM 'C:\Program Files\PostgreSQL\14\data\dept_manager.csv' DELIMITER ',' CSV HEADER;