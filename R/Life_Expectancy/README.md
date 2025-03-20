# Life Expectancy Data Analysis

This project performs an in-depth analysis of a dataset containing health-related indicators for different countries over multiple years. The dataset includes key variables such as life expectancy, adult mortality, infant deaths, alcohol consumption, and more. The primary goal of this analysis is to explore health trends, disparities across countries, and factors influencing life expectancy.

## Dataset Overview

The dataset includes **2938 rows** and **22 fields**, containing both numerical and categorical data. The key variables in the dataset are:

### Numerical Data:
- Life Expectancy
- Adult Mortality
- Infant Deaths
- Alcohol Consumption
- Percentage Expenditure on Health
- Hepatitis B Immunization Rate
- Measles Cases
- BMI (Body Mass Index)
- Under-five Deaths
- Polio Immunization Rate
- Total Expenditure
- Diphtheria Immunization Rate
- HIV/AIDS Prevalence
- GDP (Gross Domestic Product)
- Population
- Thinness (1-19 years)
- Income Composition of Resources
- Schooling

### Categorical Data:
- Country
- Year
- Status (Development Status: Developed/Developing)

## Project Goals

This analysis aims to:
1. **Explore health disparities**: Investigate life expectancy and mortality trends across different countries and regions.
2. **Examine factors affecting life expectancy**: Analyze the relationship between health indicators (e.g., BMI, alcohol consumption, schooling) and life expectancy.
3. **Perform comparative studies**: Compare health indicators between developed and developing countries.
4. **Policy evaluation**: Evaluate the effectiveness of policies by exploring the impact of health expenditure, education, and economic factors on life expectancy.

## Key Insights

### 1. **Life Expectancy Analysis**
   - A significant difference in life expectancy between developed and developing countries was observed.
   - Developed countries have a higher average life expectancy compared to developing countries.

### 2. **Correlation with GDP**
   - A positive correlation between GDP and life expectancy was found, suggesting that wealthier countries tend to have higher life expectancy.
  
### 3. **Alcohol Consumption**
   - No significant difference was found in alcohol consumption between 2000 and 2015 in developing countries.
  
### 4. **BMI Differences**
   - There is a significant difference in BMI between developed and developing countries, with developed nations having a higher average BMI.

## Statistical Analysis

### Hypothesis Testing:
- **T-tests**: Used to compare life expectancy between developed and developing countries, and alcohol consumption between years.
- **Paired t-tests**: Analyzed changes in under-five mortality rates and alcohol consumption over time.
- **Regression Analysis**: Explored the impact of BMI, alcohol consumption, and income composition on life expectancy.

### Key Results:
- Significant differences were found in life expectancy between developed and developing countries.
- Alcohol consumption in developing countries remained stable over the years, with no significant difference.
- BMI and life expectancy were significantly correlated with economic factors like GDP and income composition.

## Data Cleaning

- **Missing Values**: Median imputation was applied to numerical columns with missing values.
- **Outlier Detection**: IQR (Interquartile Range) was used to identify potential outliers in alcohol consumption and BMI.

## Visualizations

Several visualizations were generated to better understand the data:
- **Histograms**: Life expectancy distribution across countries.
- **Bar Charts**: Comparison of adult mortality rates by country development status.
- **Scatter Plots**: Relationships between GDP and life expectancy, alcohol consumption trends.
- **Box Plots**: BMI by country development status.
- **Heatmaps**: Correlation matrix to identify relationships between health-related variables.

## Requirements

- **R** (Programming language)
- **tidyverse**: For data manipulation and visualization
- **ggplot2**: For creating plots and charts
- **dplyr**: For data manipulation

  ## Conclusion
  This project offers an in-depth look at life expectancy trends across the globe, with significant findings about the impact of economic and health factors. The analysis highlights disparities between developed and developing countries and provides insights into potential areas for policy intervention.
  
  ## Next Steps
  

Advanced Analysis: Use machine learning or multivariate regression to further explore predictors of life expectancy.
Geographic Stratification: Analyze health trends by region or continent for more targeted insights.
Outlier Investigation: Further investigate outliers to understand unique cases.

## References

Life Expectancy Dataset by WHO (KumarRajarshi, 2018) - Kaggle Dataset
Data Visualization - GGPLOT2: Quick correlation matrix heatmap
Statistical Tests - Paired Sample T-Test Guide


## Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/life-expectancy-analysis.git






Life Expectancy Dataset by WHO (KumarRajarshi, 2018) - Kaggle Dataset
Data Visualization - GGPLOT2: Quick correlation matrix heatmap
Statistical Tests - Paired Sample T-Test Guide

