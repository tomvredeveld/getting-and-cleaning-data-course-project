## First, install and load required libraries. 
my_packages <- c("tidyverse")
install.packages(setdiff(my_packages, rownames(installed.packages())))  
lapply(my_packages, require, character.only = TRUE)
rm(my_packages)

## Second, download the required dataset for the assignment.
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = "./data/cleaningdata-assignment.zip", curl = FALSE)
unzip("./data/cleaningdata-assignment.zip", exdir = "./data/wearables") #data is in dir './data/wearables'

## Third, load the data.
## test dataset creation
subject_test <- as_tibble(read.csv("./data/wearables/UCI HAR Dataset/test/subject_test.txt", header = FALSE))
feature_type_test <- as_tibble(read.csv("./data/wearables/UCI HAR Dataset/test/y_test.txt", header = FALSE))
feature_measurement_test <- as_tibble(read.csv("./data/wearables/UCI HAR Dataset/test/X_test.txt", sep = "", header = FALSE))
path_labels <- "./data/wearables/UCI HAR Dataset/features.txt"
feature_labels <-readLines(path_labels, n = -1L)
# Merge dataset
df_test <- cbind(subject_test, feature_type_test, feature_measurement_test)
# Add colnames
feature_labels <- unlist(sapply(feature_labels, function(x) {gsub(" ","_", x)})) #add feature labels as vector.
names(df_test) <- c("ID", "feature_type", feature_labels) #add colnames based on vector.

## train dataset creation
subject_train <- as_tibble(read.csv("./data/wearables/UCI HAR Dataset/train/subject_train.txt", header = FALSE))
feature_type_train <- as_tibble(read.csv("./data/wearables/UCI HAR Dataset/train/y_train.txt", header = FALSE))
feature_measurement_train <- as_tibble(read.csv("./data/wearables/UCI HAR Dataset/train/X_train.txt", sep = "", header = FALSE))
# Merge dataset
df_train <- cbind(subject_train, feature_type_train, feature_measurement_train)
# Add colnames
names(df_train) <- c("ID", "feature_type", feature_labels) #add colnames based on vector.

## Fourth Combine datasets with added factor for sample.
# Add column sample after first column "ID"
df_test <- df_test %>% add_column(sample = as.factor("test"), .after = "ID")
df_train <- df_train %>% add_column(sample = as.factor("train"), .after = "ID")
# Both datasets include a different sample, thus datasets can be merged by rbinding
df_complete <- rbind(df_test, df_train)

## Fifth: subsetting data. 
# For the assignment, only mean's and std's are required. 
df_narrow <- df_complete %>% select_if(grepl("mean|std", names(.))) #selects mean and std
df_narrow <- cbind(df_complete[ , c(1:3)], df_narrow) #re-add first columns.

## Sixth: clean up names
names(df_narrow) <- gsub("^[0-9]{1,3}_", "", names(df_narrow)) #remove all numbers in front of var names
names(df_narrow) <- gsub("[()]", "", names(df_narrow))
names(df_narrow) <- gsub("-", "_", names(df_narrow)) #change - to _ for easier programming


## Seventh: change activities to labels.
df_narrow$feature_type
df_narrow$feature_type <- as.factor(unlist(lapply(df_narrow$feature_type, 
                                                  function(x) {
                                                    if (x == 1) {v <- "walking"}
                                                    else if (x == 2) {v <- "walking_upstairs"}
                                                    else if (x == 3) {v <- "walking_downstairs"}
                                                    else if (x == 4) {v <- "sitting"}
                                                    else if (x == 5) {v <- "standing"}
                                                    else if (x == 6) {v <- "laying"}
                                                  })))

## Eight and final step: create a tidy dataset
#' This step is to create a independent dataset that is tidy with the average of each subject and each activity
df_tidy <- data.frame() #create an empty dataframe for preallocation
for (i in 1:30) { #start a loop to go through all ID's. 
  df_temp <- df_narrow %>% filter(ID == i) %>% split(.$feature_type) #create a list per feature_type, for each ID
  l <- lapply(df_temp, function(x) {colMeans(x[, c(4:82)], na.rm = TRUE)}) #apply colmeans for each feature
  tmp <- as.data.frame(do.call(rbind, l)) #convert back to dataframe
  tmp <- tmp %>% 
    add_column(ID = i,
               sample = df_narrow$sample[df_narrow$ID == i][1],
               feature_type = as.factor(rownames(.)),
               .before = 1) #adds back columns for ID, feature type and sample
  rownames(tmp) <- NULL #removes the rownames.
  df_tidy <- rbind(df_tidy, tmp) #add to overall dataframe
}

## Get an idea of the df_tidy dataset
head(df_tidy, 20) #provide an overview of first 20 rows.

## Save the dataset
saveRDS(df_tidy, file = "./data/tidy-dataset.RDS")
write.table(df_tidy, file = "./data/tidy-dataset.txt", row.name = FALSE)