CREATE DATABASE IF NOT EXISTS outer_join_multiple_conditions;

USE outer_join_multiple_conditions;

CREATE TABLE
  employee_certifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    emp_code VARCHAR(10),
    certification VARCHAR(10)
  );

INSERT INTO
  employee_certifications (emp_code, certification)
VALUES
  ('S001', 'FE'),
  ('S001', 'AP'),
  ('S001', 'DB'),
  ('S002', 'FE'),
  ('S002', 'SM'),
  ('S003', 'FE'),
  ('S004', 'AP'),
  ('S005', NULL)
