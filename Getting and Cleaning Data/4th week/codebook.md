# Code Book #

### Getting and cleaning data process flow: ###

1. Download the data, unzip, remove zipped file and check files in folder
2. Import all tables for merge within df
3. Merge both tables - train and test
4. Append labels
5. Replace all short names with descriptive var names
6. Aggregate means in whole dataset by subject and activity
7. Output to file 

### All variables present different measurements for each subject and activity (indicated by first two columns). ###

- [1] subject                                       
- [2] activity                                      
- [3] timeBodyAccelerometerMeanX                    
- [4] timeBodyAccelerometerMeanY                    
- [5] timeBodyAccelerometerMeanZ                    
- [6] timeBodyAccelerometerStdDevX                  
- [7] timeBodyAccelerometerStdDevY                  
- [8] timeBodyAccelerometerStdDevZ                  
- [9] timeGravityAccelerometerMeanX                 
- [10] timeGravityAccelerometerMeanY                 
- [11] timeGravityAccelerometerMeanZ                 
- [12] timeGravityAccelerometerStdDevX               
- [13] timeGravityAccelerometerStdDevY               
- [14] timeGravityAccelerometerStdDevZ               
- [15] timeBodyAccelerometerJerkMeanX                
- [16] timeBodyAccelerometerJerkMeanY                
- [17] timeBodyAccelerometerJerkMeanZ                
- [18] timeBodyAccelerometerJerkStdDevX              
- [19] timeBodyAccelerometerJerkStdDevY              
- [20] timeBodyAccelerometerJerkStdDevZ              
- [21] timeBodyGyroscopeMeanX                        
- [22] timeBodyGyroscopeMeanY                        
- [23] timeBodyGyroscopeMeanZ                        
- [24] timeBodyGyroscopeStdDevX                      
- [25] timeBodyGyroscopeStdDevY                      
- [26] timeBodyGyroscopeStdDevZ                      
- [27] timeBodyGyroscopeJerkMeanX                    
- [28] timeBodyGyroscopeJerkMeanY                    
- [29] timeBodyGyroscopeJerkMeanZ                    
- [30] timeBodyGyroscopeJerkStdDevX                  
- [31] timeBodyGyroscopeJerkStdDevY                  
- [32] timeBodyGyroscopeJerkStdDevZ                  
- [33] timeBodyAccelerometerMagnitudeMean            
- [34] timeBodyAccelerometerMagnitudeStdDev          
- [35] timeGravityAccelerometerMagnitudeMean         
- [36] timeGravityAccelerometerMagnitudeStdDev       
- [37] timeBodyAccelerometerJerkMagnitudeMean        
- [38] timeBodyAccelerometerJerkMagnitudeStdDev      
- [39] timeBodyGyroscopeMagnitudeMean                
- [40] timeBodyGyroscopeMagnitudeStdDev              
- [41] timeBodyGyroscopeJerkMagnitudeMean            
- [42] timeBodyGyroscopeJerkMagnitudeStdDev          
- [43] freBodyAccelerometerMeanX                     
- [44] freBodyAccelerometerMeanY                     
- [45] freBodyAccelerometerMeanZ                     
- [46] freBodyAccelerometerStdDevX                   
- [47] freBodyAccelerometerStdDevY                   
- [48] freBodyAccelerometerStdDevZ                   
- [49] freBodyAccelerometerMeanFrequencyX            
- [50] freBodyAccelerometerMeanFrequencyY            
- [51] freBodyAccelerometerMeanFrequencyZ            
- [52] freBodyAccelerometerJerkMeanX                 
- [53] freBodyAccelerometerJerkMeanY                 
- [54] freBodyAccelerometerJerkMeanZ                 
- [55] freBodyAccelerometerJerkStdDevX               
- [56] freBodyAccelerometerJerkStdDevY               
- [57] freBodyAccelerometerJerkStdDevZ               
- [58] freBodyAccelerometerJerkMeanFrequencyX        
- [59] freBodyAccelerometerJerkMeanFrequencyY        
- [60] freBodyAccelerometerJerkMeanFrequencyZ        
- [61] freBodyGyroscopeMeanX                         
- [62] freBodyGyroscopeMeanY                         
- [63] freBodyGyroscopeMeanZ                         
- [64] freBodyGyroscopeStdDevX                       
- [65] freBodyGyroscopeStdDevY                       
- [66] freBodyGyroscopeStdDevZ                       
- [67] freBodyGyroscopeMeanFrequencyX                
- [68] freBodyGyroscopeMeanFrequencyY                
- [69] freBodyGyroscopeMeanFrequencyZ                
- [70] freBodyAccelerometerMagnitudeMean             
- [71] freBodyAccelerometerMagnitudeStdDev           
- [72] freBodyAccelerometerMagnitudeMeanFrequency    
- [73] freBodyAccelerometerJerkMagnitudeMean         
- [74] freBodyAccelerometerJerkMagnitudeStdDev       
- [75] freBodyAccelerometerJerkMagnitudeMeanFrequency
- [76] freBodyGyroscopeMagnitudeMean                 
- [77] freBodyGyroscopeMagnitudeStdDev               
- [78] freBodyGyroscopeMagnitudeMeanFrequency        
- [79] freBodyGyroscopeJerkMagnitudeMean             
- [80] freBodyGyroscopeJerkMagnitudeStdDev           
- [81] freBodyGyroscopeJerkMagnitudeMeanFrequency    