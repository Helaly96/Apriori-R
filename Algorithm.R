library(arules)

all_data <- read.delim("data.txt",header = FALSE)

project_data <- all_data[2:13]

for (i in 1:ncol(project_data))
{
  project_data[,i] <- as.factor(project_data[,i])
}


min_support=0.08
transes = as(project_data,"transactions")

#will contain the supports of  all elements of each attribute
mat = c()

#att_names
names=c('A','B','C','D','E','F','G','H','I','J','K','L')

#Calculating the support


#loop on attributes
for ( i in 1:ncol(project_data))
{
   attributes_values=c()
   dummy_col_names=c()
   
   
   #get how many times each element in that attribute is repeated 
   # 0 repeated 3 times, 1 repeated 4 times .. etc
   x = table(project_data[,i])
   
   #convert it to dataframe
   df_x = as.data.frame(x)
   
   #get the first column of the dataframes, which is the values that attribute will take
   levels_name = df_x[[1]]

   #get the frequecny of each value
   attributes_values = df_x[[2]]
   #attributes_values = as.vector(x)
   
   #support = attributes_values / nrow(project_data)
   support = attributes_values 
   
   #TODO, check the starting if it's from 0 or 1
   for ( j in 1:length(levels_name))
   {
       dummy_col_names[j]= paste(names[i],levels_name[j])
   }
  
   
   mat <-c(mat,list(list(support,dummy_col_names)))
   
}


L=c()


#Forming the First L
for (i in 1:12)
{
  current_list = mat[[i]]
  

  supports <- unlist(current_list[1],use.names=FALSE)
  names_of_atts    <- unlist(current_list[2],use.names=FALSE)
  
  
  supports_bool <- supports > 0.08

  supports <- supports[supports_bool]
  names_of_atts    <- names_of_atts[supports_bool]
  
  for (i in 1:length(supports))
  {
    L<-c(L,list(list(supports[i],names_of_atts[i])))
  }
  
  
}


count = 1


#loops on the elemetns of L

for (i in 1:length(L))
{
  
  i=1
  
  Current_Selected_Element = L[[i]]
  
  Name_Of_Attribute = Current_Selected_Element[2]
  
  splitted = strsplit(Name_Of_Attribute[[1]], ' ')
  
  
  #The index of the attribute
  col_index=match( names, splitted[[1]][1] )
  #the value of that attribute
  value_of_attribute= splitted[[1]][2]

  
  #Selects the Element of L with the elements under it
  for(j in i+1:length(L))
  {
    
    Element_to_be_compared_to = L[[j]]
    Name_Of_Element_to_Be_Compared_to= Element_to_be_compared_to[2]
    
    #if the under elements has more than one element, count will increase and we will
    #loop on all elements
    for(q in 1:count)
    {
      
    }
    
  }
  
}
