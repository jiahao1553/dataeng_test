-- I want to find out the top 3 car manufacturers that customers bought by sales (quantity) and the sales number for it in the current month.
SELECT
  c.manufacturer,
  COUNT(t.car_id) AS sales_quantity,
  SUM(c.price) AS sales_number
FROM
  car c
  LEFT JOIN transaction t ON c.id = t.car_id
WHERE
  to_char(t.transaction_date, 'YYYY-MM') = to_char(current_date, 'YYYY-MM')
GROUP BY
  c.manufacturer
order by
  sales_number desc
limit
  3;