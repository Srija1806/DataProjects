# Bank Marketing Campaign Analysis

This project uses machine learning to analyze a dataset related to the direct marketing campaigns of a Portuguese bank. The goal is to predict whether a client will subscribe to a term deposit based on various attributes. Two machine learning models, Logistic Regression and Decision Tree Classifier, are used to determine the effectiveness of the marketing strategy.

## Table of Contents
- [Project Overview](#project-overview)
- [Dataset](#dataset)
- [Attributes](#attributes)
- [Project Structure](#project-structure)
- [Setup and Installation](#setup-and-installation)
- [Data Preprocessing](#data-preprocessing)
- [Model Training and Evaluation](#model-training-and-evaluation)
- [Results](#results)
- [Conclusion](#conclusion)
- [License](#license)

## Project Overview

In this project, we analyze data from phone-based marketing campaigns of a bank to predict term deposit subscriptions. Using the dataset, we train and evaluate both Logistic Regression and Decision Tree models to determine which model performs better in terms of accuracy and generalizability.

## Dataset

The dataset contains data on various client and campaign-related features, obtained from the UCI Machine Learning Repository: [Bank Marketing Data](http://archive.ics.uci.edu/ml/datasets/Bank+Marketing#).

The data includes:
- **45211 rows** (client interactions)
- **17 columns** (attributes describing clients and campaign results)

## Attributes

The dataset includes the following types of information:

- **Client data**: Age, job type, marital status, education, credit default status, housing loan, and personal loan.
- **Campaign data**: Contact communication type, last contact month, duration of last contact.
- **Previous campaign data**: Number of contacts, days since last contact, previous outcome.
- **Target variable**: `y` (binary, representing if the client subscribed to a term deposit: "yes" or "no").

## Project Structure

```
├── bank_marketing_analysis.ipynb   # Jupyter notebook with full analysis
├── README.md                       # Project documentation
```

## Setup and Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/bank-marketing-analysis.git
   cd bank-marketing-analysis
   ```

2. **Install Dependencies**:
   Install required Python packages using:
   ```bash
   pip install -r requirements.txt
   ```

3. **Data Loading**:
   The dataset can be loaded directly from the provided Google Drive link using the code in the notebook.

## Data Preprocessing

- **Data Cleaning**: Null values are handled, and categorical variables are converted to numerical form using dummy variables.
- **Feature Scaling**: We apply z-score standardization to numeric features to improve model performance.
- **Train-Test Split**: The data is split into a training set (70%) and a test set (30%).

## Model Training and Evaluation

1. **Logistic Regression**:
   - Trained to predict subscription likelihood.
   - Performance evaluated using confusion matrix, precision, recall, and F1-score.
   - Shows high accuracy and good generalizability.

2. **Decision Tree Classifier**:
   - Tested with different maximum node values to optimize performance.
   - Model overfits on training data, resulting in lower generalizability on test data.

3. **Cross-Validation**:
   - K-fold cross-validation (k=25) is used to assess model robustness.
   - Results are averaged to account for variation across different data splits.

4. **Learning Curve Analysis**:
   - Shows that Logistic Regression performs consistently better as training data size increases, while the Decision Tree fluctuates and overfits.

## Results

- **Logistic Regression**:
  - Achieved ~90% accuracy with strong performance in classifying non-subscribers.
  - Shows a balanced generalization across both training and test data.
  
- **Decision Tree Classifier**:
  - Achieves perfect accuracy on training data but suffers from overfitting, leading to reduced test performance.
  - Optimal number of nodes is found to be around 6 for balanced performance.

## Conclusion

The **Logistic Regression** model is recommended for this marketing campaign as it generalizes well and provides consistent predictions. The Decision Tree model overfits and does not perform reliably on unseen data.
