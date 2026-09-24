-- BASIC: What is the average delivery fee and minimum order amount across all active restaurants?
SELECT
    ROUND(AVG(delivery_fee), 2)         AS avg_delivery_fee,
    ROUND(AVG(minimum_order_amount), 2) AS avg_minimum_order
FROM restaurants
WHERE is_active = TRUE;


-- BASIC: How many restaurants are there per category?
SELECT
    rc.category_name,
    COUNT(r.restaurant_id) AS restaurant_count
FROM restaurant_categories rc
JOIN restaurants r ON r.category_id = rc.category_id
GROUP BY rc.category_name
ORDER BY restaurant_count DESC;


-- INTERMEDIATE: Which cities have more than 5 active restaurants?
SELECT
    city,
    COUNT(*) AS restaurant_count
FROM restaurants
WHERE is_active = TRUE
GROUP BY city
HAVING COUNT(*) > 5
ORDER BY restaurant_count DESC;


-- INTERMEDIATE: What are the total revenue, order count, and average order value per restaurant, for restaurants with at least 10 orders?
SELECT
    r.restaurant_name,
    COUNT(o.order_id)             AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_revenue,
    ROUND(AVG(o.total_amount), 2) AS avg_order_value
FROM restaurants r
JOIN orders o ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING COUNT(o.order_id) >= 10
ORDER BY total_revenue DESC;


-- ADVANCED: What percentage of each restaurant's orders were cancelled (restaurants with at least 10 orders)?
SELECT
    r.restaurant_name,
    COUNT(o.order_id) AS total_orders,
    SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    ROUND(
        100.0 * SUM(CASE WHEN o.order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(o.order_id),
        2
    ) AS cancellation_rate_pct
FROM restaurants r
JOIN orders o ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
HAVING COUNT(o.order_id) >= 10
ORDER BY cancellation_rate_pct DESC;


-- ADVANCED: What is the item count and average price for moderately priced (100-400) menu items, by spice level and vegetarian preference?
SELECT
    spice_level,
    CASE WHEN is_vegetarian = TRUE THEN 'Vegetarian' ELSE 'Non-Vegetarian' END AS vegetarian_type,
    COUNT(item_id)       AS item_count,
    ROUND(AVG(price), 2) AS avg_price
FROM menu_items
WHERE price BETWEEN 100 AND 400
GROUP BY spice_level, vegetarian_type
ORDER BY spice_level ASC, vegetarian_type ASC;


-- ADVANCED: How do established restaurants (50+ reviews, minimum order <= 200) perform by activity status and rating category?
SELECT
    CASE WHEN is_active = TRUE THEN 'Active' ELSE 'Inactive' END AS activity_status,
    CASE WHEN average_rating >= 4.5 THEN 'Excellent'
         WHEN average_rating BETWEEN 3.5 AND 4.4 THEN 'Good'
         ELSE 'Fair' END AS rating_category,
    COUNT(restaurant_id)                 AS restaurant_count,
    ROUND(AVG(average_delivery_time), 2) AS avg_delivery_time
FROM restaurants
WHERE total_reviews >= 50
    AND minimum_order_amount <= 200
GROUP BY activity_status, rating_category
ORDER BY activity_status ASC, rating_category ASC;
