CREATE VIEW weekly_order_report AS
SELECT 
    -- Monday
    STRING_AGG(
        CASE WHEN EXTRACT(DOW FROM sub.created_at) = 1 THEN
            sub.uuid || '::' || sub.product_count || '::' || (sub.amount * 100)::INT 
        END, ' || '
    ) AS "Monday",

    -- Tuesday
    STRING_AGG(
        CASE WHEN EXTRACT(DOW FROM sub.created_at) = 2 THEN
            sub.uuid || '::' || sub.product_count || '::' || (sub.amount * 100)::INT 
        END, ' || '
    ) AS "Tuesday",

    -- Wednesday
    STRING_AGG(
        CASE WHEN EXTRACT(DOW FROM sub.created_at) = 3 THEN
            sub.uuid || '::' || sub.product_count || '::' || (sub.amount * 100)::INT 
        END, ' || '
    ) AS "Wednesday",

    -- Thursday
    STRING_AGG(
        CASE WHEN EXTRACT(DOW FROM sub.created_at) = 4 THEN
            sub.uuid || '::' || sub.product_count || '::' || (sub.amount * 100)::INT 
        END, ' || '
    ) AS "Thursday",

    -- Friday
    STRING_AGG(
        CASE WHEN EXTRACT(DOW FROM sub.created_at) = 5 THEN
            sub.uuid || '::' || sub.product_count || '::' || (sub.amount * 100)::INT 
        END, ' || '
    ) AS "Friday",

    -- Saturday
    STRING_AGG(
        CASE WHEN EXTRACT(DOW FROM sub.created_at) = 6 THEN
            sub.uuid || '::' || sub.product_count || '::' || (sub.amount * 100)::INT 
        END, ' || '
    ) AS "Saturday",

    -- Sunday
    STRING_AGG(
        CASE WHEN EXTRACT(DOW FROM sub.created_at) = 0 THEN
            sub.uuid || '::' || sub.product_count || '::' || (sub.amount * 100)::INT 
        END, ' || '
    ) AS "Sunday"

FROM 
    (SELECT 
        o.uuid,
        o.created_at,
        COUNT(DISTINCT psc.product_id) as product_count,
        o.amount
    FROM orders o
    JOIN product_sub_categories psc ON o.id = psc.product_id
    WHERE 
        o.created_at >= date_trunc('week', current_date)
        AND o.created_at < date_trunc('week', current_date) + interval '7 days'
    GROUP BY o.uuid, o.created_at, o.amount) AS sub;
