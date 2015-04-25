## GCDProject
This is the repo for GCD project.

## Data source:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The Goal
Convert a raw data set into a tidy data set associated a codebook.

## What the R script should do (from GCD course project page):
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Description for Main tasks
1. Combine training & testing data X_test, X_train, Y_test, Y_train, subject_test, subject_train into a data frame
2. The variable names of X is in the file feature.txt. With function grep, we can select those columns including "mean" and "std" strings.
3. Combine the chosen subset of data and name each column of the data. The output in this step is the first tidy data, "tidy_data.txt".
4. Based on the "tidy_data.txt", we further make another tidy data set "tidy_data_with_average.txt" including the average value of every variable for each subject - activity pair (so 180 rows in total).

For more information, see codebook.md & run_analysis.R.
