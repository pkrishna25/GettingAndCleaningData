Created by Prashanth Krishnamurthy
File Name : codeBook.md

The run_analysis.R scripts downloads the file and performs the following steps to 
answers all the 5 questions and to create the tidy_data file.

Steps for Data Cleaning Process: 


1. Downloads the file and Unzips the same
2. Read Activity and Features files
3. Read Training related files. 
 - Adding Feature file column names for the training data
 - Combining the Subject, X Train and Y Train files
 - Merge with activityLabels file

4. Read Test related files
 - Adding Feature File column names for the test data
 - Combining the Subject, X Test and Y Test files
 - Merge with activityLabels file

5. Combines Training and Test data ( Question 1 )

6. Extract Std and Mean measurement columns from the combined file ( Question 2 )

7. Add descriptive activity names to name the activities in the data set ( Question 3 )

8. Appropriately labels the data set with descriptive variable names. ( Question 4 )

9. Creates a second, independent tidy data set with the average of each variable for 
each activity and each subject. ( Question 5 ) 

Last step is writing the data frame to tidy.txt and tidy.csv files which are uploaded to the Git repository

The Column Names included in the output files are listed below

[1]" Time Body Accelerometer -mean()-X"
[2]" Time Body Accelerometer -mean()-Y"              
[3]" Time Body Accelerometer -mean()-Z"              
[4]" Time Gravity Accelerometer -mean()-X"           
[5]" Time Gravity Accelerometer -mean()-Y"       
[6]" Time Gravity Accelerometer -mean()-Z"           
[7]" Time Body Accelerometer Jerk-mean()-X"     
[8]" Time Body Accelerometer Jerk-mean()-Y"          
[9]" Time Body Accelerometer Jerk-mean()-Z"     
[10]" Time Body Gyroscope -mean()-X"                  
[11]" Time Body Gyroscope -mean()-Y"           
[12]" Time Body Gyroscope -mean()-Z"                  
[13]" Time Body Gyroscope Jerk-mean()-X"          
[14]" Time Body Gyroscope Jerk-mean()-Y"              
[15]" Time Body Gyroscope Jerk-mean()-Z"        
[16]" Time Body Accelerometer Mag-mean()"             
[17]" Time Gravity Accelerometer Mag-mean()"     
[18]" Time Body Accelerometer JerkMag-mean()"         
[19]" Time Body Gyroscope Mag-mean()"              
[20]" Time Body Gyroscope JerkMag-mean()"             
[21]" Frequency Body Accelerometer -mean()-X"     
[22]" Frequency Body Accelerometer -mean()-Y"         
[23]" Frequency Body Accelerometer -mean()-Z"       
[24]" Frequency Body Accelerometer Jerk-mean()-X"     
[25]" Frequency Body Accelerometer Jerk-mean()-Y"  
[26]" Frequency Body Accelerometer Jerk-mean()-Z"     
[27]" Frequency Body Gyroscope -mean()-X"          
[28]" Frequency Body Gyroscope -mean()-Y"             
[29]" Frequency Body Gyroscope -mean()-Z"           
[30]" Frequency Body Accelerometer Mag-mean()"        
[31]" Frequency BodyBody Accelerometer JerkMag-mean()"
[32]" Frequency BodyBody Gyroscope Mag-mean()"        
[33]" Frequency BodyBody Gyroscope JerkMag-mean()"    
[34]" Time Body Accelerometer -std()-X"               
[35]" Time Body Accelerometer -std()-Y"               
[36]" Time Body Accelerometer -std()-Z"               
[37]" Time Gravity Accelerometer -std()-X"            
[38]" Time Gravity Accelerometer -std()-Y"            
[39]" Time Gravity Accelerometer -std()-Z"            
[40]" Time Body Accelerometer Jerk-std()-X"           
[41]" Time Body Accelerometer Jerk-std()-Y"           
[42]" Time Body Accelerometer Jerk-std()-Z"           
[43]" Time Body Gyroscope -std()-X"                   
[44]" Time Body Gyroscope -std()-Y"                   
[45]" Time Body Gyroscope -std()-Z"                   
[46]" Time Body Gyroscope Jerk-std()-X"               
[47]" Time Body Gyroscope Jerk-std()-Y"                
[48]" Time Body Gyroscope Jerk-std()-Z"               
[49]" Time Body Accelerometer Mag-std()"               
[50]" Time Gravity Accelerometer Mag-std()"           
[51]" Time Body Accelerometer JerkMag-std()"           
[52]" Time Body Gyroscope Mag-std()"                  
[53]" Time Body Gyroscope JerkMag-std()"               
[54]" Frequency Body Accelerometer -std()-X"          
[55]" Frequency Body Accelerometer -std()-Y"        
[56]" Frequency Body Accelerometer -std()-Z"          
[57]" Frequency Body Accelerometer Jerk-std()-X"      
[58]" Frequency Body Accelerometer Jerk-std()-Y"      
[59]" Frequency Body Accelerometer Jerk-std()-Z"     
[60]" Frequency Body Gyroscope -std()-X"              
[61]" Frequency Body Gyroscope -std()-Y"            
[62]" Frequency Body Gyroscope -std()-Z"              
[63]" Frequency Body Accelerometer Mag-std()"     
[64]" Frequency BodyBody Accelerometer JerkMag-std()" 
[65]" Frequency BodyBody Gyroscope Mag-std()"      
[66]" Frequency BodyBody Gyroscope JerkMag-std()"     
[67]"ActivityID"                                   
[68]"subjectID"                                       
[69]"ActivityDescName"                                