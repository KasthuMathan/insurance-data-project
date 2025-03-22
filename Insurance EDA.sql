SELECT * FROM medical_cost.insurance;

SELECT 
    AVG(age) AS avg_age, 
    MIN(age) AS min_age, 
    MAX(age) AS max_age, 
    AVG(bmi) AS avg_bmi, 
    MIN(bmi) AS min_bmi, 
    MAX(bmi) AS max_bmi, 
    AVG(charges) AS avg_charges, 
    MIN(charges) AS min_charges, 
    MAX(charges) AS max_charges
FROM insurance;

SELECT charges, COUNT(*) 
FROM insurance
GROUP BY charges
ORDER BY charges;

ALTER TABLE insurance
RENAME COLUMN sex TO gender;

UPDATE insurance
set gender = CASE
	WHEN gender = 'female' THEN 'Female'
    WHEN gender = 'male' THEN 'Male'
    ELSE gender
END;

SELECT gender, COUNT(*) AS count 
FROM insurance
GROUP BY gender;


ALTER TABLE insurance
ADD COLUMN age_group VARCHAR(20);

UPDATE insurance
SET age_group = CASE
    WHEN age BETWEEN 18 AND 25 THEN '18-25'
    WHEN age BETWEEN 26 AND 35 THEN '26-35'
    WHEN age BETWEEN 36 AND 45 THEN '36-45'
    WHEN age BETWEEN 46 AND 55 THEN '46-55'
    WHEN age > 55 THEN '55+'
    ELSE 'Unknown'
END;

SELECT age, age_group FROM insurance;

SELECT charges FROM insurance;

SELECT COUNT(charges) FROM insurance
WHERE charges > 25000;

SELECT
    CASE 
        WHEN charges BETWEEN 0 AND 10000 THEN '0-10K'
		WHEN charges BETWEEN 10001 AND 20000 THEN '10K-20K'
		WHEN charges BETWEEN 20001 AND 30000 THEN '20K-30K'
		WHEN charges BETWEEN 30001 AND 40000 THEN '30K-40K'
		WHEN charges BETWEEN 40001 AND 50000 THEN '40K-50K'
		WHEN charges > 50000 THEN '50K+'
		ELSE 'Unknown'
    END AS charges_range,
    COUNT(*) AS patient_count,
    AVG(charges) AS avg_charge
FROM insurance
GROUP BY charges_range;

ALTER TABLE insurance
ADD COLUMN charge_range VARCHAR(20);

SELECT COUNT(charges) FROM insurance
WHERE charges BETWEEN 10001 AND 20000;

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

SELECT charges, charge_range FROM insurance;

SELECT ROUND(charges, 2) AS charges_rounded FROM insurance;

SELECT charges, ROUND(charges, 2) AS charges_rounded 
FROM insurance;

SELECT * FROM medical_cost.insurance;

ALTER TABLE insurance
ADD COLUMN charges_rounded DECIMAL(10,2);

UPDATE insurance
SET charges_rounded = ROUND(charges, 2);

ALTER TABLE insurance DROP COLUMN charges_rounded;

UPDATE insurance
SET charges = ROUND(charges, 2);

SELECT charges FROM insurance;

SELECT charges, charges_rounded FROM insurance;

SELECT COUNT(*) FROM insurance
WHERE charge_range = '0-10K';

SELECT COUNT(*) FROM insurance
WHERE charge_range = '10K-20K';

SELECT COUNT(*) FROM insurance
WHERE charge_range = '20K-30K';

SELECT COUNT(*) FROM insurance
WHERE charge_range = '30K-40K';

SELECT COUNT(*) FROM insurance
WHERE charge_range = '40K-50K';

SELECT COUNT(*) FROM insurance
WHERE charge_range = '50K+';

SELECT COUNT(*) FROM insurance;

SELECT bmi FROM insurance;

SELECT bmi,
       CASE 
           WHEN bmi < 18.5 THEN 'Underweight'
           WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal Weight'
           WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
           WHEN bmi BETWEEN 30 AND 34.9 THEN 'Obese Class 1'
           WHEN bmi BETWEEN 35 AND 39.9 THEN 'Obese Class 2'
           ELSE 'Obese Class 3'
       END AS bmi_category
FROM insurance;

ALTER TABLE insurance
ADD COLUMN bmi_range VARCHAR(20);

UPDATE insurance
SET bmi_range = CASE
	WHEN bmi < 18.5 THEN 'Underweight'
	WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal Weight'
	WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
	WHEN bmi BETWEEN 30 AND 34.9 THEN 'Obese Class 1'
	WHEN bmi BETWEEN 35 AND 39.9 THEN 'Obese Class 2'
	ELSE 'Obese Class 3'
END;

ALTER TABLE insurance
RENAME COLUMN bmi_range TO bmi_category;

SELECT bmi, bmi_category FROM insurance;

SELECT DISTINCT region FROM insurance;

UPDATE insurance
set region = CASE
	WHEN region = 'southwest' THEN 'South-West'
    WHEN region = 'southeast' THEN 'South-East'
    WHEN region = 'northwest' THEN 'North-West'
    WHEN region = 'northeast' THEN 'North-East'
    ELSE region
END;

UPDATE insurance
set smoker = CASE
	WHEN smoker = 'yes' THEN 'Yes'
    WHEN smoker = 'no' THEN 'No'
    ELSE smoker
END;

SELECT * FROM medical_cost.insurance;

ALTER TABLE insurance 
MODIFY COLUMN bmi_category VARCHAR(20) AFTER bmi;

ALTER TABLE insurance 
MODIFY COLUMN age_group VARCHAR(20) AFTER age;