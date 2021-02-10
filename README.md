# retail-sales-analytics-pipeline-2021

Modular ETL/ELT pipeline for aggregating and analyzing retail sales data across multiple channels.  
Implements daily ingestion, transformations, and BI-ready models for financial and operational reporting.

---

## Overview

This project demonstrates:
- **Automated extraction** of sales, product, and region data.  
- **Data cleaning and enrichment** for consistency and completeness.  
- **Transformation layer** producing analytical tables for dashboards.  
- **Offline PostgreSQL loading** for demo purposes (or Redshift-ready schema).  
- **SQL models** for KPIs: revenue, conversion rate, and product performance.  

All data is synthetic and generated locally for demonstration.

---

## Project Structure

retail-sales-analytics-pipeline-2021/
├─ scripts/
│ ├─ extract_sales_data.py # Extract sales transactions from CSV
│ ├─ transform_clean_data.py # Clean and normalize records
│ ├─ enrich_product_metrics.py # Join sales with products and regions
│ ├─ load_to_postgres.py # Load into PostgreSQL (offline simulation)
│ └─ generate_bi_reports.py # Produce BI-ready CSV reports
│
├─ sql/
│ ├─ ddl_tables.sql # DDL for staging and analytics schema
│ ├─ model_revenue_kpi.sql # Aggregation by date and revenue
│ ├─ model_conversion_kpi.sql # Simplified conversion KPI
│ └─ model_product_perf.sql # Product category performance
│
├─ data_sample/
│ ├─ sales_2021_q1.csv # Synthetic sales data
│ ├─ products.csv # Product reference data
│ └─ regions.csv # Region mapping data
│
├─ requirements.txt
├─ .gitignore
├─ CHANGELOG.md
└─ README.md

yaml
Copy code

---

## Usage

To run the full pipeline locally (offline mode):

```bash
python scripts/extract_sales_data.py
python scripts/transform_clean_data.py
python scripts/enrich_product_metrics.py
python scripts/load_to_postgres.py
python scripts/generate_bi_reports.py
Each script writes intermediate outputs to the /out/ directory:

csharp
Copy code
out/
├─ sales_extracted.csv
├─ sales_clean.csv
├─ sales_enriched.csv
├─ sales_loaded.csv
├─ revenue_by_region.csv
└─ product_performance.csv
Example SQL Models
sql
Copy code
-- model_revenue_kpi.sql
SELECT
    DATE_TRUNC('day', sale_date) AS day,
    SUM(total_amount) AS total_revenue,
    SUM(quantity) AS total_units
FROM sales
GROUP BY 1
ORDER BY 1;

-- model_product_perf.sql
SELECT
    category,
    SUM(total_amount) AS revenue,
    COUNT(DISTINCT sale_id) AS orders,
    SUM(quantity) AS units_sold
FROM sales s
LEFT JOIN products p ON p.product_id = s.product_id
GROUP BY 1
ORDER BY revenue DESC;
Requirements
ini
Copy code
pandas==1.3.5
sqlalchemy==1.4.27
psycopg2-binary==2.9.3
requests==2.26.0
jinja2==3.0.3
Install dependencies:

bash
Copy code
pip install -r requirements.txt
Changelog
2021-02-10 — Initial ETL design and base model setup

2021-06-18 — Added enrichment and BI-ready transformations

2021-10-27 — Introduced KPI SQL models and report generation

Disclaimer
This repository and its contents are for educational and demonstration purposes only.
All datasets are synthetic and do not represent real users, transactions, or companies.
No proprietary or confidential information from any employer or client is included.
