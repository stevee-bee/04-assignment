Data Dictionary - Getting and Cleaning Data Course Project
        for Coursera/JHU
        by Steven Balzer
        date 2021-02-13


==================================================================
The Variables
==================================================================

activity        type: Character
	Labels describing the type of activity taking place during the 
	measurement. The original data set contained numeric values ranging 
	from 1 through 6. Using 'activity_labels.txt' these were replaced with 
	the corresponding descriptive activity name.
	        LAYING
	        SITTING
	        STANDING
	        WALKING
	        WALKING_DOWNSTAIRS
	        WALKING_UPSTAIRS

subject         type: Integer
	An identifier of the subject who carried out the experiment
	        1..30


Note: The following measurements are selected variables from the original
data set for which the mean has been calculated for each combination of
activity and subject. All are of type Numeric. All are derived from values that 
are normalized and bounded within the range of -1 and 1.


tBodyAcc_mean_X

tBodyAcc_mean_Y

tBodyAcc_mean_Z

tBodyAcc_std_X

tBodyAcc_std_Y

tBodyAcc_std_Z

tGravityAcc_mean_X

tGravityAcc_mean_Y

tGravityAcc_mean_Z

tGravityAcc_std_X

tGravityAcc_std_Y

tGravityAcc_std_Z

tBodyAccJerk_mean_X

tBodyAccJerk_mean_Y

tBodyAccJerk_mean_Z

tBodyAccJerk_std_X

tBodyAccJerk_std_Y

tBodyAccJerk_std_Z

tBodyGyro_mean_X

tBodyGyro_mean_Y

tBodyGyro_mean_Z

tBodyGyro_std_X

tBodyGyro_std_Y

tBodyGyro_std_Z

tBodyGyroJerk_mean_X

tBodyGyroJerk_mean_Y

tBodyGyroJerk_mean_Z

tBodyGyroJerk_std_X

tBodyGyroJerk_std_Y

tBodyGyroJerk_std_Z

tBodyAccMag_mean

tBodyAccMag_std

tGravityAccMag_mean

tGravityAccMag_std

tBodyAccJerkMag_mean

tBodyAccJerkMag_std

tBodyGyroMag_mean

tBodyGyroMag_std

tBodyGyroJerkMag_mean

tBodyGyroJerkMag_std

fBodyAcc_mean_X

fBodyAcc_mean_Y

fBodyAcc_mean_Z

fBodyAcc_std_X

fBodyAcc_std_Y

fBodyAcc_std_Z

fBodyAcc_meanFreq_X

fBodyAcc_meanFreq_Y

fBodyAcc_meanFreq_Z

fBodyAccJerk_mean_X

fBodyAccJerk_mean_Y

fBodyAccJerk_mean_Z

fBodyAccJerk_std_X

fBodyAccJerk_std_Y

fBodyAccJerk_std_Z

fBodyAccJerk_meanFreq_X

fBodyAccJerk_meanFreq_Y

fBodyAccJerk_meanFreq_Z

fBodyGyro_mean_X

fBodyGyro_mean_Y

fBodyGyro_mean_Z

fBodyGyro_std_X

fBodyGyro_std_Y

fBodyGyro_std_Z

fBodyGyro_meanFreq_X

fBodyGyro_meanFreq_Y

fBodyGyro_meanFreq_Z

fBodyAccMag_mean

fBodyAccMag_std

fBodyAccMag_meanFreq

fBodyBodyAccJerkMag_mean

fBodyBodyAccJerkMag_std

fBodyBodyAccJerkMag_meanFreq

fBodyBodyGyroMag_mean

fBodyBodyGyroMag_std

fBodyBodyGyroMag_meanFreq

fBodyBodyGyroJerkMag_mean

fBodyBodyGyroJerkMag_std

fBodyBodyGyroJerkMag_meanFreq


==================================================================
The Data
==================================================================

Abstract: Human Activity Recognition database built from the recordings of 30 
subjects performing activities of daily living (ADL) while carrying a 
waist-mounted smartphone with embedded inertial sensors.

A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The original data set is provided by the following AS-IS publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Data set URL: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip



==================================================================
Transformations
==================================================================

Note: See 'run_analysis.R' for the detailed step-by-step transformations and 
analysis for this project.

1) Merge the training and the test data sets into one.

1.1) All 3 training data files - 'X_train.txt', 'y_train.txt', 
'subject_train.txt' - each containing 7,352 observations are combined, 
vertically, so that the result still has 7,352 observations.

1.2) A partition variable with the value 'training' is added to all 
observations in 1.1 in order to maintain the type of the subjects selected for 
generating the training data.

1.3) All 3 training data files - 'X_test.txt', 'y_test.txt', 
'subject_test.txt' - each containing 2,947 observations are combined, 
vertically, so that the result still has 2,947 observations.

1.4) A partition variable with the value 'test' is added to all 
observations in 1.3 in order to maintain the type of the subjects selected for 
generating the test data.

1.5) The the data sets from 1.2 and 1.4 are combined, horizontally, so that the 
result is a total of 10,299 observations (7,352 training and 2,947 test). This 
data set includes 3 descriptive variables - 'subject', 'partition', 'activity' 
- and all 561 measurement variables.

2) Extract only the measurements on the mean and standard deviation for each 
measurement.

2.1) Using 'features.txt' as a reference, the variable names that contain 
either '-mean' or '-std' are selected. This reduces the number of measurement 
variables to 79.

2.2) Since the information is readily available, the variable names are also 
updated to something more meaningful at this stage.

3) Use descriptive activity names to name the activities in the data set.

3.1) Using 'activity_labels.txt', the numeric 'activity' variable is replaced 
with a more meaningful descriptive label.

4) Appropriately label/tidy the data set with descriptive variable names.

4.1) The variable names listed in 'features.txt' contained parentheses and 
hyphens. When written to the data frame, these characters were replaced with a 
period. These are cleaned up using a single underscore to make the variable 
names tidy.

5) From the data set in step 4, create a second, independent tidy data set with 
the average of each variable for each activity and each subject.

5.1) Transform all measurements in to a single observation.

5.2) Take the mean of the measurement values for each combination of activity, 
subject, and measurement variable.

5.3) Transform back to a tidy wide data set where each observation consists of 
mean values for each of the 79 measurements for each activity-subject 
combination.
