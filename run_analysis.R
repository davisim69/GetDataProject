# Script for analysis of Human Activity Recognition Using Smartphones Dataset

# Some notes on the structure of the data files

# subject_test/train: Lists the sample member number
# that each record in the X_test/train data set contains
# Can probably remain as numeric

# X_test/train: The data - test data set contains around 3k records, 
# train dataset around 7,000 records
# Each row is a unique combination of activity (defined by the y_test/train file) 
# and sample member defined by subject_test/train
# Each column is represents one element in the 561 feature vector
# To understand these features you can refer to the features.txt and features_info.txt files

# y_test/train: Lists which of the 6 activies each record in X_test/train relates to
# Names of the activities are provided in the activity_labels.txt file


#Read


#Load appropriate libraries
# ------------TO COMPLETE-------------
library(dplyr)

#PART 1: load test and train data sets and append them together

#Read in the X_test data - (make sure your setwd() is pointing to the directory your test data is in)
testData<-read.table(paste(getwd(),"/","X_test.txt",sep = ""), header=FALSE, sep="")
str(testData)  #Check what you have - should be 2947 * 561

#Read in the X_train data - (make sure your setwd() is pointing to the directory your test data is in)
trainData<-read.table(paste(getwd(),"/","X_train.txt",sep = ""), header=FALSE, sep="")
str(trainData)  #Check what you have - should be 7352 * 561

#Merge the two data sets together - append one on the end of other to give 10,299 * 561
featureDat<-rbind(trainData,testData)
str(featureDat)  #Check what you have

#Check that the test data has correctly appended to end of train data
head(select(testData,V1:V5),2)  #This should match....
featureDat[7353:7354,1:5]     #...this.

# PART 2: Extract mean and standard deviation measures of features
# Assumptions - include all mean(), std() and meanFreq(), but not angle() measures

# Load in the features data set
# Need to set the working directory to where the features.txt file is held
testDat<-read.table("features.txt", header = FALSE, sep="")
#Identify target mean, std and meanFreq measures
testDat<-mutate(testDat,targets = grepl("mean|std",testDat[,2]))
#Filter out the measures not interested in
testDat<-filter(testDat, targets)
#Check what we have
View(testDat)   #79 measures
#Select the first column which holds the number corresponding to that variable in the featureDat data set
testDat<-select(testDat,V1)
testDat<-as.integer(testDat$V1)
#Use testDat to select columns in featureDat
featureTarget<-select(featureDat,testDat)
#Check the new data set has only 79 variables
str(featureTarget)
#Check that the new data set has the correct 79 variables
tail(testDat,10)   #Compare with the output of str(featureTarget)
tail(testDat,10)  #Compare with the output of str(featureTarget)

#PART3 - use descriptive activity names to name the variables
names(featureTarget)<-c("tBodyAccMeanX","tBodyAccMeanY","tBodyAccMeanZ","tBodyAccStdX","tBodyAccStdY","tBodyAccStdZ",
                        "tBodyGravMeanX","tBodyGravMeanY","tBodyGravMeanZ","tBodyGravStdX","tBodyGravStdY","tBodyGravStdZ",
                        "tBodyAccJerkMeanX","tBodyAccJerkMeanY","tBodyAccJerkMeanZ","tBodyAccJerkStdX","tBodyAccJerkStdY","tBodyAccJerkStdZ",
                        "tBodyGyroMeanX","tBodyGyroMeanY","tBodyGyroMeanZ","tBodyGyroStdX","tBodyGyroStdY","tBodyGyroStdZ",
                        "tBodyGyroJerkMeanX","tBodyGyroJerkMeanY","tBodyGyroJerkMeanZ","tBodyGyroJerkStdX","tBodyGyroJerkStdY","tBodyGyroJerkStdZ",
                        "tBodyAccMagMean","tBodyAccMagStd","tGravAccMagMean","tGravAccMagStd","tBodyAccJerkMagMean","tBodyAccJerkMagStd",
                        "tBodyGyroMagMean","tBodyGyroMagStd","tBodyGyroJerkMagMean","tBodyGyroJerkMagStd",
                        "fBodyAccMeanX","fBodyAccMeanY","fBodyAccMeanZ","fBodyAccStdX","fBodyAccStdY","fBodyAccStdZ",
                        "fBodyAccMeanFreqX","fBodyAccMeanFreqY","fBodyAccMeanFreqZ",
                        "fBodyAccJerkMeanX","fBodyAccJerkMeanY","fBodyAccJerkMeanZ","fBodyAccJerkStdX","fBodyAccJerkStdY","fBodyAccJerkStdZ",
                        "fBodyAccJerkMeanFreqX","fBodyAccJerkMeanFreqY","fBodyAccJerkMeanFreqZ",
                        "fBodyGyroMeanX","fBodyGyroMeanY","fBodyGyroMeanZ","fBodyGyroStdX","fBodyGyroStdY","fBodyGyroStdZ",
                        "fBodyGyroMeanFreqX","fBodyGyroMeanFreqY","fBodyGyroMeanFreqZ",
                        "fBodyAccMagMean","fBodyAccMagStd","fBodyAccMagMeanFreq",
                        "fBodyAccJerkMagMean","fBodyAccJerkMagStd","fBodyAccJerkMagMeanFreq",
                        "fBodyGyroMagMean","fBodyGyroMagStd","fBodyGyroMagMeanFreq",
                        "fBodyGyroJerkMagMean","fBodyGyroJerkMagStd","fBodyGyroJerkMagMeanFreq")

