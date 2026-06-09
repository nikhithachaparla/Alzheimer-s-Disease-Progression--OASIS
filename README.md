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
- nWBV was significantly lower in the AD group vs cognitively normal 
  individuals (p < 0.001), confirming brain atrophy as a core AD biomarker
- Strong negative correlation between age and nWBV (p < 0.001) — brain 
  volume declines systematically with age
- ANOVA confirmed nWBV declines across CDR severity categories 
  (F(3,231) = 27.65, p < 0.001); largest decline between CDR 0 and CDR 2
- Age, MMSE, and eTIV were significant independent predictors of nWBV 
  in multivariate regression; sex was not significantly associated with diagnosis
- Assumption testing conducted: Shapiro-Wilk normality, Levene's equality 
  of variances, VIF for multicollinearity

---

## Semester 2 — Machine Learning Classification (Python)
**Course:** HDS-5330 | **Dataset:** OASIS-2 Longitudinal  
**Methods:** KNN, Naive Bayes, SVM (RBF kernel), Random Forest

### Key Findings
- RBF SVM achieved best reliable accuracy (85.33%) with strong specificity 
  for cognitively normal classification (97% recall for Nondemented)
- KNN: 82.7% accuracy | Naive Bayes: 81.3% accuracy
- Random Forest showed 100% accuracy — identified as likely overfitting 
  on small dataset; results interpreted with caution
- nWBV and MMSE confirmed as strongest predictive features across all models
- Converted group (later developed dementia) showed intermediate atrophy 
  at baseline — validates nWBV as a potential early predictive biomarker

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
