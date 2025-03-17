# Project – Pharmacy Claims

## Introduction
This project demonstrates the process of transforming raw data into a star schema for efficient data analysis within a relational database management system (RDBMS). The goal is to organize the data for analytical queries by normalizing it into relational tables, implementing primary and foreign key relationships, and creating an Entity Relationship Diagram (ERD) for a clear depiction of the database schema. SQL queries have been designed to highlight the analytical potential of the schema.

## Project Components
- **Data Transformation**: The raw dataset was transformed into three relational tables adhering to the Third Normal Form (3NF).
- **Star Schema Design**: The schema consists of one fact table and two dimension tables:
  - `fact_prescription`: Contains details about individual prescription claims.
  - `dim_member`: Contains information about the members who filled prescriptions.
  - `dim_drug`: Contains information about the drugs prescribed.

## Tables and Keys
### Fact Table: `fact_prescription`
- Contains additive measures (`copay` and `insurance_paid`) and references member and drug information through foreign keys.
- **Primary Key**: `prescription_id`
- **Foreign Keys**: `member_id`, `drug_ndc`
- Other Attributes: `fill_date`, `copay`, `insurance_paid`

### Dimension Tables:
- **`dim_member`**: Contains member details such as `member_id`, `first_name`, `last_name`, `birth_date`, `gender`, and `age`.
  - **Primary Key**: `member_id`
  
- **`dim_drug`**: Contains drug details such as `drug_ndc`, `drug_name`, `drug_form_code`, and `drug_form_desc`.
  - **Primary Key**: `drug_ndc`

### Relationships
- One-to-many relationships exist between `fact_prescription` and the dimension tables (`dim_member` and `dim_drug`).
- Referential integrity is enforced using primary and foreign keys.

## Entity Relationship Diagram (ERD)
The ERD represents the database schema using a crow's foot notation. Here's a breakdown of the schema:

### Fact Table: `fact_prescription`
- **Primary Key**: `prescription_id`
- **Foreign Keys**: 
  - `member_id` references `dim_member(member_id)`
  - `drug_ndc` references `dim_drug(drug_ndc)`
- **Attributes**: `fill_date`, `copay`, `insurance_paid`

### Dimension Table: `dim_member`
- **Primary Key**: `member_id`
- **Attributes**: `first_name`, `last_name`, `birth_date`, `gender`, `age`

### Dimension Table: `dim_drug`
- **Primary Key**: `drug_ndc`
- **Attributes**: `drug_name`, `drug_form_code`, `drug_form_desc`

### Relationships:
- The `fact_prescription` table is connected to `dim_member` and `dim_drug` via foreign keys, representing a star schema model. This schema allows for efficient data organization for analytical queries.


## SQL Queries
SQL queries are designed to analyze the transformed data:
- Group prescriptions by drug name.
- Summarize prescriptions by age group.
- Fetch insurance-paid amounts for the most recent prescription filled by a member.

## Files Included
- `Pharmacy_Claims.sql`: SQL file with queries.
- `Pharmacy_Claims.pdf`: Final project report detailing the schema, relationships, and design.
- `Pharmacy Claims_ERD.pdf`: ERD diagram of the database.

## References
- Simplilearn, SQL Normalization: [Link](https://www.simplilearn.com/tutorials/sql-tutorial/what-is-normalization-in-sql)
- W3Schools SQL Foreign Key: [Link](https://www.w3schools.com/sql/sql_foreignkey.asp)
- TechTarget, Star Schema: [Link](https://www.techtarget.com/searchdatamanagement/definition/star-schema)

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

