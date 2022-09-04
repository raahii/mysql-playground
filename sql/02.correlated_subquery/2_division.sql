USE correlated_subquery;

-- すべての商品を納品する商社の商社名を求める。
-- NOT EXISTS はよく差を求めるケースで使われるが、このクエリでは商を求めている
SELECT DISTINCT
    company_name
FROM
    company c
WHERE
    NOT EXISTS (
        SELECT
            *
        FROM
            product p
        WHERE
            NOT EXISTS (
                SELECT
                    *
                FROM
                    delivery d
                WHERE
                    d.product_id = p.product_id
                    AND d.company_id = c.company_id));

-- +--------------+
-- | company_name |
-- +--------------+
-- | Foo Inc.     |
-- +--------------+
