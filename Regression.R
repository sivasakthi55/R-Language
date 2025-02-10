# load required libraries

library(e1071)           # For naive Bayes
library(randomForest)    # For Random Forest
library(glmnet)          # For Lasso and Ridge Regression
#library(nnet)            # For multinomial logistic regression
library(caret)           # For preprocessing and evaluation

# set seed for reproducibility

set.seed(123)

# Generate sample dataset

set.seed(123)
n<-200
data<-data.frame(
  x1=rnorm(n,mean=5,sd=2),
  x2=rnorm(n,mean=3,sd=1),
  x3=rbinom(n,1,0.5),
  y_class=factor(sample(c("A","B"),n,replace=TRUE)),
  y_continuous=rnorm(n,mean=50,sd=10)
)
data

# split data into training and testing sets

trainIndex<-createDataPartition(data$y_class,p=0.7,list=FALSE)
trainData<-data[trainIndex,]
testData<-data[-trainIndex,]

#---------- Naive bayes classifier ---------

nb_model<-naiveBayes(y_class ~ x1+x2+x3,data=trainData)
nb_pred<-predict(nb_model,testData)
cat("\n Naive Bayes Accuracy:",mean(nb_pred==testData$y_class),"\n")

#-------linear Regression ------------

lm_model<-lm(y_continuous ~ x1+x2+x3,data=trainData)
lm_pred<-predict(lm_model,testData)
cat("\n linear regression RMSE:",RMSE(lm_pred,testData$y_continuous),"\n")

#---------logistic Regression -------

logistic_model<-glm(y_class~ x1 + x2 + x3 ,data = trainData,family="binomial")
logistic_pred<-predict(logistic_model,testData,type="response")
logistic_pred_class<-ifelse(logistic_pred>0.5,"B","A")
cat("\n logistic regression Accuracy:",mean(logistic_pred_class==testData$y_class),"\n")


#-----multiple linear regression-------

mlm_model<-lm(y_continuous~ x1+x2+x3 , data=trainData)
mlm_pred<- predict(mlm_model,testData)
cat("\n Multiple Linear Regression RMSE:",RMSE(mlm_pred,testData$y_continuous),"\n")

#---------------Random Forest-----------

rf_model<-randomForest(y_class ~ x1+x2+x3 , data = trainData)
rf_pred<- predict(rf_model,testData)
cat("\n Random Forest Accuracy:",mean(rf_pred==testData$y_class),"\n")

#-------Lasso regression----------

x<-model.matrix(y_continuous ~ x1+x2+x3 ,data=trainData)[,-1]
lasso_model<-glmnet(x,trainData$y_continuous,alpha=1)
lasso_pred<-predict(lasso_model,s=0.01,newx=model.matrix(y_continuous ~ x1+x2+x3,data=testData)[,-1])
cat("\n lasso Regression RMSE:",RMSE(lasso_pred,testData$y_continuous),"\n")

#-------Ridge Regression ------

ridge_model<-glmnet(x,trainData$y_continuous ,alpha=0)
ridge_pred<-predict(ridge_model,s=0.01,newx=model.matrix(y_continuous ~ x1+x2+x3 ,data =  testData)[,-1])
cat("\n Ridge Regression RMSE:",RMSE(ridge_pred,testData$y_continuous),"\n")

#------multinomial logistic Regression ---------------

multi_model<-multinom(y_class ~ x1+x2+x3,data=trainData)
multi_pred<-predict(multi_model,testData)
cat("\n multinomiallogistic Regression Accuracy:",mean(multi_pred==testData$Y_class),"\n")


