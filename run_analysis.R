#  Read all the test and train files

xtest <- read.table("./X_test.txt", sep="")
ytest <- read.table("./y_test.txt", sep="")
subject_test <- read.table("./subject_test.txt", sep="")

xtrain <- read.table("./X_train.txt", sep="")
ytrain <- read.table("./y_train.txt", sep="")
subject_train <- read.table("./subject_train.txt", sep="")

# Understand the data
#str(xtest)
#str(ytest)
#str(subject_test)

#str(xtrain)
#str(ytrain)
#str(subject_train)

# Load DPLYR package 
library(dplyr)

# change the variable name in Subject_test
names(subject_test) <- "Subject.Id"

# Change the variable name in ytest
names(ytest) <- "activity.num"

# Merge all test data frames
alltest <- cbind(subject_test, ytest, xtest)

# change variable name in subject_train
names(subject_train) <- "Subject.Id"

#change variable name in y_train
names(ytrain) <- "activity.num"

# merge all train data frames
alltrain <- cbind(subject_train, ytrain, xtrain)

# merge test and train data frames 
alldata <- rbind(alltest,alltrain)

# create a vector with activuty labels
acti <- c(" WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

# create activity variable to provide labels
alldata$activity.label <- acti[alldata$activity.num]

# to check if labels are created properly
table(alldata$activity.num,alldata$activity.label)

# Choose Mean and STD varaibles
alldata0 <- select(alldata, Subject.Id, activity.label, V1:V6, V41:V46, V81:V86, V121:V126, V161:V166, 
                    V201:V202, V214:V215, V227:V228, V240:V241, V253:V254, V266:V271, V345:V350, 
                    V424:V429, V503:V504, V516:V517, V529:V530, V542:V543)


names(alldata0) <- c("Subject.Id", "activity.label","timeBodyAcc-mean-X", "timeBodyAcc-mean-Y", 
                    "timeBodyAcc-mean-Z", "timeBodyAcc-std-X", "timeBodyAcc-std-Y", 
                    "timeBodyAcc-std-Z", "timeGravityAcc-mean-X", "timeGravityAcc-mean-Y",
                    "timeGravityAcc-mean-Z", "timeGravityAcc-std-X",  "timeGravityAcc-std-Y", 
                    "timeGravityAcc-std-Z", "timeBodyAccJerk-mean-X", "timeBodyAccJerk-mean-Y",
                    "timeBodyAccJerk-mean-Z", "timeBodyAccJerk-std-X", "timeBodyAccJerk-std-Y", 
                    "timeBodyAccJerk-std-Z", "timeBodyGyro-mean-X", "timeBodyGyro-mean-Y", 
                    "timeBodyGyro-mean-Z", "timeBodyGyro-std-X", "timeBodyGyro-std-Y", 
                    "timeBodyGyro-std-Z", "timeBodyGyroJerk-mean-X", "timeBodyGyroJerk-mean-Y", 
                    "timeBodyGyroJerk-mean-Z", "timeBodyGyroJerk-std-X",
                     "timeBodyGyroJerk-std-Y", "timeBodyGyroJerk-std-Z",  "timeBodyAccMag-mean", 
                     "timeBodyAccMag-std", "timeGravityAccMag.mean", "timeGravityAccMag.std", 
                     "timeBodyAccJerkMag-mean", "timeBodyAccJerkMag-std", "timeBodyGyroMag-mean", 
                     "timeBodyGyroMag-std", "timeBodyGyroJerkMag-mean", "timeBodyGyroJerkMag-std", 
                     "freqBodyAcc-mean-X", "freqBodyAcc-mean-Y", "freqBodyAcc-mean-Z", "freqBodyAcc-std-X", 
                     "freqBodyAcc-std-Y", "freqBodyAcc-std-Z", "freqBodyAccJerk-mean-X", 
                     "freqBodyAccJerk-mean-Y", "freqBodyAccJerk-mean-Z", "freqBodyAccJerk-std-X", 
                     "freqBodyAccJerk-std-Y", "freqBodyAccJerk-std-Z", "freqBodyGyro-mean-X", 
                     "freqBodyGyro-mean-Y", "freqBodyGyro-mean-Z", "freqBodyGyro-std-X", 
                      "freqBodyGyro-std-Y", "freqBodyGyro-std-Z", "freqBodyAccMag-mean", 
                      "freqBodyAccMag-std", "freqBodyBodyAccJerkMag-mean", 
                    "freqBodyBodyAccJerkMag-std", "freqBodyBodyGyroMag-mean", "freqBodyBodyGyroMag-std", 
                     "freqBodyBodyGyroJerkMag-mean", "freqBodyBodyGyroJerkMag-std")

# replace hyphens with periods
names(alldata0) <- gsub("-",".",names(alldata0))

# group by subject.id, activity.num, activity.label
alldata1 <- group_by(alldata0, Subject.Id, activity.label)
#dim(alldata1)

# summarize all other variables
alldata2 <- summarize_each(alldata1, funs(mean), 3:68)
#dim(alldata2)

write.table(alldata2, file="./tidy_data.txt", row.names = FALSE)