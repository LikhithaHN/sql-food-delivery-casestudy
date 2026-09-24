-- Who are the best-performing delivery personnel by average rating within each vehicle type (unique sequential ranking)?
WITH personnel_ratings AS (
    SELECT
        vehicle_type,
        CONCAT(first_name, ' ', last_name) AS personnel_name,
        d.delivery_person_id,
        ROUND(AVG(delivery_rating), 2) AS avg_delivery_rating
    FROM delivery_personnel dp
    JOIN deliveries AS d ON d.delivery_person_id = dp.delivery_person_id
    GROUP BY vehicle_type, personnel_name, d.delivery_person_id
)
SELECT
    vehicle_type,
    personnel_name,
    avg_delivery_rating,
    ROW_NUMBER() OVER (
        PARTITION BY vehicle_type
        ORDER BY avg_delivery_rating DESC, delivery_person_id ASC
    ) AS vehicle_rank
FROM personnel_ratings
ORDER BY vehicle_type ASC, vehicle_rank ASC;


-- How do restaurants rank within each city by total revenue generated?
SELECT
    r.city,
    r.restaurant_name,
    ROUND(SUM(o.total_amount), 2) AS total_revenue,
    ROW_NUMBER() OVER (
        PARTITION BY r.city
        ORDER BY SUM(o.total_amount) DESC, r.restaurant_id ASC
    ) AS city_rank
FROM restaurants r
JOIN orders o ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_id, r.city, r.restaurant_name
ORDER BY r.city ASC, city_rank ASC;


-- What are the highest-rated menu items within each spice level (ranked with gaps after ties)?
SELECT
    m.spice_level,
    m.item_name,
    ROUND(AVG(rv.food_rating), 2) AS avg_food_rating,
    RANK() OVER (
        PARTITION BY m.spice_level
        ORDER BY AVG(rv.food_rating) DESC
    ) AS spice_rank
FROM menu_items m
JOIN order_items oi ON oi.item_id = m.item_id
JOIN orders o ON o.order_id = oi.order_id
JOIN reviews rv ON rv.order_id = o.order_id
GROUP BY m.item_id, m.spice_level, m.item_name
ORDER BY m.spice_level ASC, spice_rank ASC;
