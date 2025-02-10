#install and load the necessary packages
if(!require(ggplot2))install.packages("ggplot2",dependencies=TRUE)
if(!require(dplyr))install.packages("dplyr",dependencies=TRUE)
if(!require(ggfortify))install.packages("ggfortify",dependencies=TRUE)

library(ggplot2)
library(dplyr)
library(ggfortify)

#load the iris dataset 
data(iris)

# preprocess the data by removing the species column 
iris_data <- iris %>% select(-Species)

#perform PCA
pca_result<-prcomp(iris_data,centre=TRUE,scale.=TRUE)

#print PCA result
print(summary(pca_result))

# visualize the PCA result 
autoplot(pca_result,data=iris,color='Species',loadings=TRUE,loadings.label=TRUE,loadings.label.size=3)