library(dplyr)
library(data.table)
run_analysis <- function(){
  
  ############# Read Test Files########
  ####################################
  features_file <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/features.txt")
  
  file_subject_test <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/test/subject_test.txt")
  x_test <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/test/X_test.txt")
  y_test <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/test/y_test.txt")
  

  label_and_subject_test <- cbind(file_subject_test,y_test)
 colnames(label_and_subject_test) <- c("subject","activity")
  
  merged_test_file <- cbind(label_and_subject_test,x_test)
  merged_test_file
  
  ############# Read Test Train ########
  ####################################
  file_subject_train <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/train/subject_train.txt")
  x_train <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/train/X_train.txt")
  y_train <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/train/y_train.txt")
  
  label_and_subject_train <- cbind(file_subject_train,y_train)
  colnames(label_and_subject_train) <- c("subject","activity")
  merged_train_file <- cbind(label_and_subject_train,x_train)
  
  ############# Meges Train/Test Files into one Data Frame ########
  ####################################
  
  merged_file_trainTest <- rbind(merged_test_file,merged_train_file)
  

  ############# Changes Namaes for main columns (Subject and Activity) ########
  ####################################
  feature_names <- features_file$V2
  
  names <- c("subject","activity")
  names <- append(names,as.character(feature_names))
  setnames(merged_file_trainTest, old = names(merged_file_trainTest), new = names)
  
  ############# Takes out duplicated columns########
  ####################################
  merged_file_trainTest <- merged_file_trainTest[ , !duplicated(colnames(merged_file_trainTest))]
  
  ############# Regular expression that only keeps key Columns (Subject, Activity, Mean and STD) ########
  ####################################
  merged_file_MEAN_SDT <- select(merged_file_trainTest,matches("(subject)|(activity)|(mean\\()|(std\\()"))
  
  
  ############# Changes Activity Names into real names ########
  ####################################
  activity_vector <- merged_file_MEAN_SDT$activity
  activity_vector <- replace(activity_vector, activity_vector== 1, "Walking")
  activity_vector <- replace(activity_vector, activity_vector== 2, "Walking_Upstairs")
  activity_vector <- replace(activity_vector, activity_vector== 3, "Walking_Downstairs")
  activity_vector <- replace(activity_vector, activity_vector== 4, "Sitting")
  activity_vector <- replace(activity_vector, activity_vector== 5, "Standing")
  activity_vector <- replace(activity_vector, activity_vector== 6, "Laying")
  merged_file_MEAN_SDT[["Activity_Name"]] <- activity_vector
  merged_file_MEAN_SDT <- merged_file_MEAN_SDT[,!(names(merged_file_MEAN_SDT) %in% "activity")]
  
  ############# Clean Columns names to be able to run in dply Library ########
  ####################################
  #to_summarise <- c("Subject","Activity_Name")
  data_frame_names <- names(merged_file_MEAN_SDT)
  subsetted_names <- data_frame_names[2:67]
  subbed_names <- gsub("-","_",subsetted_names)
  subbed_names_1 <- gsub(")","",subbed_names)
  subbed_names_2 <- gsub("\\(","",subbed_names_1)
  names(merged_file_MEAN_SDT) <- c("Subject",subbed_names_2,"Activity_Name")

  ############# Organize Columns ########
  ####################################
  data_names <- select(merged_file_MEAN_SDT,Subject,Activity_Name)
  data_frame_variables <- select(merged_file_MEAN_SDT,-Subject,-Activity_Name)
  
  names_data_frame <- cbind(data_names,data_frame_variables)
  
  ############# Factorize variables of Key Columns (Subject, Activity_Name) ########
  ####################################
  names_data_frame$Subject <-as.factor(names_data_frame$Subject)
  names_data_frame$Activity_Name <-as.factor(names_data_frame$Activity_Name)
  
  ############# Group and summarize data to create Tidy Data Set########
  ####################################
  grouped <- group_by(names_data_frame,Subject,Activity_Name) 
  summarised_data_frame <- summarise_each(grouped, funs(mean))
  
  
  ############# Write Data Set into Text File########
  ####################################
  write.table(summarised_data_frame,"tidy.txt", row.names = FALSE, quote = FALSE)
}

