# Code Book - Getting and Cleanning Data Course Project

### Creator
Roberto Valle

### Description
In this Code Book you can find a brief explanation of the steps that were taken in order to complete the course project. I worked around one month to complete it!

You can find the data source here and aditional descriptions:
[The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Key Information (Description taken from original Read Me File)


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


### Script

The script had to do the following (Taken from original course description)
You should create one R script called run_analysis.R that does the following.

1.- Merges the training and the test sets to create one data set.
2.- Extracts only the measurements on the mean and standard deviation for each measurement.
3.- Uses descriptive activity names to name the activities in the data set
4.- Appropriately labels the data set with descriptive variable names.
5.- From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#### Libraries

I used dplyr and data.frame libraries

