
# Machine Learning Classification Project

This project demonstrates the use of various machine learning models to perform classification on a dataset. The models explored include Logistic Regression, K-Nearest Neighbors (KNN), Gradient Boosting, and Random Forest.

## Files in this Project
- `Classification_Models_Analysis.ipynb`: Jupyter notebook with the code and analysis.
- `requirements.txt`: The necessary Python libraries for the project.
- `output/`: Folder containing output files like  plot.

## How to Run the Project
1. Clone the repository:
   ```bash
   git clone https://github.com/username/ml-classification-project.git
   ```
2. Install dependencies:
   ```bash
   pip install -r requirements.txt
   ```
3. Open the Jupyter notebook:
   ```bash
   jupyter notebook Classification_Models_Analysis.ipynb
   ```

## Results
- The project includes performance evaluations for multiple models, including accuracy scores and cross-validation results.

## Models Used:
1. **Polynomial Features (Degree=2)**
   - Accuracy: 0.9267 (± 0.0230)
2. **PCA (n_components=10)**
   - Accuracy: 0.8377 (± 0.0354)
3. **SMOTE Logistic Regression**
   - Accuracy: 0.8767
4. **Class Weighted Logistic Regression**
   - Accuracy: 0.8663 (± 0.0320)
5. **Random Forest**
   - Accuracy: 0.9210 (± 0.0279)
6. **Gradient Boosting**
   - Accuracy: 0.9223 (± 0.0253)
7. **Time-Series Split Logistic Regression**
   - Accuracy: 0.8627 (± 0.0134)
8. **Regularization (GridSearchCV)**
   - Best Accuracy (Regularization): 0.8680
   - Best Parameters: `{'C': 0.01, 'solver': 'lbfgs'}`

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

