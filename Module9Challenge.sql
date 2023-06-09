-- Data Engineering --
-- Drop Tables if Existing
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

-- Exported from QuickDBD: Specifying Data Types, Primary Keys & Foreign Keys 
-- Import CSV Files Into Corresponding SQL Table

CREATE TABLE titles (
    title_id VARCHAR  NOT NULL ,
    title VARCHAR  NOT NULL ,
      PRIMARY KEY   (
        title_id 
    )
);


CREATE TABLE employees (
    emp_no INTEGER  NOT NULL ,
    emp_title_id VARCHAR  NOT NULL ,
    birth_date DATE  NOT NULL ,
    first_name VARCHAR  NOT NULL ,
    last_name VARCHAR  NOT NULL ,
    sex VARCHAR  NOT NULL ,
    hire_date DATE  NOT NULL ,
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id),
    PRIMARY KEY(
        emp_no 
    )
);

CREATE TABLE Departments (
    dept_no VARCHAR(10)  NOT NULL ,
    dept_name VARCHAR(30)  NOT NULL ,
    PRIMARY KEY  (
        dept_no 
    )
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(10)  NOT NULL ,
    emp_no INTEGER  NOT NULL ,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
     PRIMARY KEY  (
        dept_no ,emp_no 
    )
);

CREATE TABLE dept_emp (
    emp_no INTEGER  NOT NULL ,
    dept_no VARCHAR(10)  NOT NULL ,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no,dept_no)
);

CREATE TABLE salaries (
    emp_no INTEGER  NOT NULL ,
    salary INTEGER  NOT NULL ,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no) ,
    PRIMARY KEY  (
        emp_no 
    )
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");
 
 
SELECT * from titles ;
SELECT * from employees ;
SELECT * from departments ;
SELECT * from dept_manager ;
SELECT * from dept_emp ;
SELECT * from salaries ;
