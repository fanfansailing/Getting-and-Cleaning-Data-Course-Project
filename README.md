# Getting-and-Cleaning-Data-Course-Project
## Getting and Cleaning Data Course Project

## Repository List of Contents
This repository includes the following files 
README.md: explains the purpose of this repository and the contents in each analysis file
CodeBook.md: background about the raw data set and the process of transforming raw data into the tidy version
run_analysis.R: R script with detailed steps for transforming raw data into the tidy dataset

##Data Transformation Process

The raw data sets were provided through: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analisys.R script processed the following steps to transform the raw data into a tidy data set.

###Step 1: Merge training and test sets
Read in features (features.txt), activity labels (ctivity_labels.txt), training (subject_train.txt, x_train.txt, y_train.txt) and test (subject_test.txt, x_test.txt, y_test.txt) data sets. Normalize column names for training and test datasets, and then merge to create one combined dataset.

###Step 2: Extract only the measurements on the mean and standard deviation for each measurement
Create a logical vector that returns TRUE when column name includes “activity”, “subject”, “std”, “mean” and excludes “meanFreq”. Subset the combined dataset to extract columns that meet this logical condition.

###Step 3: Use descriptive activity names to name the activities in the dataset
Merge the existing dataset with the acticvityLabel table based on activityId to include the descriptive activity names.

###Step 4: Appropriately label the data set with descriptive activity names
Relabel the variable names (e.g., relabel t as time) using the gsub function.

###Step 5: Create a second, independent tidy data set with the average of each variable for each activity and each subject
Average the numeric variables for each subject / activity, and sort the tidy data set by subject ID and activity ID.

