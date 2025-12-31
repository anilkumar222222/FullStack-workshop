SELECT p.product_name, p.price, c.category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.category_id;

SELECT order_id, order_date, status, total_amount
FROM orders
WHERE customer_id = 1;

UPDATE products 
SET stock_quantity = stock_quantity - 2 
WHERE product_id = 5;

DELETE FROM orders 
WHERE status = 'cancelled' 
AND order_date < DATE_SUB(NOW(), INTERVAL 30 DAY);

SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id
ORDER BY total_sold DESC
LIMIT 5;

SELECT c.category_name, SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_id;

SELECT customer_id, first_name, last_name
FROM customers
WHERE customer_id NOT IN (
    SELECT customer_id 
    FROM orders 
    WHERE order_date >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
);

SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 10;

CREATE OR REPLACE VIEW order_summary_view AS
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    o.status,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

SELECT first_name, last_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id 
    FROM orders 
    WHERE total_amount > (SELECT AVG(total_amount) FROM orders)
);

SELECT c.category_name, SUM(oi.quantity * oi.unit_price) AS sales_volume
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY c.category_name
HAVING sales_volume > 1000;

START TRANSACTION;

INSERT INTO orders (customer_id, order_date, status, total_amount, shipping_address)
VALUES (1, NOW(), 'pending', 1225.50, '999 Tech Lane, Silicon Valley');

SET @last_order_id = LAST_INSERT_ID();

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES (@last_order_id, 1, 1, 1200.00);

UPDATE products 
SET stock_quantity = stock_quantity - 1 
WHERE product_id = 1;

COMMIT;