-- H23 春 DB 午前2 問11
USE employees;

-- 社員表から男女それぞれの最年長社員を除く全ての社員を取り出す
-- まず gender 別最年長社員の生年月日を確認
SELECT
    gender
    , MIN(birth_date)
FROM
    employees
GROUP BY
    gender;

-- 社員表から男女それぞれの最年長社員を除く全ての社員を取り出す
---- めちゃめちゃ遅い
---- サブクエリ内のテーブル結果がキャッシュされてない？
---- WHERE 句が動的に変わるので無理なのかも
SELECT
    emp_no
    , CONCAT(first_name , ' ' , last_name) AS name
    , gender
    , birth_date
FROM
    employees AS e1
WHERE
    e1.birth_date > (
        SELECT
            MIN(birth_date)
        FROM
            employees AS e2
        WHERE
            e1.gender = e2.gender)
ORDER BY
    gender
    , birth_date ASC
LIMIT 10;

-- view 使ってみるとすぐ終わる
WITH oldest_birthdates AS (
    SELECT
        gender
        , MIN(birth_date) AS birth_date
    FROM
        employees
    GROUP BY
        gender
)
SELECT
    emp_no
    , CONCAT(first_name , ' ' , last_name) AS name
    , gender
    , birth_date
FROM
    employees AS e
WHERE
    e.birth_date > (
        SELECT
            birth_date
        FROM
            oldest_birthdates AS o
        WHERE
            e.gender = o.gender)
ORDER BY
    gender
    , birth_date ASC
LIMIT 10;

