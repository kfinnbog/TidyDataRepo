#Data load
X_train <- read.table("./X_train.txt", quote="\"")
Y_train <- read.table("./Y_train.txt", quote="\"")
Y_test <- read.table("./Y_test.txt", quote="\"")
X_test <- read.table("./X_test.txt", quote="\"")
Subject_test <- read.table("./subject_test.txt", quote="\"")
Subject_train <- read.table("./subject_train.txt", quote="\"")
labels <- read.table("./features.txt", quote="\"")
act_labels<- read.table("./activity_labels.txt", quote="\"")

#DPLYR Load:

library("dplyr", lib.loc="/Library/Frameworks/R.framework/Versions/3.1/Resources/library")

#Label creation:
labels<-gsub("()","",labels$V2,fixed=TRUE)
labels<-gsub("(","",labels,fixed=TRUE)
labels<-gsub(")","",labels,fixed=TRUE)
labels<-gsub("-","",labels,fixed=TRUE)
labels<-gsub(",","",labels,fixed=TRUE)

#Data labelling:
names_vector <- labels
names(X_train) <- names_vector
names(X_test) <- names_vector
names(Subject_test)<-c("Subject")
names(Subject_train)<-c("Subject")
names(Y_test)<-c("ActivityNum")
names(Y_train)<-c("ActivityNum")
names(act_labels)<-c("ActivityNum","Activity")

#Data merge:
train_data<-cbind(Subject_train,Y_train,X_train)
test_data<-cbind(Subject_test,Y_test,X_test)
merged_data<-rbind(train_data,test_data)
merged_data_sel<-select(merged_data,contains("Subject"),contains("Activity"),contains("std"),contains("mean"))
merged_data_sel<-merge(merged_data_sel,act_labels)
merged_data_sel<-select(merged_data_sel,-ActivityNum)

#Tidy set:
MDS<-merged_data_sel
grouped_MDS<-group_by(MDS, Subject, Activity)
TidyData<-summarize(grouped_MDS,mean(tBodyAccstdX),mean(tBodyAccstdY),mean(tBodyAccstdZ),mean(tGravityAccstdX),mean(tGravityAccstdY),mean(tGravityAccstdZ),mean(tBodyAccJerkstdX),mean(tBodyAccJerkstdY),mean(tBodyAccJerkstdZ),mean(tBodyGyrostdX),mean(tBodyGyrostdY),mean(tBodyGyrostdZ),mean(tBodyGyroJerkstdX),mean(tBodyGyroJerkstdY),mean(tBodyGyroJerkstdZ),mean(tBodyAccMagstd),mean(tGravityAccMagstd),mean(tBodyAccJerkMagstd),mean(tBodyGyroMagstd),mean(tBodyGyroJerkMagstd),mean(fBodyAccstdX),mean(fBodyAccstdY),mean(fBodyAccstdZ),mean(fBodyAccJerkstdX),mean(fBodyAccJerkstdY),mean(fBodyAccJerkstdZ),mean(fBodyGyrostdX),mean(fBodyGyrostdY),mean(fBodyGyrostdZ),mean(fBodyAccMagstd),mean(fBodyBodyAccJerkMagstd),mean(fBodyBodyGyroMagstd),mean(fBodyBodyGyroJerkMagstd),mean(tBodyAccmeanX),mean(tBodyAccmeanY),mean(tBodyAccmeanZ),mean(tGravityAccmeanX),mean(tGravityAccmeanY),mean(tGravityAccmeanZ),mean(tBodyAccJerkmeanX),mean(tBodyAccJerkmeanY),mean(tBodyAccJerkmeanZ),mean(tBodyGyromeanX),mean(tBodyGyromeanY),mean(tBodyGyromeanZ),mean(tBodyGyroJerkmeanX),mean(tBodyGyroJerkmeanY),mean(tBodyGyroJerkmeanZ),mean(tBodyAccMagmean),mean(tGravityAccMagmean),mean(tBodyAccJerkMagmean),mean(tBodyGyroMagmean),mean(tBodyGyroJerkMagmean),mean(fBodyAccmeanX),mean(fBodyAccmeanY),mean(fBodyAccmeanZ),mean(fBodyAccmeanFreqX),mean(fBodyAccmeanFreqY),mean(fBodyAccmeanFreqZ),mean(fBodyAccJerkmeanX),mean(fBodyAccJerkmeanY),mean(fBodyAccJerkmeanZ),mean(fBodyAccJerkmeanFreqX),mean(fBodyAccJerkmeanFreqY),mean(fBodyAccJerkmeanFreqZ),mean(fBodyGyromeanX),mean(fBodyGyromeanY),mean(fBodyGyromeanZ),mean(fBodyGyromeanFreqX),mean(fBodyGyromeanFreqY),mean(fBodyGyromeanFreqZ),mean(fBodyAccMagmean),mean(fBodyAccMagmeanFreq),mean(fBodyBodyAccJerkMagmean),mean(fBodyBodyAccJerkMagmeanFreq),mean(fBodyBodyGyroMagmean),mean(fBodyBodyGyroMagmeanFreq),mean(fBodyBodyGyroJerkMagmean),mean(fBodyBodyGyroJerkMagmeanFreq),mean(angletBodyAccMeangravity),mean(angletBodyAccJerkMeangravityMean),mean(angletBodyGyroMeangravityMean),mean(angletBodyGyroJerkMeangravityMean),mean(angleXgravityMean),mean(angleYgravityMean),mean(angleZgravityMean))

