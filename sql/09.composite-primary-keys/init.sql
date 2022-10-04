DROP DATABASE
  IF EXISTS composite_keys;

CREATE DATABASE
  composite_keys;

USE
  composite_keys;

CREATE TABLE
  `groups` (
    `group_id` INT AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `parent_group_id` INT,
    PRIMARY KEY (`group_id`),
    FOREIGN KEY (`parent_group_id`) REFERENCES `groups` (`group_id`)
  );

CREATE TABLE
  `users` (
    `group_id` INT,
    `user_id` INT,
    `name` VARCHAR(255),
    PRIMARY KEY (`group_id`, `user_id`)
  );

INSERT INTO
  `groups` (`group_id`, `name`, `parent_group_id`)
VALUES
  (1, 'Legal Dept', NULL),
  (2, 'Sales Dept', NULL),
  (3, 'Development Dept', NULL),
  (4, 'Engineering Team 1', 3),
  (5, 'Engineering Team 2', 3);

INSERT INTO
  `users` (`group_id`, `user_id`, `name`)
VALUES
  (1, 1, 'Kirimaru'),
  (2, 2, 'Sinbe'),
  (4, 3, 'Rantaro'),
  (4, 4, 'Hemuhemu'),
  (5, 5, 'Happosai');
