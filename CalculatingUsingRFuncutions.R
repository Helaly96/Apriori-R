library(arules)
#Loading the data from txt file
#doing so will make us have 5281 records of 86 Variable
all_data <- read.delim("data.txt",header = FALSE)

#Taking the only variables of interest and leaving the rest
#we selected index 26, so we select 26+12
project_data <- all_data[2:13]


#we need to change them to DISCRETE data, so we use factor each column
#if you don't do this, you will face an awful amount of errors,check the links in google docs
for (i in 1:ncol(project_data))
{
  project_data[,i] <- as.factor(project_data[,i])
}


#in order to use the Arules library, we must change it to a transaction object
transes = as(project_data,"transactions")


#association rules for the transactions
association.rules <- apriori(transes, parameter = list(supp=0.2, conf=0.5,maxlen=4))



















######################################################################################################
temporary_raw1  <- as.vector( table(project_data[,1]) )
temporary_raw2  <- as.vector( table(project_data[,2]) )
temporary_raw3  <- as.vector( table(project_data[,3]) )
temporary_raw4  <- as.vector( table(project_data[,4]) )
temporary_raw5  <- as.vector( table(project_data[,5]) )
temporary_raw6  <- as.vector( table(project_data[,6]) )
temporary_raw7  <- as.vector( table(project_data[,7]) )
temporary_raw8  <- as.vector( table(project_data[,8]) )
temporary_raw9  <- as.vector( table(project_data[,9]) )
temporary_raw10 <- as.vector( table(project_data[,10]) )
temporary_raw11 <- as.vector( table(project_data[,11]) )
temporary_raw12 <- as.vector( table(project_data[,12]) )
######################################################################################################
matrix=list(temporary_raw1 , temporary_raw2 , temporary_raw3 , temporary_raw4 , temporary_raw5,
            temporary_raw6 , temporary_raw7 , temporary_raw8 , temporary_raw9 , temporary_raw10,
            temporary_raw11, temporary_raw12 )



            