# Code Book for Getting & Cleaning Data Class Project

## This code book describes the tidy data set (UCI_HAR_tidydata.txt) output by run_analysis.R and the details of its creation.

### Raw data used for creating UCI_HAR_tidydata.txt
The raw data for this analysis were taken from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

The data are extracted from the .zip file and several .txt files are read into R:.
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

### Raw Data Processing & Cleaning
#### Combining training & test data:
Combined data sets for X, y and subject are created by row binding the training and test data for each set.  
Subject data is then coerced into a factor.  
#### Extracting variable means and standard deviations
We only want to keep observations from the features




### Creation of tidy data table in UCI_HAR_tidydata.txt


### Variables in UCI_HAR_tidydata.txt
