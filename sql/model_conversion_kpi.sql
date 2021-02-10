-- Conversion KPI model
-- Calculates simplified daily conversion rates
-- (ratio of unique completed sales to unique visitors)
-- For demonstration only, all data synthetic.

WITH sales_counts AS (
  SELECT
    DATE_TRUNC('day', sale_date) AS day,
    COUNT(DISTINCT sale_id) AS completed_sales
  FROM sales
  GROUP BY 1
),
visitor_counts AS (
  SELECT
    DATE_TRUNC('day', sale_date) AS day,
    COUNT(DISTINCT (product_id::text || '_' || region)) AS pseudo_visitors
  FROM sales
  GROUP BY 1
)
SELECT
  s.day,
  s.completed_sales,
  v.pseudo_visitors,
  ROUND(s.completed_sales::decimal / NULLIF(v.pseudo_visitors, 0), 3) AS conversion_rate
FROM sales_counts s
LEFT JOIN visitor_counts v USING (day)
ORDER BY s.day;
