# Code Book for Getting & Cleaning Data Class Project

## This code book describes the tidy data set (UCI_HAR_tidydata.txt) output by run_analysis.R and the details of its creation.

### Raw data used for creating UCI_HAR_tidydata.txt
The raw data for this analysis were taken from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

### Raw Data Processing & Cleaning
#### Reading data into R:
1. The data are extracted from the .zip file, creating a new directory "UCI HAR Dataset". In this directory, detailed information on experiment and the measurements recorded can be found in the files "README.txt" and "feature_info.txt", respectively. 

2. Text files containing the raw data and corresponding labels for subjects, activities and features are read into R:    

* Training Data: 
  + /UCI HAR Dataset/train/X_train.txt
  + /UCI HAR Dataset/train/y_train.txt
  + /UCI HAR Dataset/train/subject_train.txt
* Test Data:
  + /UCI HAR Dataset/train/X_test.txt
  + /UCI HAR Dataset/train/y_test.txt
  + /UCI HAR Dataset/train/subject_test.txt
* Activity Labels and Features:
  + /UCI HAR Dataset/activity_labels.txt
  + /UCI HAR Dataset/features.txt  (read in as string, not as Factor)
  
#### Combining training & test data:
1. Combined data sets for X, y and subject are created by row binding the training and test data for each set.  
2. Subject data is then coerced into a factor.  

#### Subsetting the features from X:
Fill in here

#### Naming the activities in the data set:
Fill in here

#### Giving data set descriptive variable names:
Fill in here

### Creation of tidy data table in UCI_HAR_tidydata.txt

#### Create new data table with the mean of each variable grouped by activity and subject:
Fill in here  


### Variables in UCI_HAR_tidydata.txt
Fill in here
