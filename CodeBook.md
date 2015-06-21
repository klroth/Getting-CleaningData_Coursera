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

#### Variables
**Activity:** the activity performed by the subject; a factor with 6 levels:    
    1. Laying  
    2. Sitting  
    3. Standing  
    4. Walking  
    5. Walking Down Stairs  
    6. Walking Up Stairs  
    
**SubjectNumber:** the number identifying the research subject performing the activity; a factor with 30 levels (1-30)    

**Avg_meanAccelerometerBodyTime-Xaxis:** the average mean time of the Accelerometer body acceleration signal along the X axis  

**Avg_meanAccelerometerBodyTime-Yaxis:** the average mean time of the Accelerometer body acceleration signal along the Y axis  

**Avg_meanAccelerometerBodyTime-Zaxis:** the average mean time of the Accelerometer body acceleration signal along the Z axis  

**Avg_stdAccelerometerBodyTime-Xaxis:** the average std of time of the Accelerometer body acceleration signal along the X axis  

**Avg_stdAccelerometerBodyTime-Yaxis:** the average std of time of the Accelerometer body acceleration signal along the Y axis  

**Avg_stdAccelerometerBodyTime-Zaxis:** the average std of time of the Accelerometer body acceleration signal along the Z axis  

**Avg_meanAccelerometerGravityTime-Xaxis:** the average mean time of the Accelerometer gravity acceleration signal along the X axis  

**Avg_meanAccelerometerGravityTime-Yaxis:** the average mean time of the Accelerometer gravity acceleration signal along the Y axis  

**Avg_meanAccelerometerGravityTime-Zaxis:** the average mean time of the Accelerometer gravity acceleration signal along the Z axis  

**Avg_stdAccelerometerGravityTime-Xaxis:** the average std of time of the Accelerometer gravity acceleration signal along the X axis  

**Avg_stdAccelerometerGravityTime-Yaxis:** the average std of time of the Accelerometer gravity acceleration signal along the Y axis  

**Avg_stdAccelerometerGravityTime-Zaxis:** the average std of time of the Accelerometer gravity acceleration signal along the Z axis  

**Avg_meanAccelerometerBodyJerkTime-Xaxis:** the average mean time of the Accelerometer body linear acceleration along the X axis  

**Avg_meanAccelerometerBodyJerkTime-Yaxis:** the average mean time of the Accelerometer body linear acceleration along the Y axis  

**Avg_meanAccelerometerBodyJerkTime-Zaxis:** the average mean time of the Accelerometer body linear acceleration along the Z axis  

**Avg_stdAccelerometerBodyJerkTime-Xaxis:** the average std of time of the Accelerometer body linear acceleration along the X axis  

**Avg_stdAccelerometerBodyJerkTime-Yaxis:** the average std of time of the Accelerometer body linear acceleration along the Y axis  

**Avg_stdAccelerometerBodyJerkTime-Zaxis:** the average std of time of the Accelerometer body linear acceleration along the Z axis  

**Avg_meanGyroscopeBodyTime-Xaxis:** the average mean time of the Gyroscope body acceleration signal along the X axis  

**Avg_meanGyroscopeBodyTime-Yaxis:** the average mean time of the Gyroscope body acceleration signal along the Y axis  

**Avg_meanGyroscopeBodyTime-Zaxis:** the average mean time of the Gyroscope body acceleration signal along the Z axis  

**Avg_stdGyroscopeBodyTime-Xaxis:** the average std of time of the Gyroscope body acceleration signal along the X axis  

**Avg_stdGyroscopeBodyTime-Yaxis:** the average std of time of the Gyroscope body acceleration signal along the Y axis  

**Avg_stdGyroscopeBodyTime-Zaxis:** the average std of time of the Gyroscope body acceleration signal along the Z axis  

**Avg_meanGyroscopeBodyJerkTime-Xaxis:** the average mean time of the angular velocity along the X axis  

**Avg_meanGyroscopeBodyJerkTime-Yaxis:** the average mean time of the angular velocity along the Y axis  

**Avg_meanGyroscopeBodyJerkTime-Zaxis:** the average mean time of the angular velocity along the Z axis  

**Avg_stdGyroscopeBodyJerkTime-Xaxis:** the average std of time of the angular velocity along the X axis  

**Avg_stdGyroscopeBodyJerkTime-Yaxis:** the average std of time of the angular velocity along the Y axis  

**Avg_stdGyroscopeBodyJerkTime-Zaxis:** the average std of time of the angular velocity along the Z axis  

**Avg_meanAccelerometerBodyMagnitudeTime:** the average mean time of the magnitude of the Accelerometer 3-D body acceleration signal  

**Avg_stdAccelerometerBodyMagnitudeTime:** the average std of time of the magnitude of the Accelerometer 3-D body acceleration signal  

**Avg_meanAccelerometerGravityMagnitudeTime:** the average mean time of the magnitude of the Accelerometer 3-D gravity acceleration signal  

