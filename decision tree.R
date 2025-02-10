# Install and load the necessary packages
if (!require(rpart)) install.packages("rpart", dependencies = TRUE)
if (!require(rpart.plot)) install.packages("rpart.plot", dependencies = TRUE)

library(rpart)
library(rpart.plot)

# Load the iris dataset
data(iris)

# Build the decision tree model
model <- rpart(Species ~ ., data = iris, method = "class")

# Print the model
print(model)

# Plot the decision tree
rpart.plot(model)

rpart.plot(model, type = 3, extra = 102, fallen.leaves = TRUE)
