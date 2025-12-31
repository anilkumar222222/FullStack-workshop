DELIMITER //

CREATE PROCEDURE AdjustDepartmentSalary(
    IN dept VARCHAR(50), 
    IN percent DECIMAL(5,2), 
    OUT affected_count INT
)
BEGIN
    -- Initialize affected_count to 0
    SET affected_count = 0;

    -- Safety check: only proceed if percentage is positive
    IF percent >= 0 THEN
        UPDATE employees 
        SET salary = salary * (1 + (percent / 100))
        WHERE department = dept;
        
        -- Get the number of rows updated
        SET affected_count = ROW_COUNT();
    END IF;
END //

DELIMITER ;
-- 1. Initialize a variable for the output
SET @count = 0;

CALL AdjustDepartmentSalary('Engineering', 10.00, @count);

-- 3. Check the results
SELECT @count AS employees_updated;

-- 4. Verify the new salaries
SELECT name, department, salary 
FROM employees 
WHERE department = 'Engineering';