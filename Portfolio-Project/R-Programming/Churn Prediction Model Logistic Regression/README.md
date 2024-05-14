
# Churn-Prediction-Model-Logistic-Regression [R]

Project Code [_click file_](https://github.com/tamakuku/data-science-bootcamp9/blob/a2fbfb4d156e127b4ddce8e11c77a0a42981b12f/Portfolio-Project/R-Programming/Churn%20Prediction%20Model%20Logistic%20Regression/Churn%20Prediction%20Model%20Logistic%20Regression)

This project come from practice made by Data Rockie School.

website https://data-science-bootcamp1.teachable.com/

Thanks for the practice.

## Objective:
- To build a model that predicts which customers are likely to leave the service (churn).

### Key Steps:
01 Data Preparation: Read and prepare the customer churn data.

02 Data Splitting: Divide the data into training (80%) and testing (20%) sets.

03 Model Training: Train the model using logistic regression and cross-validation.

04 Model Scoring: Use the model to predict churn on the test data.

05 Model Evaluation: Check how well the model performed by comparing predicted results to actual outcomes.

## Project Outcome:

### Model Type:
- Generalized Linear Model (GLM)

### Dataset:
- 5000 samples
- 4 predictors: totaldayminutes, totaldaycalls, totaldaycharge, numbercustomerservicecalls
- 2 classes: 'No' and 'Yes'

### Re-sampling Method:
- 10-fold Cross-Validation

### Re-sampling Results:
- Training Accuracy: 85.66%
- Kappa: 0.0578

## Test Set Evaluation:
- Test Accuracy: 85.4%

## Interpretation and Suitability for Prediction
### Comparison of Train and Test Accuracy:
- Training Accuracy: 85.66%
- Test Accuracy: 85.4%
- The test accuracy (85.4%) is very close to the training accuracy (85.66%), indicating that the model has generalized well to unseen data. This suggests that the model is neither overfitting nor underfitting.

### Kappa Statistic:
- The Kappa statistic is 0.0578, which is relatively low. This suggests that while the overall accuracy is high, the model may not be significantly better than random guessing for one of the classes, potentially due to class imbalance.

### Suitability for Prediction:
- Usefulness: The close alignment between training and test accuracy indicates that the model is stable and performs consistently on both the training and test data. However, the low Kappa value suggests caution, particularly in terms of its effectiveness in predicting the minority class.
- Next Steps:
  - Address Class Imbalance: Implement techniques to handle class imbalance, such as oversampling the minority class, undersampling the majority class, or using synthetic data generation (e.g., SMOTE).
  - Feature Engineering: Add or transform features to improve predictive power.
  - Model Selection: Experiment with different models that might handle class imbalance better, such as decision trees, random forests, or gradient boosting machines.
  - Performance Metrics: Evaluate the model using additional metrics like Precision, Recall, F1-score, and ROC-AUC to get a more comprehensive view of its performance, especially for the minority class.

## Conclusion:
- The model shows good predictive accuracy both on the training and test datasets, indicating it has generalized well to new data. However, the low Kappa statistic suggests that the model's performance in predicting the minority class might be suboptimal. Further steps are needed to address these issues before relying on the model for critical business decisions.
