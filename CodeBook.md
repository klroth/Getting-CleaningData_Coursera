# Code Book for Getting & Cleaning Data Class Project

## This code book describes the tidy data set (UCI_HAR_tidydata.txt) output by run_analysis.R and the details of its creation.

### Raw data used for creating UCI_HAR_tidydata.txt
The raw data for this analysis were taken from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)  

### Raw Data Processing & Cleaning
#### Reading data into R:
1. The data are extracted from the .zip file, creating a new directory "UCI HAR Dataset". In this directory, detailed information on experiment and the measurements recorded can be found in the files "README.txt" and "feature_info.txt", respectively. 

2. Text files containing the raw data and corresponding labels for subjects, activities and features are read into R:    

* Training Data (70% of the full data set, set aside for training): 
  + /UCI HAR Dataset/train/X_train.txt (contains measurements of features)
  + /UCI HAR Dataset/train/y_train.txt (contains a value corresponding to the activity)
  + /UCI HAR Dataset/train/subject_train.txt (contains a value corresponding to the research subject)
* Test Data (30% of the full data set, set aside for testing):
  + /UCI HAR Dataset/train/X_test.txt (contains measurements of features)
  + /UCI HAR Dataset/train/y_test.txt (contains a value corresponding to the activity)
  + /UCI HAR Dataset/train/subject_test.txt (contains a value corresponding to the research subject)
* Activity Labels and Features:
  + /UCI HAR Dataset/activity_labels.txt (contains labels for each unique value of y, identifying the activity)
  + /UCI HAR Dataset/features.txt; read in as string, not as Factor (contains the names of the features, corresponding to the columns in X)
  
#### Combining training & test data:
1. Combined data sets for X, y and subject are created by row binding the training and test data for each set.  
2. Subject data is then coerced into a factor (with levels 1-30).  

#### Subsetting the features from X:
We are only interested in the mean and standard deviation features of each of the study measurements. These values have feature names with the strings "mean()" or "std()" in them.  

1. Using grepl, the indices for features containing either of these two strings are recorded and sorted in ascending order.  
2. These indices are used to create an X data subset of just these features by selecting the appropriate columns.  
3. The indices are also used to create a feature names subset.  

#### Naming the activities in the data set:
We need to replace the y activity factor values with the names of the corresponding activities to make our data set more understandable. We also want to combine all our information into one table.  

1. y is coerced into a factor with labels set to the levels of the activity labels data  
2. A new data frame "newdata" is created by column binding the new y factor to the subject data factor and the subset of X data.  

#### Giving data set descriptive variable names:
We now want to give our new data table descriptive variable names.  

1. The column names for "newdata" are set to "Activity", "Subject" and the subset of feature names created previously.

### Creation of tidy data table in UCI_HAR_tidydata.txt

#### Create new data table with the mean of each variable grouped by activity and subject:
We would like to create a final data table that contains the mean of each variable of interest grouped by the unique combinations of activity and subject. Put another way, we want the mean value of each variable for each activity and each subject.  

1. The package "dplyr" is required.  
2. A new data frame "tidy_data" is created by grouping the newdata table by Activity and Subject, and then summarizing each group with its mean value.  
3. The column names of "tidy_data" are set to a character vector of new, descriptive measurement names. 
4. The table "tidy_data" is written to the output file "UCI_HAR_tidydata.txt" with no row names.  

### Description of data in UCI_HAR_tidydata.txt
#### Table Format
The tidy data table contains 180 observations of 68 variables. *Each measurement observation is the mean value of the means or standard deviations of the raw measurements for each unique combination of Activity and Subject.* So there will be one row for every activity (6) performed by every subject (30); 6*30=180.  
The columns each represent a variable. Descriptive variable names for the feature measurements were created using the information found in the file ""feature_info.txt" from the raw data. 

#### Variables & Units
**Activity:** the activity performed by the subject; a factor with 6 levels:    
    1. Laying  
    2. Sitting  
    3. Standing  
    4. Walking  
    5. Walking Down Stairs  
    6. Walking Up Stairs  
    
**SubjectNumber:** the number identifying the research subject performing the activity; a factor with 30 levels (1-30)    

