-- SQLite dialect. Import Cleaned_Dataset.csv as orders using run_analysis.py.
-- Profit aggregates exclude nulls. Product rankings use product_name.
-- customer_key uses name plus country because customer IDs are unavailable.
-- order_key uses market plus order ID plus order date; no stable line ID is supplied.

-- 01_top_profitable_products
SELECT product_name, SUM(profit) AS known_profit, SUM(sales) AS sales, SUM(profit_missing) AS missing_profit_lines FROM orders GROUP BY product_name ORDER BY known_profit DESC, product_name LIMIT 10;

-- 02_top_customers
SELECT customer_key, SUM(sales) AS sales FROM orders WHERE customer_name <> 'Unknown' GROUP BY customer_key ORDER BY sales DESC, customer_key LIMIT 10;

-- 03_region_sales
SELECT region, SUM(sales) AS sales, SUM(profit) AS known_profit FROM orders GROUP BY region ORDER BY sales DESC, region;

-- 04_category_average_profit
SELECT category, AVG(profit) AS average_known_line_profit, SUM(profit) AS known_profit, SUM(profit_missing) AS missing_profit_lines FROM orders GROUP BY category ORDER BY average_known_line_profit;

-- 05_highest_discount_category
SELECT category, AVG(discount) AS average_line_discount FROM orders GROUP BY category ORDER BY average_line_discount DESC, category;

-- 06_negative_profit_orders
SELECT order_key, SUM(sales) AS sales, SUM(profit) AS known_profit, SUM(profit_missing) AS missing_profit_lines FROM orders GROUP BY order_key HAVING SUM(profit)<0 AND SUM(profit_missing)=0 ORDER BY known_profit,order_key;

-- 07_monthly_sales
SELECT order_month, SUM(sales) AS sales, SUM(profit) AS known_profit FROM orders GROUP BY order_month ORDER BY order_month;

-- 08_market_revenue
SELECT market, SUM(sales) AS revenue, SUM(profit) AS known_profit FROM orders GROUP BY market ORDER BY revenue DESC,market;

-- 09_subcategory_performance
SELECT sub_category, SUM(sales) AS sales, SUM(profit) AS known_profit, SUM(profit)/NULLIF(SUM(sales),0) AS known_profit_to_sales FROM orders GROUP BY sub_category ORDER BY known_profit DESC,sub_category;

-- 10_ship_mode_usage
SELECT ship_mode,COUNT(*) AS order_lines, COUNT(DISTINCT order_key) AS distinct_orders_using_mode FROM orders GROUP BY ship_mode ORDER BY order_lines DESC,ship_mode;

-- 11_negative_profit_lines
SELECT * FROM orders WHERE profit < 0 ORDER BY profit, order_key;