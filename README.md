Run_analysis
============
dataActivityTest,dataActivityTrain,dataFeaturesTest and dataFeaturesTrain are variables used to read data from files in the "UCI HAR Dataset"
library(dplyr),library(plyr),library(tidyr) and library(data.table) are packages loaded.
dataSubject is a variable for  row binding dataSubjectTrain and dataSubjectTest( same goes for dataActivity and dataFeatures)
names(dataSubject),names(dataActivity) and names(dataFeatures) is used to give column names to variables(dataActivity,dataSubject and dataFeatures)
dataCombine and Data variables are used to merge the three variables into one variable called Data
subdataFeaturesNames is a variable  used to Extract only the measurements on the mean and standard deviation for each measurement.
activityLabels is a variable that Uses descriptive activity names to name the activities in the data set
names(Data)<-gsub("^t", "time", names(Data));names(Data)<-gsub("^f", "frequency", names(Data));names(Data)<-gsub("Acc", "Accelerometer", names(Data));names(Data)<-gsub("Gyro", "Gyroscope", names(Data));names(Data)<-gsub("Mag", "Magnitude", names(Data));names(Data)<-gsub("BodyBody", "Body", names(Data))   ####Appropriately labels the data set with descriptive variable names. 
Data 2 and wite.table() is used to create a second, independent tidy data set with the average of each variable for each activity and each subject.
