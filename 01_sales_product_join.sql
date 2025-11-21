------------------------------------------------------------------------
-- 01) SALES & PRODUCT JOIN  (CREATE gwz_sales_margin)
-- Objective: Add purchase_price from product table to sales table
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
-- PURCHASE COST & MARGIN CALCULATION
-- purchase_cost = qty * purchase_price
-- margin = turnover - purchase_cost
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
-- RIGHT JOIN VERSION (NOT TO SAVE) – for analysis only
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
