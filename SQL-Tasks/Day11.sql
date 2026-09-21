-- DAY 11
USE data_analytics;

-- =========================

-- SELECT / WHERE
SELECT * FROM products;
SELECT product_name, price FROM products WHERE price > 2000;

-- ORDER BY
SELECT * FROM products ORDER BY price DESC;

-- DISTINCT
SELECT DISTINCT category FROM products;

-- Aggregate functions
SELECT COUNT(*) AS total_products FROM products;
SELECT SUM(stock) AS total_stock FROM products;
SELECT AVG(price) AS average_price FROM products;
SELECT MAX(price) AS highest_price, MIN(price) AS lowest_price FROM products;

-- GROUP BY / HAVING
SELECT category, COUNT(*) AS product_count, AVG(price) AS avg_price
FROM products
GROUP BY category;

SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category
HAVING AVG(price) > 2000;

-- LIKE
SELECT * FROM products WHERE product_name LIKE '%phone%';

-- BETWEEN / IN
SELECT * FROM products WHERE price BETWEEN 1500 AND 10000;
SELECT * FROM products WHERE category IN ('Electronics','Furniture');

-- INNER JOIN
SELECT o.order_id, p.product_name, o.customer_name, o.quantity, p.price
FROM orders o
INNER JOIN products p ON o.product_id = p.product_id;

-- JOIN across 3 tables
SELECT o.order_id, o.customer_name, p.product_name, s.courier, s.shipment_status
FROM orders o
JOIN products p ON o.product_id = p.product_id
JOIN shipments s ON o.order_id = s.order_id;

-- LEFT JOIN: include orders even if no return exists
SELECT o.order_id, o.customer_name, r.return_reason, r.return_status
FROM orders o
LEFT JOIN returns r ON o.order_id = r.order_id;

-- Calculated column
SELECT o.order_id, p.product_name, o.quantity,
       p.price, (o.quantity * p.price) AS order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;

-- CASE
SELECT product_name, price,
CASE
    WHEN price >= 50000 THEN 'Premium'
    WHEN price >= 5000 THEN 'Mid Range'
    ELSE 'Budget'
END AS price_category
FROM products;

-- UPDATE / DELETE examples (run carefully)
-- UPDATE products SET price = 2700 WHERE product_id = 102;
-- DELETE FROM returns WHERE return_id = 7002;
