# 💳 Credit Card Fraud Detection

This project focuses on detecting fraudulent credit card transactions using machine learning techniques. The dataset is highly imbalanced, so resampling and careful model evaluation were essential. The goal is to evaluate and compare multiple models to find the most effective approach to fraud detection.

## 📁 Project Structure

CreditCard_FraudDetection_R/
├── data/
│ └── creditcard.csv # Dataset from Kaggle
├── R/
│ ├── install_packages.R # Installs required libraries
│ ├── load_data.R # csv file (Data load) 
│ ├── preprocess_data.R # Data cleaning and preprocessing script
│ ├── train_model.R # Model training 
│ ├── evaluate_model.R #  Evaluates model performance
│ └── run_full_pipeline.R #Executes the entire pipeline
│
├── report/
│ └── Credit_Card_Fraud_Detection_Report.Rmd # RMarkdown report
│ └── aus_score.csv # AUC summary table
│ └── model_evaluation.txt # Detailed confusion matrices
│ └── trained_models.RData # Saved trained models
├── README.md


## 📦 Technologies & Libraries
- **Programming Language**: R
- **Libraries**:
  - `data.table`, `dplyr`, `ggplot2`, `caret`
  - `ROSE`, `rpart`, `nnet`, `gbm`
  - `pROC`, `PRROC`, `cowplot`, `gridExtra`


## 📊 Dataset
- Source: [Kaggle – Credit Card Fraud Detection](https://www.kaggle.com/datasets/mlg-ulb/creditcardfraud)
- Size: 284,807 transactions
- Fraud cases: 492 (≈ 0.17%)
- Features:
  - `V1` to `V28`: PCA-anonymized features
  - `Amount`, `Time`: Raw numeric features
  - `Class`: Target variable (0 = Non-Fraud, 1 = Fraud)


## 🚀 How to Run the Project

### 1. Setup

Make sure you have [R](https://cran.r-project.org/) and RStudio or VS Code installed.

### 2. Clone the repository

Open a terminal or command prompt and run:


git clone https://github.com/jennnypatel/CreditCard_FraudDetection_R.git
cd CreditCard_FraudDetection_R

### 3. Install required packages

Open R or RStudio and run:
pls use r terminal
source("R/install_packages.R")

### 4. Run the full pipeline
In R or RStudio, run:
source("R/run_full_pipeline.R")

### 5. Render the report
In R or RStudio, run:
rmarkdown::render("report/Credit_Card_Fraud_Detection_Report.Rmd")


## 🔄 Pipeline Overview
1. **Data Loading**: Import CSV using `fread()`
2. **Preprocessing**:
   - Drop `Time` column
   - Scale `Amount`
   - Split into 80/20 training and test sets
   - Apply **ROSE** to balance training data
3. **Model Training**:
   - Logistic Regression
   - Decision Tree
   - Artificial Neural Network (ANN)
   - Gradient Boosting Machine (GBM)
4. **Evaluation**:
   - Confusion Matrix
   - AUC Score
   - ROC & Precision-Recall Curves
   - Feature Importance (GBM)


## 📈 Results Summary

| Model                | AUC Score | Accuracy | Precision | Recall (Sensitivity) |
|---------------------|-----------|----------|-----------|-----------------------|
| Logistic Regression | **0.98**  | 0.9887   | 0.13      | 0.84                  |
| ANN                 | 0.96      | 0.9965   | 0.32      | 0.81                  |
| GBM                 | 0.95      | 0.9953   | 0.26      | 0.82                  |
| Decision Tree       | 0.90      | 0.9755   | 0.06      | 0.83                  |

 📌 **Logistic Regression** and **ANN** showed the best overall performance.


## 📊 Visualizations

- Bar plots of class distribution (original vs balanced)
- Feature importance (GBM)
- Confusion matrix heatmaps
- ROC Curves
- Precision-Recall Curves

All visualizations are available in the HTML report._



## 🎯 Conclusion

Logistic Regression and Artificial Neural Network models showed the best performance in detecting fraudulent transactions, achieving high AUC scores and balanced sensitivity-specificity. The results demonstrate that with proper data balancing and model selection, effective fraud detection is possible despite highly imbalanced datasets.

## 🚀 Future Work
Future improvements could include:

- Experimenting with anomaly detection or unsupervised learning techniques.
- Implementing ensemble methods or stacking models to improve predictive power.
- Incorporating cost-sensitive learning to better handle the rare but costly fraud cases.
- Applying real-time streaming data analysis for live fraud detection.