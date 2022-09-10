USE joins;

SELECT
    po.id product_order_id
    , p.id product_id
    , p.name product_name
    , po.num_orders
FROM
    product_order po
    JOIN product p ON p.id = po.product_id
        AND p.is_set_product = TRUE
    UNION ALL
    SELECT
        po.id product_order_id
        , p.id product_id
        , p.name product_name
        , po.num_orders
    FROM
        product_order po
    JOIN product p ON p.id = po.product_id
        AND p.is_set_product = FALSE;

SELECT
    po.id product_order_id
    , COALESCE(p1.id , p2.id , NULL) product_id
    , COALESCE(p1.name , p2.name , NULL) product_name
    , po.num_orders
FROM
    product_order po
    LEFT JOIN product p1 ON po.product_id = p1.id
        AND p1.is_set_product = TRUE
    LEFT JOIN product p2 ON po.product_id = p2.id
        AND p2.is_set_product = FALSE;

