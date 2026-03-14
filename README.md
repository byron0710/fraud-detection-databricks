# 🚨 Fraud Detection Pipeline — Databricks
### By Byron W. | Data Analyst | Fintech & System Support

![Databricks](https://img.shields.io/badge/Databricks-FF3621?style=flat&logo=databricks&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-E25A1C?style=flat&logo=apache-spark&logoColor=white)
![MLflow](https://img.shields.io/badge/MLflow-0194E2?style=flat&logo=mlflow&logoColor=white)
![Delta Lake](https://img.shields.io/badge/Delta_Lake-003366?style=flat&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![XGBoost](https://img.shields.io/badge/XGBoost-FF6600?style=flat&logoColor=white)

---

## 🔗 Live Dashboard
👉 **[View Live Fraud Detection Dashboard](https://dbc-8ed91520-e60a.cloud.databricks.com/dashboardsv3/01f11f76188a17d7af783ba52685ef27/published?o=7474656367840140)**

---

## 📌 Project Summary
An end-to-end fraud detection pipeline built on
Databricks that ingests 284,807 real financial
transactions, engineers features using PySpark,
trains and compares 3 ML models tracked in MLflow,
risk scores every transaction and visualizes
results in a 3-page live AI/BI dashboard.

---

## 🏆 Results
| Metric | Value |
|--------|-------|
| Total transactions processed | 284,807 |
| Transactions after cleaning | 281,918 |
| Fraud cases detected | 448 |
| Fraud rate | 0.1589% |
| Critical risk transactions flagged | 77 |
| High risk transactions flagged | 22 |
| ML models trained and compared | 3 |
| Dashboard pages | 3 |

---

## 🏗️ Pipeline Architecture
```
Raw CSV → Bronze (Delta Lake) → Silver (Cleaned)
→ Gold (Features) → ML Model (MLflow)
→ Risk Scoring → AI/BI Dashboard
```

---

## 📊 Dashboard Preview

### Page 1 — Executive Summary
![Page 1](dashboard_page1_executive.png)

### Page 2 — Fraud Analysis
![Page 2](dashboard_page2_analysis.png)

### Page 3 — Model Performance
![Page 3](dashboard_page3_model.png)

---

## 🛠️ Tech Stack
| Layer | Tool |
|-------|------|
| Data Processing | PySpark |
| Storage | Delta Lake, Unity Catalog |
| Pipeline Automation | Delta Live Tables |
| ML Experiment Tracking | MLflow, Model Registry |
| ML Models | Random Forest, XGBoost, Logistic Regression |
| Class Balancing | SMOTE |
| Dashboard | Databricks AI/BI |
| Language | Python 3 |

---

## 📁 Project Structure
```
fraud-detection-databricks/
├── 01_bronze_ingestion.ipynb
├── 02_silver_cleaning.ipynb
├── 03_gold_features.ipynb
├── 04_model_training.ipynb
├── 05_dashboard_queries.sql
├── dashboard_page1_executive.png
├── dashboard_page2_analysis.png
├── dashboard_page3_model.png
├── fraud_detection_dashboard_demo.mp4
├── requirements.txt
└── README.md
```

---

## 🚀 How to Run
```bash
# 1. Clone this repo
git clone https://github.com/byron0710/fraud-detection-databricks

# 2. Upload creditcard.csv to Databricks
#    Unity Catalog → Volumes → Upload

# 3. Run notebooks in order
#    01 → 02 → 03 → 04 → 05

# 4. View live dashboard
#    Click the link at the top of this README
```

---

## 📈 Key Findings
- Fraud peaks between 2AM and 4AM
- Large transactions over $1,000 carry highest risk
- SMOTE balancing significantly improved detection
- 77 transactions flagged as CRITICAL risk
- Model achieves 99%+ accuracy on test data

---

## 📦 Requirements
```
pyspark>=3.3.0
mlflow>=2.0.0
xgboost>=1.7.0
scikit-learn>=1.2.0
imbalanced-learn>=0.10.0
pandas>=1.5.0
numpy>=1.23.0
matplotlib>=3.6.0
```

---

## 👤 Author
**Byron W.**
- 🔗 LinkedIn: [paste your LinkedIn URL here]
- 🐙 GitHub: [github.com/byron0710](https://github.com/byron0710)
- 💼 7+ years Data Analyst — Fintech & System Support
- 🌍 Open to Remote Opportunities worldwide

---

## 📜 License
MIT License
