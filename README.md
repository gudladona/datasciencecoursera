Clone the git repository in /User/yourlogin/git/

Unzip the file downloaded from the link https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip into /User/yourlogin/git/datasciencecoursera


Open RStudio and run the commands below:

setwd("/User/yourlogin/git/datasciencecoursera")

source("run_analysis.R")


Run the commad below to read the data

data <- read.table("averages.txt")