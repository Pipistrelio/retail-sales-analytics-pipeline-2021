-- Product Performance Model
-- Aggregates metrics by product category and computes revenue KPIs.

SELECT
  p.category,
  COUNT(DISTINCT s.sale_id) AS order_count,
  SUM(s.quantity) AS units_sold,
  SUM(s.total_amount) AS total_revenue,
  ROUND(AVG(p.unit_price), 2) AS avg_price
FROM sales s
LEFT JOIN products p ON p.product_id = s.product_id
GROUP BY 1
ORDER BY total_revenue DESC;
