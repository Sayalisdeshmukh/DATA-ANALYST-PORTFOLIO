# Uber and Lyft Rideshare Data Analysis & Optimization

## Project Overview
This project aims to analyze Uber and Lyft rideshare data to optimize transportation services, predict ride demand, and adjust pricing dynamically based on weather conditions. The project leverages historical data to offer insights that can help improve the efficiency and quality of transportation services in a specific region.

### Key Objectives:
- **Demand Prediction:** Predict ride demand for different times and locations.
- **Route Optimization:** Optimize routes to reduce travel time and improve efficiency.
- **Dynamic Pricing:** Implement surge pricing strategies based on demand and weather conditions.
- **Personalized Service Recommendations:** Provide tailored service options to riders based on their preferences and weather.

## Dataset
The dataset contains detailed information about rides, including:
- **Timestamp**: The time when the ride was requested.
- **Location**: Pickup and drop-off locations.
- **Weather Data**: Weather conditions like temperature, wind speed, and visibility during the ride.
- **Ride Attributes**: Cab type, ride distance, and pricing information.

Dataset Source: [Kaggle Uber and Lyft Dataset](https://www.kaggle.com/datasets/brllrb/uber-and-lyft-dataset-boston-ma)

## Database Design
The project uses a relational database model to store and manage data across several tables:
- **`cab`**: Information about different types of cabs.
- **`apparent_weather`**: Temperature data (high and low) during the ride.
- **`payment`**: Payment details for each ride.
- **`weather`**: Weather conditions such as temperature, wind speed, and visibility.
- **`ride`**: Ride details, including distance, source, destination, and associated weather, payment, and cab information.

## SQL Queries
The repository includes several SQL queries for:
- **Data Insertion**: Populating tables like `cab`, `payment`, `weather`, etc.
- **Data Analysis**: Queries to analyze ride distances, pricing, and ride counts for Uber and Lyft.
- **Complex Filters**: Filters and joins to query rides under specific conditions (e.g., rainy weather or low temperatures).
- **Reports**: Reports showing metrics such as average ride price, ride counts by hour, and most expensive rides.

### Example Queries:
1. **Average Ride Distance**
   ```sql
   SELECT AVG(distance) FROM ride;

