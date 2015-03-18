---
title: CodeBook
author: Ian Davis
date: Wednesday, March 11, 2015
output: html_document
----
    
**Course: Get and Clean Data**

  
    
The study
------------
The aim of this study was to test the use of smartphones to measure basic human activities such as walking and sitting. Measurements were taken by strapping smartphones to 30 volunteers and recording various measurements using internal sensors in the phones. Full details of the study can be found at the following link: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

The raw data
-------------
The raw data is divided into a training set and a test set. The training set contains the records from around 70% of the volunteers (7,352 records) and the test set contains the rest (2,941 records). In total there are 10,299 records for the 30 volunteers. A total of 561 measurements were taken. So in total the raw data contains 10,299 records of 561 measurements. The data training and test data are held in a series of three separate data sets containing:  

1. The volunteer to which a record relates
2. The activities to which a record relates
3. The measurements taken for each combination of volunteer/activity 

Our project goal
----------------
The aim of this course project was to merge the test and train data together into a single data set and to produce an analysis of the mean by subject and activity for each of the mean and standard deviation measurements. 

Data manipulations required
---------------------------
The following data manipulations were required to achieve this goal:  

* append the test and train measurement data sets together
* merge the list of activities and voluteers per record to the measurement data set
* change the list of activities from an integer variable into a character variable of meaningful descriptions.
* change the variable names into meaningful variable names
* select out from the 561 measurements, those that represented measures of mean or standard deviation
* calculate means of selected measurements grouped by subject and activity

Brief description of final tidy data set
----------------------------------------
Name of Data set: resultMeans.txt
Dimensions of data set: 180 observations (rows) by 81 variables (columns)
Observations: one record per subject per activity
Variables: Two variables listing the subjects and activities plus 79 variables of mean / standard deviation measurements. See below for variable descriptions.
Interpretation: Each cell in the data set represents the mean of the variable for the specific combination of subject and activity.

Variable list
-------------

