# TidyDataRepo
Repo Containing Project Files for Getting and Cleaning Data Assigment

run_analysis.R has several different components to its structure.

Data Load : read.table is used to load relevant data into R to be manipulated. Namely, the training and test data, along with the labels used to describe these data.

DPLYR Load: the DPLYR package is loaded into R.

Label Creation: gsub is used to remove problematic characters such as parentheses, dashes and commas from the variables default titles.

Data Labelling: The edited labels are appended to the datasets, the activity labels are also updated to allow for easier merging further on in the code.

Data Merge: cbind is used to attach Subject ID and Activity to the variable measurements. rbind is used to attach training data to test data. select is used to choose only the columns containing standard deviation or average data. merge is used to merge activity description with the new data set and then drop the old activity ID's.

TidySet: group_by is used to organize the data by subject and activity. summarize is then used to calculate the averages of variable based on subject and activity.