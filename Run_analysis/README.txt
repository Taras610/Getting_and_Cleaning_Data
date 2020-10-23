relevant library: dplyr

Script:
It reads all needed filles. In first part it counts mean ahd standart deviation.
And merges it in 1 data frame.
in second part it collects all measurements to a tidy data set and saves it as 
"tidy_data.txt"


Variables:

XTest - X_test.txt
XTrain - X_train.txt
Features - features.txt
MergedSetMD - combined XTest and XTrain
SetMean - vector containing means of each measurement
SetDev - vector containing standart deviation of each measurement

YTest - y_test.txt
YTrain - y_train.txt
ActivityLabel - activity_labels.txt
SubjectTest - subject_test.txt
SubjectTrain - subject_train.txt
MergedSub - combined Subjects
MergedAct - combined YTest and YTrain

MergedSet - data frame containing all calculations of mean and standart deviation(in 1st step)/ data frame containing tidy data(in second)
