create schema pizza_sales;
use pizza_sales;

select * from pizza_sales;

-- Total revenue
select sum(total_price) as total_revenue
from pizza_sales;

-- Average order value
select sum(total_price) / count(distinct order_id) as avg_order_value
from pizza_sales;

-- Total pizza sales
select sum(quantity) as total_quantity
from pizza_sales;

-- Total orders
select count(distinct order_id) as total_orders
from pizza_sales;

-- Average pizzas per order
select sum(quantity) / count(distinct order_id) as avg_pizza_per_order
from pizza_sales;

-- Highest Priced Pizza
select max(total_price) as highest_price
from pizza_sales;

-- QUESTIONS
-- 1. Daily Trend for Total Orders
select order_day, total_orders
from (
    select dayname(order_date) as order_day, count(distinct order_id) as total_orders
    from pizza_sales
    group by dayname(order_date)
) as daily_orders
order by field(order_day, 
          'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');

-- 2. Hourly Trend for Total Orders
select hour(order_time) as order_hours, count(distinct order_id) as total_orders
from pizza_sales
group by hour(order_time)
order by hour(order_time);

-- 3. Monthly pizza sales
select monthname(order_date) as order_month, round(sum(total_price), 2) as total_sales
from pizza_sales
group by order_month
order by field(order_month, 
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December');

-- 4. Percentage of Sales by Pizza Category
select pizza_category, round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as pct
from pizza_sales
group by pizza_category
order by pct desc;

-- 5. Percentage of Sales by Pizza Size
select pizza_size, round(sum(total_price) * 100 / (select sum(total_price) from pizza_sales),2) as pct_sales_by_size
from pizza_sales
group by pizza_size
order by pct_sales_by_size desc;

-- 6. Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) as total_pizza_sold_by_category
from pizza_sales
group by pizza_category;

-- 7. Top 5 Best Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by total_pizza_sold desc
limit 5;

-- 8. Bottom 5 Worst Sellers by Total Pizzas Sold
select pizza_name, sum(quantity) as total_pizza_sold
from pizza_sales
group by pizza_name
order by total_pizza_sold asc
limit 5;

-- 9. Top 3 pizza categories by revenue
select pizza_category, round(sum(total_price), 2) as total_revenue
from pizza_sales
group by pizza_category
order by total_revenue desc
limit 3;

-- 10. Which pizza size sells most? 
select pizza_size, sum(quantity) as total_pizzas_sold
from pizza_sales
group by pizza_size
order by total_pizzas_sold desc;

-- 11. Which Weekday Has Highest Average Order Value?
select dayname(order_date) as weekday, round(sum(total_price) / count(distinct order_id), 2) as avg_order_value
from pizza_sales
group by weekday
order by avg_order_value desc;