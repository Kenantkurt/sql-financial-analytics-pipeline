------------------------------------------------------------------------
-- 04) JOIN ORDERS WITH SHIPPING + TESTS + OPERATIONAL MARGIN
-- This script:
--  1. Joins gwz_orders with gwz_ship
--  2. Tests primary key uniqueness
--  3. Tests NULL shipping fields
--  4. Calculates operational_margin
------------------------------------------------------------------------


-- A) CREATE gwz_orders_operational (JOIN orders + shipping)
SELECT
  o.date_date,
  o.orders_id,
  -- Order-level metrics
  o.qty,
  o.turnover,
  o.purchase_cost,
  o.margin,
  -- Shipping & logistics metrics
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
-- B) PRIMARY KEY TEST (gwz_orders_operational_pk)
-- Ensures orders_id appears once
------------------------------------------------------------------------

SELECT
  orders_id,
  COUNT(*) AS nb
FROM `course16.gwz_orders_operational`
GROUP BY orders_id
HAVING nb >= 2
ORDER BY nb DESC;


------------------------------------------------------------------------
-- C) NULL TEST FOR SHIPPING FIELDS
-- Ensures shipping_fee, log_cost, ship_cost are not missing
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
-- D) ADD operational_margin COLUMN
-- operational_margin = margin + shipping_fee - (log_cost + ship_cost)
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
