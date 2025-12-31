-- Format Names, Calculate Days, Currency, and Categoriz
SELECT 
    CONCAT(UPPER(last_name), ', ', CONCAT(UPPER(LEFT(first_name, 1)), LOWER(SUBSTRING(first_name, 2)))) AS customer_formatted,
    TIMESTAMPDIFF(DAY, order_date, NOW()) AS order_age_days,
    CONCAT('$', FORMAT(total_amount, 2)) AS formatted_price,
    CASE 
        WHEN total_amount < 50 THEN 'Small'
        WHEN total_amount BETWEEN 50 AND 200 THEN 'Medium'
        ELSE 'Large'
    END AS order_size
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Function 1: Calculate Order Total with 8% Tax
DELIMITER //
CREATE FUNCTION CalculateOrderTotal(p_order_id INT) 
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE v_total DECIMAL(12,2);
    SELECT SUM(quantity * unit_price) INTO v_total 
    FROM order_items WHERE order_id = p_order_id;
    
    IF v_total IS NULL THEN RETURN 0; END IF;
    RETURN v_total * 1.08;
END //

-- Function 2: Get Customer Loyalty Level
DELIMITER //
CREATE FUNCTION GetCustomerLevel(p_customer_id INT) 
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE v_spend DECIMAL(12,2);
    SELECT SUM(total_amount) INTO v_spend FROM orders WHERE customer_id = p_customer_id;
    
    IF v_spend > 1000 THEN RETURN 'Gold';
    ELSEIF v_spend > 500 THEN RETURN 'Silver';
    ELSE RETURN 'Bronze';
    END IF;
END //
DELIMITER ;

-- Function 3: Format Product Code (e.g., ELE-00042)
DELIMITER //
CREATE FUNCTION FormatProductCode(p_product_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE v_prefix VARCHAR(3);
    DECLARE v_code VARCHAR(20);
    
    SELECT UPPER(LEFT(category_name, 3)) INTO v_prefix 
    FROM categories c 
    JOIN products p ON c.category_id = p.category_id 
    WHERE p.product_id = p_product_id;
    
    SET v_code = CONCAT(v_prefix, '-', LPAD(p_product_id, 5, '0'));
    RETURN v_code;
END //
DELIMITER ;