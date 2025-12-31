DELIMITER //

CREATE TRIGGER trg_validate_assignment
BEFORE INSERT ON assignments
FOR EACH ROW
BEGIN
    DECLARE project_count INT;
    DECLARE total_hours INT;

    -- 1. Count current projects for the employee
    SELECT COUNT(*) INTO project_count 
    FROM assignments 
    WHERE employee_id = NEW.employee_id;

    -- 2. Calculate current total hours for the employee
    SELECT IFNULL(SUM(hours_allocated), 0) INTO total_hours 
    FROM assignments 
    WHERE employee_id = NEW.employee_id;

    -- Validation 1: Project Limit
    IF project_count >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Employee is already assigned to the maximum of 3 projects.';
    END IF;

    -- Validation 2: Hour Limit
    IF (total_hours + NEW.hours_allocated) > 2080 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: Total allocated hours cannot exceed 2080.';
    END IF;
END //

DELIMITER ;
-- This should succeed
INSERT INTO assignments (employee_id, project_id, role, hours_allocated) 
VALUES (1, 4, 'Consultant', 100);
-- This should FAIL with "Employee is already assigned to the maximum of 3 projects."
INSERT INTO assignments (employee_id, project_id, role, hours_allocated) 
VALUES (1, 10, 'Advisor', 10);
-- This should FAIL with "Total allocated hours cannot exceed 2080."
INSERT INTO assignments (employee_id, project_id, role, hours_allocated) 
VALUES (15, 12, 'Lead', 3000);