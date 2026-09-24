# 🍽️ Food Delivery Platform Analysis — SQL Portfolio

## 📌 Project Overview

This project analyzes a 14-table relational database for a food
delivery platform, covering restaurants, menu items, orders,
deliveries, payments, promotions, and reviews. Using PostgreSQL, it
answers real operational and business questions through progressively
advanced SQL — from GROUP BY aggregations to multi-table joins, CTEs,
and window functions — to surface restaurant quality, menu
performance, delivery efficiency, and promotion effectiveness.

---

## 📊 Project Summary

| Metric | Value |
|---|---|
| Database Tables | 14 (9 dimension, 5 fact) |
| Techniques Covered | Aggregations · Joins · CTEs · Window Functions |
| Queries Completed | 17 |
| Tech Stack | PostgreSQL |

---

## 📁 Datasets Used

| Table | Type | Description |
|---|---|---|
| restaurant_categories | Dimension | Cuisine/category types (e.g. North Indian, Chinese) |
| item_categories | Dimension | Menu item categories (Starters, Main Course, Desserts...) |
| restaurants | Dimension | Restaurant details, location, ratings, delivery settings |
| menu_items | Dimension | Food items per restaurant — price, spice level, availability |
| users | Dimension | Customer accounts, order history, loyalty points |
| user_addresses | Dimension | Delivery addresses per user |
| delivery_personnel | Dimension | Delivery staff — vehicle type, ratings, activity |
| promotions | Dimension | Discount codes and promotional offers |
| restaurant_operating_hours | Dimension | Daily open/close times per restaurant |
| orders | Fact | Order status, amounts, timestamps |
| order_items | Fact | Line items within each order |
| deliveries | Fact | Delivery tracking, distance, ratings |
| payments | Fact | Payment transactions and status |
| reviews | Fact | Customer ratings and feedback |

---

## 📋 Business Analytics Tasks

Queries are grouped by technique into one file per folder, rather than
one file per question — each file below contains several related
queries.

### Aggregations — [aggregation-basic-to-advanced.sql`](aggregation-basic-to-advanced.sql)
- Average delivery fee & minimum order across active restaurants
- Restaurant count per category
- Cities with more than 5 active restaurants
- Revenue, order count & avg order value per restaurant (10+ orders)
- Cancellation rate per restaurant (conditional aggregation)
- Menu item distribution by spice level & vegetarian preference
- Restaurant performance by activity status & rating category

### Joins — [joins-and-aggregation.sql`](joins-and-aggregation.sql)
- Active restaurant distribution by city & state
- Menu item popularity by category & spice level
- Delivery performance by vehicle type & status
- Promotion effectiveness by discount type & month
- Revenue by restaurant category
- Payment method usage by membership tier
- Review patterns by gender & rating level

### Window Functions — [window-functions-queries.sql`](window-functions-queries.sql)
- Best-performing delivery personnel per vehicle type (CTE + `ROW_NUMBER`)
- Restaurant ranking by revenue within each city (`ROW_NUMBER`)
- Highest-rated menu items within each spice level (`RANK`, with gaps after ties)

*More tasks (subqueries) will be added here as they're completed.*

---

## 🛠️ Tools Used

- **PostgreSQL** — query engine
- **SQL** — GROUP BY aggregates, CASE WHEN bucketing, multi-table JOINs, CTEs, window functions

---



---

## 👨‍💻 Author

**Likhitha HN**
Aspiring Data Analyst | SQL · Python · Power BI · Excel
🔗 [Add your GitHub profile link here]
