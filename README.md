# 🧾 SQL Financial Analytics Pipeline – Revenue, Cost & Margin Analysis

![SQL](https://img.shields.io/badge/Tool-SQL-blue)
![BigQuery](https://img.shields.io/badge/Platform-Google%20BigQuery-red)
![DataAnalysis](https://img.shields.io/badge/Skill-Financial%20Analytics-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

This project builds an end-to-end financial analytics pipeline using SQL in Google BigQuery.  
It combines sales, product, and shipping datasets to compute product margins, operational costs, and monthly profitability insights for structured financial monitoring.

---

## 📊 What I Did

- Imported and structured the `gwz_product`, `gwz_sales`, and `gwz_ship` tables  
- Joined tables to enrich sales with product and shipping data  
- Computed:
  - purchase cost  
  - product margin  
  - shipping revenue  
  - operational cost  
  - operational margin  
- Validated table integrity with primary key and NULL-value tests  
- Aggregated sales at order level to avoid duplication  
- Built daily financial KPIs (`gwz_finance_day`)  
- Built monthly profitability KPIs (`gwz_finance_ads_month`)  
- Produced revenue, margin, and ads impact insights across July–September  
- Organized SQL scripts into clean analysis stages  

---

## 🛠 Tools & Methods

**Tools:**  
- Google BigQuery  
- SQL  

**Techniques:**  
- LEFT / RIGHT / INNER JOINs  
- Primary key validation  
- NULL checks  
- Daily & monthly aggregation  
- Financial KPI computation  
- Margin & operational margin calculation  
- ETL-style SQL pipeline design  

---

## 📈 Key Insights

- Demand remained consistently strong across all three months  
- Revenue and order volume were stable and healthy  
- Profitability declined due to:
  - higher logistics cost  
  - increased shipping expenses  
  - significant advertising spend  
- July was the most profitable month  
- August showed stable demand but higher costs  
- September displayed the lowest profitability due to rising expenses  
- Operational margin analysis highlighted cost drivers clearly  
- Monthly KPI tracking showed durable demand but stressed margins  

---

## 📌 Final Results

- **July** delivered the strongest profit margin and best operational efficiency  
- **August** maintained strong demand but showed early cost pressure  
- **September** had the lowest profitability, driven by rising operational and advertising costs  
- Shipping & logistics proved to be critical factors in margin compression  
- Monthly KPIs provided a reliable structure for finance teams to monitor profitability shifts  

---

## 🧾 Conclusion

This SQL project demonstrates how raw transactional data can be turned into a structured profitability monitoring system.  
The pipeline supports business teams by revealing:

- revenue trends  
- cost fluctuations  
- margin compression  
- operational efficiency  
- advertising cost impact  

It provides a clear financial overview and helps guide strategic decisions around pricing, cost optimization, and budget allocation.

---
---

## 🚀 How to Run This Project

1. Open **Google BigQuery** in your GCP project  
2. Create a dataset named `course16` in the **eu (multi-region in European Union)** location  
3. Import the following tables into `course16`:
   - `gwz_product`
   - `gwz_sales`
   - `gwz_ship`
4. Run the SQL files in this order:
   1. `01_sales_product_join.sql`
   2. `02_sales_margin_tests.sql`
   3. `03_orders_aggregation.sql`
   4. `04_shipping_join_operational_margin.sql`
   5. `05_finance_day_kpis.sql`
   6. `06_finance_month_kpis.sql`
5. Use the final tables (`gwz_finance_day`, `gwz_finance_ads_month`) for reporting, dashboards, or further analysis.

## 🔗 SQL Files

All SQL analysis is broken down into the following steps:

- `01_sales_product_join.sql`  
- `02_sales_margin_tests.sql`  
- `03_orders_aggregation.sql`  
- `04_shipping_join_operational_margin.sql`  
- `05_finance_day_kpis.sql`  
- `06_finance_month_kpis.sql`  

---

## 🔖 Tags

`#SQL` `#BigQuery` `#FinancialAnalytics`  
`#KPIs` `#ProfitabilityAnalysis` `#DataEngineering`  
`#EcommerceAnalytics` `#MarginAnalysis` `#SQLPipeline`

