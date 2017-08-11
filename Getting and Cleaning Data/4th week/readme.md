### Run_analysis ###

R script run_analysis.R employs following tasks.

- Download the data from source and unzip within a folder ('UCI HAR Dataset'.
- Import both - train and test daasets, activities and subjects, merge all together
- Reduce dataset to only means and std deviations for each measurement.
- Cleans labels and replaces short abbrievations with longer descriptive names
- calculate means by subject and activity and save it to a file

Dependencies

run_analysis.R depends on dplyr package.