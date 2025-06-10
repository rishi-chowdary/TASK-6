SQL QUERIES

CREATE TABLE online_sales (
order_id VARCHAR PRIMARY KEY, 
order_date DATE, 
amount NUMERIC(10, 2), 
product_id VARCHAR 
);

SELECT * FROM online_sales;

SELECT order_id, 
order date, 
EXTRACT(YEAR FROM order_date) AS year, 
EXTRACT(MONTH FROM order_date) AS month 
FROM online_sales;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
WHERE order_date BETWEEN '2023-07-01' AND '2023-12-31'
GROUP BY year, month
ORDER BY year, month;

SELECT 
  order_date,
  SUM(amount) AS daily_revenue,
  COUNT(DISTINCT order_id) AS daily_orders
FROM online_sales
GROUP BY order_date
ORDER BY order_date;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) / COUNT(DISTINCT order_id) AS avg_order_value
FROM online_sales
GROUP BY year, month
ORDER BY year, month;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  SUM(amount) AS total_revenue
FROM online_sales
GROUP BY year, month
ORDER BY total_revenue DESC
LIMIT 5;

SELECT 
  product_id,
  EXTRACT(YEAR FROM order_date) AS year,
  EXTRACT(MONTH FROM order_date) AS month,
  COUNT(DISTINCT order_id) AS order_count
FROM online_sales
GROUP BY product_id, year, month
ORDER BY year, month, product_id;

SELECT 
  product_id,
  EXTRACT(YEAR FROM order_date) AS year,
  SUM(amount) AS total_revenue
FROM online_sales
GROUP BY product_id, year
ORDER BY product_id, year;

SELECT 
  EXTRACT(YEAR FROM order_date) AS year,
  CEIL(EXTRACT(MONTH FROM order_date) / 3.0) AS quarter,
  SUM(amount) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM online_sales
GROUP BY year, quarter
ORDER BY year, quarter;