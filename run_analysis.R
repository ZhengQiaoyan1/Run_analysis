# This file is the project in getting and cleaning data week 3
if (!require("mefa")) {
  install.packages("mefa")
}

if (!require("reshape2")) {
  install.packages("reshape2")
}

require("mefa")
require("reshape2")
# 1.Merges the training and the test sets to create one data set
# read  test data
X_test<-read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/test/X_test.txt",
                   sep="", strip.white=TRUE, header=TRUE,  quote = "\"", fill=TRUE)
Y_test<-read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/test/y_test.txt",
                   sep="", strip.white=TRUE, header=TRUE,  quote = "\"", fill=TRUE)
subject_test<-read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/test/subject_test.txt",
                         sep="", strip.white=TRUE, header=TRUE,  quote = "\"", fill=TRUE)

# read train data
X_train<-read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/train/X_train.txt",
                   sep="", strip.white=TRUE, header=TRUE,  quote = "\"", fill=TRUE)
Y_train<-read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/train/y_train.txt",
                    sep="", strip.white=TRUE, header=TRUE,  quote = "\"", fill=TRUE)
subject_train<-read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/train/subject_train.txt",
                          sep="", strip.white=TRUE, header=TRUE,  quote = "\"", fill=TRUE)

# add column name for subject files
names(subject_train) <- "subjectID"
names(subject_test) <- "subjectID"

# add column names for measurement files
featureNames <- read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/features.txt")
names(X_train) <- featureNames$V2
names(X_test) <- featureNames$V2

# add column name for label files
names(Y_train) <- "activity"
names(Y_test) <- "activity"

#merge test data
testdata <- cbind(subject_test,Y_test,X_test)
#merge train data
traindata <- cbind(subject_train,Y_train,X_train)
#merges the training and the test sets 
mergedata <- rbind(testdata,traindata)

# 3&4 Uses descriptive activity names to name the activities in the data set
activity_labels <- read.table("E:/R programming/getting and cleanning data/week 3/UCI HAR Dataset/activity_labels.txt")
mergedata$activity <- factor(mergedata$activity, labels=c(activity_labels$V2))


# 2.Extracts only the measurements on the mean and standard deviation for each measurement
# find names which has mean or std in them 
meanstd <- grepl("mean\\(\\)", names(mergedata))|grepl("std\\(\\)", names(mergedata))
meanstd[1:2] <- TRUE
# Extracts cols satified demand
mergedata <- mergedata[,meanstd]
# convert the activity column from integer to factor
mergedata$activity <- factor(mergedata$activity, labels=c("Walking",
                       "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# 4. Appropriately labels the data set with descriptive variable names 
id_var <- c("subjectID","activity")
melted <- melt(mergedata, id=id_var)
tidy <- dcast(melted, subjectID+activity ~ variable, mean)

#5. write the tidy data set to a file
write.table(tidy, "tidy.txt", row.names=FALSE)

