DELIMITER //

CREATE FUNCTION GetProjectStatus(p_id INT) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE v_start DATE;
    DECLARE v_end DATE;
    DECLARE status VARCHAR(20);

    -- Fetch the dates for the given project
    SELECT start_date, end_date INTO v_start, v_end 
    FROM projects 
    WHERE id = p_id;

    -- Logical checks
    IF v_start IS NULL THEN
        SET status = 'Unknown';
    ELSEIF v_start > CURDATE() THEN
        SET status = 'Not Started';
    ELSEIF CURDATE() BETWEEN v_start AND v_end THEN
        SET status = 'In Progress';
    ELSEIF v_end < CURDATE() THEN
        -- Note: In a real system, you'd check a 'completion_date' column here
        SET status = 'Completed';
    ELSE
        SET status = 'Overdue';
    END IF;

    RETURN status;
END //

DELIMITER ;

SELECT 
    name, 
    start_date, 
    end_date, 
    GetProjectStatus(id) AS status
FROM projects
ORDER BY start_date DESC;