**Avg_stdAccelerometerGravityMagnitudeTime:** the average std of time of the magnitude of the Accelerometer 3-D gravity acceleration signal  
**Avg_meanAccelerometerBodyJerkMagnitudeTime:**  the average mean time of the magnitude of the Accelerometer 3-D body linear acceleration  

**Avg_stdAccelerometerBodyJerkMagnitudeTime:**  the average std of time of the magnitude of the Accelerometer 3-D body linear acceleration  

**Avg_meanGyroscopeBodyMagnitudeTime:** the average mean time of the magnitude of the Gyroscope 3-D body acceleration signal  
**Avg_stdGyroscopeBodyMagnitudeTime:** the average std of time of the magnitude of the Gyroscope 3-D body acceleration signal  
**Avg_meanGyroscopeBodyJerkMagnitudeTime:** the average mean time of the magnitude of the 3-D body angular velocity  

**Avg_stdGyroscopeBodyJerkMagnitudeTime:** the average std of time of the magnitude of the 3-D body angular velocity  

**Avg_meanAccelerometerBodyFrequency-Xaxis:** the average mean frequency of the Accelerometer body acceleration signal along the X axis  

**Avg_meanAccelerometerBodyFrequency-Yaxis:** the average mean frequency of the Accelerometer body acceleration signal along the Y axis  

**Avg_meanAccelerometerBodyFrequency-Zaxis:** the average mean frequency of the Accelerometer body acceleration signal along the Z axis  

**Avg_stdAccelerometerBodyFrequency-Xaxis:** the average std of frequency of the Accelerometer body acceleration signal along the X axis  

**Avg_stdAccelerometerBodyFrequency-Yaxis:** the average std of frequency of the Accelerometer body acceleration signal along the Y axis  

**Avg_stdAccelerometerBodyFrequency-Zaxis:** the average std of frequency of the Accelerometer body acceleration signal along the Z axis  

**Avg_meanAccelerometerBodyJerkFrequency-Xaxis:**  the average mean frequency of the Accelerometer body linear acceleration along the X axis  

**Avg_meanAccelerometerBodyJerkFrequency-Yaxis:** the average mean frequency of the Accelerometer body linear acceleration along the Y axis  

**Avg_meanAccelerometerBodyJerkFrequency-Zaxis:** the average mean frequency of the Accelerometer body linear acceleration along the Z axis  

**Avg_stdAccelerometerBodyJerkFrequency-Xaxis:** the average std of frequency of the Accelerometer body linear acceleration along the X axis  

**Avg_stdAccelerometerBodyJerkFrequency-Yaxis:** the average std of frequency of the Accelerometer body linear acceleration along the Y axis  

**Avg_stdAccelerometerBodyJerkFrequency-Zaxis:** the average std of frequency of the Accelerometer body linear acceleration along the Z axis  

**Avg_meanGyroscopeBodyFrequency-Xaxis:** the average mean frequency of the Gyroscope body acceleration signal along the X axis  

**Avg_meanGyroscopeBodyFrequency-Yaxis:** the average mean frequency of the Gyroscope body acceleration signal along the Y axis  

**Avg_meanGyroscopeBodyFrequency-Zaxis:** the average mean frequency of the Gyroscope body acceleration signal along the Z axis  

**Avg_stdGyroscopeBodyFrequency-Xaxis:** the average std of frequency of the Gyroscope body acceleration signal along the X axis  

**Avg_stdGyroscopeBodyFrequency-Yaxis:** the average std of frequency of the Gyroscope body acceleration signal along the Y axis  

**Avg_stdGyroscopeBodyFrequency-Zaxis:** the average std of frequency of the Gyroscope body acceleration signal along the Z axis

**Avg_meanAccelerometerBodyMagnitudeFrequency:**  the average mean frequency of the magnitude of the Accelerometer 3-D body acceleration signal  

**Avg_stdAccelerometerBodyMagnitudeFrequency:**  the average std of frequency of the magnitude of the Accelerometer 3-D body acceleration signal  

**Avg_meanAccelerometerBodyJerkMagnitudeFrequency:**  the average mean frequency of the magnitude of the Accelerometer 3-D body linear acceleration  

**Avg_stdAccelerometerBodyJerkMagnitudeFrequency:**  the average std of frequency of the magnitude of the Accelerometer 3-D body linear acceleration  

**Avg_meanGyroscopeBodyMagnitudeFrequency:** the average mean frequency of the magnitude of the Gyroscope 3-D body acceleration signal  

**Avg_stdGyroscopeBodyMagnitudeFrequency:** the average std of frequency of the magnitude of the Gyroscope 3-D body acceleration signal  

**Avg_meanGyroscopeBodyJerkMagnitudeFrequency:**  the average mean frequency of the magnitude of the 3-D body angular velocity  

**Avg_stdGyroscopeBodyJerkMagnitudeFrequency:** the average std of frequency of the magnitude of the 3-D body angular velocity  



