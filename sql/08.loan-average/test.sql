USE
  loan_average;

SELECT
  account.kind + SUM(move.amount) as cash_balance
FROM
  account,
  transaction,
  move
WHERE
  account.kind = move.account_kind
  AND transaction.id = move.transaction_id
  AND account.kind = 'cash'
  AND transaction.at <= '2017-05-30'
