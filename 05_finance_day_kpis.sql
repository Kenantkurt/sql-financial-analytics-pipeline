------------------------------------------------------------------------
-- 05) DAILY FINANCIAL KPI AGGREGATION (CREATE gwz_finance_day)
-- This script:
--  1. Aggregates order-level data to daily KPIs
--  2. Computes transactions count
--  3. Computes average basket
------------------------------------------------------------------------


SELECT
  date_date,

  -- KPI: Number of transactions
  COUNT(orders_id) AS nb_transaction,

  -- KPI: Daily quantities & financials
  SUM(qty) AS qty,
  ROUND(SUM(turnover),0) AS turnover,
  ROUND(SUM(purchase_cost),0) AS purchase_cost,
  ROUND(SUM(margin),0) AS margin,

  -- Shipping & logistics
  ROUND(SUM(shipping_fee),0) AS shipping_fee,
  ROUND(SUM(log_cost),0) AS log_cost,
  ROUND(SUM(ship_cost),0) AS ship_cost,

  -- Operational margin (daily)
  ROUND(SUM(operational_margin),0) AS operational_margin,

  -- KPI: Average basket
  ROUND(AVG(turnover),1) AS average_basket,
  ROUND(SUM(turnover) / COUNT(orders_id),1) AS average_basket_bis

FROM `course16.gwz_orders_operationnal`
GROUP BY
  date_date
ORDER BY
  date_date DESC;
