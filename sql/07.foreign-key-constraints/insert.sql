USE fk_test;

INSERT INTO
  departments
VALUES
  (1, 'EngineeringA'),
  (2, 'EngineeringB'),
  (3, 'ManagingA');

-- dept_code は NULL 許容なので入れられる
-- あくまで外部参照制約が効くのは非NULLの値に関してのみ
INSERT INTO
  employees
VALUES
  (1000, 'John', 1),
  (1001, 'Bob', NULL);

INSERT INTO
  employees
VALUES
  (1002, 'Kyle', 4);
