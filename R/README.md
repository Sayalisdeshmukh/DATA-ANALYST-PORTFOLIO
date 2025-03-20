# Credit Card Customer Behavior Analysis

This project explores the behavior of credit card customers, identifying key trends and insights based on customer demographics, spending habits, credit limits, and other features. The analysis helps in uncovering churn factors, understanding spending behavior, and optimizing credit limit decisions for customer retention.

## Dataset Overview

The dataset consists of 10,000 customer records with 18 features, including demographic and financial details. Key features include:
- **Age**
- **Salary**
- **Attrition Flag** (Whether the customer has churned)
- **Credit Card Limit**
- **Credit Card Category**
- **Education Level**
- **Marital Status**
- **Transaction Count**
- **Revolving Balance**
- **Utilization Ratio**

## Objectives

The primary objectives of this analysis are:
1. **Identify Churn Factors**: Understand the reasons behind customer attrition.
2. **Informed Decision Making**: Use data to help reduce churn by adapting services and credit limits.
3. **Enhance Retention**: Provide insights into keeping more satisfied customers through personalized services.
4. **Data-Backed Insights**: Make informed decisions based on comprehensive data analysis.
5. **Competitive Edge**: Adapt strategies to attract and retain customers based on behavioral patterns.

## Methodology

The analysis was performed in several stages:
1. **Data Cleaning**: Missing values were removed, and columns such as `Education_Level` and `Marital_Status` were transformed into categorical factors for better analysis.
2. **Data Transformation**: The dataset was cleaned and saved as a CSV file for further analysis.
3. **Visualization**: Various visualizations were created using `ggplot2` to understand relationships between key features, such as credit limits, income levels, and education.

## Key Insights

- **Education Level and Credit Limit**: The largest segment of customers has a Graduate level of education, but higher education levels (Post-Graduate and Doctorate) showed a significant drop in credit card adoption.
- **Income Distribution**: A substantial proportion of customers have lower incomes, with only 7.18% having an income of $120K or more.
- **Credit Limit vs. Education**: Customers with lower education levels tend to have a wider range of credit limits, while post-graduates surprisingly have slightly lower limits.
- **Utilization Ratio**: A low utilization ratio correlates with higher credit limits, indicating good financial management.
- **Spending Behavior**: There is a weak positive correlation between credit limits and total revolving balance, indicating that factors beyond the credit limit (such as income and spending habits) play a role.

## Statistical Analysis

- **Correlation**: We found strong positive correlations between credit limits and total transaction amounts.
- **Regression Models**: A linear regression model was created to predict `Avg Open To Buy = 0.99619 * Credit Limit - 1129.92` based on the credit limit.
- **Churn Analysis**: The analysis showed slight differences in account retention between male and female customers, with a slightly higher attrition rate among female customers.

## Recommendations

- **Targeted Marketing**: Tailor services and offers based on income and education level. Offer rewards programs to encourage responsible spending and higher credit limits.
- **Holistic Credit Assessment**: Incorporate multiple factors like income, credit history, and spending behavior when making credit limit decisions.
- **Customer Segmentation**: Segment customers based on credit behavior to offer customized credit solutions.
- **Financial Education**: Provide resources and tools to customers, particularly those with lower income or higher utilization ratios, to help them better manage their credit.

## Visualizations

Several visualizations were created to understand trends and relationships in the data, including:
- **Bar Plots**: Showed the distribution of customers by education level and income group.
- **Box Plots**: Compared credit limits across different education levels.
- **Scatter Plots**: Analyzed relationships between credit limits, total transaction amounts, and revolving balances.
- **Correlation Heatmap**: Provided insights into correlations between various numerical features in the dataset.

## Conclusion

The analysis provides a comprehensive understanding of credit card customer behavior. By identifying churn factors, recognizing the complexities of spending behavior, and providing recommendations for personalized credit strategies, this project aims to optimize customer retention and reduce attrition.

## Requirements

- **R**
- **ggplot2**: For data visualization
- **dplyr**: For data manipulation
- **tidyverse**: General data wrangling

## Installation

Clone this repository to your local machine:

```bash
git clone https://github.com/yourusername/credit-card-customer-behavior-analysis.git
