USE employees;

-- JOIN では AND で WHERE 句相当のことができる
-- 結合処理に関係のない絞り込みをしても OK （※関係なくはない）
--
-- +--------+------------+------------+--------+---------+-------------+
-- | emp_no | first_name | last_name  | gender | dept_no | dept_name   |
-- +--------+------------+------------+--------+---------+-------------+
-- |  10006 | Anneke     | Preusig    | F      | d005    | Development |
-- |  10018 | Kazuhide   | Peha       | F      | d005    | Development |
-- |  10023 | Bojan      | Montemayor | F      | d005    | Development |
-- |  10027 | Divier     | Reistad    | F      | d005    | Development |
-- |  10040 | Weiyi      | Meriste    | F      | d005    | Development |
-- |  10056 | Brendon    | Bernini    | F      | d005    | Development |
-- |  10057 | Ebbe       | Callaway   | F      | d005    | Development |
-- |  10072 | Hironoby   | Sidou      | F      | d005    | Development |
-- |  10074 | Mokhtar    | Bernatsky  | F      | d005    | Development |
-- |  10075 | Gao        | Dolinsky   | F      | d005    | Development |
-- +--------+------------+------------+--------+---------+-------------+
SELECT
    e.emp_no
    , e.first_name
    , e.last_name
    , e.gender
    , d.dept_no
    , d.dept_name
FROM
    employees AS e
    JOIN dept_emp AS m ON e.emp_no = m.emp_no
        AND e.gender = 'F'
    JOIN departments AS d ON m.dept_no = d.dept_no
        AND dept_name = 'Development'
    LIMIT 10;

-- CROSS JOIN でスカラを簡単に列方向に結合できたりする、集計後の算出に必要な定数を取り込むのに便利だったりする
--
-- +--------+----------+
-- | gender | DIFF     |
-- +--------+----------+
-- | M      |  27.4321 |
-- | F      | -41.1416 |
-- +--------+----------+
WITH temp (
    global_mean
) AS (
    SELECT
        AVG(salary)
    FROM
        salaries) -- WITH はセミコロンいらないので注意
    SELECT
        e.gender
        , AVG(s.salary) - global_mean AS DIFF
FROM
    salaries AS s
    CROSS JOIN temp
    JOIN employees AS e ON s.emp_no = e.emp_no
GROUP BY
    e.gender
    , global_mean;

-- SELECT INTO を使うと結果を変数に格納することができる
-- GROUP BY のためにテーブルを取り込むよりもこちらのほうが楽ちん
--
-- +--------+------------------------------------+
-- | gender | DIFF                               |
-- +--------+------------------------------------+
-- | M      |  27.432089535000000000000000000000 |
-- | F      | -41.141672464000000000000000000000 |
-- +--------+------------------------------------+
SELECT
    AVG(salary) INTO @global_mean
FROM
    salaries;

SELECT
    e.gender
    , AVG(s.salary) - @global_mean AS DIFF
FROM
    salaries AS s
    JOIN employees AS e ON s.emp_no = e.emp_no
GROUP BY
    e.gender;

