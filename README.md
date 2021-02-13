==================================================================
Coursera/JHU project: Getting and Cleaning Data Course
        by Steven Balzer
        date 2021-02-13
==================================================================

This is the peer-graded assignment for week 4 of the 'Getting and Cleaning 
Data' Course.

The purpose of this assignment is to demonstrate the ability to collect, work 
with, and clean a data set.

This approach uses the wide form as mentioned in the rubric as either long or 
wide form is acceptable.

The following files are included in this repository.

CodeBook.md
        Defines all of the variables of the resulting data set, the original 
        data source, and outlines the transformations made to the original data 
        sets.

run_analysis.R
        R script file that contains all of the transformations needed to 
        recreate the tidy data set in the wide form as mentioned in the rubric. 
        You can either run it as a function with no arguments or as individual 
        commands. A data frame is returned.
        Requirements:
        1) Pre-installation of 'reshape2' library.
        2) This script must run in the same folder as the unpacked source zip 
        file [1]. Once the source data is unzipped, the working directory needs 
        to contain the following folder structure/file listing before running 
        the script: 
        
        [working directory]
                > run_analysis.R
                > UCI HAR Dataset
                        > features.txt
                        > activity_labels.txt
                        > test
                                > subject_test.txt
                                > X_test.txt
                                > y_test.txt
                        > train
                                > subject_train.txt
                                > X_train.txt
                                > y_train.txt

import_tidy_data.R
        R script commands used to import and view my submitted file, 
        'measurement_means.txt', for this assignment.


Citation for some addition insight gained in preparation of this assignment:

'Part 6: Getting and Cleaning the Assignment', by David Hood, as posted 
online [2].

        
[1] https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

[2] https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/
