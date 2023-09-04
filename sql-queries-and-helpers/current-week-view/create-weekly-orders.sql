CREATE VIEW current_week_orders AS
SELECT
    o.id AS order_id,
    u.id AS user_id,
    u.first_name || ' ' || u.last_name AS client_name,
    p.title AS product_title,
    pay.type AS payment_type,
    os.title AS order_status,
    o.created_at AS order_date
FROM 
    orders o
JOIN 
    users u ON o.user_id = u.id
JOIN 
    product_sub_categories psc ON o.id = psc.product_id
JOIN 
    sub_categories sc ON psc.sub_category_id = sc.id
JOIN 
    products p ON psc.product_id = p.id
JOIN 
    payments pay ON o.payment_id = pay.id
JOIN 
    order_statuses os ON o.order_status_id = os.id
WHERE 
    o.created_at >= date_trunc('week', current_date)
    AND o.created_at < date_trunc('week', current_date) + interval '7 days';
