# set work directory
getwd()
setwd("C:/Users/fan_yang/datascience")
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Data.zip")
unzip(zipfile="./data/Data.zip",exdir="./data")
path_rf <- file.path("./data" , "UCI HAR Dataset")
setwd("C:/Users/fan_yang/datascience/data/UCI HAR Dataset")

# prepare training and test data
features     = read.table('./features.txt',header=FALSE)
activityLabel = read.table('./activity_labels.txt',header=FALSE)
colnames(activityLabel)  = c('activityId','activityLabel')
## read in training data
subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain       = read.table('./train/x_train.txt',header=FALSE)
yTrain       = read.table('./train/y_train.txt',header=FALSE)
## create column names
colnames(subjectTrain)  = "subjectId"
colnames(xTrain)        = features[,2]
colnames(yTrain)        = "activityId"
## create training set
trainingData = cbind (yTrain, subjectTrain, xTrain)
## read in test data
subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest       = read.table('./test/x_test.txt',header=FALSE)
yTest       = read.table('./test/y_test.txt',header=FALSE)
## create column names
colnames(subjectTest) = "subjectId"
colnames(xTest)       = features[,2] 
colnames(yTest)       = "activityId"

## create test set
testData = cbind(yTest,subjectTest,xTest)

# Step 1: Merges the training and the test sets to create one data set
mergedData= rbind(trainingData,testData)
colNames = colnames(mergedData)

# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement
extractedNames <- (grepl("activity..",colNames) | grepl("subject..",colNames) |grepl(".*mean.*|.*std.*", colNames))&!grepl("-meanFreq..",colNames)
mergedData <- mergedData[extractedNames==TRUE]

# Step 3: Uses descriptive activity names to name the activities in the data set
mergedData <- merge (activityLabel, mergedData, by ="activityId", all.x=TRUE)
colNames = colnames(mergedData)

# Step 4: Appropriately labels the data set with descriptive variable names
## normalize time and frequency
names(mergedData)<-gsub("^t", "time", names(mergedData))
names(mergedData)<-gsub("^f", "frequency", names(mergedData))
## normalize MEAN and SD
names(mergedData)<-gsub("std()", "SD", names(mergedData))
names(mergedData)<-gsub("mean()", "MEAN", names(mergedData))
## normalize "Acc" and "Gyro"
names(mergedData)<-gsub("Acc", "Accelerometer", names(mergedData))
names(mergedData)<-gsub("Gyro", "Gyroscope", names(mergedData))
## normlize others
names(mergedData)<-gsub("Mag", "Magnitude", names(mergedData))
names(mergedData)<-gsub("BodyBody", "Body", names(mergedData))
str(mergedData)

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
install.packages("plyr")
library(plyr)
tidyData<-aggregate(. ~subjectId + activityId +activityLabel, mergedData, mean)
tidyData<-tidyData[order(tidyData$subjectId,tidyData$activityId,tidyData$activityLabel),]
write.table(tidyData, file = "tidydata.txt",row.name=FALSE)

