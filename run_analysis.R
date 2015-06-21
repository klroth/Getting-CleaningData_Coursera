##############################################################
######    Getting & Cleaning Data Class Project         ######
##############################################################
## Code developed by Keely Roth

##############################################################
###                   PROJECT OUTLINE                      ###

## This function takes a raw data zip file and returns a tidy 
## data set with the following steps met:

## Step 1: Merge the training and test data sets to create one data set

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement

## Step 3: Uses descriptive activity names to name the activities in the data set

## Step 4: Appropriately label the data set with descriptive variable names

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the
##         average of each variable for each activity and each subject.  



#### The function takes the raw data zip file as the input  ####
run_analysis<-function(datazipfile){
        
        ##### GET THE DATA #####
        
        # determine if zip file exists & if not, message user and exit function
        if(!file.exists(datazipfile)) stop("Raw data file is not found.")
        
        # determine if the extracted folder already exists
        # if not, extract the raw data from the zipfile
        if(!file.exists("./UCI HAR Dataset")) {
                unzip(datazipfile)} else {
                        message("It appears these data have already been extracted in this location. Program will not re-extract data at this time.")}
                
        # read training data into R
        X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
        y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
        subj_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
        
        # read test data into R
        X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
        y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
        subj_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
        
        # read activity labels & data features into R
        activitylabels<-read.table("./UCI HAR Dataset/activity_labels.txt")
        features<-read.table("./UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
        
        
        ##### STEP 1: COMBINE TRAIN & TEST DATA #####
        
        # Combine the test and train data sets
        X_data<-rbind(X_train,X_test)
        y_data<-rbind(y_train,y_test)
        subj_data<-rbind(subj_train,subj_test)
        
        # Coerce subject data into factor
        subj_data<-factor(subj_data$V1)
        
        
        ##### STEP 2: Extract the mean & std features #####
        
        # Determine the columns of X corresponding to the means & stds
        featmean<-which(grepl("mean()",features[,2],fixed=TRUE))
        featstd<-which(grepl("std()",features[,2],fixed=TRUE))
        featmnstds<-sort(union(featmean,featstd))
        
        # Create subsetted X data set
        X_subdata<-X_data[,featmnstds]
        
        # Create subsetted feature list
        features_sub<-features[featmnstds,2]
        
        
        ##### STEP 3: Name the activities in the data set
        
        # Create a vector of activity names from y subdata
        y_activities<-factor(y_data$V1,labels=levels(activitylabels[,2]))
                
        # Combine with X & subject data to create complete data set
        newdata<-cbind(y_activities,subj_data,X_subdata)

          
        ##### STEP 4: Give the data set descriptive variable names #####
        
        # Set column names equal to the features list
        colnames(newdata)<-c("Activity","Subject",features_sub)
        
        
        ##### STEP 5: Create a new tidy data set with the mean of each variable by activity and subject #####
        
        ## Load dplyr library
        require(dplyr)
        
        ## Group data by activity-subject pairs & calculate means
        tidy_data<- newdata %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))
        
        ## Update the column names to be more descriptive
        newcolnames<-c('Activity','SubjectNumber','Avg_meanAccelerometerBodyTime-Xaxis','Avg_meanAccelerometerBodyTime-Yaxis','Avg_meanAccelerometerBodyTime-Zaxis','Avg_stdAccelerometerBodyTime-Xaxis','Avg_stdAccelerometerBodyTime-Yaxis','Avg_stdAccelerometerBodyTime-Zaxis','Avg_meanAccelerometerGravityTime-Xaxis','Avg_meanAccelerometerGravityTime-Yaxis','Avg_meanAccelerometerGravityTime-Zaxis','Avg_stdAccelerometerGravityTime-Xaxis','Avg_stdAccelerometerGravityTime-Yaxis','Avg_stdAccelerometerGravityTime-Zaxis','Avg_meanAccelerometerBodyJerkTime-Xaxis','Avg_meanAccelerometerBodyJerkTime-Yaxis','Avg_meanAccelerometerBodyJerkTime-Zaxis','Avg_stdAccelerometerBodyJerkTime-Xaxis','Avg_stdAccelerometerBodyJerkTime-Yaxis','Avg_stdAccelerometerBodyJerkTime-Zaxis','Avg_meanGyroscopeBodyTime-Xaxis','Avg_meanGyroscopeBodyTime-Yaxis','Avg_meanGyroscopeBodyTime-Zaxis','Avg_stdGyroscopeBodyTime-Xaxis','Avg_stdGyroscopeBodyTime-Yaxis','Avg_stdGyroscopeBodyTime-Zaxis','Avg_meanGyroscopeBodyJerkTime-Xaxis','Avg_meanGyroscopeBodyJerkTime-Yaxis','Avg_meanGyroscopeBodyJerkTime-Zaxis','Avg_stdGyroscopeBodyJerkTime-Xaxis','Avg_stdGyroscopeBodyJerkTime-Yaxis','Avg_stdGyroscopeBodyJerkTime-Zaxis','Avg_meanAccelerometerBodyMagnitudeTime','Avg_stdAccelerometerBodyMagnitudeTime','Avg_meanAccelerometerGravityMagnitudeTime','Avg_stdAccelerometerGravityMagnitudeTime','Avg_meanAccelerometerBodyJerkMagnitudeTime','Avg_stdAccelerometerBodyJerkMagnitudeTime','Avg_meanGyroscopeBodyMagnitudeTime','Avg_stdGyroscopeBodyMagnitudeTime','Avg_meanGyroscopeBodyJerkMagnitudeTime','Avg_stdGyroscopeBodyJerkMagnitudeTime','Avg_meanAccelerometerBodyFrequency-Xaxis','Avg_meanAccelerometerBodyFrequency-Yaxis','Avg_meanAccelerometerBodyFrequency-Zaxis','Avg_stdAccelerometerBodyFrequency-Xaxis','Avg_stdAccelerometerBodyFrequency-Yaxis','Avg_stdAccelerometerBodyFrequency-Zaxis','Avg_meanAccelerometerBodyJerkFrequency-Xaxis','Avg_meanAccelerometerBodyJerkFrequency-Yaxis','Avg_meanAccelerometerBodyJerkFrequency-Zaxis','Avg_stdAccelerometerBodyJerkFrequency-Xaxis','Avg_stdAccelerometerBodyJerkFrequency-Yaxis','Avg_stdAccelerometerBodyJerkFrequency-Zaxis','Avg_meanGyroscopeBodyFrequency-Xaxis','Avg_meanGyroscopeBodyFrequency-Yaxis','Avg_meanGyroscopeBodyFrequency-Zaxis','Avg_stdGyroscopeBodyFrequency-Xaxis','Avg_stdGyroscopeBodyFrequency-Yaxis','Avg_stdGyroscopeBodyFrequency-Zaxis','Avg_meanAccelerometerBodyMagnitudeFrequency','Avg_stdAccelerometerBodyMagnitudeFrequency','Avg_meanAccelerometerBodyJerkMagnitudeFrequency','Avg_stdAccelerometerBodyJerkMagnitudeFrequency','Avg_meanGyroscopeBodyMagnitudeFrequency','Avg_stdGyroscopeBodyMagnitudeFrequency','Avg_meanGyroscopeBodyJerkMagnitudeFrequency','Avg_stdGyroscopeBodyJerkMagnitudeFrequency')
        colnames(tidy_data)<-newcolnames
        
        ## Write the tidy data table to an output file
        write.table(tidy_data,file="./UCI_HAR_tidydata.txt",row.name=FALSE)
        
        ## Notify user of completion
        message("Data set has been processed. See file 'UCI_HAR_tidydata.txt' for output.")

        
}

