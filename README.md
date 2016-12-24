# Getting and Cleanning Data - Course Project

I have been working for several months in this Course Project for Coursera's Data Science Specialiation. It is based on a R Script, run_analysis.R which creates a tidy data set (tidy.txt) from several files.

run_analysis.R does the follwing:

1. Reads Files (Test and Train Files)
2. Merges Files
3. Creates a clean data frame keeping Subject Number, Activity and variables that contain MEANs and STDs.
4. Organices the new data frame and changes Subject and Activity variables into factors
5. Creates a new and tidy data frame grouping Subject, Activity Name and the mean of each variable

The scripts uses two R libraries: dlyr and data.frame
