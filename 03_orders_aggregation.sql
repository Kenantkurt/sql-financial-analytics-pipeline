------------------------------------------------------------------------
-- 03) AGGREGATE SALES TO ORDER LEVEL (CREATE gwz_orders)
-- Objective: Summarize all sales metrics per orders_id
------------------------------------------------------------------------

SELECT
  date_date,
  orders_id,
  ROUND(SUM(qty), 2) AS qty,
  ROUND(SUM(turnover), 2) AS turnover,
  ROUND(SUM(purchase_cost), 2) AS purchase_cost,
  ROUND(SUM(margin), 2) AS margin
FROM `course16.gwz_sales_margin`
GROUP BY
  date_date,
  orders_id
ORDER BY
  date_date,
  orders_id;

------------------------------------------------------------------------
-- PRIMARY KEY TEST (gwz_orders_pk)
-- Ensures each orders_id appears only once in gwz_orders
------------------------------------------------------------------------

SELECT
  orders_id,
  COUNT(*) AS nb
FROM `course16.gwz_orders`
GROUP BY
  orders_id
HAVING nb >= 2
ORDER BY nb DESC;
