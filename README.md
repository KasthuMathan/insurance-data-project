# Insurance Data Project
 
## Overview
This project involves Exploratory Data Analysis (EDA) and Data Visualization on an [Insurance dataset](https://www.kaggle.com/datasets/mirichoi0218/insurance) obtained from Kaggle.
The dataset was already clean, so the focus was on analyzing key metrics and visualizing trends using SQL and Excel.

## Tools Used
- **MySQL** - For data analysis, transformation, and categorization.
- **Excel** - For data visualization using pivot tables and bar charts.

## Exploratory Data Analysis (EDA)

### 1. Basic Statistics
Retrieved average, minimum, and maximum values for `age`, `bmi` and `charges`:
```sql
SELECT 
  AVG(age) AS avg_age, MIN(age) AS min_age, MAX(age) AS max_age, 
  AVG(bmi) AS avg_bmi, MIN(bmi) AS min_bmi, MAX(bmi) AS max_bmi, 
  AVG(charges) AS avg_charges, MIN(charges) AS min_charges, MAX(charges) AS max_charges
FROM insurance;
```

Checked for unique values in charges:
```sql
SELECT charges, COUNT(*) 
FROM insurance
GROUP BY charges
ORDER BY charges;
```

### 2. Data Cleaning & Transformation

- Renamed columns for better readability:
```sql
ALTER TABLE insurance
RENAME COLUMN sex TO gender;
```

- Standardized text values
```sql
UPDATE insurance
SET gender = CASE
    WHEN gender = 'female' THEN 'Female'
    WHEN gender = 'male' THEN 'Male'
    ELSE gender
END;
```

- Categorized age into groups:
```sql
UPDATE insurance
SET age_group = CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 55 THEN '46-55'
    WHEN age > 55 THEN '55+'
    ELSE 'Unknown'
END;
```

- Categorized charges into ranges:
```sql
UPDATE insurance
SET charge_range = CASE
    WHEN charges BETWEEN 0 AND 10000 THEN '0-10K'
    WHEN charges BETWEEN 10001 AND 20000 THEN '10K-20K'
    WHEN charges BETWEEN 20001 AND 30000 THEN '20K-30K'
    WHEN charges BETWEEN 30001 AND 40000 THEN '30K-40K'
    WHEN charges BETWEEN 40001 AND 50000 THEN '40K-50K'
    WHEN charges > 50000 THEN '50K+'
    ELSE 'Unknown'
END;
```

- Categorized BMI into different weight classes:
```sql
UPDATE insurance
SET bmi_category = CASE 
    WHEN bmi < 18.5 THEN 'Underweight'
    WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal Weight'
    WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
    WHEN bmi BETWEEN 30 AND 34.9 THEN 'Obese Class 1'
    WHEN bmi BETWEEN 35 AND 39.9 THEN 'Obese Class 2'
    ELSE 'Obese Class 3'
END;
```

- Adjusted region names for clarity:
```sql
UPDATE insurance
SET region = CASE
    WHEN region = 'southwest' THEN 'South-West'
    WHEN region = 'southeast' THEN 'South-East'
    WHEN region = 'northwest' THEN 'North-West'
    WHEN region = 'northeast' THEN 'North-East'
    ELSE region
END;
```

## Data Visualization
- After completing the EDA, the dataset was exported as CSV and converted to Excel (XLSX).
- Created Pivot Tables to compare
-- Age Groups vs. Charges
-- Gender vs.Charges
-- Smoker Status vs.Charges
-- BMI Categories vs.Charges
-- Regions vs. Charges
- Used Bar Charts for better data comparison.
- Designed a Dashboard for an easy-to-read summary.

## Changes & Enhancement
- Added `MODIFY COLUMN` statements for `bmi_category` and `age_group` so they are next to `bmi` and `age`.
```sql
ALTER TABLE insurance 
MODIFY COLUMN bmi_category VARCHAR(20) AFTER bmi;
```

## Key Insights
- Smokers had significantly higher insurance charges than non-smokers.
- Higher BMI categories (Obese) correlated with higher charges.
- The age group 36-45 had the highest insurance cost.
- The South - East region had the most insurance claims.
- Males and females had similar distribution, but charges varied due to smoking and BMI.

## Credits
- Datasets [Kaggle -Insurance](https://www.kaggle.com/datasets/mirichoi0218/insurance)
- EDA and SQL Tutorial: Inspired by [Alex Freberg](https://www.youtube.com/@AlexTheAnalyst)





