--Procedure 1: Start a New Order
DELIMITER //
CREATE PROCEDURE ProcessOrder(IN p_customer_id INT, OUT p_order_id INT)
BEGIN
    INSERT INTO orders (customer_id, order_date, status, total_amount)
    VALUES (p_customer_id, NOW(), 'pending', 0.00);
    
    SET p_order_id = LAST_INSERT_ID();
END //
DELIMITER ;

-- Procedure 2: Add Item and Validate Stock
DELIMITER //
CREATE PROCEDURE AddItemToOrder(
    IN p_order_id INT, 
    IN p_product_id INT, 
    IN p_qty INT, 
    OUT p_success BOOLEAN
)
BEGIN
    DECLARE v_stock INT;
    DECLARE v_price DECIMAL(10,2);
    
    SELECT stock_quantity, price INTO v_stock, v_price 
    FROM products WHERE product_id = p_product_id;
    
    IF v_stock >= p_qty THEN
        -- Add the item
        INSERT INTO order_items (order_id, product_id, quantity, unit_price)
        VALUES (p_order_id, p_product_id, p_qty, v_price);
        
        -- Reduce stock
        UPDATE products SET stock_quantity = stock_quantity - p_qty 
        WHERE product_id = p_product_id;
        
        -- Update order total
        UPDATE orders SET total_amount = total_amount + (v_price * p_qty)
        WHERE order_id = p_order_id;
        
        SET p_success = TRUE;
    ELSE
        SET p_success = FALSE;
    END IF;
END //
DELIMITER ;

-- Procedure 3: Sales Report
DELIMITER //
CREATE PROCEDURE GetSalesReport(IN p_start DATE, IN p_end DATE)
BEGIN
    SELECT 
        DATE(order_date) AS sale_date,
        COUNT(order_id) AS order_count,
        SUM(total_amount) AS total_revenue,
        AVG(total_amount) AS avg_order_value
    FROM orders
    WHERE order_date BETWEEN p_start AND p_end
    GROUP BY DATE(order_date);
END //
DELIMITER ;


-- Procedure 4: Update Status and Handle Cancellations
DELIMITER //
CREATE PROCEDURE UpdateOrderStatus(IN p_order_id INT, IN p_new_status VARCHAR(20))
BEGIN
    -- Check if we are cancelling to restore stock
    IF p_new_status = 'cancelled' THEN
        -- Using a cursor logic simplified: 
        UPDATE products p
        JOIN order_items oi ON p.product_id = oi.product_id
        SET p.stock_quantity = p.stock_quantity + oi.quantity
        WHERE oi.order_id = p_order_id;
    END IF;

    UPDATE orders SET status = p_new_status WHERE order_id = p_order_id;
END //