**Avg_meanAccelerometerBodyTime-Xaxis**
**Avg_meanAccelerometerBodyTime-Yaxis**
**Avg_meanAccelerometerBodyTime-Zaxis**
**Avg_stdAccelerometerBodyTime-Xaxis**
**Avg_stdAccelerometerBodyTime-Yaxis**
**Avg_stdAccelerometerBodyTime-Zaxis**
**Avg_meanAccelerometerGravityTime-Xaxis**
**Avg_meanAccelerometerGravityTime-Yaxis**
**Avg_meanAccelerometerGravityTime-Zaxis**
**Avg_stdAccelerometerGravityTime-Xaxis**
**Avg_stdAccelerometerGravityTime-Yaxis**
**Avg_stdAccelerometerGravityTime-Zaxis**
**Avg_meanAccelerometerBodyJerkTime-Xaxis**
**Avg_meanAccelerometerBodyJerkTime-Yaxis**
**Avg_meanAccelerometerBodyJerkTime-Zaxis**
**Avg_stdAccelerometerBodyJerkTime-Xaxis**
**Avg_stdAccelerometerBodyJerkTime-Yaxis**
**Avg_stdAccelerometerBodyJerkTime-Zaxis**
**Avg_meanGyroscopeBodyTime-Xaxis**
**Avg_meanGyroscopeBodyTime-Yaxis**
**Avg_meanGyroscopeBodyTime-Zaxis**
**Avg_stdGyroscopeBodyTime-Xaxis**
**Avg_stdGyroscopeBodyTime-Yaxis**
**Avg_stdGyroscopeBodyTime-Zaxis**
**Avg_meanGyroscopeBodyJerkTime-Xaxis**
**Avg_meanGyroscopeBodyJerkTime-Yaxis**
**Avg_meanGyroscopeBodyJerkTime-Zaxis**
**Avg_stdGyroscopeBodyJerkTime-Xaxis**
**Avg_stdGyroscopeBodyJerkTime-Yaxis**
**Avg_stdGyroscopeBodyJerkTime-Zaxis**
**Avg_meanAccelerometerBodyMagnitudeTime**
**Avg_stdAccelerometerBodyMagnitudeTime**
**Avg_meanAccelerometerGravityMagnitudeTime**
**Avg_stdAccelerometerGravityMagnitudeTime**
**Avg_meanAccelerometerBodyJerkMagnitudeTime**
**Avg_stdAccelerometerBodyJerkMagnitudeTime**
**Avg_meanGyroscopeBodyMagnitudeTime**
**Avg_stdGyroscopeBodyMagnitudeTime**
**Avg_meanGyroscopeBodyJerkMagnitudeTime**
**Avg_stdGyroscopeBodyJerkMagnitudeTime**
**Avg_meanAccelerometerBodyFrequency-Xaxis**
**Avg_meanAccelerometerBodyFrequency-Yaxis**
**Avg_meanAccelerometerBodyFrequency-Zaxis**
**Avg_stdAccelerometerBodyFrequency-Xaxis**
**Avg_stdAccelerometerBodyFrequency-Yaxis**
**Avg_stdAccelerometerBodyFrequency-Zaxis**
**Avg_meanAccelerometerBodyJerkFrequency-Xaxis**
**Avg_meanAccelerometerBodyJerkFrequency-Yaxis**
**Avg_meanAccelerometerBodyJerkFrequency-Zaxis**
**Avg_stdAccelerometerBodyJerkFrequency-Xaxis**
**Avg_stdAccelerometerBodyJerkFrequency-Yaxis**
**Avg_stdAccelerometerBodyJerkFrequency-Zaxis**
**Avg_meanGyroscopeBodyFrequency-Xaxis**
**Avg_meanGyroscopeBodyFrequency-Yaxis**
**Avg_meanGyroscopeBodyFrequency-Zaxis**
**Avg_stdGyroscopeBodyFrequency-Xaxis**
**Avg_stdGyroscopeBodyFrequency-Yaxis**
**Avg_stdGyroscopeBodyFrequency-Zaxis**
**Avg_meanAccelerometerBodyMagnitudeFrequency**
**Avg_stdAccelerometerBodyMagnitudeFrequency**
**Avg_meanAccelerometerBodyJerkMagnitudeFrequency**
**Avg_stdAccelerometerBodyJerkMagnitudeFrequency**
**Avg_meanGyroscopeBodyMagnitudeFrequency**
**Avg_stdGyroscopeBodyMagnitudeFrequency**
**Avg_meanGyroscopeBodyJerkMagnitudeFrequency**
**Avg_stdGyroscopeBodyJerkMagnitudeFrequency**


