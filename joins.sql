-- Which menu item categories and spice levels are most popular across all restaurants?
select
    i.category_name,
    m.spice_level,
    count(distinct o.item_id) as items_ordered,
    sum(o.quantity)           as total_quantity
from item_categories i
join menu_items as m on i.item_category_id = m.item_category_id
join order_items as o on o.item_id = m.item_id
group by i.category_name, m.spice_level
order by i.category_name asc, total_quantity desc;


-- How does delivery volume and distance vary by vehicle type and delivery status?
select
    vehicle_type,
    delivery_status,
    count(delivery_id)                  as total_deliveries,
    round(avg(delivery_distance_km), 2) as avg_distance
from delivery_personnel dp
join deliveries d on d.delivery_person_id = dp.delivery_person_id
group by vehicle_type, delivery_status
order by vehicle_type asc, delivery_status asc;


-- Which promotion types drive the most usage and discount value, and how does that shift by month?
select
    discount_type,
    extract(month from order_date)  as order_month,
    count(o.promotion_id)           as orders_with_promotion,
    round(sum(discount_amount), 2)  as total_discount_given
from promotions as p
join orders as o on o.promotion_id = p.promotion_id
group by discount_type, order_month
order by order_month asc, total_discount_given desc;


-- Which restaurant categories generate the highest order volume and revenue?
select
    rc.category_name,
    count(o.order_id)             as total_orders,
    round(sum(o.total_amount), 2) as total_revenue
from restaurant_categories rc
join restaurants r on r.category_id = rc.category_id
join orders o on o.restaurant_id = r.restaurant_id
group by rc.category_name
order by total_revenue desc;


-- How does payment method usage and total amount processed differ between premium and non-premium members?
select
    u.is_premium_member,
    p.payment_method,
    count(p.payment_id)             as total_payments,
    round(sum(p.payment_amount), 2) as total_amount
from users u
join orders o on o.user_id = u.user_id
join payments p on p.order_id = o.order_id
where p.payment_status = 'Success'
group by u.is_premium_member, p.payment_method
order by u.is_premium_member desc, total_amount desc;
