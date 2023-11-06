# Load the required libraries
library(randomForest)
library(caret)
library(randomForestSRC)
library(party)

# Set the seed for reproducibility
set.seed(20)

# Load your dataset (replace 'D:/WSN.csv' with your actual file path)
df <- read.csv("D:/WSN.csv")

# Remove the last column from the dataset
df <- df[, -ncol(df)]

# Select predictor variables (features) and the target variable
x <- df[c('anchor_ratio', 'trans_range', 'node_density', 'iterations')]
y <- df$ale

# Split the data into a training and testing set
set.seed(20)
split_index <- createDataPartition(y, p = 0.2, list = FALSE)
x_train <- x[-split_index, ]
y_train <- y[-split_index]
x_test <- x[split_index, ]
y_test <- y[split_index]

# Fit a Random Forest model
regressor <- randomForest(y_train ~ ., data = x_train, ntree = 100, nodesize = 5)

# Make predictions on the test set
y_pred <- predict(regressor, newdata = x_test)

# Calculate the mean squared error
mse <- mean((y_test - y_pred)^2)
cat("Mean Squared Error:", mse, "\n")

# Define the parameter grid for grid search
param_grid <- expand.grid(n_estimators = 1:20,
                          max_depth = 1:20,
                          random_state = 1:20,
                          min_samples_split = c(2, 5, 10),
                          n_jobs = -1)

# Initialize the Random Forest Regressor
clf <- randomForest(y_train ~ ., data = x_train, ntree = 10)

# Perform grid search
grid_search <- train(x_train, y_train, method = "rf", tuneGrid = param_grid, trControl = trainControl(method = "cv", number = 10))
best_params <- grid_search$results[which.min(grid_search$results$RMSE), ]
best_params <- best_params[c('n_estimators', 'max_features', 'min_samples_split', 'n_jobs')]

# Fit a Random Forest model with the best parameters
clf <- randomForest(y_train ~ ., data = x_train, ntree = best_params$n_estimators, mtry = best_params$max_features, nodesize = best_params$min_samples_split)

# Make predictions on the test set
pred <- predict(clf, newdata = x_test)

# Calculate the mean squared error
mse <- mean((y_test - pred)^2)
cat("Mean Squared Error (Optimized):", mse, "\n")

# Function to input WSN values and make predictions
input_WSN_Values <- function() {
  anchor_ratio <- as.numeric(readline("Enter the anchor_ratio: "))
  trans_range <- as.numeric(readline("Enter the trans_range: "))
  node_density <- as.numeric(readline("Enter the node_density: "))
  iterations <- as.numeric(readline("Enter the iterations: "))
  new_data <- data.frame(
    anchor_ratio = anchor_ratio,
    trans_range = trans_range,
    node_density = node_density,
    iterations = iterations
  )
  pred_ale <- predict(clf, new_data)
  cat("Predicted ale:", pred_ale, "\n")
  continue_input <- readline("Do you want to input features for another WSN? (Y/N): ")
  if (tolower(continue_input) == 'y') {
    input_WSN_Values()
  }
}

# Call the function to input WSN values and make predictions
input_WSN_Values()
