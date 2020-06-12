## Import Libraries
library(dplyr)
library(tidyr)

##Making Features Vector
features <- read.table('UCI HAR Dataset\\features.txt')
features <- as.character(features[,2])

## Activity Labels Vector
Activity_labels <- read.table('UCI HAR Dataset\\activity_labels.txt')
Activity_labels <- as.character(Activity_labels[,2])


## Making Test Data
subjectTest <- read.table('UCI HAR Dataset\\test\\subject_test.txt')
XTest <- read.table('UCI HAR Dataset\\test\\X_test.txt')
activityTest <- read.table('UCI HAR Dataset\\test\\y_test.txt')
Test <- data.frame(subjectTest,activityTest,XTest)
names(Test) <- c(c('Subject','Activity'),features)

## Making Training Data
subjectTrain <- read.table('UCI HAR Dataset\\train\\subject_train.txt')
XTrain <- read.table('UCI HAR Dataset\\train\\X_train.txt')
activityTrain <- read.table('UCI HAR Dataset\\train\\y_train.txt')
Train <- data.frame(subjectTrain,activityTrain,XTrain)
names(Train) <- c(c('Subject','Activity'),features)

## Merging Data
data <- rbind(Test,Train)

## Extract mean and Standard Deviation Values
dataExtract <- data[,which(colnames(data) %in% c('Subject', 'Activity', grep('mean()|std()', colnames(data), value=TRUE)))]

## Replacing Activity Numbers with Names
dataExtract$Activity <- Activity_labels[dataExtract$Activity]

## Making Descriptive VAriable Names
names(dataExtract)[-c(1:2)]<-gsub('^t', 'Time', names(dataExtract)[-c(1:2)])
names(dataExtract)[-c(1:2)]<-gsub('^f', 'Frequency', names(dataExtract)[-c(1:2)])
names(dataExtract)[-c(1:2)]<-gsub('Acc', 'Accelerometer', names(dataExtract)[-c(1:2)])
names(dataExtract)[-c(1:2)]<-gsub('Gyro', 'Gyroscope', names(dataExtract)[-c(1:2)])
names(dataExtract)[-c(1:2)]<-gsub('Mag', 'Magnitude', names(dataExtract)[-c(1:2)])
names(dataExtract)[-c(1:2)]<-gsub('BodyBody', 'Body', names(dataExtract)[-c(1:2)])

## Making the data Tidy
dataTidy <- aggregate(.~Subject + Activity, dataExtract, mean)
dataTidy <- dataTidy[order(dataTidy$Subject,dataTidy$Activity),]
