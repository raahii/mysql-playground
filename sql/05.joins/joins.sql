USE joins;

-- join with where clause;
SELECT
    'join with where';

SELECT
    po.id product_order_id
    , p.id product_id
    , p.name product_name
    , po.num_orders
FROM
    product p
    , product_order po
WHERE
    po.product_id = p.id;

-- inner join
SELECT
    'inner join';

SELECT
    po.id product_order_id
    , p.id product_id
    , p.name product_name
    , po.num_orders
FROM
    product p
    JOIN product_order po ON p.id = po.product_id;

-- outer join
SELECT
    'left outer join';

SELECT
    po.id product_order_id
    , p.id product_id
    , p.name product_name
    , po.num_orders
FROM
    product p
    LEFT JOIN product_order po ON p.id = po.product_id;

SELECT
    'right outer join';

SELECT
    po.id product_order_id
    , p.id product_id
    , p.name product_name
    , po.num_orders
FROM
    product p
    RIGHT JOIN product_order po ON po.product_id = p.id;

-- MySQL doesn't support FULL OUTER JOIN
-- SELECT
--     'full join';
--
-- SELECT
--     po.id product_order_id
--     , p.id product_id
--     , p.name product_name
--     , po.num_orders
-- FROM
--     product p
--     FULL JOIN product_order po ON po.product_id = p.id;
--
