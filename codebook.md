The script run_analysis.R performs the following to obtain clean data

1. Merges the training and test sets to create one data set:
	 Merges X_train.txt and X_test.txt to xTrainTest data frame
	 Merges subject_train.txt and subject_test.txt to subjectTrainTest data frame
	 Merges y_train.txt and y_test.txt to yTrainTest data frame

2. Extracts only the measurements on the mean and standard deviation for each measurement:
	Read features.txt and extracts the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set:
	Reads activity_labels.txt and appends activity names to name the activities in the data set

walking,walkingupstairs, walkingdownstairs, sitting, standing, laying

4. Appropriately labels the data set with descriptive variable names: Column Binds the subjectTrainTest, yTrainTest, xTrainTest data frames into new data table final_clean_data

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject: The result wrritten into averages.txt data table. First Column Represents subjects, second column represents activity, and the rest of the columns represent mean and standard deviation methods extracted from features.txt file. The averages.txt file has 181 rows(First row represents the column names + (6 activities * 30 subjects)) and 68 columns in total.