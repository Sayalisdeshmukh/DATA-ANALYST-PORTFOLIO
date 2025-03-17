-- Create and use the database
CREATE DATABASE IF NOT EXISTS pharmacy;
USE pharmacy;

-- Create Member Dimension Table
CREATE TABLE dim_member (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birth_date DATE,
    gender CHAR(1),
    age INT
);

-- Create Drug Dimension Table
CREATE TABLE dim_drug (
    drug_ndc INT PRIMARY KEY,
    drug_name VARCHAR(100),
    drug_form_code VARCHAR(10),
    drug_form_desc VARCHAR(100),
    brand_generic_desc VARCHAR(50)
);

-- Create Prescription Fact Table
CREATE TABLE fact_prescription (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    drug_ndc INT,
    fill_date DATE,
    copay DECIMAL(10, 2),
    insurance_paid DECIMAL(10, 2)
);








-- Populate dim_drug table
INSERT INTO dim_drug (drug_ndc, drug_name, drug_form_code, drug_form_desc, brand_generic_desc)
SELECT DISTINCT
    drug_ndc,
    drug_name,
    drug_form_code,
    drug_form_desc,
    drug_brand_generic_desc
FROM final_project_data;

-- Populate dim_member table
INSERT INTO dim_member (member_id, first_name, last_name, birth_date, gender, age)
SELECT DISTINCT
    member_id,
    member_first_name,
    member_last_name,
    CASE 
        WHEN member_birth_date != '' THEN STR_TO_DATE(member_birth_date, '%m/%d/%Y')
        ELSE NULL
    END AS birth_date,
    member_gender,
    member_age
FROM final_project_data;



-- Populate fact_prescription table
INSERT INTO fact_prescription (member_id, drug_ndc, fill_date, copay, insurance_paid)
SELECT
    member_id,
    drug_ndc,
    CASE 
        WHEN fill_date1 != '' THEN STR_TO_DATE(fill_date1, '%m/%d/%Y')
        ELSE NULL
    END AS fill_date,
    CASE 
        WHEN copay1 != '' THEN CAST(copay1 AS DECIMAL(10, 2))
        ELSE NULL
    END AS copay,
    CASE 
        WHEN insurancepaid1 != '' THEN CAST(insurancepaid1 AS DECIMAL(10, 2))
        ELSE NULL
    END AS insurance_paid
FROM final_project_data
WHERE fill_date1 IS NOT NULL
UNION ALL
SELECT
    member_id,
    drug_ndc,
    CASE 
        WHEN fill_date2 != '' THEN STR_TO_DATE(fill_date2, '%m/%d/%Y')
        ELSE NULL
    END AS fill_date,
    CASE 
        WHEN copay2 != '' THEN CAST(copay2 AS DECIMAL(10, 2))
        ELSE NULL
    END AS copay,
    CASE 
        WHEN insurancepaid2 != '' THEN CAST(insurancepaid2 AS DECIMAL(10, 2))
        ELSE NULL
    END AS insurance_paid
FROM final_project_data
WHERE fill_date2 IS NOT NULL
UNION ALL
SELECT
    member_id,
    drug_ndc,
    CASE 
        WHEN fill_date3 != '' THEN STR_TO_DATE(fill_date3, '%m/%d/%Y')
        ELSE NULL
    END AS fill_date,
    CASE 
        WHEN copay3 != '' THEN CAST(copay3 AS DECIMAL(10, 2))
        ELSE NULL
    END AS copay,
    CASE 
        WHEN insurancepaid3 != '' THEN CAST(insurancepaid3 AS DECIMAL(10, 2))
        ELSE NULL
    END AS insurance_paid
FROM final_project_data
WHERE fill_date3 IS NOT NULL;






-- Fact Table: Add FK for member_id referencing dim_member
ALTER TABLE fact_prescription
ADD CONSTRAINT fk_member_id
FOREIGN KEY (member_id)
REFERENCES dim_member (member_id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

-- Fact Table: Add FK for drug_ndc referencing dim_drug
ALTER TABLE fact_prescription
ADD CONSTRAINT fk_drug_ndc
FOREIGN KEY (drug_ndc)
REFERENCES dim_drug (drug_ndc)
ON DELETE RESTRICT
ON UPDATE CASCADE;


SELECT * FROM dim_member;
SELECT * FROM dim_drug;           -- View all data in the drug dimension table
SELECT * FROM fact_prescription;








#1. Number of Prescriptions Grouped by Drug Name
SELECT 
    d.drug_name AS drug_name, -- Using the correct column name
    COUNT(f.prescription_id) AS prescription_count
FROM 
    fact_prescription f
JOIN 
    dim_drug d ON f.drug_ndc = d.drug_ndc
GROUP BY 
    d.drug_name;




#2. Total Prescriptions, Unique Members, Copay, and Insurance Paid Grouped by Age Group
SELECT 
    CASE 
        WHEN m.age >= 65 THEN 'age 65+'
        ELSE '< 65'
    END AS age_group,
    COUNT(f.prescription_id) AS total_prescriptions,
    COUNT(DISTINCT m.member_id) AS unique_members,
    SUM(f.copay) AS total_copay,
    SUM(f.insurance_paid) AS total_insurance_paid
FROM 
    fact_prescription f
JOIN 
    dim_member m ON f.member_id = m.member_id
GROUP BY 
    age_group;
    
    
    
    
    #3.. Most Recent Prescription Fill Date and Insurance Paid
    WITH RecentFill AS (
    SELECT 
        f.member_id,
        m.first_name,
        m.last_name,
        d.drug_name AS drug_name, -- Using the correct column name
        f.fill_date,
        f.insurance_paid,
        ROW_NUMBER() OVER (PARTITION BY f.member_id ORDER BY f.fill_date DESC) AS row_num
    FROM 
        fact_prescription f
    JOIN 
        dim_member m ON f.member_id = m.member_id
    JOIN 
        dim_drug d ON f.drug_ndc = d.drug_ndc
)
SELECT 
    member_id,
    first_name,
    last_name,
    drug_name,
    fill_date,
    insurance_paid
FROM 
    RecentFill
WHERE 
    row_num = 1;

