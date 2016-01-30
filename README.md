# Getting and Cleaning Data

## Description of the code - how it works

### 1) Read X_test, y_test, subject_test, X_train, y_train, and subject_train files using read.table function and create xtest, ytest, subject_test, xtrain, ytrain, and subject_train data frames respectively.

### 2) Use str function and dim function to understand the data.

### 3) upload dplyr library to use functions available in dplyr package.

### 4) ytest and subject_test data frames have one column named as V1. So rename them to activity.num and subject.id.

### 5) After looking at the data, xtest, ytest, and subject_test data frames have same number of  observations. So combine them using cbind() function and name the data frame as alltest.

### 6) ytrain and subject_train data frames have one column named as V1. So rename them to activity.num and subject.id.

### 7) After looking at the data, xtrain, ytrain, and subject_train data frames have same number of  observations. So combine them using cbind() function and name the data frame as alltrain.

### 8) alltest and alltrain have same number of columns. So combine them using rbind function and name the new data frame as alldata.

### 9) Create acti vector with all the activity labels ordered according to the IDs which are provided in activity_labels.txt file.

### 10)Index the acti vector with the column containing the IDs (activity.num) variable and create a new variable with activity labels called activity.labels

### 11) Identify the variables containing mean and std from the features.txt file and pass them into the select funtion and create a new data frame alldata0.

### 12) Using the names function provide the names for column variables (which have V1, V2, and so on.). These names are from the features.txt file.

### 13) The variable names have '-'. So to clean the names use gsub function to convery the hyphen("-") to period(.).

### 14) Group the variables subject.Id and activity.labels in alldata0 and create alldata1 data frame.

### 15) using summarize_each function calculate mean for all the non-group variables and name the data frame alldata2. 

### 16) The data frame has 180 observations and 68 columns.

### 17) Usine write.table to create the tidy_data.txt file for the project purpose.