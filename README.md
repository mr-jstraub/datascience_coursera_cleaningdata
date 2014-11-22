### Cleaning data from the "Human Activity Recognition Using Smartphones Dataset" experiment

The `run_analysis.R` script will download the dataset from the experiment about human activity recognition conducted by the University of Genoa. The dataset is split into a training and a test dataset and contains the results of the experiment regarding the 6 activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) of the 30 volunteers/subjects.

The following tasks are covered by the R-script:
* Download and extract the data zip-file into the current working directory
* Read and merge the training and test datasets
* Clean and appropriately name the variables of the dataset
* Insert descriptive activity names to name the numerical activities
* Extract measurements mean and standard deviation
* Dump results to the current working directory

In addition to the above tasks, a second dataset will be created. This dataset is based on the tidy data from the first part and will contain the average of each variable for each activity and each subject.

More information about the experiment can be found [here](Extract measurements mean and standard deviation) and the url of the datasets (zip) is (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

#### Columns/Variable

The final dataset contains the columns:
- Time_BodyAcceleration_mean_X
- Time_BodyAcceleration_mean_Y
- Time_BodyAcceleration_mean_Z
- Time_BodyAcceleration_std_X
- Time_BodyAcceleration_std_Y
- Time_BodyAcceleration_std_Z
- Time_GravityAcceleration_mean_X
- Time_GravityAcceleration_mean_Y
- Time_GravityAcceleration_mean_Z
- Time_GravityAcceleration_std_X
- Time_GravityAcceleration_std_Y
- Time_GravityAcceleration_std_Z
- Time_BodyAccelerationJerk_mean_Xf
- Time_BodyAccelerationJerk_mean_Y
- Time_BodyAccelerationJerk_mean_Z
- Time_BodyAccelerationJerk_std_X
- Time_BodyAccelerationJerk_std_Y
- Time_BodyAccelerationJerk_std_Z
- Time_BodyGyroscope_mean_X
- Time_BodyGyroscope_mean_Y
- Time_BodyGyroscope_mean_Z
- Time_BodyGyroscope_std_X
- Time_BodyGyroscope_std_Y
- Time_BodyGyroscope_std_Z
- Time_BodyGyroscopeJerk_mean_X
- Time_BodyGyroscopeJerk_mean_Y
- Time_BodyGyroscopeJerk_mean_Z
- Time_BodyGyroscopeJerk_std_X
- Time_BodyGyroscopeJerk_std_Y
- Time_BodyGyroscopeJerk_std_Z
- Time_BodyAccelerationMagnitude_mean
- Time_BodyAccelerationMagnitude_std
- Time_GravityAccelerationMagnitude_mean
- Time_GravityAccelerationMagnitude_std
- Time_BodyAccelerationJerkMagnitude_mean
- Time_BodyAccelerationJerkMagnitude_std
- Time_BodyGyroscopeMagnitude_mean
- Time_BodyGyroscopeMagnitude_std
- Time_BodyGyroscopeJerkMagnitude_mean
- Time_BodyGyroscopeJerkMagnitude_std
- Frequency_BodyAcceleration_mean_X
- Frequency_BodyAcceleration_mean_Y
- Frequency_BodyAcceleration_mean_Z
- Frequency_BodyAcceleration_std_X
- Frequency_BodyAcceleration_std_Y
- Frequency_BodyAcceleration_std_Z
- Frequency_BodyAccelerationJerk_mean_X
- Frequency_BodyAccelerationJerk_mean_Y
- Frequency_BodyAccelerationJerk_mean_Z
- Frequency_BodyAccelerationJerk_std_X
- Frequency_BodyAccelerationJerk_std_Y
- Frequency_BodyAccelerationJerk_std_Z
- Frequency_BodyGyroscope_mean_X
- Frequency_BodyGyroscope_mean_Y
- Frequency_BodyGyroscope_mean_Z
- Frequency_BodyGyroscope_std_X
- Frequency_BodyGyroscope_std_Y
- Frequency_BodyGyroscope_std_Z
- Frequency_BodyAccelerationMagnitude_mean
- Frequency_BodyAccelerationMagnitude_std
- Frequency_BodyAccelerationJerkMagnitude_mean
- Frequency_BodyAccelerationJerkMagnitude_std
- Frequency_BodyGyroscopeMagnitude_mean
- Frequency_BodyGyroscopeMagnitude_std
- Frequency_BodyGyroscopeJerkMagnitude_mean
- Frequency_BodyGyroscopeJerkMagnitude_std

The variables of this dataset come from the accelerometer and gyroscope 3-axial raw signals Time_Acceleration-XYZ and Time_Gyroscope-XYZ. The time domain signals (prefix 'Time') were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (Time_BodyAcceleration-XYZ and Time_GravityAcceleration-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (Time_BodyAccelerationJerk-XYZ and Time_BodyGyroscopeJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (Time_BodyAccelerationMagnitude, Time_GravityAccelerationMagnitude, Time_BodyAccelerationJerkMagnitude, Time_BodyGyroscopeMagnitude, Time_BodyGyroscopeJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing Frequency_BodyAcceleration-XYZ, Frequency_BodyAccelerationJerk-XYZ, Frequency_BodyGyroscope-XYZ, Frequency_BodyAccelerationJerkMagnitude, Frequency_BodyGyroscopeMagnitude, Frequency_BodyGyroscopeJerkMagnitude.

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*This column description has been taken from the Readme file of the original dataset of the University of Genoa.*
