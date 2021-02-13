run_analysis <- function() {
        
        # script may take a few seconds
        message("\nProcessing...")
        
        # load required libraries
        library(reshape2)
        
        
        ##
        # Requirement 1.
        # Merges the training and the test sets to create one data set.
        ##
        
        # load the following data sets from
        # https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
        
        folder <- "UCI HAR Dataset/"
        
        # training set
        trnset <- read.table(paste0(folder, "train/X_train.txt"))
        # training labels
        trnlbl <- read.table(paste0(folder, "train/y_train.txt"))
        # training subjects
        trnsub <- read.table(paste0(folder, "train/subject_train.txt"))
        # test set
        tstset <- read.table(paste0(folder, "test/X_test.txt"))
        # test labels
        tstlbl <- read.table(paste0(folder, "test/y_test.txt"))
        # test subjects
        tstsub <- read.table(paste0(folder, "test/subject_test.txt"))
        
        # combine the training data
        #
        # All 3 data sets to be combined each have 7,352 observations.
        # Add a partition variable to identify the subjects selected for
        # generating the training data.
        trn <- cbind(trnsub, partition = "training", trnlbl, trnset)
        
        # combine the test data
        #
        # All 3 data sets to be combined each have 2,947 observations.
        # Add a partition variable to identify the subjects selected for 
        # generating the test data.
        tst <- cbind(tstsub, partition = "test", tstlbl, tstset)
        
        # combine the training and test data
        #
        # Both data sets - 'trn' and 'tst' - each have 564 variables and 
        # contain the same variable names.
        df <- rbind(trn, tst)
        
        
        ##
        # Requirement 2. 
        # Extracts only the measurements on the mean and standard deviation for 
        # each measurement. 
        ##
        
        # load the features.txt file to obtain the list of variable names
        cnames <- read.table(paste0(folder, "features.txt"))
        
        # provide the data set with meaningful variable names...currently
        # they are called "V1", "V2", "V3", etc.
        names(df) <- c("subject", "partition", "activity", cnames[,2])
        
        # identify the variables pertaining to mean and standard deviation
        keep <- grepl("-mean|-std", cnames[,2])
        
        # also keep the 'subject', 'partition', and 'activity' variables
        keep <- c(TRUE, TRUE, TRUE, keep)
        
        # reduce data set to only those identified variables
        df <- df[, keep]
        # At this point, 'df' contains 10299 observations and 82 variables, 
        # where variables 4 through 82 are representing only selected feature 
        # vectors for the mean and standard deviation estimates.
        
        
        ##
        # Requirement 3. 
        # Uses descriptive activity names to name the activities in the data 
        # set.
        ##
        
        # load the activity_labels.txt file for the list of activities
        actlbl <- read.table(paste0(folder, "activity_labels.txt"))
        
        # update the 'activity' variable with the labels from 
        # 'activity_labels.txt'
        df <- transform(df, activity = actlbl[df[,3], 2])
        
        
        ##
        # Requirement 4. 
        # Appropriately labels the data set with descriptive variable names.
        ##
        
        # Appropriate labels were applied during Requirement 2.
        #
        # Further cleaning up of the variable names.
        #
        # where "()-" was, it is now "...", replace with "_"
        names(df) <- gsub("[.]{3}", "_", names(df))
        # where "()" was, it is now "..", replace with ""
        names(df) <- gsub("[.]{2}", "", names(df))
        # where "-" was, it is now ".", replace with "_"
        names(df) <- gsub("[.]", "_", names(df))
        
        
        ##
        # Requirement 5.
        # From the data set in step 4, creates a second, independent tidy data 
        # set with the average of each variable for each activity and each 
        # subject.
        ##
        
        # reshape so that each measurement is a single observation
        df <- melt(df, id=1:3)
        
        # take the mean of the measurements for each activity-subject-variable 
        # combination and reshape to a tidy wide format
        df <- dcast(df, activity + subject ~ variable, mean)
        
        # processing data is completed
        message("\nFinished!")
        
        # output the resulting tidy data set
        filename <- "measurement_means.txt"
        write.table(df, file = filename, row.names = FALSE)
        message("\nThe tidy wide data set has been written to\nthe file '", 
                filename, "' in the working directory:\n", 
                getwd())
        View(df)
}