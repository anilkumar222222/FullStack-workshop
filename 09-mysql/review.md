# Review: 09-mysql

**Exercise:**  Exercise: E-Commerce Database Design and Queries
**Review Date:** 2026-01-02 16:53

---

## Status: ✅ Submitted

**Files submitted:** 18

### Relevance Check

⚠️ Submission partially matches exercise requirements
   Found: customer product category order 
   Missing: ecommerce schema queries 

### Code Review

📄 **assignment-validation-trigger.sql**
   Path: `09-mysql/challenges/assignment-validation-trigger.sql`
   Lines: 41

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **budget-utilization.sql**
   Path: `09-mysql/challenges/budget-utilization.sql`
   Lines: 20

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **date-report-function.sql**
   Path: `09-mysql/challenges/date-report-function.sql`
   Lines: 40

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **department-stats.sql**
   Path: `09-mysql/challenges/department-stats.sql`
   Lines: 7

    📋 **Challenge 1: Department Stats**
    Expected: department, employee_count, avg_salary, max_salary

    - ✅ Groups by department
    - ❌ Missing COUNT(*) for employee count
    - ✅ Calculates average salary
    - ✅ Finds maximum salary
    - ✅ Filters departments with >2 employees (HAVING)

   **Score: 4/5**

📄 **employee-hierarchy.sql**
   Path: `09-mysql/challenges/employee-hierarchy.sql`
   Lines: 5

    📋 **Challenge 2: Employee Hierarchy**
    Expected: employee_name, manager_name (self-join)

    - ✅ Uses self-join on employees table
    - ✅ Uses LEFT JOIN (handles employees without managers)
    - ✅ Joins on manager_id = id
    - ✅ Uses table aliases

   **Score: 4/4**

📄 **name-formatter.sql**
   Path: `09-mysql/challenges/name-formatter.sql`
   Lines: 4

    📋 **Challenge 6: Employee Name Formatter**
    Expected: formatted_name, email, initials (string functions)

    - ✅ Uses UPPER() function
    - ✅ Uses CONCAT() for string building
    - ✅ Uses LEFT() for initials
    - ✅ Generates email format

   **Score: 4/4**

📄 **project-workload.sql**
   Path: `09-mysql/challenges/project-workload.sql`
   Lines: 9

    📋 **Challenge 3: Project Workload**
    Expected: project_name, budget, team_size, total_hours

    - ✅ Joins projects with assignments
    - ✅ Counts team members
    - ✅ Sums allocated hours
    - ✅ Filters budget > 50000
    - ✅ Orders by total hours descending

   **Score: 5/5**

📄 **salary-adjustment.sql**
   Path: `09-mysql/challenges/salary-adjustment.sql`
   Lines: 34

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **salary-audit-trigger.sql**
   Path: `09-mysql/challenges/salary-audit-trigger.sql`
   Lines: 49

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **tenure-function.sql**
   Path: `09-mysql/challenges/tenure-function.sql`
   Lines: 31

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source

   **Score: 2/3**

📄 **top-earners.sql**
   Path: `09-mysql/challenges/top-earners.sql`
   Lines: 13

    📋 **Challenge 4: Top Earners**
    Expected: department, name, salary, rank_in_dept (window function)

    - ✅ Uses window ranking function
    - ✅ Partitions by department
    - ✅ Orders by salary descending
    - ✅ Filters top 3 earners

   **Score: 4/4**

📄 **unassigned-resources.sql**
   Path: `09-mysql/challenges/unassigned-resources.sql`
   Lines: 6

    📋 **Challenge 5: Unassigned Resources**
    Expected: id, name, department (employees not in any project)

    - ✅ Uses LEFT JOIN with assignments
    - ✅ Checks for NULL (unassigned employees)
    - ✅ References employee_id for join
    - ✅ Selects required columns (id, name, department)

   **Score: 4/4**

📄 **functions.sql**
   Path: `09-mysql/functions.sql`
   Lines: 60

    - ✅ Contains 4 SELECT statement(s)
    - ✅ Uses JOIN operations
    - ✅ Uses aggregate functions
    - ✅ Uses explicit column selection

   **Score: 4/5**

📄 **procedures.sql**
   Path: `09-mysql/procedures.sql`
   Lines: 76

    - ✅ Contains SQL statements
    - ✅ Has SQL comments

   **Score: 3/3**

