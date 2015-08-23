## GetCleanDataCP
# 1- Read the file "features.txt" and saves column 2 as a character string called 'lab1'.
# 2- Read the test files "X_test.txt", "Y_test.txt" and "subject_test.txt".
# 3- Read the train files "X_train.txt", "Y_train.txt" and "subject_train.txt".
# 4- Bind the test files by columns.
# 5- Bind the train files by columns.
# 6- Bind the test dataset and the train dataset into one big dataset by rows.
# 7- Put the names of the columns from 'lab1' string
# 8- Look for the words "Mean", "mean" and "std" in the variable character string called 'lab1'.
# 9- Subset the columns that has one of those words in their names.
# 10- Transform column 563 depending on its activity:
        1 - "Walking"
        2 - "Walking Upstairs"
        3 - "Walking Downstairs"
        4 - "Sitting"
        5 - "Standing"
        6 - "Laying"
# 11- Already label the columns in step 7
# 12- Create datasets for each activity
# 13- Calculate the mean for each column and each activity
# 14- Bind them into a matrix called 'total'
# 15- Print the matrix
# 16- Extract the tiny dataset with the function "write.table" into a txt file
