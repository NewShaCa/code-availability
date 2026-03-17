# trust_analysis.m – MATLAB GLME Analysis Script

## Overview

This script performs statistical analyses for the trust game experiment using **generalized linear mixed-effects models (GLME)** in MATLAB.

The analyses examine how experimental conditions (fairness and emotional expressions) influence:

1. Investment behavior in the trust game
2. Reaction time for investment decisions

The models account for repeated measurements across trials using participant-level random effects.

---

## Software requirements

The script requires:

- **MATLAB**
- **Statistics and Machine Learning Toolbox**

The key MATLAB function used is:

`fitglme`

which fits generalized linear mixed-effects models.

---

## Data input

The script reads a cleaned dataset containing trial-level observations:
```matlab
data = readtable('final_df_clean__1_5_IQR.csv');
