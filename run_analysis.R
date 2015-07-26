## Merges the training and the test sets to create one data set ##
xTrain <- read.table("train/X_train.txt")
xTest <- read.table("test/X_test.txt")
xTrainTest <- rbind(xTrain, xTest)

subjectTrain <- read.table("train/subject_train.txt")
subjectTest <- read.table("test/subject_test.txt")
subjectTrainTest <- rbind(subjectTrain, subjectTest)

yTrain <- read.table("train/y_train.txt")
yTest <- read.table("test/y_test.txt")
yTrainTest <- rbind(yTrain, yTest)

## Extracts only the measurements on the mean and standard deviation for each measurement. ##
features <- read.table("features.txt")
meanAndStd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
xTrainTest <- xTrainTest[, meanAndStd]
names(xTrainTest) <- features[meanAndStd, 2]

## Uses descriptive activity names to name the activities in the data set ###
activityLables <- read.table("activity_labels.txt")
yTrainTest[,1] = activityLables[yTrainTest[,1], 2]
names(yTrainTest) <- "activity"

## Appropriately labels the data set with descriptive activity names ##
names(subjectTrainTest) <- "subject"
final_clean_data <- cbind(subjectTrainTest, yTrainTest, xTrainTest)
write.table(final_clean_data, "final_clean_data.txt")

## Tidy data set with the average of each variable for each activity and each subject ##
subjects = unique(subjectTrainTest)[,1]
subjectCount = length(unique(subjectTrainTest)[,1])
activities = length(activityLables[,1])
cols = dim(final_clean_data)[2]
result = final_clean_data[1:(subjectCount*activities), ]

row = 1
for (i in 1:subjectCount) {
    for (j in 1:activities) {
        result[row, 1] = subjects[i]
        result[row, 2] = activityLables[j, 2]
        tmp <- final_clean_data[final_clean_data$subject==i & final_clean_data$activity==activityLables[j, 2], ]
        result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
        row = row+1
    }
}
write.table(result, "averages.txt")