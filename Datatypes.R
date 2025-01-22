# numeric datatypes

numeric_var<-42.5
print(paste("numeric :",numeric_var,"type:",class(numeric_var)))

#Integer datatype

integer_var<-as.integer(10)
print(paste("integer:",integer_var,"type:",class(integer_var)))

#complex datatype

complex_var<-3+5i
print(paste("complex:",complex_var,"type:",class(complex_var)))

#Logical datatype

logical_var=TRUE
print(paste("logical:",logical_var,"type:",class(logical_var)))

#character datatype

character_var="Hello,R!"
print(paste("character:",character_var,"type:",class(character_var)))

#Raw datatype

raw_var=charToRaw("S")
print(paste("Raw:",raw_var,"type:",class(raw_var)))

#vector datatype

vector_var=c(1,2,3,4,5)
print(paste("vector:",vector_var,"type:",class(vector_var)))

#list datatype

list_var<-list(42,"R Programming",TRUE,3+2i)
print(paste("list type:",class(list_var)))
print("list contents:")
print(list_var)

#Matrix datatype

matrix_var<-matrix(1:9,nrow=3,ncol=3)
print("matrix")
print(matrix_var)
print(paste("matrix type:",class(matrix_var)))

# Array datatype

array_var<-array(1:12,dim=c(2,3,2))
print("array:")
print(array_var)
print(paste("array type:",class(array_var)))

#factor datatype

factor_var<-factor(c("low","medium","high","low"))
print("factor:")
print(factor_var)
print(paste("factor levels:",levels(factor_var)))

# Data frame datatype

data_frame_var<-data.frame(
  ID=c(1,2,3),
  Name=c("Alice","bb","ccharlie"),
  score=c(59,56,47)
  )
print("data frame:")
print(data_frame_var)
print(paste("data frame type:",class(data_frame_var)))