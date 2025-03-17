# Iris Flower Prediction Microservice

This project implements a machine learning model for predicting the species of an Iris flower based on its sepal and petal measurements. The model is built using the RandomForestClassifier from scikit-learn, and it is exposed as a microservice using Gradio in Google Colab.

## Project Overview

The microservice allows users to input four measurements of an Iris flower: 
- Sepal Length
- Sepal Width
- Petal Length
- Petal Width

The model predicts the flower's species based on these measurements. The available species are:
- Iris-setosa
- Iris-versicolor
- Iris-virginica

The service is implemented using Google Colab and Gradio to provide a user-friendly web interface for predictions.

## Prerequisites

To run this microservice, you will need:
- Python 3.x
- Google Colab or Jupyter Notebook for running the notebook
- The following Python libraries:
  - Gradio
  - scikit-learn
  - numpy

## Project Structure

- `Iris-Flower-Prediction-Microservice.ipynb`: Jupyter notebook containing the code to train the model, expose it via a Gradio interface, and make predictions based on user inputs.
- `Iris-Flower-Prediction-Microservice_output.pdf`: A report detailing the implementation of the microservice, including input-output examples, code, and explanation of the model.
- `README.md`: Documentation for the project.

## How to Run the Microservice

1. **Clone the repository**:

   First, clone this repository to your local machine or use it directly on GitHub. If you're using Git, run the following command:
   ```bash
   git clone https://github.com/your-username/Iris-Flower-Prediction-Microservice.git

