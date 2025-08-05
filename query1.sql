-- This query calculates the average billing amount for each insurance provider.
-- It helps identify cost disparities between insurance types (e.g., public vs. private).
SELECT Insurance_Provider, AVG(Billing_Amount) AS Avg_Cost
FROM healthcare_data
GROUP BY Insurance_Provider
ORDER BY Avg_Cost DESC;

-- This query counts the number of patients with each medical condition,
-- It can reveal gender disparities in diagnosis or health conditions.
SELECT Gender, Medical_Condition, COUNT(*) AS Patient_Count
FROM healthcare_data
GROUP BY Gender, Medical_Condition
ORDER BY Gender, Patient_Count DESC;

-- This query calculates the average hospital stay duration for each insurance provider.
-- This can reveal potential inequalities in the level of care or discharge practices.
SELECT Insurance_Provider, 
       AVG(Discharge_Date::date - Date_of_Admission::date) AS Avg_Stay_Duration
FROM healthcare_data
GROUP BY Insurance_Provider;

--This query compares hospitals by:
-- - Total number of patients treated
-- - Average billing amount per patient
-- - Average length of patient stay
-- - It helps identify facilities with higher costs or longer stays, which may indicate overburdening or inefficiencies.
SELECT Hospital, 
       COUNT(*) AS Total_Patients, 
       AVG(Billing_Amount) AS Avg_Billing_Amount, 
       AVG(Discharge_Date::date - Date_of_Admission::date) AS Avg_Length_of_Stay
FROM healthcare_data
GROUP BY Hospital;

-- This query groups patients into age brackets and counts the number of occurrences for each medical condition.
-- Useful for identifying age-specific health challenges or trends.
SELECT 
    CASE 
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 34 THEN '18-34'
        WHEN Age BETWEEN 35 AND 49 THEN '35-49'
        WHEN Age BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS Age_Group,
    Medical_Condition, 
    COUNT(*) AS Condition_Count
FROM healthcare_data
GROUP BY Age_Group, Medical_Condition
ORDER BY Age_Group, Condition_Count DESC;