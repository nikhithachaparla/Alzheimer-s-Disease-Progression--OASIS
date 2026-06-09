# Alzheimer's Disease Progression — Longitudinal Analysis (OASIS I–IV)

## Overview
Multi-semester longitudinal research project examining dementia progression 
using the OASIS neuroimaging and clinical dataset. Analysis spans three phases: 
statistical modeling in R, machine learning classification in Python, and 
full-dataset scaling using distributed computing.

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
- nWBV significantly lower in AD group vs normal (p < 0.001)
- Strong negative correlation between age and nWBV (p < 0.001)
- ANOVA confirmed nWBV declines across CDR categories 
  (F(3,231) = 27.65, p < 0.001)
- Age, MMSE, and eTIV significant independent predictors of nWBV

---

## Semester 2 — Machine Learning Classification (Python)
**Course:** HDS-5330 | **Dataset:** OASIS-2 Longitudinal  
**Methods:** KNN, Naive Bayes, SVM (RBF kernel), Random Forest

### Key Findings
- Random Forest achieved best performance: 96% accuracy, ROC-AUC 0.960
- All models performed strongly: KNN 93.3%, Naive Bayes 94.7%, SVM 94.7%
- CDR was strongest predictor (51.9% feature importance), followed by 
  MMSE (16.6%) and nWBV (7.9%)
- Cross-validation confirmed no overfitting — consistent with holdout results
- Gender showed lowest importance (1.3%), consistent with Semester 1 
  chi-square finding of no significant sex difference in diagnosis
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

## How to Run

### R Analysis (Semester 1)
1. Install R and RStudio
2. Open `notebooks/01_statistical_analysis.Rmd`
3. Data is included in `/data/oasis_cross_sectional.xlsx`
4. Knit the document to reproduce all analyses

### Python Analysis (Semester 2)
1. Clone the repo
2. `pip install -r requirements.txt`
3. Open notebooks in order: `02` → `03` → `04` → `05` → `06`
4. Data is included in `/data/oasis_longitudinal.xlsx`

## Project Structure

notebooks/
01_statistical_analysis.Rmd     ← R: stats analysis (Semester 1)
02_regression_analysis.ipynb    ← Python: regression (Semester 2)
03_ml_classification.ipynb      ← ML classification results
04_scaling_dask.html            ← Dask scaling (Semester 3)

data/
oasis_cross_sectional.xlsx      ← OASIS-1 dataset
oasis_longitudinal.xlsx         ← OASIS-2 dataset


## Contact
Nikhitha Chaparla | nikhitha.nikki.chaparla@gmail.com  
linkedin.com/in/nikhithachaparla-a33247b7
