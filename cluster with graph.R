# Load required libraries

if(!require("cluster")) install.packages("cluster")
if(!require("dbscan")) install.packages("dbscan")
if(!require("Rtsne")) install.packages("Rtsne")
if(!require("wordcloud")) install.packages("wordcloud")
if(!require("ggplot2")) install.packages("wordcloud")

library(cluster)
library(dbscan)
library(Rtsne)
library(wordcloud)
library(ggplot2)

# sample dataset(iris data without the species column)

data<-iris[,-5]
labels<-iris$Species

# K-Medoids Clustering

cat("Running K-Medoids------\n")
kmed<-pam(data,k=3)
print(kmed$clustering)

# K-Medoids Plot

plot(kmed,main="K-Medoids Clustering")

# 2. DBSCAN Clustering

cat("Running DBSCAN...\n")
db<-dbscan(data,eps = 0.5,minPts = 5)
print(db$cluster)

#DBSCAN plot

plot(data,col=db$cluster + 1,pch=19,main="DBSCAN Clustering")

# 3. Clara Clustering

cat("Running clara....\n")
clara_result<-clara(data,k=3)
print(clara_result$clustering)

# plot Clara

plot(clara_result,main="CLARA Clustering")

# 4. Dimension Reducton 

## PCA 

cat("performing PCA...\n")
pca_result<-prcomp(data,scale. = TRUE)
summary(pca_result)

# PCA plot 

biplot(pca_result,main="PCA Biplot")

## t-SNE

#cat("Performing t-SNE....\n")
#tsne_result<-Rtsne(data,dims=2,perplexity=30)

# s-SNE plot 

#plot(tsne_result$Y,col=as.numeric(labels),pch=19,main="t-SNE",xlab="Dim 1",ylab="Dim 2")

# 5. Word Cloud

cat(" Generating Word Cloud....\n")
text<-c("R","Clustering","Visulaization","PCA","DBSCAN","CLARA")

wordcloud(words = text,freq = c(4,3,2,5,3,1),colors = brewer.pal(8,"Dark2"))

# 6.Graphical Representation (ggplot2 Example)

cat("Creating Graphical Representation....\n")
ggplot(iris,aes(x=Sepal.Length,y=Sepal.Width,colour = Species))+geom_point(size=3)+theme_minimal()+ggtitle("sepal Dimensions by species")