📄 **queries.sql**
   Path: `09-mysql/queries.sql`
   Lines: 83

    - ✅ Contains 11 SELECT statement(s)
    - ✅ Uses JOIN operations
    - ✅ Uses aggregate functions
    - ✅ Uses GROUP BY for aggregation
    - ✅ Uses explicit column selection

   **Score: 5/5**

📄 **schema.sql**
   Path: `09-mysql/schema.sql`
   Lines: 44

    - ✅ Has table definitions
    - ✅ Defines primary keys
    - ✅ Defines foreign key relationships
    - ✅ Uses NOT NULL constraints
    - ✅ Uses auto-increment for IDs

   **Score: 5/5**

📄 **seed_data.sql**
   Path: `09-mysql/seed_data.sql`
   Lines: 58

    - ✅ Contains SQL statements

   **Score: 2/3**

📄 **triggers.sql**
   Path: `09-mysql/triggers.sql`
   Lines: 94

    - ✅ Contains SQL statements
    - ✅ Has SQL comments

   **Score: 3/3**

### Topic Score: 64 / 68 (94%)

---

## Challenge

**Status:** ✅ Submitted (12 files)

### Challenge Relevance Check

✅ Submission appears relevant to the exercise
   Found keywords: employee department salary project assignment 

### Challenge Code Review

📄 **assignment-validation-trigger.sql**
   Lines: 41

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **budget-utilization.sql**
   Lines: 20

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **date-report-function.sql**
   Lines: 40

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **department-stats.sql**
   Lines: 7

    📋 **Challenge 1: Department Stats**
    Expected: department, employee_count, avg_salary, max_salary

    - ✅ Groups by department
    - ❌ Missing COUNT(*) for employee count
    - ✅ Calculates average salary
    - ✅ Finds maximum salary
    - ✅ Filters departments with >2 employees (HAVING)

   **Score: 4/5**

📄 **employee-hierarchy.sql**
   Lines: 5

    📋 **Challenge 2: Employee Hierarchy**
    Expected: employee_name, manager_name (self-join)

    - ✅ Uses self-join on employees table
    - ✅ Uses LEFT JOIN (handles employees without managers)
    - ✅ Joins on manager_id = id
    - ✅ Uses table aliases

   **Score: 4/4**

📄 **name-formatter.sql**
   Lines: 4

    📋 **Challenge 6: Employee Name Formatter**
    Expected: formatted_name, email, initials (string functions)

    - ✅ Uses UPPER() function
    - ✅ Uses CONCAT() for string building
    - ✅ Uses LEFT() for initials
    - ✅ Generates email format

   **Score: 4/4**

📄 **project-workload.sql**
   Lines: 9

    📋 **Challenge 3: Project Workload**
    Expected: project_name, budget, team_size, total_hours

    - ✅ Joins projects with assignments
    - ✅ Counts team members
    - ✅ Sums allocated hours
    - ✅ Filters budget > 50000
    - ✅ Orders by total hours descending

   **Score: 5/5**

📄 **salary-adjustment.sql**
   Lines: 34

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **salary-audit-trigger.sql**
   Lines: 49

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source
    - ✅ Uses filtering/joining

   **Score: 3/3**

📄 **tenure-function.sql**
   Lines: 31

    📋 **SQL Query Review**

    - ✅ Contains SELECT statement
    - ✅ Specifies table source

   **Score: 2/3**

📄 **top-earners.sql**
   Lines: 13

    📋 **Challenge 4: Top Earners**
    Expected: department, name, salary, rank_in_dept (window function)

    - ✅ Uses window ranking function
    - ✅ Partitions by department
    - ✅ Orders by salary descending
    - ✅ Filters top 3 earners

   **Score: 4/4**

📄 **unassigned-resources.sql**
   Lines: 6

    📋 **Challenge 5: Unassigned Resources**
    Expected: id, name, department (employees not in any project)

    - ✅ Uses LEFT JOIN with assignments
    - ✅ Checks for NULL (unassigned employees)
    - ✅ References employee_id for join
    - ✅ Selects required columns (id, name, department)

   **Score: 4/4**

### Challenge Score: 42 / 44 (95%)


---

*Generated by Learner Review Tool v2.0*
