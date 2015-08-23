   ### 1 - Merge everything into one dataset
   ## Reading features
features <- read.table("./UCI HAR Dataset/features.txt")
lab1 <- as.character(features[,2])
   ## Reading test files
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/Y_test.txt")
stest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
   ## Reading train files
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/Y_train.txt")
strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
   ## Merge test
test <- cbind(xtest,stest,ytest)
   ## Merge train
train <- cbind(xtrain,strain,ytrain)
   ## Merge test and train
data1 <- rbind(train, test)
colnames(data1) <- c(lab1, "Subject Test", "Activity")

   ### 2 - Extract only measurements on the mean and standard deviation
me1 <- grep("Mean", lab1) ## search for 'Mean'
me2 <- grep("mean", lab1) ## search for 'mean'
st1 <- grep("std", lab1) ## search for 'std'
me <- c(me1,me2,st1) ## bind the searches
dataonly <- data1[,me] ## leave only the columns with mean and std

   ### 3 - Use descriptive names to the activity column
act1 <- as.character(data1[,563]) ## activity column as characters
for(i in 1:10299){ ## transform activity column depending on its value
        if(data1[i,563]=="1"){data1[i,563] <- "Walking"}
        if(data1[i,563]=="2"){data1[i,563] <- "Walking Upstairs"}
        if(data1[i,563]=="3"){data1[i,563] <- "Walking Downstairs"}
        if(data1[i,563]=="4"){data1[i,563] <- "Sitting"}
        if(data1[i,563]=="5"){data1[i,563] <- "Standing"}
        if(data1[i,563]=="6"){data1[i,563] <- "Laying"}
}

   ### 4 - Label the dataset with descriptive variable names
## Already did it in row 18 of this script
## colnames(data1) <- c(lab1, "Subject Test", "Activity") 

   ### 5 - Create a tidy dataset with the average of each variable, by activity and by subject
r11 <- vector(length = 563)
dat11 <- subset(data1, data1[,563]=="Walking")
for(i in 1:563){
        r11[i] <- mean(dat11[,i])
}
r12 <- vector(length = 563)
dat12 <- subset(data1, data1[,563]=="Walking Upstairs")
for(i in 1:563){
        r12[i] <- mean(dat12[,i])
}
r13 <- vector(length = 563)
dat13 <- subset(data1, data1[,563]=="Walking Downstairs")
for(i in 1:563){
        r13[i] <- mean(dat13[,i])
}
r14 <- vector(length = 563)
dat14 <- subset(data1, data1[,563]=="Sitting")
for(i in 1:563){
        r14[i] <- mean(dat14[,i])
}
r15 <- vector(length = 563)
dat15 <- subset(data1, data1[,563]=="Standing")
for(i in 1:563){
        r15[i] <- mean(dat15[,i])
}
r16 <- vector(length = 563)
dat16 <- subset(data1, data1[,563]=="Laying")
for(i in 1:563){
        r16[i] <- mean(dat16[,i])
}
  ## Bind each mean for each activity in one dataset
total <- matrix(0,6,563)
colnames(total) <- c(lab1, "Subject Test", "Activity")
rownames(total) <- c("Walking","Walking Upstairs","Walking Downstairs","Sitting","Standing","Laying")
total[1,] <- r11
total[2,] <- r12
total[3,] <- r13
total[4,] <- r14
total[5,] <- r15
total[6,] <- r16
print(total)
   ### Extract tiny final tiny dataset from step 5
write.table(total, file = "getcleanPC.txt", row.name=FALSE)
