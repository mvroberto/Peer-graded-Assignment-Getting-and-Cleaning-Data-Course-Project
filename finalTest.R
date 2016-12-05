library(dplyr)
library(data.table)
read_files <- function(){
  
  features_file <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/features.txt")
  
  file_subject_test <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/test/subject_test.txt")
  x_test <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/test/X_test.txt")
  y_test <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/test/y_test.txt")
  

  label_and_subject_test <- cbind(file_subject_test,y_test)
 colnames(label_and_subject_test) <- c("subject","activity")
  
  merged_test_file <- cbind(label_and_subject_test,x_test)
  merged_test_file
  
  file_subject_train <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/train/subject_train.txt")
  x_train <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/train/X_train.txt")
  y_train <- read.table("/Users/robertovallemateos/Desktop/GaT_Coursera/finalTest/UCI\ HAR\ Dataset/train/y_train.txt")
  
  label_and_subject_train <- cbind(file_subject_train,y_train)
  colnames(label_and_subject_train) <- c("subject","activity")
  merged_train_file <- cbind(label_and_subject_train,x_train)
  
  
  merged_file_trainTest <- rbind(merged_test_file,merged_train_file)
  
  ##data_frame_names <- names(merged_train_file)
  
  ##measurement_names_index <- grep("V.+",data_frame_names, perl = TRUE)
  
  feature_names <- features_file$V2
  
  names <- c("subject","activity")
  names <- append(names,as.character(feature_names))
  setnames(merged_file_trainTest, old = names(merged_file_trainTest), new = names)
  
  merged_file_trainTest
  merged_file_trainTest <- merged_file_trainTest[ , !duplicated(colnames(merged_file_trainTest))]
  merged_file_MEAN_SDT <- select(merged_file_trainTest,matches("(subject)|(activity)|(mean\\()|(std\\()"))
  activity_vector <- merged_file_MEAN_SDT$activity
  activity_vector <- replace(activity_vector, activity_vector== 1, "Walking")
  activity_vector <- replace(activity_vector, activity_vector== 2, "Walking_Upstairs")
  activity_vector <- replace(activity_vector, activity_vector== 3, "Walking_Downstairs")
  activity_vector <- replace(activity_vector, activity_vector== 4, "Sitting")
  activity_vector <- replace(activity_vector, activity_vector== 5, "Standing")
  activity_vector <- replace(activity_vector, activity_vector== 6, "Laying")
  activity_vector
  merged_file_MEAN_SDT[["Activity_Name"]] <- activity_vector
  merged_file_MEAN_SDT
  
  to_read_file <- merged_file_MEAN_SDT[,3:68]
  
}


a <- function(file){
  library(dplyr)
  
  my_list <- list()
  #file %>% mutate(is.na(.),0) %>% summarise_each(funs(sum))
  list <- as.list(file)
  vectors <- as.vector(list)
  sumed_vector <- vectors[[1]]
  for(i in ncol(vectors)){
  sumed_vector <- summed_vector + sumed_vector[[i]]
  sumed_vector
  }
  
}
