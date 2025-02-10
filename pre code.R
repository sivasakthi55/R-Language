# Install essential libraries (Uncomment if needed)
install.packages(c("ggplot2", "dplyr", "caret", "lmtest", "MASS"))

# Load essential libraries
library(ggplot2)
library(dplyr)
library(caret)
library(lmtest)
library(MASS)

# Check R version and environment info
cat("R Version: ", R.version.string, "\n")
cat("Working Directory: ", getwd(), "\n")

# Define utility functions
check_versions <- function() {
  cat("Library Versions:\n")
  cat("ggplot2:", packageVersion("ggplot2"), "\n")
  cat("dplyr:", packageVersion("dplyr"), "\n")
  cat("caret:", packageVersion("caret"), "\n")
  cat("lmtest:", packageVersion("lmtest"), "\n")
  cat("MASS:", packageVersion("MASS"), "\n")
}

# Call version checker
check_versions()

# Generate a sample dataset for practice
generate_sample_data <- function() {
  set.seed(42)  # For reproducibility
  X <- runif(100, 1, 10)  # Feature
  y <- 3.5 * X + rnorm(100, 0, 2)  # Target with noise
  data <- data.frame(Feature = X, Target = y)
  return(data)
}

# Visualize the sample data
sample_data <- generate_sample_data()
cat("\nSample Dataset:\n")
print(head(sample_data))

# Plotting the sample data
ggplot(sample_data, aes(x = Feature, y = Target)) +
  geom_point() +
  ggtitle("Sample Data Visualization") +
  xlab("Feature") +
  ylab("Target")

# Split data for training and testing
set.seed(42)
train_index <- createDataPartition(sample_data$Target, p = 0.8, list = FALSE)
train_data <- sample_data[train_index, ]
test_data <- sample_data[-train_index, ]

# Train a simple Linear Regression model
model <- lm(Target ~ Feature, data = train_data)

# Evaluate the model
y_pred <- predict(model, newdata = test_data)


cat("\nModel Evaluation:\n")
mse <- mean((test_data$Target - y_pred)^2)
r2 <- summary(model)$r.squared
cat("Mean Squared Error: ", round(mse, 2), "\n")
cat("R^2 Score: ", round(r2, 2), "\n")

# Visualize the regression line
ggplot(test_data, aes(x = Feature, y = Target)) +
  geom_point(color = "blue") +
  geom_abline(slope = coef(model)[2], intercept = coef(model)[1], color = "red") +
  ggtitle("Linear Regression Model") +
  xlab("Feature") +
  ylab("Target")

# Save the dataset to a CSV file
output_file <- "sample_dataset.csv"
write.csv(sample_data, file = output_file, row.names = FALSE)
cat("\nSample dataset saved to ", output_file, "\n")

