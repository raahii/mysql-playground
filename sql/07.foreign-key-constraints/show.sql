USE fk_test;

ANALYZE TABLE departments,
employees;

SHOW INDEXES
FROM
  departments;

SHOW INDEXES
FROM
  employees;
