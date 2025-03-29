# Transcriptomic-data-normalization

This project normalizes small cell lung cancer (SCLC) transcriptomic data using **median polish** 
## Data
- **Expression matrix**: `expr_sclc_ucologne_2015.rds`

## Methods

### 1. Log Transformation
- Applied log2(x + 1) transformation to reduce skewness in expression values.

### 2. Median Polish Normalization
- Used `stats::medpolish()` to decompose data into additive row/column effects and residuals.
- The **residual matrix** is used as the normalized expression matrix.

### 3. Visualization
- Heatmaps were generated (before and after normalization) to visualize the effect of normalization.

## Results
- **Normalized expression** saved to: `expr_normalized_median_polish.rds`

## Requirements
- R (≥ 4.4)
- Packages:
  - `readr`
  - `ggplot2`
  - `pheatmap`
