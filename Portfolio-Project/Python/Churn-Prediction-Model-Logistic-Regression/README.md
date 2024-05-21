
# Churn-Prediction-Model-Logistic-Regression

Project File [_click Google Colab_](https://colab.research.google.com/drive/1K4eVfD0NLN0B33awu1BsOB3eDYwlxe0T?usp=sharing)

This project come from practice made by Data Rockie School.

website https://data-science-bootcamp1.teachable.com/

Thanks for the practice.

## Objective:
- To build a model that predicts which customers are likely to leave the service (churn).

## Key Steps:
01 Data Preparation: Read and prepare the customer churn data.

02 Data Splitting: Divide the data into training (80%) and testing (20%) sets.

03 Model Training: Train the model using logistic regression.

04 Model Scoring: Use the model to predict churn on the test data.

05 Model Evaluation: Check how well the model performed by comparing predicted results to actual outcomes.

## Project Outcome:
### Model Type:
- Logistic Regression

### Dataset:
- 5000 samples
- 4 predictors: totaldayminutes, totaldaycalls, totaldaycharge, numbercustomerservicecalls
- 2 classes: 'No' and 'Yes'

### Re-sampling Method:
- Train-test split (80% training, 20% testing)

### Re-sampling Results:
- Training Accuracy: 85.75%

### Test Set Evaluation:
- Test Accuracy: 85.4%

## Interpretation and Suitability for Prediction
### Comparison of Train and Test Accuracy:
- Training Accuracy: 85.75%
- Test Accuracy: 85.4%
- The test accuracy (85.4%) is very close to the training accuracy (85.75%), indicating that the model has generalized well to unseen data. This suggests that the model is neither overfitting nor underfitting.

### Suitability for Prediction:
- Usefulness: The close alignment between training and test accuracy indicates that the model is stable and performs consistently on both the training and test data.

### Next Steps:
- Address Class Imbalance: If applicable, implement techniques to handle class imbalance, such as oversampling the minority class, undersampling the majority class, or using synthetic data generation (e.g., SMOTE).
- Feature Engineering: Add or transform features to improve predictive power.
- Model Selection: Experiment with different models that might handle class imbalance better, such as decision trees, random forests, or gradient boosting machines.
- Performance Metrics: Evaluate the model using additional metrics like Precision, Recall, F1-score, and ROC-AUC to get a more comprehensive view of its performance.

## Conclusion:
- The model shows good predictive accuracy both on the training and test datasets, indicating it has generalized well to new data. The close alignment between training and test accuracy suggests the model is reliable for prediction, but further steps might be necessary to enhance its performance, especially if class imbalance is an issue.
