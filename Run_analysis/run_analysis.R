#prepares working directory, library
directory <- "D:/R/RStudio/R/ProgrammingAssignment3/UCI HAR Dataset"
setwd(directory)
library(dplyr)

#Reads needed files for mean and standart deviation (X_test.txt, X_train.txt, features.txt)
XTest <- read.table("./test/X_test.txt")
XTrain <- read.table("./train/X_train.txt")
Features <- read.table("./features.txt")

MergedSetMD <- rbind(XTrain, XTest)      #merges XTrain, XTest
SetMean <- lapply(MergedSetMD, mean)     #counts mean for each measurement
SetDev <- lapply(MergedSetMD, sd)        #counts standart deviation for each measurement
MergedSet <- rbind(SetMean, SetDev)      #merges SetMean and SetDev
MergedSet <- as.data.frame(MergedSet)    #
names(MergedSet) <- Features$V2          #set names for variables
View(MergedSet)                          #Opens the table

##########################################################Second part

#Reads needed files for new data table (y_test.txt, y_train.txt, activity_labels.txt, subject_test.txt, subject_train.txt)
YTest <- read.table("./test/y_test.txt")
YTrain <- read.table("./train/y_train.txt")
ActivityLabel <- read.table("./activity_labels.txt")
SubjectTest <- read.table("./test/subject_test.txt")
SubjectTrain <- read.table("./train/subject_train.txt")

MergedSub <- rbind(SubjectTrain, SubjectTest)           #merges both subjects
MergedAct <- rbind(YTrain, YTest)                       #merges YTrain and YTest
MergedSet <- cbind(MergedSetMD, MergedSub, MergedAct)   #merges MergedSetMD, MergedSub, MergedAct
names(MergedSet) <- Features$V2                         #set names for variables

names(MergedSet)[ncol(MergedSet)-1] <- "Subject_id"     #sets name for 562th column
names(MergedSet)[ncol(MergedSet)] <- "Activity_Name"    #sets name for 563th column

#creates final table
MergedSet <- merge(MergedSet, ActivityLabel, by.x = 'Activity_Name', by.y = "V1", all.x = TRUE, all.y = FALSE)
names(MergedSet)[ncol(MergedSet)] <- "Activity_Name"

write.table(MergedSet, file = "tidy_data.txt", row.name=FALSE)

