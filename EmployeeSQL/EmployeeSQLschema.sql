-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Folder Name with tables is Data

DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE "titles" (
    "title_id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(255)   NOT NULL,
	PRIMARY KEY (title_id)
    -- CONSTRAINT "pk_titles" PRIMARY KEY ( "title_id")
);

CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(30)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(255)   NOT NULL,
    "last_name" VARCHAR(255)   NOT NULL,
    "sex" VARCHAR(30)   NOT NULL,
    "hire_date" DATE   NOT NULL,
	PRIMARY KEY (emp_no),
	FOREIGN KEY("emp_title_id") REFERENCES "titles" ("title_id")
    -- CONSTRAINT "pk_employees" PRIMARY KEY ("emp_no")
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
	
);

CREATE TABLE "departments" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "dept_name" VARCHAR(255)   NOT NULL,
	PRIMARY KEY (dept_no)
    --CONSTRAINT "pk_departments" PRIMARY KEY ("dept_no")
);

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
	FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no")
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "emp_no" INT   NOT NULL,
	FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
	FOREIGN KEY("emp_no")  REFERENCES "employees" ("emp_no")
);


-- NOTE: Import CSV file into a table using pgAdmin