- Subject: Individual participants in the study. Integer variable from 1 to 30
- Activity: Six activities carried out by the participants. Character variable.
- tBodyAccMeanX: Mean body acceleration over time in the X direction. Numeric variable.
- tBodyAccMeanY: Mean body acceleration over time in the Y direction. Numeric variable.
- tBodyAccMeanZ: Mean body acceleration over time in the Z direction. Numeric variable.
- tBodyAccStdX: Standard deviation of body acceleration over time in the X direction. Numeric variable.
- tBodyAccStdY: Standard deviation of body acceleration over time in the Y direction. Numeric variable.
- tBodyAccStdZ: Standard deviation of body acceleration over time in the Z direction. Numeric variable.
- tGravMeanX: Mean gravity acceleration over time in the X direction. Numeric variable.
- tGravMeanY: Mean gravity acceleration over time in the Y direction. Numeric variable.
- tGravMeanZ: Mean gravity acceleration over time in the Z direction. Numeric variable.
- tGravStdX: Standard deviation of gravity acceleration over time in the X direction. Numeric variable.
- tGravStdY: Standard deviation of gravity acceleration over time in the Y direction. Numeric variable.
- tGravStdZ: Standard deviation of gravity acceleration over time in the Z direction. Numeric variable.
- tBodyAccJerkMeanX: Mean body jerk acceleration over time in the X direction. Numeric variable.
- tBodyAccJerkMeanY: Mean body jerk acceleration over time in the Y direction. Numeric variable.
- tBodyAccJerkMeanZ: Mean body jerk acceleration over time in the Z direction. Numeric variable.
- tBodyAccJerkStdX: Standard deviation of body jerk acceleration over time in the X direction. Numeric variable.
- tBodyAccJerkStdY: Standard deviation of body jerk acceleration over time in the Y direction. Numeric variable.
- tBodyAccJerkStdZ: Standard deviation of body jerk acceleration over time in the Z direction. Numeric variable.
- tBodyGyroMeanX: Mean body orientation over time in the X direction. Numeric variable.
- tBodyGyroMeanY: Mean body orientation over time in the Y direction. Numeric variable.
- tBodyGyroMeanZ: Mean body orientation over time in the Z direction. Numeric variable.
- tBodyGyroStdX: Standard deviation of body orientation over time in the X direction. Numeric variable.
- tBodyGyroStdY: Standard deviation of body orientation over time in the Y direction. Numeric variable.
- tBodyGyroStdZ: Standard deviation of body orientation over time in the Z direction. Numeric variable.
- tBodyGyroJerkMeanX: Mean body jerk orientation over time in the X direction. Numeric variable.
- tBodyGyroJerkMeanY: Mean body jerk orientation over time in the Y direction. Numeric variable.
- tBodyGyroJerkMeanZ: Mean body jerk orientation over time in the Z direction. Numeric variable.
- tBodyGyroJerkStdX: Standard deviation of body jerk orientation over time in the X direction. Numeric variable.
- tBodyGyroJerkStdY: Standard deviation of body jerk orientation over time in the Y direction. Numeric variable.
- tBodyGyroJerkStdZ: Standard deviation of body jerk orientation over time in the Z direction. Numeric variable.
- tBodyAccMagMean: Mean body acceleration magnitude over time. Numeric variable.
- tBodyAccMagStd: Standard deviation of body acceleration magnitude over time. Numeric variable.
- tGravAccMagMean: Mean body gravity magnitude over time. Numeric variable.
- tGravAccMagStd: Standard deviation of body gravity magnitude over time. Numeric variable.
- tBodyAccJerkMagMean: Mean body jerk acceleration magnitude over time. Numeric variable.
- tBodyAccJerkMagStd: Standard deviation of body jerk acceleration magnitude over time. Numeric variable.
- tBodyGyroMagMean: Mean body orientation magnitude. Numeric variable over time.
- tBodyGyroMagStd: Standard deviation of body orientation magnitude over time. Numeric variable.
- tBodyGyroJerkMagMean: Mean body orientation jerk magnitude over time. Numeric variable.
- tBodyGyroJerkMagStd: Standard deviation of body orientation jerk magnitude over time. Numeric variable.
- fBodyAccMeanX: Mean body acceleration in the X direction frequency. Numeric variable.
- fBodyAccMeanY: Mean body acceleration in the Y direction frequency. Numeric variable.
- fBodyAccMeanZ: Mean body acceleration in the Z direction frequency. Numeric variable.
- fBodyAccStdX: Standard deviation body acceleration in the X direction frequency. Numeric variable.
- fBodyAccStdY: Standard deviation body acceleration in the Y direction frequency. Numeric variable.
- fBodyAccStdZ: Standard deviation body acceleration in the Z direction frequency. Numeric variable.
- fBodyAccMeanFreqX: Weighted average of body acceleration in the X direction frequency. Numeric variable.
- fBodyAccMeanFreqY: Weighted average of body acceleration in the Y direction frequency. Numeric variable.
- fBodyAccMeanFreqZ: Weighted average of body acceleration in the Z direction frequency. Numeric variable.
- fBodyAccJerkMeanX: Mean body jerk acceleration in the X direction frequency. Numeric variable.
- fBodyAccJerkMeanY: Mean body jerk acceleration in the Y direction frequency. Numeric variable.
- fBodyAccJerkMeanZ: Mean body jerk acceleration in the Z direction frequency. Numeric variable.
- fBodyAccJerkStdX: Standard deviation of body jerk acceleration in the X direction frequency. Numeric variable.
- fBodyAccJerkStdY: Standard deviation of body jerk acceleration in the Y direction frequency. Numeric variable.
- fBodyAccJerkStdZ: Standard deviation of body jerk acceleration in the Z direction frequency. Numeric variable.
- fBodyAccJerkMeanFreqX: Weighted average of body jerk acceleration in the X direction frequency. Numeric variable.
- fBodyAccJerkMeanFreqY: Weighted average of body jerk acceleration in the Y direction frequency. Numeric variable.
- fBodyAccJerkMeanFreqZ: Weighted average of body jerk acceleration in the Z direction frequency. Numeric variable.
- fBodyGyroMeanX: Mean body orientation in X direction frequency. Numeric variable.
- fBodyGyroMeanY: Mean body orientation in Y direction frequency. Numeric variable.
- fBodyGyroMeanZ: Mean body orientation in Z direction frequency. Numeric variable.
- fBodyGyroStdX: Standard deviation of body orientation in X direction frequency. Numeric variable.
- fBodyGyroStdY: Standard deviation of body orientation in Y direction frequency. Numeric variable.
- fBodyGyroStdZ: Standard deviation of body orientation in Z direction frequency. Numeric variable.
- fBodyGyroMeanFreqX: Weighted average of body orientation in the X direction frequency. Numeric variable. 
- fBodyGyroMeanFreqY: Weighted average of body orientation in the Y direction frequency. Numeric variable. 
- fBodyGyroMeanFreqZ: Weighted average of body orientation in the Z direction frequency. Numeric variable. 
- fBodyAccMagMean: Mean body acceleration magnitude frequency. Numeric variable.
- fBodyAccMagStd: Standard deviation of body acceleration magnitude frequency. Numeric variable.
- fBodyAccMagMeanFreq: Weighted average of body acceleration magnitude frequency. Numeric variable.
- fBodyAccJerkMagMean: Mean body jerk acceleration magnitude frequency. Numeric variable. 
- fBodyAccJerkMagStd: Standard deviation of body jerk acceleration magnitude frequency. Numeric variable. 
- fBodyAccJerkMagMeanFreq: Weighted average of body jerk acceleration magnitude frequency. Numeric variable.
- fBodyGyroMagMean: Mean body orientation magnitude frequency. Numeric variable.
- fBodyGyroMagStd: Standard deviation of body orientation magnitude frequency. Numeric variable.
- fBodyGyroMagMeanFreq: Weighted average of body orientation magnitude frequency. Numeric variable.
- fBodyGyroJerkMagMean: Mean body orientation jerk magnitude frequency. Numeric variable.
- fBodyGyroJerkMagStd: Standard deviation of body orientation jerk magnitude frequency. Numeric variable.
- fBodyGyroJerkMagMeanFreq: Weighted average of body orientation jerk magnitude frequency. Numeric variable.



