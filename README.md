# 🧾 SQL Financial Analytics Pipeline – Revenue, Cost & Margin Analysis

![SQL](https://img.shields.io/badge/Tool-SQL-blue)
![BigQuery](https://img.shields.io/badge/Platform-Google%20BigQuery-red)
![DataAnalysis](https://img.shields.io/badge/Skill-Financial%20Analytics-green)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

This project builds an end-to-end financial analytics pipeline using SQL in Google BigQuery, transforming raw transactional data into daily and monthly profitability insights.

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
- Analyzed revenue, margin trends, and advertising impact for July–September  
- Structured SQL scripts into a clean, modular pipeline  

---

## 🛠 Tools & Methods

**Tools:**  
- Google BigQuery  
- SQL  

**Techniques:**  
- LEFT / RIGHT / INNER JOIN operations  
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
- **July** was the most profitable month  
- **August** saw stable demand but early cost pressure  
- **September** had the lowest profitability due to increased cost load  
- Operational margin analysis highlighted clear cost drivers  
- Monthly KPIs helped track demand vs. cost imbalance  

---

## 📌 Final Results

- **July** delivered the strongest profit margin and best operational efficiency  
- **August** maintained strong demand with rising cost pressure  
- **September** showed the weakest profitability due to operational + advertising cost increases  
- Shipping & logistics were the largest contributors to margin compression  
- Monthly KPIs provided strong visibility into financial performance trends  

---

## 🧾 Conclusion

This SQL project demonstrates how raw transactional data can be transformed into a structured financial intelligence system.  
The pipeline gives clear visibility into:

- revenue trends  
- cost fluctuations  
- margin compression  
- operational efficiency  
- advertising cost impact  

These insights support data-driven decisions for pricing, cost optimization, and budget allocation.

---

## 📁 Project Structure

- `01_sales_product_join.sql` → Join sales with product and compute purchase_cost & margin  
- `02_sales_margin_tests.sql` → Primary key and purchase_price NOT NULL tests  
- `03_orders_aggregation.sql` → Aggregate sales to order level (gwz_orders)  
- `04_shipping_join_operational_margin.sql` → Join shipping data + compute operational_margin  
- `05_finance_day_kpis.sql` → Daily KPI calculation (gwz_finance_day)  
- `06_finance_month_kpis.sql` → Monthly KPI calculation (gwz_finance_ads_month)  

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
5. Use the final tables (`gwz_finance_day`, `gwz_finance_ads_month`) for reporting, dashboards, further analysis, or visualization tools.

---

## 🔗 SQL Files

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
