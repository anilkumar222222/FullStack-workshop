DELIMITER //

CREATE FUNCTION GetTenureCategory(hire_date DATE) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE years_worked INT;
    DECLARE category VARCHAR(20);
    
    SET years_worked = TIMESTAMPDIFF(YEAR, hire_date, CURDATE());
    
    IF years_worked > 5 THEN
        SET category = 'Veteran';
    ELSEIF years_worked >= 2 THEN
        SET category = 'Experienced';
    ELSE
        SET category = 'New Hire';
    END IF;
    
    RETURN category;
END //

DELIMITER ;



SELECT 
    name, 
    hire_date, 
    GetTenureCategory(hire_date) AS tenure_category
FROM employees
ORDER BY hire_date ASC;