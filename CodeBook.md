### Variables
The variables for `df_tidy` are described below:

"1" "ID" - subject number
"2" "sample" - sample where data was derived from: test or train
"3" "feature_type" - activities, 1 = laying, 2 = sitting, 3 = standing, 4 = walking, 5 = walking_downstairs, 6 = walking_upstairs.
"4" "tBodyAcc_mean_X" 
"5" "tBodyAcc_mean_Y"
"6" "tBodyAcc_mean_Z"
"7" "tBodyAcc_std_X"
"8" "tBodyAcc_std_Y"
"9" "tBodyAcc_std_Z"
"10" "tGravityAcc_mean_X"
"11" "tGravityAcc_mean_Y"
"12" "tGravityAcc_mean_Z"
"13" "tGravityAcc_std_X"
"14" "tGravityAcc_std_Y"
"15" "tGravityAcc_std_Z"
"16" "tBodyAccJerk_mean_X"
"17" "tBodyAccJerk_mean_Y"
"18" "tBodyAccJerk_mean_Z"
"19" "tBodyAccJerk_std_X"
"20" "tBodyAccJerk_std_Y"
"21" "tBodyAccJerk_std_Z"
"22" "tBodyGyro_mean_X"
"23" "tBodyGyro_mean_Y"
"24" "tBodyGyro_mean_Z"
"25" "tBodyGyro_std_X"
"26" "tBodyGyro_std_Y"
"27" "tBodyGyro_std_Z"
"28" "tBodyGyroJerk_mean_X"
"29" "tBodyGyroJerk_mean_Y"
"30" "tBodyGyroJerk_mean_Z"
"31" "tBodyGyroJerk_std_X"
"32" "tBodyGyroJerk_std_Y"
"33" "tBodyGyroJerk_std_Z"
"34" "tBodyAccMag_mean"
"35" "tBodyAccMag_std"
"36" "tGravityAccMag_mean"
"37" "tGravityAccMag_std"
"38" "tBodyAccJerkMag_mean"
"39" "tBodyAccJerkMag_std"
"40" "tBodyGyroMag_mean"
"41" "tBodyGyroMag_std"
"42" "tBodyGyroJerkMag_mean"
"43" "tBodyGyroJerkMag_std"
"44" "fBodyAcc_mean_X"
"45" "fBodyAcc_mean_Y"
"46" "fBodyAcc_mean_Z"
"47" "fBodyAcc_std_X"
"48" "fBodyAcc_std_Y"
"49" "fBodyAcc_std_Z"
"50" "fBodyAcc_meanFreq_X"
"51" "fBodyAcc_meanFreq_Y"
"52" "fBodyAcc_meanFreq_Z"
"53" "fBodyAccJerk_mean_X"
"54" "fBodyAccJerk_mean_Y"
"55" "fBodyAccJerk_mean_Z"
"56" "fBodyAccJerk_std_X"
"57" "fBodyAccJerk_std_Y"
"58" "fBodyAccJerk_std_Z"
"59" "fBodyAccJerk_meanFreq_X"
"60" "fBodyAccJerk_meanFreq_Y"
"61" "fBodyAccJerk_meanFreq_Z"
"62" "fBodyGyro_mean_X"
"63" "fBodyGyro_mean_Y"
"64" "fBodyGyro_mean_Z"
"65" "fBodyGyro_std_X"
"66" "fBodyGyro_std_Y"
"67" "fBodyGyro_std_Z"
"68" "fBodyGyro_meanFreq_X"
"69" "fBodyGyro_meanFreq_Y"
"70" "fBodyGyro_meanFreq_Z"
"71" "fBodyAccMag_mean"
"72" "fBodyAccMag_std"
"73" "fBodyAccMag_meanFreq"
"74" "fBodyBodyAccJerkMag_mean"
"75" "fBodyBodyAccJerkMag_std"
"76" "fBodyBodyAccJerkMag_meanFreq"
"77" "fBodyBodyGyroMag_mean"
"78" "fBodyBodyGyroMag_std"
"79" "fBodyBodyGyroMag_meanFreq"
"80" "fBodyBodyGyroJerkMag_mean"
"81" "fBodyBodyGyroJerkMag_std"
"82" "fBodyBodyGyroJerkMag_meanFreq"

### Data
The `df_tidy` dataset contains a mean value for each variable measured from the data. The first column `ID` contains the subject number, `feature_type` describes the activity and `sample` describes whether the ID data was collected from the folder 'train' or 'test' before merging the two datasets. 

### Transformations
The follow transformations were performed to the data to get the dataset `df_tidy`
1. Obtain and run necessary packages
2. Download and unzip the data
3. Create a subject_test dataset and a subject_train dataset from the two folders train and test.
4. Merge both datasets for a complete overview
5. A subset of the data was created, as only the variables with means and standard deviations were needed.
6. Change names of the columns by removing the numbers in front of the variables and removing the '()' from the variable names for clearer overview. Also, all dashes `-` were replaced with underscores `_` for easier programming.
7. Replace all activities with relevant names and converting them to factors for easier splitting.
8. Splitting per ID and activity, to obtain a mean per column for the `df_tidy` dataset. This is done by a for-loop for each subject.
9. Perform `head(df_tidy)` for a short overview.

