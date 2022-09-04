SET database = outer_join_multiple_conditions;
SELECT
    c1.emp_code,
    c1.certification AS cert1,
    c2.certification AS cert2
FROM
    employee_certifications AS c1
    LEFT JOIN employee_certifications AS c2 ON
            c1.emp_code = c2.emp_code
            AND c1.certification = 'FE'
            AND c2.certification = 'AP'
WHERE
    c1.certification = 'FE';
SELECT
    c1.emp_code,
    c1.certification,
    c2.emp_code,
    c2.certification
FROM
    employee_certifications AS c1
    LEFT JOIN employee_certifications AS c2 ON
            c1.emp_code = c2.emp_code
            AND c1.certification = 'FE'
            AND c2.certification = 'AP';
