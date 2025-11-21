------------------------------------------------------------------------
-- 02) TESTS FOR gwz_sales_margin
-- Includes: Primary key test & purchase_price NULL test
------------------------------------------------------------------------


------------------------------------------------------------------------
-- PRIMARY KEY TEST (gwz_sales_margin_pk)
-- Ensures (orders_id, products_id) is unique in gwz_sales_margin
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
-- PURCHASE PRICE NOT NULL TEST (gwz_sales_margin_pp_not_null)
-- Ensures purchase_price exists for all product_id in sales
------------------------------------------------------------------------

SELECT
  orders_id,
  products_id,
  purchase_price
FROM `course16.gwz_sales_margin`
WHERE purchase_price IS NULL
ORDER BY orders_id;
