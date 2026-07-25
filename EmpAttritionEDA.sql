
-- 1. UNDERSTANDING THE WORKFORCE

-- Total Employees
SELECT COUNT(*) AS TotalEmployees
FROM EmployeeAttrition;

-- Employee Distribution by Department
SELECT
    Department,
    COUNT(*) AS Employees
FROM EmployeeAttrition
GROUP BY Department
ORDER BY Employees DESC;

-- Employee Distribution by Job Role
SELECT
    JobRole,
    COUNT(*) AS Employees
FROM EmployeeAttrition
GROUP BY JobRole
ORDER BY Employees DESC;

-- Gender Distribution
SELECT
    Gender,
    COUNT(*) AS Employees
FROM EmployeeAttrition
GROUP BY Gender;

-- Marital Status Distribution
SELECT
    MaritalStatus,
    COUNT(*) Employees
FROM EmployeeAttrition
GROUP BY MaritalStatus;

-- Education Field Distribution
SELECT
    EducationField,
    COUNT(*) Employees
FROM EmployeeAttrition
GROUP BY EducationField
ORDER BY Employees DESC;

-- 2. ATTRITION ANALYSIS

-- Overall Attrition Rate
SELECT
    COUNT(*) TotalEmployees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) EmployeesLeft,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS AttritionRate
FROM EmployeeAttrition;

-- Attrition by Department
SELECT
    Department,
    COUNT(*) Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AttritionRate
FROM EmployeeAttrition
GROUP BY Department
ORDER BY AttritionRate DESC;

-- Attrition by JobRole
SELECT
    JobRole,
    COUNT(*) Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees,
    ROUND(
        100.0 * SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AttritionRate
FROM EmployeeAttrition
GROUP BY JobRole
ORDER BY AttritionRate DESC;

-- Attrition by Gender
SELECT
    Gender,
    COUNT(*) Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY Gender;

-- Attrition by Marital Status
SELECT
    MaritalStatus,
    COUNT(*) Employees,
    SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY MaritalStatus;


-- 3. SALARY ANALYSIS

-- Average Salary
SELECT
AVG(MonthlyIncome) AverageSalary
FROM EmployeeAttrition;

-- Average Salary by Department
SELECT
Department,
AVG(MonthlyIncome) AverageSalary
FROM EmployeeAttrition
GROUP BY Department
ORDER BY AverageSalary DESC;

-- Average Salary by JobRole
SELECT
JobRole,
AVG(MonthlyIncome) AverageSalary
FROM EmployeeAttrition
GROUP BY JobRole
ORDER BY AverageSalary DESC;

-- Salary of Employees Who Left
SELECT
Attrition,
AVG(MonthlyIncome) AverageSalary
FROM EmployeeAttrition
GROUP BY Attrition;

-- 4. OVERTIME ANALYSIS

-- Overtime Distribution
SELECT
OverTime,
COUNT(*) Employees
FROM EmployeeAttrition
GROUP BY OverTime;

-- Overtime vs Attrition
SELECT
OverTime,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY OverTime;

-- 5. AGE ANALYSIS

-- Average Age
SELECT AVG(Age) as AvgAge FROM EmployeeAttrition;

-- Age Distribution
SELECT Age, COUNT(*) Employees
FROM EmployeeAttrition
GROUP BY Age
ORDER BY Age;

-- Attrition by Age
SELECT Age, COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY Age
ORDER BY Age;

-- 6. EXPERIENCE ANALYSIS

-- Average Years at Company
SELECT
AVG(YearsAtCompany) AvgYearsAtCompany
FROM EmployeeAttrition;

-- Attrition by Years at Company
SELECT
YearsAtCompany,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

-- Total Working Years
SELECT AVG(TotalWorkingYears) AvgTotalWorkingYears
FROM EmployeeAttrition;

-- 7. SATISFACTION ANALYSIS

-- Job Satisfaction vs Attrition
SELECT
JobSatisfaction,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;

-- Environment Satisfaction
SELECT
EnvironmentSatisfaction,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY EnvironmentSatisfaction
ORDER BY EnvironmentSatisfaction;

-- Relationship Satisfaction
SELECT
RelationshipSatisfaction,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY RelationshipSatisfaction
ORDER BY RelationshipSatisfaction;

-- Work-Life Balance
SELECT
WorkLifeBalance,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;

-- 8. ANALYSING PROMOTION & CAREER GROWTH

-- Years Since Last promotion
SELECT
YearsSinceLastPromotion,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;

-- Job Level
SELECT
JobLevel,
COUNT(*) Employees,
AVG(MonthlyIncome) AverageSalary
FROM EmployeeAttrition
GROUP BY JobLevel;

-- 9. BUSINESS TRAVEL

-- Business Travel Distribution
SELECT
BusinessTravel,
COUNT(*) Employees
FROM EmployeeAttrition
GROUP BY BusinessTravel;

-- Business Travel vs Attrition
SELECT
BusinessTravel,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY BusinessTravel;

-- 10. OTHER USEFUL ANALYSES

-- Distance from Home
SELECT
AVG(DistanceFromHome) AvgDistance
FROM EmployeeAttrition;

-- Distance vs Attrition
SELECT
DistanceFromHome,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY DistanceFromHome
ORDER BY DistanceFromHome;

-- Training
SELECT
TrainingTimesLastYear,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY TrainingTimesLastYear;

-- Stock Options
SELECT
StockOptionLevel,
COUNT(*) Employees,
SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) LeftEmployees
FROM EmployeeAttrition
GROUP BY StockOptionLevel;




