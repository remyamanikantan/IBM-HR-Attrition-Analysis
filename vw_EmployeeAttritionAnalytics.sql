CREATE VIEW vw_EmployeeAttritionAnalytics AS
SELECT

    Age,
    Attrition,
    BusinessTravel,
    Department,
    DistanceFromHome,
    Education,
    EducationField,
    EmployeeNumber,
    EnvironmentSatisfaction,
    Gender,
    JobInvolvement,
    JobLevel,
    JobRole,
    JobSatisfaction,
    MaritalStatus,
    MonthlyIncome,
    NumCompaniesWorked,
    OverTime,
    PercentSalaryHike,
    PerformanceRating,
    RelationshipSatisfaction,
    StockOptionLevel,
    TotalWorkingYears,
    TrainingTimesLastYear,
    WorkLifeBalance,
    YearsAtCompany,
    YearsInCurrentRole,
    YearsSinceLastPromotion,
    YearsWithCurrManager,

    -- Age Group
    CASE
        WHEN Age < 25 THEN '18-24'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END AS AgeGroup,

    -- Income Band
    
CASE
    WHEN MonthlyIncome < 3000 THEN 'Low'
    WHEN MonthlyIncome < 7000 THEN 'Medium'
    WHEN MonthlyIncome < 12000 THEN 'High'
    ELSE 'Very High'
END AS IncomeBand,

CASE
    WHEN MonthlyIncome < 3000 THEN 1
    WHEN MonthlyIncome < 7000 THEN 2
    WHEN MonthlyIncome < 12000 THEN 3
    ELSE 4
END AS IncomeBandSort,

    -- Experience Band
    CASE
        WHEN YearsAtCompany < 2 THEN '0-2 Years'
        WHEN YearsAtCompany < 5 THEN '3-5 Years'
        WHEN YearsAtCompany < 10 THEN '6-10 Years'
        ELSE '10+ Years'
    END AS ExperienceBand,

    -- Distance Band
    CASE
        WHEN DistanceFromHome <= 5 THEN 'Near'
        WHEN DistanceFromHome <= 15 THEN 'Moderate'
        ELSE 'Far'
    END AS DistanceBand,

    -- Career Stage
    CASE
        WHEN TotalWorkingYears < 5 THEN 'Early Career'
        WHEN TotalWorkingYears < 15 THEN 'Mid Career'
        ELSE 'Senior Career'
    END AS CareerStage,

    -- JobSatisfaction
     CASE
        WHEN JobSatisfaction < 1 THEN 'very Low'
        WHEN JobSatisfaction < 2 THEN 'Low'
        WHEN JobSatisfaction < 3 THEN 'Medium'
        ELSE 'High'
    END AS JobSatisfactionband


FROM EmployeeAttrition;