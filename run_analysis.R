library(reshape2)

fileName <- "FUCI HAR Dataset.zip"

## Download the file and Unzip

if(!file.exists(fileName)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL,fileName,method="curl")
}

if (!file.exists("UCI HAR Dataset")){
  unzip(fileName)
}

# Read Activity and Features files

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")

#### Working with training Data set ####

# Read Training related files
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
xtrain <- read.table("UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("UCI HAR Dataset/train/y_train.txt")

# Adding Feature file column names for the training data
names(xtrain) <- features$V2

# Combining the Subject, X Test and Y Test files
xtrain$subjectID <- trainSubject$V1
xtrain$ActivityID <- ytrain$V1

# Merge with activityLabels
merge_train <- merge(xtrain,activityLabels,by.x="ActivityID",by.y="V1")

####  Working with test Data set #####

# Read Test related files
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
xtest <- read.table("UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("UCI HAR Dataset/test/y_test.txt")

# Adding column names for the test data
names(xtest) <- features$V2

# Combining the Subject, X Test and Y Test files
xtest$subjectID <- testSubject$V1
xtest$ActivityID <- ytest$V1

# Merge with activityLabels
merge_test <- merge(xtest,activityLabels,by.x="ActivityID",by.y="V1")


# Question 1 - Combining Training and Test data
fulldataset <- rbind(merge_train,merge_test)

# Extracts only the measurements on the mean and standard deviation for each measurement
meanCol <- grep("mean\\(\\)", names(fulldataset), value = TRUE )
stdCol <- grep("std\\(\\)", names(fulldataset), value = TRUE )

#Question 2 - Extract Std and Mean measurement from the col
extractedData <- fulldataset[,c(meanCol,stdCol,"ActivityID","subjectID","V2")]

#Question 3 - Extract Std and Mean measurement from the col
colnames(extractedData)[69] <- "ActivityDescName" 

# Question 4 - Appropriately labels the data set with descriptive variable names.
names(extractedData) = gsub("Gyro", " Gyroscope ", names(extractedData))
names(extractedData) = gsub("^f", " Frequency ", names(extractedData))
names(extractedData) = gsub("^t", " Time ", names(extractedData))
names(extractedData) = gsub("Acc", " Accelerometer ", names(extractedData))

#Question 5 - creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tempVar <- melt(extractedData, id=c("subjectID", "ActivityDescName"))
tidyData <- dcast(tempVar, subjectID + ActivityDescName ~ variable, mean)

write.table(tidyData, "tidy.txt", row.names = FALSE, quote = FALSE)
write.csv(tidyData, "tidy.csv", row.names = FALSE, quote = FALSE)

