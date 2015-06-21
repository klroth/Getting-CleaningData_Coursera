# Getting-CleaningData_Coursera
This repo contains my class project work for the Getting and Cleaning Data class on Coursera.

### The repo contains an R script, "run_analysis.R", for cleaning the data and a Code Book, "CodeBook.md", describing the data processing and resulting tidy data set.

#### Description of run_analysis.R

The R script and the zipped raw data file must be in your working directory for run_analysis.R to work. The script requires the dplyr package. If you do not have this package installed, run the following R code:  
install.packages("dplyr")

To run the script use the following R code (NOTE: if you saved the .zip file with another name, assign that name here to the variable "datazipfile"):

  source("run_analysis.R")  
  datazipfile<-"getdata-projectfiles-UCI HAR Dataset.zip"  
  run_analysis(datazipfile)  
  
The script will tell you if the data have already been extracted from the .zip file, and the program will not extract the data again. The script will then continue processing.  

The script will write the output file "UCI_HAR_tidydata.txt" to the working directory & print a message to the console to let the user know the data have been processed. To view the output file in R, run the following R code:  
tidydata<-read.table("UCI_HAR_tidydata.txt",header=TRUE)  

#### Description of CodeBook.md  

The Code Book contains a detailed description of the processing steps applied to the raw data to create the tidy data, as well as additional relevant information about each of the variables in the output file.






