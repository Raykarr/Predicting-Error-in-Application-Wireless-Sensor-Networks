# Load the required libraries
library(ggplot2)
library(stats)
library(base)
library(dplyr) 
library(tidyr) 
library(scatterplot3d)
# Read the CSV file
df <- read.csv("D:/Project/mcs_ds_edited_iter_shuffled.csv")

# Data Visualization
# Scatter Plot for 'anchor_ratio' vs 'ale'
ggplot(df, aes(x = anchor_ratio, y = ale)) +
  geom_point() +
  labs(x = "anchor_ratio", y = "ale", title = "Anchor Ratio vs ale")

# Scatter Plot for 'trans_range' vs 'ale'
ggplot(df, aes(x = trans_range, y = ale)) +
  geom_point() +
  labs(x = "trans_range", y = "ale", title = "Trans Range vs ale")

# Scatter Plot for 'node_density' vs 'ale'
ggplot(df, aes(x = node_density, y = ale)) +
  geom_point() +
  labs(x = "node_density", y = "ale", title = "Node Density vs ale")

# Scatter Plot for 'iterations' vs 'ale'
ggplot(df, aes(x = iterations, y = ale)) +
  geom_point() +
  labs(x = "iterations", y = "ale", title = "Iterations vs ale")

# Bar Plot for 'anchor_ratio'
df %>%
  ggplot(aes(x = anchor_ratio, y = ale)) +
  geom_bar(stat = "identity", fill = "blue", color = "black") +
  labs(title = "Anchor Ratio vs ale")

# Box Plot for 'anchor_ratio', 'trans_range', 'node_density', 'iterations'
df %>%
  gather(variable, value, -ale) %>%
  ggplot(aes(x = variable, y = value)) +
  geom_boxplot(fill = "blue") +
  labs(title = "Box Plot of Data", x = "Columns", y = "Values")

# Line Plot for the entire dataset
df %>%
  ggplot(aes(x = 1:nrow(df), y = ale)) +
  geom_line() +
  labs(title = "Line Graph", x = "X-axis label", y = "Y-axis label")

# 3D Scatter Plot
scatterplot3d(df$anchor_ratio, df$trans_range, df$ale, color = "blue", pch = 16, main = "3D Scatter Plot")

# 3D Scatter Plot (Alternative)
scatterplot3d(df$anchor_ratio, df$trans_range, df$ale, color = "blue", pch = 16, main = "3D Scatter Plot")

# Change plot size for better visualization
par(mfrow = c(1, 1), mar = c(5, 5, 4, 2) + 0.1, xpd = NA)

# Bar Plot for 'anchor_ratio', 'trans_range', 'node_density', 'iterations'
df %>%
  pivot_longer(cols = -ale) %>%
  ggplot(aes(x = name, y = ale, fill = name)) +
  geom_bar(stat = "identity") +
  labs(title = "Anchor Ratio")

# K-Means Clustering
set.seed(123)
df_scaled <- scale(df[, c("anchor_ratio", "trans_range", "node_density", "iterations")])

kmeans_result <- kmeans(df_scaled, centers = 3, nstart = 25)
df$cluster <- as.factor(kmeans_result$cluster)

# Plot the clusters
plot(df_scaled, col = df$cluster)
points(kmeans_result$centers, col = 1:3, pch = 8, cex = 2)

# Preprocessing (Min-Max Scaling)
# df$ale <- scale(df$ale, center = FALSE, scale = (max(df$ale) - min(df$ale)))
# df$anchor_ratio <- scale(df$anchor_ratio, center = FALSE, scale = (max(df$anchor_ratio) - min(df$anchor_ratio)))
