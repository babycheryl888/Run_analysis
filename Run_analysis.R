list.files("UCI HAR Dataset",recursive=T)
dataActivityTest  <- read.table(file.path("UCI HAR Dataset", "test" , "y_test.txt" ),header = FALSE)
dataActivityTrain <- read.table(file.path("UCI HAR Dataset", "train", "y_train.txt"),header = FALSE)
dataFeaturesTest  <- read.table(file.path("UCI HAR Dataset", "test" , "X_test.txt" ),header = FALSE);
dataFeaturesTrain <- read.table(file.path("UCI HAR Dataset", "train", "X_train.txt"),header = FALSE)
library(dplyr)
library(plyr)
library(tidyr)
library(data.table)
dataSubject <- rbind(dataSubjectTrain, dataSubjectTest);
dataActivity<- rbind(dataActivityTrain, dataActivityTest);
dataFeatures<- rbind(dataFeaturesTrain, dataFeaturesTest)
names(dataSubject)<-c("subject");
names(dataActivity)<- c("activity")
dataFeaturesNames <- read.table(file.path("UCI HAR Dataset", "features.txt"),head=FALSE)
names(dataFeatures)<- dataFeaturesNames$V2
dataCombine <- cbind(dataSubject, dataActivity);
Data <- cbind(dataFeatures, dataCombine)
subdataFeaturesNames<-dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]
selectedNames<-c(as.character(subdataFeaturesNames), "subject", "activity" )
Data<-subset(Data,select=selectedNames)
activityLabels <- read.table(file.path("UCI HAR Dataset", "activity_labels.txt"),header = FALSE)
names(Data)<-gsub("^t", "time", names(Data));
names(Data)<-gsub("^f", "frequency", names(Data));
names(Data)<-gsub("Acc", "Accelerometer", names(Data));
names(Data)<-gsub("Gyro", "Gyroscope", names(Data));
names(Data)<-gsub("Mag", "Magnitude", names(Data));
names(Data)<-gsub("BodyBody", "Body", names(Data))

