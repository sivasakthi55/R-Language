#sample dataset

data<-c(4,8,6,44,85,54)

# 1. Mean

mean_value<-mean(data)
print(paste("mean:",mean_value))

# 2.median

median_values<-median(data)
print(paste("median:",median_values))

# 3.mode(custom function as R doesn't have a built-int function for mode)

get_mode<-function(x){
  unique_x<-unique(x)
  unique_x[which.max(tabulate(match(x,unique_x)))]
}
mode_value<-get_mode(data)
print(paste("mode:",mode_value))

# 4. variance

variance_value<-var(data)
print(paste("variance:",variance_value))

# 5.standard deviation

std_dev_value<-sd(data)
print(paste("standard deviation:",std_dev_value))

# 6. minimum

min_value<-min(data)
print(paste("minimum:",min_value))

# 7. maximum

max_value<-max(data)
print(paste("maximum:",max_value))

# 8. Range

range_value<-range(data)
print(paste("Range:",paste(range_value,collapse = "to")))

# 9.sum

sum_value=sum(data)
print(paste("sum:",sum_value))

#10. product

prod_value<-prod(data)
print(paste("Product:",prod_value))

# 11.Quantiles

quantiles<-quantile(data,probs=c(0.25,0.5,0.75))
print("quantile:")
print(quantiles)

# 12.correlation(example with another dataset)

data2<-c(4,5,8,1,5,8)
correlation=cor(data,data2)
print(paste("correlation with another dataset :",correlation))

# 13.covariance(example with another dataset)

covariance=cov(data,data2)
print(paste("covariance with another dataset:",covariance))






      