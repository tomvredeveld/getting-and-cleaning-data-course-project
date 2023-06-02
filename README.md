# getting-and-cleaning-data-course-project
Repo for the final assignment of the Getting and Cleaning Data Course on R. 

## Assignment Getting and Cleaning Data Course Project 
This README.md file contains the analysis files created, transformed or altered for 
the final assignment of the R Coursera course 'Assignment Getting and Cleaning Data Course project'.

The goal of the assignment is:

> You should create one R script called run_analysis.R that does the following. 

> 1. Merges the training and the test sets to create one data set.
> 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
> 3. Uses descriptive activity names to name the activities in the data set
> 4. Appropriately labels the data set with descriptive variable names. 
> 5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.


## Description of files used
In the unzipped wearables folder, there is another folder 'UCI HAR Dataset'
This folder contains: 'activity_labels.txt', 'features_info.txt', 'features.txt'
a 'README.txt' and 2 subfolders
test =  containing folder 'inertial Signals' containing sensor data from accelerator
and gyroscope. Also contains; subject_test.txt, X_test.txt and y_test.txt
train, which contains the same names of folders and files. 

## Scripts
This repository contains 1 script, called: `run_analysis.R` that aims to complete the goals of the above.
Run this script from a folder with a child-folder called `"data" `inside in which a folder
`"wearables"` exists.

## Other documents
This repository also contains a file called: `CodeBook.md` which describes all files
