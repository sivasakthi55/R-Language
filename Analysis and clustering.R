# install required packages (if not already installed)
#install.packages(c("survival","rvest","cluster","factoextra","dplyr"))

# load necessary librar̥ies

library(survival)       # For survival analysis 
library(rvest)          # For web extraction
library(cluster)        # For clustering
library(factoextra)     # For visulaization
library(dplyr)          # For data manipulation

#------1.Survival Analysis -----------

cat("\n------Survival Analysis---\n")

# Load and Clean dataset

data(lung)
lung<-na.omit(lung)       #Remove missing values
lung

# Create a survival object

surv_obj<-Surv(time=lung$time,event=lung$status)

# Fit Kapan-meier model

fit <-  survfit(surv_obj ~ 1, data=lung)

# Plot survival curve

plot (fit,main="kaplan-meier survival",xlab="Time",ylab="survival probability")

# 2. Web Extrāction 
library(rvest)
cat("\n-------Web Extraction---------\n")

url<-"https://www.w3schools.com/"        #Replace with actual website 

page <- read_html(url)

# Extract text from headings(modify selection based on actual website)

titles <- page %>% html_nodes("h1") %>% html_text()
print(titles)

#========================
# 3. clustering (hierarchical & k-means)
#=========================
library(cluster)  
cat("\n-----Clustering Example -------\n")

 # Generate a sample dataset

set.seed(123)

data<- data.frame(
  x=rnorm(50,mean = 5,sd=2),
  y=rnorm(50,mean = 3,sd=1)
)
data

# Euclidean Distance Calculation 

euclidean_dist <- dist(data,method="euclidean")

# Manhatttan distance calculation

manhattan_dist <- dist(data,method="manhattan")

cat("\n Euclidean Distance Matrix:\n")
print(euclidean_dist)

cat("\n Manhattan Distance Matrix:\n")
print(manhattan_dist)

# Hierarchical clustering 

hc<-  hclust(euclidean_dist,method="complete")

# Plot Hierarchical Clustering

plot (hc,main="Hierarchical Clustering",xlab = "observations",sub="")


#----------------------------
# k-MEANS Clustering
#----------------------------

set.seed(123)
kmeans_result<-kmeans(data,centers = 3,nstart = 25)

# Plot K-means Clustering 

fviz_cluster(kmeans_result,data=data)

cat("\n k-means cluster centers:\n")
print(kmeans_result$centers)

cat("\n k-means cluster assignment :\n")
print(kmeans_result$cluster)






