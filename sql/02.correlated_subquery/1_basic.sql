-- https://dev.mysql.com/doc/refman/5.6/ja/exists-and-not-exists-subqueries.html
USE correlated_subquery;

-- 1つ以上納品されている商品の名前
SELECT DISTINCT
    product_name
FROM
    product p
WHERE
    EXISTS (
        SELECT
            *
        FROM
            delivery d
        WHERE
            p.product_id = d.product_id);

-- 100 個以上納品をしている商品が1つもない商社の名前
SELECT DISTINCT
    company_id
FROM
    company c
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            delivery d
        WHERE
            c.company_id = d.company_id
            AND d.quantity >= 100);

