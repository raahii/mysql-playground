DROP DATABASE IF EXISTS table_constraints;

CREATE DATABASE table_constraints;

USE table_constraints;

-- MySQL ではサポートされてなかった
-- CREATE DOMAIN SHORT_STRING AS VARCHAR(20)
-- CHECK (LENGTH(VALUE) > 0 LENGTH(VALUE) < 20);
CREATE TABLE human (
    id int PRIMARY KEY AUTO_INCREMENT
    -- , name SHORT_STR UNIQUE NOT NULL
    , name varchar(20) UNIQUE NOT NULL
    , age int NOT NULL
    -- CONSTRAINT で CHECK 制約似名前をつけられてエラーがわかりやすくなる
    , CONSTRAINT valid_name CHECK (LENGTH(name) > 0)
    , CONSTRAINT adult_age CHECK (age > 18)
);

INSERT INTO human (name , age)
    VALUES ('John' , 20);

-- ERROR 3819 (HY000) at line 21: Check constraint 'adult_age' is violated.
INSERT INTO human (name , age)
    VALUES ('Ann' , 4);

-- ERROR 3819 (HY000) at line 26: Check constraint 'valid_name' is violated.
INSERT INTO human (name , age)
    VALUES ('' , 20);

-- RROR 1406 (22001) at line 28: Data too long for column 'name' at row 1
INSERT INTO human (name , age)
    VALUES ('Foooooooooooooooooooooooooooooooooooooooooooooooooooooo' , 4);

