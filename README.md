Run_analysis
============

This is created for the Getting and Cleaning Data Course Project

The goal is to prepare tidy data that can be used for later analysis. 
One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The code book of run_analysis.R are as follows
X_test: data of X_test.txt
Y_test: data of Y_test.txt
subject_test: data of subject_test.txt
X_train: data of X_train.txt
Y_train: data of Y_train.txt
subject_train: data of subject_train.txt
featureNames: data of features.txt, is also the column name for subject files
testdata:  all the test data
traindata: all the train data
mergedata: merge data for testdata and traindata
meanstd: mean and standard deviation for each measurement
tidy: the tidy data 

