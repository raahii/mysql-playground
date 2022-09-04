-- H11 春 DB 問45
DROP DATABASE IF EXISTS correlated_subquery;

CREATE DATABASE correlated_subquery;

USE correlated_subquery;

-- 商社
CREATE TABLE company (
    company_id varchar(10) PRIMARY KEY
    , company_name varchar(255)
);

-- 商品
CREATE TABLE product (
    product_id varchar(10) PRIMARY KEY
    , product_name varchar(255)
);

-- 納品
CREATE TABLE delivery (
    company_id varchar(10)
    , product_id varchar(10)
    , quantity int
    , CONSTRAINT quantity_check CHECK (quantity > 0)
    , PRIMARY KEY (company_id , product_id)
);

-- 以下データ
INSERT INTO company (company_id , company_name)
    VALUES ('c001' , 'Foo Inc.')
    , ('c002' , 'Piyo Inc.')
    , ('c003' , 'Bar Inc.');

INSERT INTO product (product_id , product_name)
    VALUES ('p001' , 'Udon')
    , ('p002' , 'Ramen');

INSERT INTO delivery (company_id , product_id , quantity)
    VALUES ('c001' , 'p001' , 100)
    , ('c001' , 'p002' , 10)
    , ('c002' , 'p001' , 1000)
    , ('c003' , 'p002' , 1);

-- 納品一覧の確認
SELECT
    c.company_name
    , p.product_name
    , quantity
FROM
    delivery d
    JOIN company c ON d.company_id = c.company_id
    JOIN product p ON d.product_id = p.product_id;

