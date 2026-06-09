# Alzheimer's Disease Progression — Longitudinal Analysis (OASIS I–IV)

## Overview
Multi-semester longitudinal research project examining dementia progression 
using the OASIS neuroimaging and clinical dataset. Analysis spans four phases: 
statistical modeling in R, machine learning classification, distributed 
computing with Dask, and deep learning using TensorFlow/Keras.

Co-authored with Dr. Bahareh Rahmani | Saint Louis University | 
Manuscript in preparation

## Research Question
Can clinical and neuroimaging variables from the OASIS registry predict 
dementia progression in a real-world longitudinal cohort?

---

## Semester 1 — Statistical Analysis (R)
**Course:** HDS-5310 | **Dataset:** OASIS-1 Cross-sectional (416 participants)  
**Methods:** t-test, chi-square, ANOVA, Tukey post-hoc, multivariate regression

### Key Findings
- nWBV significantly lower in AD group vs normal (p < 0.001), confirming 
  brain atrophy as a core AD biomarker
- Strong negative correlation between age and nWBV (p < 0.001) — brain 
  volume declines systematically with age
- ANOVA confirmed nWBV declines across CDR severity categories 
  (F(3,231) = 27.65, p < 0.001); largest decline between CDR 0 and CDR 2
- Age, MMSE, and eTIV significant independent predictors of nWBV in 
  multivariate regression
- Sex not significantly associated with diagnosis group (chi-square p > 0.05)
- Assumption testing conducted: Shapiro-Wilk normality, Levene's equality 
  of variances, VIF for multicollinearity

---

## Semester 2 — Machine Learning Classification (Python)
**Course:** HDS-5330 | **Dataset:** OASIS-2 Longitudinal  
**Methods:** KNN, Naive Bayes, SVM (RBF kernel), Random Forest

### Key Findings
- Random Forest achieved best performance: 96% accuracy, ROC-AUC 0.960
- All models performed strongly: KNN 93.3%, Naive Bayes 94.7%, SVM 94.7%
- CDR strongest predictor (51.9% feature importance), followed by 
  MMSE (16.6%) and nWBV (7.9%)
- Cross-validation confirmed no overfitting — consistent with holdout results
- Gender showed lowest importance (1.3%), consistent with Semester 1 
  chi-square finding of no significant sex difference in diagnosis

---

## Semester 2 — Dask Distributed Computing
**Course:** HDS-5330 | **Dataset:** OASIS-2 Longitudinal  
**Methods:** Dask DataFrames, dask-ml, parallel Random Forest

### Key Findings
- Standard sklearn RF: 89.06% accuracy, runtime 0.04s
- Dask RF: 86.15% accuracy, runtime 0.09s
- Dask adds overhead on small datasets (317 rows) — parallelization 
  benefit requires large-scale data
- Key insight: distributed computing is most appropriate for full OASIS 
  I–IV dataset (Semester 3), not small subsets
- Demonstrates understanding of when and why to apply distributed computing

---

## Semester 2 — Deep Learning (TensorFlow/Keras)
**Course:** HDS-5330 | **Dataset:** OASIS-2 Longitudinal  
**Methods:** Artificial Neural Network (ANN), Recurrent Neural Network (RNN)

### Key Findings
- ANN (Dense 64→32→1): 96.88% accuracy, training time 0.912s
- RNN (SimpleRNN 32→Dense 16→1): 96.88% accuracy, training time 1.017s
- Both deep learning models matched Random Forest performance (96%)
- Perfect precision for Nondemented class (1.00) across both models
- Validates robustness of findings across classical ML and neural networks
- Run on Apple M4 with TensorFlow 2.21.0

---

## Semester 3 — Scaling to Full OASIS I–IV (In Progress)
**Dataset:** Complete OASIS I–IV longitudinal dataset  
**Methods:** Dask distributed computing, full pipeline scaling  
**Status:** Manuscript in preparation with Dr. Bahareh Rahmani, 
Saint Louis University

---

## Data
- **OASIS-1** (Cross-sectional): oasis-brains.org/oasis-1 — publicly available
- **OASIS-2** (Longitudinal): oasis-brains.org/oasis-2 — publicly available
- **OASIS-3 & 4**: Requires credentialed access at oasis-brains.org
- Raw data files for OASIS-1 and OASIS-2 are included in `/data` 
  (sourced from Kaggle — publicly available)

---

## How to Run

### R Analysis (Semester 1)
1. Install R and RStudio
2. Open `notebooks/01_statistical_analysis.Rmd`
3. Data is included in `/data/oasis_cross_sectional.xlsx`
4. Knit the document to reproduce all analyses

### Python Analysis (Semester 2)
1. Clone the repo
2. `pip install -r requirements.txt`
3. Open notebooks in order:
   - `02_regression_analysis.ipynb` — regression analysis
   - `02_ml_classification_oasis.ipynb` — ML model comparison
   - `03_dask_scaling.ipynb` — Dask distributed computing
   - `04_deep_learning_oasis.ipynb` — ANN and RNN (requires TensorFlow)
4. Data is included in `/data/oasis_longitudinal.xlsx`

### TensorFlow Setup (for deep learning notebook)
```bash
conda create -n tf_env python=3.11
conda activate tf_env
pip install tensorflow pandas numpy matplotlib seaborn scikit-learn jupyter
```

---

## Project Structure

notebooks/
01_data_analysis.R                  ← R: data preparation
01_statistical_analysis.Rmd         ← R: stats analysis (Semester 1)
02_regression_analysis.ipynb        ← Python: regression analysis
02_ml_classification_oasis.ipynb    ← Python: ML model comparison
03_dask_scaling.ipynb               ← Python: Dask distributed computing
04_deep_learning_oasis.ipynb        ← Python: ANN + RNN deep learning
data/
oasis_cross_sectional.xlsx          ← OASIS-1 dataset (publicly available)
oasis_longitudinal.xlsx             ← OASIS-2 dataset (publicly available)
outputs/
oasis_ml_results.png                ← ML model comparison dashboard
dask_comparison.png                 ← Dask vs standard runtime comparison
deep_learning_results.png           ← ANN vs RNN results dashboard

---

## Technologies
R (tidyverse, ggplot2, car, gt) | Python (pandas, scikit-learn, matplotlib, 
seaborn) | TensorFlow 2.21.0 / Keras | Dask | Jupyter

---

## Contact
Nikhitha Chaparla | nikhitha.nikki.chaparla@gmail.com  
linkedin.com/in/nikhithachaparla-a33247b7
