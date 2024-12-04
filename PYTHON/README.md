Supply Chain Data Analysis

This repository contains an analysis of a supply chain dataset aimed at optimizing delivery processes and improving efficiency. The analysis includes data preprocessing, statistical analysis, predictive modeling, clustering, and time-series forecasting.

Key Features
Data Preprocessing: Handling missing values, date formatting, and creating new features like "Shipping Delay" to evaluate delivery performance.

Statistical Analysis: Includes Chi-Square and ANOVA tests to understand the relationships between shipping modes, delivery risk, and other supply chain metrics.

Predictive Modeling: Implements Logistic Regression, Ridge Regression, and Lasso Regression to predict delivery risks and optimize delivery performance.

Clustering: KMeans clustering for segmenting customers based on sales, benefit per order, and shipping delays.

Feature Importance: Random Forest Classifier used to determine the most influential features impacting delivery performance.

PCA: Principal Component Analysis (PCA) for dimensionality reduction and visualizing the dataset in lower dimensions.

Time-Series Forecasting: ARIMA model applied to forecast sales per customer and predict future trends.


Requirements
pandas
numpy
scikit-learn
seaborn
matplotlib
statsmodels
To install the necessary dependencies, run the following command:

bash
Copy code
pip install pandas numpy scikit-learn seaborn matplotlib statsmodels

Dataset
The analysis uses a supply chain dataset with various features related to customer sales, order details, and delivery status. A sample dataset (CSV format) is expected to be available for analysis, containing columns such as Sales per customer, Benefit per order, Days for shipping (real), Days for shipment (scheduled), and Shipping Mode.

Methodology
Data Preprocessing:

Converted date columns and filled missing values.
Created a new feature Shipping Delay to measure delays in shipping.
Statistical Analysis:

Used Chi-Square and ANOVA tests to explore relationships between variables like delivery risk and shipping mode.
Predictive Modeling:

Logistic Regression, Ridge Regression, and Lasso Regression were used for classification and regression tasks to predict delivery risk and shipping delays.
Clustering & PCA:

KMeans clustering was applied to segment customers, and PCA was used to reduce dimensions for better visualization and analysis.
Time-Series Forecasting:

ARIMA model was used to forecast future sales per customer, based on historical data.


Visualizations
Several plots and visualizations were generated during the analysis, including:

Correlation Heatmap: Showing the relationships between key features.
Shipping Delay vs. Late Delivery Risk: A boxplot for understanding the impact of shipping delays on delivery risks.
KMeans Clustering: Visualizing customer segments based on sales and benefit per order.
PCA Projection: Showing how principal components separate clusters in the data.
Sales Over Time: A time-series plot illustrating sales per customer over a period.
ARIMA Forecast: A forecast plot predicting future sales trends.
Conclusion & Recommendations
The analysis identifies critical factors influencing delivery delays and provides actionable recommendations:

Optimize shipping processes for 'Second Class' deliveries.
Monitor the 'Shipping Delay' feature, as it has the most significant impact on late deliveries.
Use predictive models to proactively identify and address high-risk deliveries.

