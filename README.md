# Getting-and-Cleaning-Data-Final-Project
Final Course Project

The run_Analysis.R file cleans the data in this project

The first part of the script imports the dplyr and tidyr packages. These packages will be used in the cleaning of the data

The next part of the script imports the features and activity labels vectors. They indicate the column headers and specify which activity number corresponds to which activity

The training and test datasets are then imported and each is assigned a dataframe containing the subject, activity performed, and the data. Appropriate column names are given to the datasets.

The training and test datasets are then merged using rbind()

The dataExtract dataset is then created which gets rid of all variables that are not standard deviation or mean. The activity labels then replace the numbers representing activities

The variable name abbreviations are replaced with full column titles

The data is made tidy by taking the mean of repeat data entries
