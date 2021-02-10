SELECT DATE_TRUNC('day', sale_date) AS day, SUM(total_amount) AS revenue
FROM sales
GROUP BY 1;
