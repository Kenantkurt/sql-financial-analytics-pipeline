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
