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
| Techniques Covered | Joins · Aggregations · Subqueries · CTEs · Window Functions |
| Queries Completed | 4 (Aggregations: 1, Joins: 3) |
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

### Task 1 — Active Restaurant Distribution by City & State
- **Technique:** `GROUP BY` + aggregate functions (`COUNT`, `AVG`)
- **Business question:** Which cities and states have the most active, high-rated (≥3.5) restaurants?
- **Output columns:** `city, state, restaurant_count, avg_rating`
- **File:** [`queries/aggregations/restaurant-distribution-by-city-state.sql`](queries/aggregations/restaurant-distribution-by-city-state.sql)

### Task 2 — Menu Item Popularity by Category & Spice Level
- **Technique:** Multi-table `JOIN` + `COUNT(DISTINCT ...)` to handle join fan-out
- **Business question:** Which item categories and spice levels sell best across all restaurants?
- **Output columns:** `category_name, spice_level, items_ordered, total_quantity`
- **File:** [`queries/joins/menu-item-popularity-by-category-spice-level.sql`](queries/joins/menu-item-popularity-by-category-spice-level.sql)

### Task 3 — Delivery Performance by Vehicle Type & Status
- **Technique:** `JOIN` + `GROUP BY`
- **Business question:** How does delivery distance and completion vary by vehicle type and delivery status?
- **Output columns:** `vehicle_type, delivery_status, total_deliveries, avg_distance`
- **File:** [`queries/joins/delivery-performance-by-vehicle-status.sql`](queries/joins/delivery-performance-by-vehicle-status.sql)

### Task 4 — Promotion Effectiveness by Discount Type & Month
- **Technique:** `JOIN` + `GROUP BY` + `EXTRACT()` for date-part grouping
- **Business question:** Which promotion types drive the most usage and discount value, and how does that shift month to month?
- **Output columns:** `discount_type, order_month, orders_with_promotion, total_discount_given`
- **File:** [`queries/joins/promotion-effectiveness-by-discount-month.sql`](queries/joins/promotion-effectiveness-by-discount-month.sql)

*More tasks (subqueries, CTEs, window functions) will be added here as they're completed.*

---

## 🛠️ Tools Used

- **PostgreSQL** — query engine
- **SQL** — GROUP BY aggregates, multi-table JOINs, CTEs, window functions, CROSS JOIN gap-filling

---

## 📂 Files in This Repository

| Path | Description |
|---|---|
| `README.md` | This file |
| `schemas/food-delivery/schema.sql` | Full 14-table schema (DDL) |
| `queries/aggregations/` | GROUP BY + aggregate function queries |
| `queries/joins/` | Multi-table join queries |
| `queries/subqueries/` | Correlated and scalar subqueries |
| `queries/ctes/` | Multi-step CTE-based queries |
| `queries/window-functions/` | ROW_NUMBER, RANK, PARTITION BY queries |
| `notes/gotchas.md` | Recurring SQL patterns and traps worth not relearning |

---

## 🚀 How to Run

1. Load the schema: `psql -d your_db -f schemas/food-delivery/schema.sql`
2. Run any query file directly, e.g.:
   `psql -d your_db -f queries/aggregations/restaurant-distribution-by-city-state.sql`

---

## 👨‍💻 Author

**Rakesh**
Aspiring Data Analyst | SQL · Python · Power BI · Excel
🔗 [Add your GitHub profile link here]
