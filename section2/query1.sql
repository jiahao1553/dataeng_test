-- I want to know the list of our customers and their spending.
SELECT
  k.name,
  SUM(c.price) AS spending
FROM
  customer k
  LEFT JOIN transaction t ON k.id = t.customer_id
  LEFT JOIN car c ON t.car_id = k.id
GROUP BY
  k.name
ORDER BY
  SUM(c.price) DESC;