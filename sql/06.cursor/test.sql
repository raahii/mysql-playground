USE employees;
DROP PROCEDURE IF EXISTS test_insert_proc;

DELIMITER //

CREATE PROCEDURE test_insert_proc()
BEGIN
  -- 変数を宣言(カーソル定義前に行う必要あり)
  -- カーソルから読み出した値を格納する変数を宣言
  DECLARE v_emp_no INT;
  DECLARE v_first_name VARCHAR(255);
  DECLARE v_last_name VARCHAR(255);
  DECLARE v_gender ENUM ('M','F');

  -- カーソルがデータセットの最後に達したか判定するための変数を宣言
  DECLARE done INT DEFAULT FALSE;

  -- カーソルを定義
  DECLARE myCursor CURSOR FOR
    SELECT `emp_no`, `first_name`, `last_name`, `gender`
    FROM `employees`
    ORDER BY emp_no
    LIMIT 10;

  -- カーソルがデータセットの最後に達したときの動作を制御
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

  -- カーソルをオープン
  OPEN myCursor;

  -- ループで1行ずつ処理
  read_loop: LOOP
    -- カーソルから1行読み出し
    FETCH myCursor INTO v_emp_no, v_first_name, v_last_name, v_gender;
    -- SELECT v_emp_no, v_first_name, v_last_name, v_gender;

    -- カーソルからの読み出しが最後に達していればループを抜ける
    IF done THEN
      LEAVE read_loop;
    END IF;

    -- 別テーブルにインサート
    INSERT INTO `employees_copy` VALUES (v_emp_no, v_first_name, v_last_name, v_gender);
  END LOOP;

  -- カーソルを閉じる
  CLOSE myCursor;
END//

DELIMITER ;

SELECT 'Before';
SELECT * FROM employees_copy;

CALL test_insert_proc();

SELECT 'After';
SELECT * FROM employees_copy;

DELETE FROM employees_copy;
