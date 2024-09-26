#!/usr/bin/env python
# coding: utf-8

# In[7]:


#Supply Chain Data Analysis

# 1. Data Preprocessing
get_ipython().system('pip install statsmodels')

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression, Ridge, Lasso
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import classification_report, mean_squared_error, confusion_matrix
from sklearn.cluster import KMeans
from sklearn.ensemble import RandomForestClassifier
from sklearn.decomposition import PCA
from statsmodels.tsa.arima.model import ARIMA
from scipy.stats import chi2_contingency, f_oneway
import warnings

warnings.filterwarnings('ignore')

# Load data
data = pd.read_csv('/Users/sayalideshmukh/Desktop/ALY6015/final_project/DataCoSupplyChainDataset.csv', encoding='ISO-8859-1')

# Convert 'shipping date (DateOrders)' to datetime
data['shipping date (DateOrders)'] = pd.to_datetime(data['shipping date (DateOrders)'], errors='coerce')

# Fill missing values
data['Order Zipcode'].fillna(data['Order Zipcode'].mode()[0], inplace=True)
data.fillna(data.median(numeric_only=True), inplace=True)

# Add 'Shipping Delay' column
data['Shipping Delay'] = data['Days for shipping (real)'] - data['Days for shipment (scheduled)']

# 2. Statistical Analysis

# Chi-square test (Shipping Mode vs Late Delivery Risk)
contingency_table = pd.crosstab(data['Shipping Mode'], data['Late_delivery_risk'])
chi2, p, dof, expected = chi2_contingency(contingency_table)
print(f"Chi-square statistic: {chi2}, p-value: {p}")

# ANOVA test (Shipping Delay across delivery statuses)
anova_result = f_oneway(*[data.loc[data['Delivery Status'] == status, 'Shipping Delay'] for status in data['Delivery Status'].unique()])
print(f"ANOVA Test p-value: {anova_result.pvalue}")

# Correlation heatmap
corr_matrix = data[['Sales per customer', 'Benefit per order', 'Days for shipping (real)', 'Shipping Delay']].corr()
sns.heatmap(corr_matrix, annot=True, cmap='coolwarm')
plt.title('Correlation Heatmap')
plt.show()

# 3. Predictive Modeling

# Prepare features and target variable
X = data[['Sales per customer', 'Benefit per order', 'Days for shipping (real)', 'Shipping Delay']]
y = data['Late_delivery_risk']

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Scale the data
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# Logistic Regression
log_reg = LogisticRegression()
log_reg.fit(X_train_scaled, y_train)
y_pred_log = log_reg.predict(X_test_scaled)
print("Logistic Regression Classification Report:")
print(classification_report(y_test, y_pred_log))

# Ridge Regression
ridge_reg = Ridge()
ridge_reg.fit(X_train_scaled, y_train)
y_pred_ridge = ridge_reg.predict(X_test_scaled)
rmse_ridge = np.sqrt(mean_squared_error(y_test, y_pred_ridge))
print(f"Ridge Regression RMSE: {rmse_ridge}")

# Lasso Regression
lasso_reg = Lasso()
lasso_reg.fit(X_train_scaled, y_train)
y_pred_lasso = lasso_reg.predict(X_test_scaled)
rmse_lasso = np.sqrt(mean_squared_error(y_test, y_pred_lasso))
print(f"Lasso Regression RMSE: {rmse_lasso}")

# 4. Clustering Analysis (KMeans)
# Import StandardScaler if not already imported
from sklearn.preprocessing import StandardScaler

# Select relevant features for clustering
X_clustering = data[['Sales per customer', 'Benefit per order', 'Days for shipping (real)', 'Shipping Delay']]

# Scale the features for the full dataset
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X_clustering)

# Apply KMeans clustering to the scaled dataset
kmeans = KMeans(n_clusters=3, random_state=42)
data['Cluster'] = kmeans.fit_predict(X_scaled)  # Use the full dataset here

# Plot clusters
plt.scatter(X_scaled[:, 0], X_scaled[:, 1], c=data['Cluster'], cmap='viridis')
plt.title('KMeans Clustering')
plt.xlabel('Sales per customer (scaled)')
plt.ylabel('Benefit per order (scaled)')
plt.show()


# 5. Feature Importance (RandomForestClassifier)

# RandomForest Classifier
rf_classifier = RandomForestClassifier(random_state=42)
rf_classifier.fit(X_train_scaled, y_train)

# Feature importance
importances = rf_classifier.feature_importances_
feature_importance_df = pd.DataFrame({
   'Feature': X.columns,
   'Importance': importances
}).sort_values(by='Importance', ascending=False)
print("Random Forest Feature Importance:")
print(feature_importance_df)

# 6. Principal Component Analysis (PCA)

# Apply PCA to the full dataset to match the number of rows
pca = PCA(n_components=2)
X_pca_transformed = pca.fit_transform(X_scaled)  # Use the full scaled dataset

# Plot PCA results with the Cluster labels
plt.scatter(X_pca_transformed[:, 0], X_pca_transformed[:, 1], c=data['Cluster'], cmap='plasma')
plt.title('PCA Projection with KMeans Clustering')
plt.xlabel('Principal Component 1')
plt.ylabel('Principal Component 2')
plt.colorbar(label='Cluster')
plt.show()


# 7. Time-Series Analysis

# Time-series analysis for 'Sales per customer'
data.set_index('shipping date (DateOrders)', inplace=True)
data.sort_index(inplace=True)

# Plot sales per customer over time
plt.plot(data.index, data['Sales per customer'])
plt.title('Sales per Customer Over Time')
plt.xlabel('Date')
plt.ylabel('Sales per Customer')
plt.show()

# ARIMA forecasting
arima_model = ARIMA(data['Sales per customer'], order=(5, 1, 2))
arima_result = arima_model.fit()

# Forecast future sales
forecast = arima_result.forecast(steps=30)

# Plot the forecast
plt.plot(data.index, data['Sales per customer'], label='Observed')
plt.plot(forecast.index, forecast, label='Forecast', color='red')
plt.title('ARIMA Forecast of Sales per Customer')
plt.legend()
plt.show()



# In[ ]:




