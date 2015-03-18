---
title: "README"
author: "Ian Davis"
date: "Wednesday, March 11, 2015"
output: html_document
---

Description of how the run_analysis.R script works
--------------------------------------------------

The script is divided into parts that broadly mirror the steps outlined in the project brief.  
  
**Note**: in order for the script to run correctly all of the following files need to be in your working directory:  

* X_test.txt  
* y_test.txt
* subject_test.txt
* X_train.txt
* y_train.txt
* subject_train.txt
* features.txt  

**Note**: the following R packages need to be loaded:    

* dplyr

**Part One**  
Aim: Merge the test and train measurement data sets together  

Inputs:  

* X_test.txt  
* y_test.txt  
* subject_test.txt  
* X_train.txt  
* y_train.txt  
* subject_train.txt  

Steps:  

* Read in the test and train measurement data sets. 
* Read in the test and train subject and activity data sets (needed later). 
* rbind the test measurement data set to the bottom of the train measurement data set  

Outputs:    

* featureDat: data frame containing measurement data (dimensions - 10,299 * 561) 
* testAct: data frame containing the activity for each record in the test data (dimensions - 2,947 * 1)
* trainAct: data frame containing the activity for each record in the train data (dimensions - 7,352 * 1) 
* testSub: data frame containing the subject for each record in the test data (dimensions - 2,947 * 1)
* trainSub: data frame containing the subject for each record in the train data (dimensions - 7,352 * 1)

**Part Two**  
Aim: Select out the measurements of interest - mean and standard deviation measurements

Inputs:      

* features.txt: list of measurements forming columns of the measurment data set
* featureDat: data frame from Part One containing all the test and train measurement data  

Steps:    

* Read the features data into a data frame.
* Use mutate() and grepl() functions to create a logical vector that identifies the measurements of interest.
* Use filter() and the logical vector just created to retain only the measurements of interest
* Select out the first column of the features data that contains numbers corresponding to the column positions in the measurements data set
* Convert this column of the features data frame to integer
* Use select() function and the features data too retain only the variables of interest in the measurement data  

**Note**: Angle measurements that were based on measurements of mean or std were excluded as these represent angles rather than means or standard deviations.  

Outputs:    

* testDat: Data frame containing integers corresponding to columns in the featureDat data frame containing measurements that we wish to retain and analyse (dimensions - 79 * 1)
* featureTarget: subset of featureDat retaining only the measurements of interest (dimensions - 10,299 * 79)  

**Part Three**  
Aim: Merge the activity names and subject numbers onto the measurments data set  

Inputs:  

* testAct: data frame from Part One containing the activity number associated with each record in the test data
* trainAct: data frame from Part One containing the activity number associated with each record in the train data
* testSub: data frame from Part One containing the subject number associated with each record in the test data
* trainSub: data frame from Part One containing the subject number associated with each record in the train data
* featureTarget: data frame from Part Two containing the measurement data for only the measurements of interest

Steps:    

* Use rbind() to merge the testAct data to the bottom of the trainAct data
* Use rbind() to merge the testSub data to the bottom of the trainSub data
* Use cbind() to merge the two data frames created above to the featureTarget data frame
* Use a function to change the activity column to meaningful descriptions of acitivites

**Note** Adapted the gsr function from: <https://stat.ethz.ch/pipermail/r-help/2006-July/108829.html>

Outputs:    

* actDat: data frame containing activity associated with each record (dimensions - 10,299 * 1)
* subDat: data frame containing subject associated with each record (dimensions - 10,299 * 1)
* featureTarget2: data frame containing subject, activity (with meaningful descriptions) and measurements of interest (dimensions - 10,299 * 81)  

**Part Four**  
Aim: create meaningful variable names  

Inputs:  

* featureTarget2: data frame from Part Three containing subject, activities and measurements of interest  

Steps: use names() to create meaningful variable names  

Outputs:  

* featureTarget2: data frame created in Part Three but amended to include meaningful variable names (dimensions - 10,299 * 81)

**Note**: This data set is tidy because it includes one observation per row, omne variable per column and meaningful variable names  

**Part Five**  
Aim: Produce analysis of the mean of the measurements of interest by subject and activity  

Inputs:  

* featureTarget2: data frame created in Part Four containing subjects, activities and measurements of interest

Steps:  

* Use group_by() to create a version of the final data set that will deliver analysis grouped by subject and activity
* Use summarise_each() to create a data frame containing the mean for each of the measurements of interest by subject and activity  

Outputs:  

* finalDat: version of featureTarget2 data frame for which analysis will be grouped by subject and activity (dimensions - 10,299 * 81)
* finalDat2: final data frame containing analysis of the mean of each variable of interest grouped by subject and activity, plus the subject and activity variables (dimensions - 180 * 81) 

