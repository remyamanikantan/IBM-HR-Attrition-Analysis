-- DATA QUALITY CHECKS

-- Check Total Records
SELECT COUNT(*) AS TotalEmployees
FROM EmployeeAttrition;

-- Check Number of Columns
SELECT COUNT(*) AS TotalColumns
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'EmployeeAttrition';

-- To check for duplicate employees
SELECT EmployeeNumber, COUNT(*)
FROM EmployeeAttrition
GROUP BY EmployeeNumber
HAVING COUNT(*) > 1;

-- Check for Null values
SELECT
SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Age,
SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Attrition,
SUM(CASE WHEN BusinessTravel IS NULL THEN 1 ELSE 0 END) AS BusinessTravel,
SUM(CASE WHEN DailyRate IS NULL THEN 1 ELSE 0 END) AS DailyRate,
SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Department,
SUM(CASE WHEN DistanceFromHome IS NULL THEN 1 ELSE 0 END) AS DistanceFromHome,
SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS Education,
SUM(CASE WHEN EducationField IS NULL THEN 1 ELSE 0 END) AS EducationField,
SUM(CASE WHEN EmployeeNumber IS NULL THEN 1 ELSE 0 END) AS EmployeeNumber,
SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender,
SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS JobRole,
SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS MonthlyIncome,
SUM(CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) AS OverTime,
SUM(CASE WHEN YearsAtCompany IS NULL THEN 1 ELSE 0 END) AS YearsAtCompany
FROM EmployeeAttrition;

-- Check for Blank Text Values

SELECT *
FROM EmployeeAttrition
WHERE Department = ''
OR JobRole = ''
OR Gender = ''
OR Attrition = '';

-- Verify Unique Values (Department, Gender, Attrition, BusinessTravel, OverTime)

SELECT DISTINCT Department FROM EmployeeAttrition;

SELECT DISTINCT Gender FROM EmployeeAttrition;

SELECT DISTINCT Attrition FROM EmployeeAttrition;

SELECT DISTINCT BusinessTravel FROM EmployeeAttrition;

SELECT DISTINCT OverTime FROM EmployeeAttrition;

-- Check Numeric Ranges (Age, MonthlyIncome, YearsAtComapny, DistanceFromHome)

SELECT 
MIN(Age) MinAge,
MAX(Age) MaxAge
FROM EmployeeAttrition;

SELECT
MIN(MonthlyIncome) MinIncome,
MAX(MonthlyIncome) MaxIncome,
AVG(MonthlyIncome) AvgIncome
FROM EmployeeAttrition;

SELECT
MIN(YearsAtCompany) MinYearsAtCompany,
MAX(YearsAtCompany) MaxYearsAtCompany
FROM EmployeeAttrition;

SELECT
MIN(DistanceFromHome) MinDistanceFromHome,
MAX(DistanceFromHome) MaxDistanceFromHome
FROM EmployeeAttrition;

--Check Constant Columns

SELECT DISTINCT EmployeeCount FROM EmployeeAttrition;

SELECT DISTINCT Over18 FROM EmployeeAttrition;

SELECT DISTINCT StandardHours FROM EmployeeAttrition;
-- (These columns provide no analytical value.)

-- Check for Negative Values
SELECT *
FROM EmployeeAttrition
WHERE Age < 0
OR MonthlyIncome < 0
OR DailyRate < 0
OR HourlyRate < 0
OR DistanceFromHome < 0
OR YearsAtCompany < 0;

--Check Satisfaction Scores

SELECT DISTINCT JobSatisfaction FROM EmployeeAttrition ORDER BY JobSatisfaction;

SELECT DISTINCT EnvironmentSatisfaction FROM EmployeeAttrition ORDER BY EnvironmentSatisfaction;

SELECT DISTINCT RelationshipSatisfaction FROM EmployeeAttrition ORDER BY RelationshipSatisfaction;

SELECT DISTINCT WorkLifeBalance FROM EmployeeAttrition ORDER BY WorkLifeBalance;

SELECT DISTINCT JobInvolvement FROM EmployeeAttrition ORDER BY JobInvolvement;

-- Check Education Levels
SELECT DISTINCT Education FROM EmployeeAttrition 
ORDER BY Education;

-- Check Job Levels
SELECT DISTINCT JobLevel FROM EmployeeAttrition
ORDER BY JobLevel;

-- Check Performance Ratings
SELECT DISTINCT PerformanceRating
FROM EmployeeAttrition;

-- Check Attrition Distribution
SELECT
Attrition,
COUNT(*) AS Employees
FROM EmployeeAttrition
GROUP BY Attrition;

-- Check for Leading or Trailing Spaces
SELECT *
FROM EmployeeAttrition
WHERE Department <> LTRIM(RTRIM(Department))
OR JobRole <> LTRIM(RTRIM(JobRole))
OR Gender <> LTRIM(RTRIM(Gender));

-- Review Data Types
SELECT
COLUMN_NAME,
DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'EmployeeAttrition';



