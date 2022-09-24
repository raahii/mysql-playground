DROP
  DATABASE IF EXISTS fk_test;

CREATE DATABASE fk_test;

USE fk_test;

CREATE TABLE
  departments (
    dept_code INT NOT NULL,
    name VARCHAR(14) NOT NULL,
    PRIMARY KEY (dept_code)
  );

CREATE TABLE
  employees (
    emp_code INT NOT NULL,
    name VARCHAR(14) NOT NULL,
    dept_code INT,
    PRIMARY KEY (emp_code),
    FOREIGN KEY fk_emp_dept (dept_code) REFERENCES departments (dept_code) ON DELETE CASCADE ON UPDATE NO ACTION
  );
