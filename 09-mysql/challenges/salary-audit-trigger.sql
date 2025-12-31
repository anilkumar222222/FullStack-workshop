CREATE TABLE salary_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_percent DECIMAL(5,2),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
DELIMITER //

CREATE TRIGGER trg_salary_audit
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    -- Only log if the salary has actually been modified
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO salary_audit (
            employee_id, 
            old_salary, 
            new_salary, 
            change_percent
        )
        VALUES (
            OLD.id, 
            OLD.salary, 
            NEW.salary, 
            ((NEW.salary - OLD.salary) / OLD.salary) * 100
        );
    END IF;
END //

DELIMITER ;
-- Disable safe mode if necessary
SET SQL_SAFE_UPDATES = 0;

-- 1. Give Alice Johnson a raise
UPDATE employees 
SET salary = 135000.00 
WHERE name = 'Alice Johnson';

-- 2. Give Bob Smith a 5% raise
UPDATE employees 
SET salary = salary * 1.05 
WHERE name = 'Bob Smith';

-- 3. Check the audit trail
SELECT * FROM salary_audit;

-- Re-enable safe mode
SET SQL_SAFE_UPDATES = 1;