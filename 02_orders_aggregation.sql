------------------------------------------------------------------------
-- 1.1) SALES & PRODUCT JOIN (gwz_sales_margin)
------------------------------------------------------------------------

SELECT
  s.date_date,
  -- Primary Key
  s.orders_id,
  s.products_id,
  -- Sales Columns
  s.turnover,
  s.qty,
  -- Product Column
  p.purchase_price
FROM `course16.gwz_sales` AS s
LEFT JOIN `course16.gwz_product` AS p 
  ON s.products_id = p.products_id;


------------------------------------------------------------------------
-- PRIMARY KEY TEST (gwz_sales_margin_pk)
------------------------------------------------------------------------

SELECT
  orders_id,
  products_id,
  COUNT(*) AS nb
FROM `course16.gwz_sales_margin`
GROUP BY
  orders_id,
  products_id
HAVING nb >= 2
ORDER BY nb DESC;


------------------------------------------------------------------------
-- ADD purchase_cost AND margin
------------------------------------------------------------------------

SELECT
  s.date_date,
  s.orders_id,
  s.products_id,
  s.qty,
  s.turnover,
  p.purchase_price,
  ROUND(s.qty * p.purchase_price, 2) AS purchase_cost,
  s.turnover - ROUND(s.qty * p.purchase_price, 2) AS margin
FROM `course16.gwz_sales` AS s
LEFT JOIN `course16.gwz_product` AS p 
  ON s.products_id = p.products_id;


------------------------------------------------------------------------
-- RIGHT JOIN VERSION (for comparison)
------------------------------------------------------------------------

SELECT
  s.date_date,
  s.orders_id,
  s.products_id,
  s.qty,
  s.turnover,
  p.purchase_price,
  ROUND(s.qty * p.purchase_price, 2) AS purchase_cost,
  s.turnover - ROUND(s.qty * p.purchase_price, 2) AS margin
FROM `course16.gwz_sales` AS s
RIGHT JOIN `course16.gwz_product` AS p
  ON s.products_id = p.products_id;


------------------------------------------------------------------------
-- TEST purchase_price NOT NULL (gwz_sales_margin_pp_not_null)
------------------------------------------------------------------------

SELECT
  orders_id,
  products_id,
  purchase_price
FROM `course16.gwz_sales_margin`
WHERE purchase_price IS NULL;


------------------------------------------------------------------------
-- 1.2) AGGREGATE SALES TO ORDER LEVEL (gwz_orders)
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
-- PRIMARY KEY TEST FOR gwz_orders (gwz_orders_pk)
------------------------------------------------------------------------

SELECT
  orders_id,
  COUNT(*) AS nb
FROM `course16.gwz_orders`
GROUP BY
  orders_id
HAVING nb >= 2
ORDER BY nb DESC;


------------------------------------------------------------------------
-- JOIN WITH SHIPPING (gwz_orders_operational)
------------------------------------------------------------------------

SELECT
  o.date_date,
  o.orders_id,
  o.qty,
  o.turnover,
  o.purchase_cost,
  o.margin,
  sh.shipping_fee,
  sh.log_cost,
  sh.ship_cost
FROM `course16.gwz_orders` AS o
LEFT JOIN `course16.gwz_ship` AS sh
  ON o.orders_id = sh.orders_id
ORDER BY
  date_date,
  orders_id;


------------------------------------------------------------------------
-- gwz_orders_operational PK TEST
------------------------------------------------------------------------

SELECT
  orders_id,
  COUNT(*) AS nb
FROM `course16.gwz_orders_operational`
GROUP BY
  orders_id
HAVING nb >= 2
ORDER BY nb DESC;


------------------------------------------------------------------------
-- TEST shipping_fee, log_cost, ship_cost NOT NULL
------------------------------------------------------------------------

SELECT
  orders_id,
  shipping_fee,
  log_cost,
  ship_cost
FROM `course16.gwz_orders_operationnal`
WHERE
  shipping_fee IS NULL
  OR log_cost IS NULL
  OR ship_cost IS NULL
ORDER BY orders_id;


------------------------------------------------------------------------
-- ADD operational_margin
------------------------------------------------------------------------

SELECT
  o.date_date,
  o.orders_id,
  o.qty,
  o.turnover,
  o.purchase_cost,
  o.margin,
  sh.shipping_fee,
  sh.log_cost,
  sh.ship_cost,
  o.margin + sh.shipping_fee - (sh.log_cost + sh.ship_cost) AS operational_margin
FROM `course16.gwz_orders` AS o
LEFT JOIN `course16.gwz_ship` AS sh
  ON o.orders_id = sh.orders_id
ORDER BY
  date_date,
  orders_id;


------------------------------------------------------------------------
-- 1.3) DAILY FINANCIAL KPI AGGREGATION (gwz_finance_day)
------------------------------------------------------------------------

SELECT
  date_date,
  SUM(qty) AS qty,
  ROUND(SUM(turnover),0) AS turnover,
  ROUND(SUM(purchase_cost),0) AS purchase_cost,
  ROUND(SUM(margin),0) AS margin,
  ROUND(SUM(shipping_fee),0) AS shipping_fee,
  ROUND(SUM(log_cost),0) AS log_cost,
  ROUND(SUM(ship_cost),0) AS ship_cost,
  ROUND(SUM(operational_margin),0) AS operational_margin
FROM `course16.gwz_orders_operationnal`
GROUP BY
  date_date
ORDER BY
  date_date DESC;


------------------------------------------------------------------------
-- ADD KPI: nb_transaction & average basket
------------------------------------------------------------------------

SELECT
  date_date,
  COUNT(orders_id) AS nb_transaction,
  SUM(qty) AS qty,
  ROUND(SUM(turnover),0) AS turnover,
  ROUND(AVG(turnover),1) AS average_basket,
  ROUND(SUM(turnover)/COUNT(orders_id),1) AS average_basket_bis,
  ROUND(SUM(purchase_cost),0) AS purchase_cost,
  ROUND(SUM(margin),0) AS margin,
  ROUND(SUM(shipping_fee),0) AS shipping_fee,
  ROUND(SUM(log_cost),0) AS log_cost,
  ROUND(SUM(ship_cost),0) AS ship_cost,
  ROUND(SUM(operational_margin),0) AS operational_margin
FROM `course16.gwz_orders_operationnal`
GROUP BY
  date_date
ORDER BY
  date_date DESC;
