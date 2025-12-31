DELIMITER //

CREATE PROCEDURE GetBudgetUtilization()
BEGIN
    SELECT 
        p.name AS project_name,
        p.budget,
        -- Calculate Total Salary Cost: (Annual Salary / 2080) * Hours Allocated
        ROUND(SUM((e.salary / 2080) * a.hours_allocated), 2) AS salary_cost,
        -- Calculate Remaining Budget
        ROUND(p.budget - SUM((e.salary / 2080) * a.hours_allocated), 2) AS remaining,
        -- Calculate Utilization Percentage
        ROUND((SUM((e.salary / 2080) * a.hours_allocated) / p.budget) * 100, 2) AS utilization_pct
    FROM projects p
    JOIN assignments a ON p.id = a.project_id
    JOIN employees e ON a.employee_id = e.id
    GROUP BY p.id, p.name, p.budget;
END //

DELIMITER ;
CALL GetBudgetUtilization();