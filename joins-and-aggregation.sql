-- What is the distribution of active, high-rated (>= 3.5) restaurants by city and state?
SELECT
    city,
    state,
    COUNT(restaurant_id)          AS restaurant_count,
    ROUND(AVG(average_rating), 2) AS avg_rating
FROM restaurants
WHERE is_active = TRUE
    AND average_rating >= 3.5
GROUP BY city, state
ORDER BY state ASC, city ASC;


-- Which menu item categories and spice levels are most popular across all restaurants?
SELECT
    i.category_name,
    m.spice_level,
    COUNT(DISTINCT o.item_id) AS items_ordered,
    SUM(o.quantity)           AS total_quantity
FROM item_categories i
JOIN menu_items AS m ON i.item_category_id = m.item_category_id
JOIN order_items AS o ON o.item_id = m.item_id
GROUP BY i.category_name, m.spice_level
ORDER BY i.category_name ASC, total_quantity DESC;


-- How does delivery volume and distance vary by vehicle type and delivery status?
SELECT
    vehicle_type,
    delivery_status,
    COUNT(delivery_id)                  AS total_deliveries,
    ROUND(AVG(delivery_distance_km), 2) AS avg_distance
FROM delivery_personnel dp
JOIN deliveries d ON d.delivery_person_id = dp.delivery_person_id
GROUP BY vehicle_type, delivery_status
ORDER BY vehicle_type ASC, delivery_status ASC;


-- Which promotion types drive the most usage and discount value, and how does that shift by month?
SELECT
    discount_type,
    EXTRACT(MONTH FROM order_date)  AS order_month,
    COUNT(o.promotion_id)           AS orders_with_promotion,
    ROUND(SUM(discount_amount), 2)  AS total_discount_given
FROM promotions AS p
JOIN orders AS o ON o.promotion_id = p.promotion_id
GROUP BY discount_type, order_month
ORDER BY order_month ASC, total_discount_given DESC;


-- Which restaurant categories generate the highest order volume and revenue?
SELECT
    rc.category_name,
    COUNT(o.order_id)             AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_revenue
FROM restaurant_categories rc
JOIN restaurants r ON r.category_id = rc.category_id
JOIN orders o ON o.restaurant_id = r.restaurant_id
GROUP BY rc.category_name
ORDER BY total_revenue DESC;


-- How does payment method usage and total amount processed differ between premium and non-premium members?
SELECT
    u.is_premium_member,
    p.payment_method,
    COUNT(p.payment_id)             AS total_payments,
    ROUND(SUM(p.payment_amount), 2) AS total_amount
FROM users u
JOIN orders o ON o.user_id = u.user_id
JOIN payments p ON p.order_id = o.order_id
WHERE p.payment_status = 'Success'
GROUP BY u.is_premium_member, p.payment_method
ORDER BY u.is_premium_member DESC, total_amount DESC;


-- How do customer review patterns (count and average rating) vary by gender and rating level?
SELECT
    gender,
    CASE WHEN overall_rating >= 4 THEN 'High'
         WHEN overall_rating BETWEEN 2 AND 3 THEN 'Medium'
         WHEN overall_rating = 1 THEN 'Low' END AS rating_level,
    COUNT(review_id)              AS total_reviews,
    ROUND(AVG(overall_rating), 2) AS avg_overall_rating
FROM reviews r
JOIN users u ON u.user_id = r.user_id
GROUP BY gender, rating_level
ORDER BY gender ASC, rating_level ASC;
