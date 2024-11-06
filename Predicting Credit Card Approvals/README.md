# Credit Card Approval Prediction

This project aims to automate the prediction of credit card application approvals using machine learning techniques. By leveraging the Credit Card Approval dataset, this project builds a logistic regression model to determine the likelihood of approval based on various applicant features.

## Table of Contents
- [Overview](#overview)
- [Dataset](#dataset)
- [Project Structure](#project-structure)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [Results](#results)
- [Technologies Used](#technologies-used)
- [License](#license)

## Overview
Commercial banks receive numerous applications for credit cards daily. Each application needs to be reviewed to assess whether the applicant qualifies. This manual review process is time-consuming and can be automated using machine learning. In this project, a logistic regression model is trained to predict credit card approvals based on applicant features.

## Dataset
The dataset used is a subset of the Credit Card Approval dataset from the UCI Machine Learning Repository. It includes various applicant details such as age, income, loan balances, and a target variable that indicates approval status.

The data has been preprocessed to handle missing values and categorical encoding.

## Project Structure
```
├── cc_approvals.data         # Raw dataset
├── notebook.ipynb            # Jupyter notebook with complete analysis
├── README.md                 # Project README file
```

## Setup and Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/yourusername/credit-card-approval.git
   cd credit-card-approval
   ```

2. **Install Dependencies**:
   Make sure you have Python 3.x installed. Install the required libraries using:
   ```bash
   pip install -r requirements.txt
   ```

3. **Dataset**:
   Place the `cc_approvals.data` file in the same directory as the notebook.

## Usage

1. **Load the Dataset**:
   Load `cc_approvals.data` as a DataFrame in the notebook and inspect the initial rows.

2. **Preprocess the Data**:
   - Handle missing values.
   - Convert categorical data to numerical using encoding.
   - Scale numerical features using `StandardScaler`.

3. **Train the Model**:
   - Split the dataset into training and testing sets.
   - Train a logistic regression model.
   - Evaluate the model using metrics like accuracy and confusion matrix.

4. **Evaluate and Interpret Results**:
   - Visualize the confusion matrix.
   - Calculate precision, recall, and F1-score to assess performance.

## Results
The model achieved an accuracy of approximately 85-93%, depending on the threshold used. Fine-tuning was performed to improve model performance, with different metrics analyzed to understand strengths and weaknesses.

## Technologies Used
- **Python** (pandas, numpy, scikit-learn, matplotlib, seaborn)
- **Machine Learning**: Logistic Regression
- **Data Preprocessing**: StandardScaler, one-hot encoding for categorical variables
