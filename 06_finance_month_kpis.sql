------------------------------------------------------------------------
-- 06) MONTHLY FINANCIAL KPIs (CREATE gwz_finance_ads_month)
-- This script:
--  1. Aggregates daily KPIs into monthly summaries
--  2. Computes profitability metrics
--  3. Includes ads cost + ads margin KPIs
------------------------------------------------------------------------


SELECT
    EXTRACT(MONTH FROM date_date) AS month,

    -- Basic metrics
    SUM(qty) AS nb_transaction,
    SUM(turnover) AS turnover,

    -- Average basket
    ROUND(SUM(turnover) / SUM(qty), 1) AS average_basket,

    -- Margin metrics
    ROUND(SUM(margin) / SUM(qty), 1) AS margin_ord,
    ROUND(SUM(margin) / SUM(turnover) * 100, 1) AS margin_percent,

    -- Shipping & logistics cost per order
    ROUND(SUM(shipping_fee) / SUM(qty), 1) AS shipping_fee_ord,
    ROUND(SUM(log_cost + ship_cost) / SUM(qty), 1) AS operational_cost_ord,

    -- Ads cost per order
    ROUND(SUM(ads_cost) / SUM(qty), 1) AS ads_cost_ord,

    -- Ads margin metrics
    ROUND(SUM(margin - ads_cost) / SUM(qty), 1) AS ads_margin_ord,
    SUM(margin - ads_cost) AS ads_margin

FROM `course16.gwz_finance_ads`
WHERE date_date BETWEEN '2021-07-01' AND '2021-09-30'
GROUP BY
    month
ORDER BY
    month DESC;
