# Airline Passenger Satisfaction Analysis

## Project Overview
This project aims to analyze airline passenger satisfaction using machine learning models. The analysis focuses on understanding the key factors that influence satisfaction levels, including flight delays, service quality, and flight class. The goal is to develop predictive models to classify passenger satisfaction and validate key assumptions through statistical hypothesis testing.

### Key Objectives:
- Identify the key factors influencing airline passenger satisfaction.
- Analyze how flight class, delays, and service quality affect satisfaction levels.
- Build machine learning models to predict passenger satisfaction based on their travel experience.
- Statistically validate assumptions regarding the factors impacting satisfaction.

### Models Used:
- Logistic Regression
- Random Forest
- Gradient Boosting
- XGBoost

## Dataset
The dataset used for this project contains **103,904 records** with **25 features**, including:
- Passenger demographics (e.g., age, gender)
- Travel-related information (e.g., flight distance, flight class)
- Service ratings (e.g., in-flight service, seat comfort)
- Delays (e.g., departure delays, arrival delays)

### Key Findings:
- **Service quality** (in-flight entertainment, seat comfort, food) plays a significant role in passenger satisfaction.
- **Flight class** significantly impacts satisfaction, with Business class passengers reporting the highest satisfaction.
- **Delays** negatively affect satisfaction, particularly departure delays.
- A strong positive correlation exists between the **online boarding experience** and passenger satisfaction.
  
## Results
After evaluating the models, the Random Forest classifier performed the best with an accuracy of 96%. The other models, Gradient Boosting and XGBoost, also achieved high performance with accuracies of 94.48% and 94.24%, respectively. Logistic Regression provided the lowest accuracy at 87.66%, indicating its limitations for this particular dataset.

## Files

- **`Airline_Passenger_Satisfaction_Analysis.ipynb`**: Jupyter notebook containing the analysis, data preprocessing, exploratory data analysis (EDA), and machine learning model training.
- **`Airline_Dataset.csv`**: The dataset used for training and testing the models.
- **`Airline_Passenger_Satisfaction_Analysis.pdf`**: Final project report in PDF format detailing the methodology, results, and conclusions.

  

## Requirements

Before running the code, ensure you have the following libraries installed:

```bash
pip install pandas==1.5.3 numpy==1.24.0 matplotlib==3.6.3 scipy==1.9.3 scikit-learn xgboost==1.4.2 seaborn==0.11.2

