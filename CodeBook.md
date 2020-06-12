Code Book

This book describes all variables and operations performed on them

features - vector of all variables (column headers) that exist in the X datasets. When loaded into R it adds a blank first column so I took the second column and made it a character vector so it is now a list of column headers I can use

Activity_labels - These are the labels that correspond to the activity numbers. When loaded into R, the second column is taken as a character vector so I have a vector of the activity names and no numbers

subjectTest - The subject number vector in the Test subset

subjectTrain - The subject number vector in the Train subset

activityTest - The activity number vector in the Test dataset

activityTrain - the activity number vector in the Train dataset

XTest - The X data in the Test dataset

XTrain - The X data in the Train dataset

Test - The Test dataset, combines subjectTest, activityTest, and XTest into one data frame. Columns are named appropriately with the features vector

Train - The Train dataset, combines subjectTrain, activityTrain, and XTrain, into one data frame. Columns are named appropriately with the features vector

data - Merging the Test and Train dataframes

dataExtract - Extracting all columns from data that are not 'Subject' 'Activity' or a mean or standard deviation variable. The activity label numbers are also replaced with the names of the activities. The column name abbreviations are replaced with more descriptive terms

dataTidy - The dataframe takes dataExtract and takes the mean of any repeat data. It also orders the rows by subject and then the activity being performed
