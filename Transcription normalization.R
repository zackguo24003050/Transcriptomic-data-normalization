#zack git trial
# Load packages
library(readr)
library(pheatmap)
library(stats)

# 1. Read expression data
expr <- readRDS("/Users/guozekai/Downloads/expr_sclc_ucologne_2015.rds")

# 2. Log2 transformation
expr_log <- log2(expr + 1)

# 3. Median polish using built-in function
medpolish_result <- medpolish(expr_log, trace.iter = TRUE)
expr_normalized <- medpolish_result$residuals

# 4. Heatmap before and after full median polish
pheatmap(expr_log[1:100, 1:50], main = "Before Median Polish", show_rownames = FALSE, show_colnames = FALSE)
pheatmap(expr_normalized[1:100, 1:50], main = "After Median Polish", show_rownames = FALSE, show_colnames = FALSE)

# 5. Save normalized expression matrix
saveRDS(expr_normalized, file = "expr_normalized_median_polish.rds")
