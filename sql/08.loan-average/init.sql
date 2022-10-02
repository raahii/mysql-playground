-- H29 秋 DB 午前2 問2
DROP DATABASE
  IF EXISTS loan_average;

CREATE DATABASE
  loan_average;

USE
  loan_average;

CREATE TABLE
  account (
    kind VARCHAR(255) NOT NULL,
    balance INTEGER NOT NULL,
    PRIMARY KEY (kind)
  );

CREATE TABLE
  transaction (
    id INTEGER NOT NULL,
    at DATE NOT NULL,
    PRIMARY KEY (id)
  );

CREATE TABLE
  move (
    account_kind VARCHAR(255),
    transaction_id INTEGER,
    amount INTEGER NOT NULL,
    PRIMARY KEY (account_kind, transaction_id),
    FOREIGN KEY fk_kind (account_kind) REFERENCES account (kind),
    FOREIGN KEY fk_tid (transaction_id) REFERENCES transaction (id)
  );

----
INSERT INTO
  account (kind, balance)
VALUES
  ('cash', 1000),
  ('fixtures', 200);

INSERT INTO
  transaction (id, at)
VALUES
  (1, '2017-04-01'),
  (2, '2017-05-01');

INSERT INTO
  move (account_kind, transaction_id, amount)
VALUES
  ('cash', 1, -500),
  ('fixtures', 1, 500),
  ('cash', 2, 500),
  ('fixtures', 2, -500);
