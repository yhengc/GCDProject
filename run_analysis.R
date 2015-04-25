## Assume that all files are in the right folders
    library(dplyr)

## Merges the training and the test sets to create one data set.
    trainX <- read.table("train/X_train.txt")
    testX <- read.table("test/X_test.txt")
    X <- rbind(trainX, testX)

    trainY <- read.table("train/y_train.txt")
    testY <- read.table("test/y_test.txt")
    Y <- rbind(trainY, testY)

    trainS <- read.table("train/subject_train.txt")
    testS <- read.table("test/subject_test.txt")
    S <- rbind(trainS, testS)

    rm("trainX","trainY","trainS","testX","testY","testS")

## Extracts only the measurements on the mean and standard deviation for each measurement.

    features <- read.table("features.txt")
    # grep returns a "position vector" of the measurements on
    # the mean and standard deviation
    m_std_features_posi  <- grep("(-std\\(\\)|-mean\\(\\))",features$V2)

    # string vectors of the measurements on the mean and standard deviation
    m_std_name <- features[m_std_features_posi,2]

    # keep columns in X that are means or std. deviation
    Data <- X[,m_std_features_posi]

## Uses descriptive activity names to name the activities in the data set

    # name each column of the data
    names(Data) <- levels(droplevels(m_std_name))

## Appropriately labels the data set with descriptive variable?names.

    # Note that Y$V1 and S$V1 are integer vector
    # Y is activity and S is subject
    activity <- (Y$V1)
    subject <- (S$V1)
    Data <- cbind(subject, activity, Data)

    write.table(Data, "tidy_data.txt", row.name=FALSE)

## NOTE!!!!!IMPORTANT!!!!!
## If you want to read the result and check, please use the following command:
## read.table("tidy_data.txt", header = TRUE)


## From the data set in step 4, creates a second, independent tidy data set with the average
## of each variable for each activity and each subject.

    Data <- tbl_df(Data)
    # Create auxiliary column s_a
    Data <- mutate(Data, s_a = paste0("s", subject, "_a", activity))
    # Apply aggregate to get mean for each subset
    tidy_data_with_average <- aggregate(. ~ s_a, Data, mean, na.rm = TRUE)
    # Remove auxiliary column s_a
    tidy_data_with_average <- select(tidy_data_with_average, -s_a)
    # Sort tidy_data_with_average with function arrange
    tidy_data_with_average <- arrange(tidy_data_with_average, activity, subject)
    # Read activity_labels into R
    activity_labels  <- read.table("activity_labels.txt")

    write.table(tidy_data_with_average, "tidy_data_with_average.txt", row.name = FALSE)

## NOTE!!!!!IMPORTANT!!!!!
## If you want to read the result and check, please use the following command:
## read.table("tidy_data_with_average.txt", header = TRUE)
