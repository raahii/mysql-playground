USE employees;

DROP TABLE IF EXISTS employees_copy;
CREATE TABLE employees_copy (
    emp_no      INT             NOT NULL,
    first_name  VARCHAR(14)     NOT NULL,
    last_name   VARCHAR(16)     NOT NULL,
    gender      ENUM ('M','F')  NOT NULL,
    PRIMARY KEY (emp_no)
);

