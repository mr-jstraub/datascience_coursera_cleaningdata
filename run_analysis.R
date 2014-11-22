###
# @author: Jonas
# @date: 2014-11-20
#
# This script will download a dataset from an experiment about 
# human activity recognition conducted by the University of Genoa.
# The following tasks will be performed:
#   - Download, read and merge the training and test datasets
#   - Extract measurements mean and standard deviation
#   - Insert descriptive activity names to name the numerical activities
#   - Clean and appropriately name the variables of the dataset
#   - Create 2nd dataset that contains the average of each variable
#     for each activity and each subject
###

# import packages
library(plyr)

# Download datasets
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if(!file.exists("data")){dir.create("data")}
download.file(url, "data/dataset.zip")
# Mark download date to identify version of downloaded dataset
date_downloaded <- Sys.time()
date_downloaded_formatted <- format(date_downloaded, "%Y%M%d_%H%M")

# Unzip dataset
unzip("data/dataset.zip", exdir = "data/.")

# Read subjects into data frame
subjects_test <- read.table("data/UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names=c("subject"))
subjects_train <- read.table("data/UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names=c("subject"))

# Read and clean column names of the test/train dataset
data_names <- read.table("data/UCI HAR Dataset/features.txt", header = FALSE, col.names=c("idx","name"))
filter_cols <- grep("mean\\(\\)|std\\(\\)", data_names$name)
data_names_clean <- data_names[filter_cols, "name"]
data_names_clean <- gsub("\\(\\)", "", data_names_clean)
data_names_clean <- gsub("^f", "Frequency_", data_names_clean)
data_names_clean <- gsub("^t", "Time_", data_names_clean)
data_names_clean <- gsub("Mag", "Magnitude", data_names_clean)
data_names_clean <- gsub("Acc", "Acceleration", data_names_clean)
data_names_clean <- gsub("Gyro", "Gyroscope", data_names_clean)
data_names_clean <- gsub("\\-", "_", data_names_clean)
data_names_clean <- gsub("BodyBody", "Body", data_names_clean)

# Read test/train dataset into data frame
data_test_x <- read.table("data/UCI HAR Dataset/test/X_test.txt", header = FALSE)
data_train_x <- read.table("data/UCI HAR Dataset/train/X_train.txt", header = FALSE)
data_test_y <- read.table("data/UCI HAR Dataset/test/y_test.txt", header = FALSE, col.names=c("activity"))
data_train_y <- read.table("data/UCI HAR Dataset/train/y_train.txt", header = FALSE, col.names=c("activity"))

# Filter test/train dataset and set cleaned column names
data_test_x_filtered <- data_test_x[, filter_cols]
data_train_x_filtered <- data_train_x[, filter_cols]
colnames(data_test_x_filtered) <- data_names_clean
colnames(data_train_x_filtered) <- data_names_clean

# Merge the test and train data frames
data_merged_x <- rbind(data_train_x_filtered, data_test_x_filtered)
data_merged_y <- rbind(data_train_y, data_test_y)
subjects_merged <- rbind(subjects_train, subjects_test)

# Read in activity names and merge with y-data frames
activities_names <- c("walking", "walking upstairs", "walking downstairs", "sitting", "standing", "laying")
data_merged_y_activities <- activities_names[data_merged_y[,"activity"]]

# Combine separate datasets and create FINAL tidy dataset
data_all <- cbind(subjects_merged,"activity" = data_merged_y_activities,data_merged_x)

# Create second dataset with the average of each variable for each activitiy and each subject
data_all_averages <- ddply(data_all, .(subject, activity), numcolwise(mean))

# Dump result datasets
write.table(data_all, paste("data_all_", date_downloaded_formatted, ".txt"), sep="\t", row.names=FALSE)
write.table(data_all_averages, paste("data_all_averages_", date_downloaded_formatted, ".txt"), sep="\t", row.names=FALSE)

