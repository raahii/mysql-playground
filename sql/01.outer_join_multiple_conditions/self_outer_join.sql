-- R3秋 DB 午前2 問8

USE outer_join_multiple_conditions;

SELECT
  C1.emp_code,
  C1.certification AS cert1,
  C2.certification AS cert2
FROM
  employee_certifications C1
  LEFT OUTER JOIN employee_certifications C2 ON C1.emp_code = C2.emp_code
  AND C1.certification = 'FE'
  AND C2.certification = 'AP'
WHERE
  C1.certification = 'FE';

-- +----------+-------+-------+
-- | emp_code | cert1 | cert2 |
-- +----------+-------+-------+
-- | S001     | FE    | AP    |
-- | S002     | FE    | NULL  |
-- | S003     | FE    | NULL  |
-- +----------+-------+-------+


-- confirmation left outer join result
SELECT
  C1.emp_code,
  C1.certification,
  C2.emp_code,
  C2.certification
FROM
  employee_certifications C1
  LEFT OUTER JOIN employee_certifications C2 ON C1.emp_code = C2.emp_code
  AND C1.certification = 'FE'
  AND C2.certification = 'AP'

-- +----------+---------------+----------+---------------+
-- | emp_code | certification | emp_code | certification |
-- +----------+---------------+----------+---------------+
-- | S001     | FE            | S001     | AP            |
-- | S001     | AP            | NULL     | NULL          |
-- | S001     | DB            | NULL     | NULL          |
-- | S002     | FE            | NULL     | NULL          |
-- | S002     | SM            | NULL     | NULL          |
-- | S003     | FE            | NULL     | NULL          |
-- | S004     | AP            | NULL     | NULL          |
-- | S005     | NULL          | NULL     | NULL          |
-- +----------+---------------+----------+---------------+

