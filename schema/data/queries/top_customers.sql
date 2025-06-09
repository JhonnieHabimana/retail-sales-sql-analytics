-- Retrieve top 5 customers by total revenue
SELECT
    c.name,
    SUM(od.quantity * od.unit_price) AS total_spent
FROM
    customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 5;
