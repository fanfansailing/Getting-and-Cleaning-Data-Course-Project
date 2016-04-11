

#HCI HAR Tidy Data Code Book


##Study Design


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 



##Attribute Information


For each record in the dataset it is provided:

An identifier of the subject who carried out the experiment.
Its activity label.
Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Triaxial Angular velocity from the gyroscope.
A 561-feature vector with time and frequency domain variables.



##Feature Selection 

*
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

*The acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). 

*Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
*Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.



##Code Book


The tidy data set contains 10299 observations with 69 variables 
*1 Subject ID 
*1 Activity ID
*1 Activity Label 
*33 Mean variables
*33 Standard deviation variables.

Below is a code book for the 66 mean and standard deviation variables in the tidy dataset. 
XYZ correspond to three variables (one for each axis). 
Each variable is further derived from mean and standard deviation estimation.



Name	                               |Time domain	                        |Frequency domain
---------------------------------------|----------------------------------------|-------------------------------------------
Body Acceleration	               |timeBodyAcceleration.XYZ	        |frequencyBodyAcceleration.XYZ
Gravity Acceleration	               |timeGravityAcceleration.XYZ	        |
Body Acceleration Jerk	               |timeBodyAccelerationJerk.XYZ	        |frequencyBodyAccelerationJerk.XYZ
Body Angular Speed	               |timeBodyAngularSpeed.XYZ	        |frequencyBodyAngularSpeed.XYZ
Body Angular Acceleration	       |timeBodyAngularAcceleration.XYZ	        |
Body Acceleration Magnitude	       |timeBodyAccelerationMagnitude	        |frequencyBodyAccelerationMagnitude
Gravity Acceleration Magnitude	       |timeGravityAccelerationMagnitude	|
Body Acceleration Jerk Magnitude       |timeBodyAccelerationJerkMagnitude	|frequencyBodyAccelerationJerkMagnitude
Body Angular Speed Magnitude	       |timeBodyAngularSpeedMagnitude	        |frequencyBodyAngularSpeedMagnitude
Body Angular Acceleration Magnitude    |timeBodyAngularAccelerationMagnitude	|frequencyBodyAngularAccelerationMagnitude

Below is a code book for the 3 remaining variables

Variable Label       |Variable                                            |Variabel Type     |Allorable Values   
---------------------|----------------------------------------------------|------------------|---------------------------------------------------------------------------------------- 
subjectId            |subject ID number                                   |int               |1-30
activityId           |activity ID number                                  |int               |1-6
activityLabel        |activity name associated with each activity number  |factor            |6 levels "WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING"
