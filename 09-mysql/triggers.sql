DELIMITER //
-- Audit for NEW orders
CREATE TRIGGER trg_order_insert_audit
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_audit (order_id, action, new_status, new_total, changed_by)
    VALUES (NEW.order_id, 'INSERT', NEW.status, NEW.total_amount, USER());
END //

-- Audit for UPDATED orders
CREATE TRIGGER trg_order_update_audit
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_audit (order_id, action, old_status, new_status, old_total, new_total, changed_by)
    VALUES (OLD.order_id, 'UPDATE', OLD.status, NEW.status, OLD.total_amount, NEW.total_amount, USER());
END //

-- Audit for DELETED orders
CREATE TRIGGER trg_order_delete_audit
AFTER DELETE ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_audit (order_id, action, old_status, old_total, changed_by)
    VALUES (OLD.order_id, 'DELETE', OLD.status, OLD.total_amount, USER());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_validate_order_item
BEFORE INSERT ON order_items
FOR EACH ROW
BEGIN
    DECLARE v_stock INT;

    -- Check if product exists and get its current stock
    SELECT stock_quantity INTO v_stock 
    FROM products 
    WHERE product_id = NEW.product_id;

    IF v_stock IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Product does not exist.';
    ELSEIF NEW.quantity > v_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Insufficient stock for this product.';
    END IF;
END //
DELIMITER ;

DELIMITER //
-- Recalculate after adding an item
CREATE TRIGGER trg_update_total_insert
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders 
    SET total_amount = (SELECT SUM(quantity * unit_price) FROM order_items WHERE order_id = NEW.order_id)
    WHERE order_id = NEW.order_id;
END //

-- Recalculate after updating an item (e.g., changing quantity)
CREATE TRIGGER trg_update_total_update
AFTER UPDATE ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders 
    SET total_amount = (SELECT SUM(quantity * unit_price) FROM order_items WHERE order_id = NEW.order_id)
    WHERE order_id = NEW.order_id;
END //

-- Recalculate after deleting an item
CREATE TRIGGER trg_update_total_delete
AFTER DELETE ON order_items
FOR EACH ROW
BEGIN
    UPDATE orders 
    SET total_amount = IFNULL((SELECT SUM(quantity * unit_price) FROM order_items WHERE order_id = OLD.order_id), 0)
    WHERE order_id = OLD.order_id;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER trg_low_stock_alert
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    -- Only insert alert if stock falls below 10 and was previously above 10
    IF NEW.stock_quantity < 10 AND OLD.stock_quantity >= 10 THEN
        INSERT INTO stock_alerts (product_id, product_name, current_quantity)
        VALUES (NEW.product_id, NEW.product_name, NEW.stock_quantity);
    END IF;
END //
DELIMITER ;