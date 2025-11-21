-- 1.1) SALES & PRODUCT JOIN
-- Add purchase_price to sales using LEFT JOIN

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


-- PRIMARY KEY TEST (gwz_sales_margin_pk)

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


-- ADD purchase_cost AND margin
-- purchase_cost = qty * purchase_price
-- margin = turnover - purchase_cost

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

-- RIGHT JOIN VERSION (for comparison only — not saved)

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


-- TEST: purchase_price SHOULD NOT BE NULL (gwz_sales_margin_pp_not_null)

SELECT
  orders_id,
  products_id,
  purchase_price
FROM `course16.gwz_sales_margin`
WHERE purchase_price IS NULL;





















