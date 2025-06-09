-- Monthly sales with rolling 3-month average using window function
WITH monthly_sales AS (
    SELECT
        DATE_TRUNC('month', o.order_date) AS sales_month,
        SUM(od.quantity * od.unit_price) AS total_sales
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    GROUP BY 1
)
SELECT
    sales_month,
    total_sales,
    ROUND(AVG(total_sales) OVER (ORDER BY sales_month ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_avg_3mo
FROM monthly_sales;
