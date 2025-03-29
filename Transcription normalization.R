# Load required packages
library(readr)
library(pheatmap)  # for heatmap
library(stats)     # medpolish comes from here

# Step 1: Read expression matrix
expr <- readRDS("/Users/guozekai/Downloads/expr_sclc_ucologne_2015.rds")

# Step 2: Log2 transformation (avoid log(0) issue)
expr_log <- log2(expr + 1)

# Step 3: Median polish normalization
medpolish_result <- medpolish(expr_log, trace.iter = TRUE)

# Extract residuals as normalized expression matrix
expr_normalized <- medpolish_result$residuals

# Step 4: Plot heatmaps (before and after)
pheatmap(expr_log[1:100, 1:50], main = "Before Median Polish (Log2)", show_rownames = FALSE, show_colnames = FALSE)
pheatmap(expr_normalized[1:100, 1:50], main = "After Median Polish", show_rownames = FALSE, show_colnames = FALSE)

# Step 5: Save normalized matrix
saveRDS(expr_normalized, file = "expr_normalized_median_polish.rds")

