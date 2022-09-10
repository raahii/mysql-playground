DROP DATABASE IF EXISTS joins;

CREATE DATABASE joins;

USE joins;

CREATE TABLE product (
    id int PRIMARY KEY AUTO_INCREMENT
    , name varchar(255) NOT NULL
    , is_set_product boolean
);

CREATE TABLE product_order (
    id int PRIMARY KEY AUTO_INCREMENT
    , product_id int
    , num_orders int DEFAULT 1
);

INSERT INTO product
    VALUES (1 , 'pencil' , FALSE)
    , (2 , 'eraser' , FALSE)
    , (3 , 'paper' , FALSE)
    , (4 , 'elementary-school-set' , TRUE)
    , (5 , 'junior-high-school-set' , TRUE);

INSERT INTO product_order (product_id , num_orders)
    VALUES (1 , 4)
    , (2 , 1)
    , (4 , 2)
    , (5 , 41)
    , (6 , 4);

