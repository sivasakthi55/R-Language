#load necccary libraries

library(rpart)          # for Decision Tree
library(rpart.plot)     # for ploting Decision Tree 
library(class)          # for KNN 
library(e1071)          # for SVM
library(caret)          # for data partitioning and accuracy measurement

# load dataset 

data(iris)
iris

# split the dataset into traning and testing sets 

set.seed(123)
trainIndex<-createDataPartition(iris$Species,p=0.7,list=FALSE)
trainData<-iris[trainIndex,]
testData<-iris[-trainIndex,]


#---------DECISION TREE (Gini Index)-------

cat("\n===Decision Tree===\n")

# build the Decision Tree model

dt_model<-rpart(Species~.,data=trainData,method="class",parms=list(split="gini"))

# plot the Decision Tree 

rpart.plot(dt_model,main="Decision Tree(Gini index)")

# predict on test data

dt_predictions<-predict(dt_model,testData,type="class")

# calculate accuracy

dt_model<-sum(dt_predictions==testData$Species)/nrow(testData)*100

cat("Decision Tree Accuracy:",dt_accuracy,"%\n")

#------k-Nearest Neighborś(knn)-------------

cat("\n==k-Nearest Neighbors(knn)==\n")

# scale the feature 

train_scaled<-scale(trainData[,-5])
test_scaled<-scale(testData[,-5])

train_scaled
test_scaled

# find the optimal k using cross-vilidation 

set.seed(123)
k_values<-1:10
accuracies<-sapply(k_values,function(k){
  knn_pred<-knn(train=train_scaled,test=test_scaled,cl=trainData$Species,k=k)
  mean(knn_pred==testData$Species)
})
  
optimal_k<-which.max(accuracies)
cat("optimal k:",optimal_k,"\n")

#Build the KNN model with optimal k
 
knn_predictions<-knn(train=train_scaled,test=test_scaled,cl=trainData$Species,k=optimal_k)

# calculate accuracy

knn_accuracy<-mean(knn_predictions==testData$Species)*100

cat("knn Accuracy:",knn_accuracy,"%\n")

#-------support vector machine(svm)-----------

cat("\n===support vector machine (svm)===\n")

# Build the svm model 

svm_model<-svm(Species~.,data=trainData,kernel="linear")

# pedict on test data

svm_predictions<-predict(svm_model,testData)

#calculate accuracy

svm_accuracy<-sum(svm_predictions==testData$Species)/nrow(testData)*100

cat("svm accuracy:",svm_accuracy,"%\n")

#------summary-----

cat("\n===summary of accuracy===\n")
cat("Decision Tree Accuracy:",dt_accuracy,"%\n")
cat("KNN Accuracy:",knn_accuracy,"%\n")
cat("SVM Accuracy:",svm_accuracy,"%\n")


              

                