# Question 1
# Read the dataset into a data frame called london_crime.
# Then show the struture of the dataset.
london_crime <- read.csv("london-crime-data.csv", na="")
str(london_crime)

# Amalgamate the month and year variables into a new 
# variable called 'Date'
# Add a day element so the data contains dd/mm/yyyy so the 
# as.Date() can be used later

london_crime$Date <- paste("01", london_crime$month, 
                           london_crime$year, sep='/')
str(london_crime)

# Question 2
# Retain only the variables shown in the given table
# Convet the variable names to the names in the given table
# Make relevent changes to london_crime so that variables
# are names correctly and unneeded variables are removed

# First show the headers of the data frame
names(london_crime)

# Create an include list of the variables you want to keep
include_list <- london_crime[c("borough", "major_category",
                               "minor_category", "value", "Date")]
# Make the london_crime data frame to only contain the variables
# in the include list

london_crime <- include_list
str(london_crime)

# Modify and update the variable names
names(london_crime)[1] <- "Borough"
names(london_crime)[2] <- "MajorCategory"
names(london_crime)[3] <- "SubCategory"
names(london_crime)[4] <- "Value"
names(london_crime)[5] <- "CrimeDate"
names(london_crime)

# Question 3
# Convert the CrimeDate variable so that it is a variable
# of type Date.
# Confirm that the variable has been changed by showing
# the structure and content of the date variable.

# Use as.Date() function 
london_crime$CrimeDate <- as.Date(london_crime$CrimeDate, "%d/%m/%Y")

# Show struture of CrimeDate variable
str(london_crime)

#Show content of CrimeDate variable
london_crime$CrimeDate

# Question 4
# Plot a chart to show the summary of the borough information
# so that we can view where most crimes occur.
# Using the summary() function, display this data in a chart
# with suitable chart title and x and y axis subtitles.

# Check the variable type of 'Borough'
str(london_crime$Borough)

# Need to convert 'Borough' to a factor first
london_crime$Borough <- factor(london_crime$Borough, order = TRUE)

# Recheck the variable type of 'Borough'
str(london_crime$Borough)

# Now this variable is ready to be plotted
plot(london_crime$Borough)

# Use the summary() function 
summary(london_crime$Borough)

# The borough that has the highest level of crime is 
# Croydon at 5,226 crimes.

# The borough that has the lowest level of crime is 
# the City of London at 86 crimes.

# Display this data in a chart with suitable chart title 
# and x and y axis subtitles.
attach(london_crime)

display_settings <- par(no.readonly = TRUE)

plot(Borough, main = "Number of Crimes in each Borough in London",
       xlab = "Name of Borough",
       ylab = "Number of Crimes")

# Question 5
# Display the MajorCategory variable data in a pie chart.
# Using the data output from the summary() function,
# determine the highest and lowest major categories of crime
# in London. Then display this information in a pie chart 
# using the pie() function.

# First check structure of MajorCategory
str(london_crime$MajorCategory)

require(grDevices)
attach(london_crime)
values <- c(Value)
majorcategory <- c(MajorCategory)
pie(values, col = majorcategory)

# The major category that has the highest level of crimes is
# The category that had the lowest level of crimes is

#Question 6
# Categorise each bourough in the londong_crime dataset
# into the general area where it lies in London. Using the table,
# create a new variable called 'Region' and store within it the 
# correct region for each borough

london_crime$Regions <- list(East = c("Barking and Dagenham","Bexley","Greenwich",
                                      "Havering","Kingston upon Thames","Newham",
                                      "Redbridge","Wandsworth"), 
                             North = c("Barnet","Camden","Enfield","Hackney","Haringey"), 
                             West = c("Brent","Ealing","Hammersmith and Fulham","Hillingdon",
                                      "Hounslow","Richmond upon Thames","Harrow"), 
                             South = c("Bromley","Croydon","Merton","Sutton"), 
                             Central = c("Islington","Kensington and Chelsea","Lambeth",
                                         "Lewisham","Southwark","Tower Hamlets",
                                         "Waltham Forest","Westminister"))

london_crime$Regions


  

  
# Question 7
# Display which region in London has the highest recorded crime rate
# Using plot() function, show the number of reported crimes by region.
# Label and chart and its axes 

# ALTHOUGH QUESTION 7 CANNOT BE ANSWERED DUE TO QUESTION 6 NOT BEING ABLE TO
# BE ANSWERED, THIS IS THE CODE I WOULD DO IF I WAS SUCCESSFUL WITH QUESTION 6

# Check the variable type of 'Region'
str(london_crime$Region)

# Need to convert 'Borough' to a factor first
london_crime$Region <- factor(london_crime$Region, order = TRUE)

# Recheck the variable type of 'Region'
str(london_crime$Region)

# Now this variable is ready to be plotted
plot(london_crime$Region)

# Use the summary() function 
summary(london_crime$Region )

# After plotting the Region variable and reporting the summary, I would
# have been able to answer both of the questions to number 7, the questions
# being "which region had the highest number of crimes. How many crimes were 
# committed?" and "which region had the lowest number of crimes. 
# How many crimes were committed?"

# Question 8
# Extract out the subset of data that had the highest number of crimes.
# Then extract out a subset of data that had the lowest level of crimes.
# Critique and discuss the major crime category of both regions

# BECAUSE QUESTION 6 & 7 WERE UNABLE TO BE ANSWERED, QUESTION 8 CANNOT BE 
# ANSWERED IN FULL. HOWEVER, I WILL PROVIDE CODE FOR WHAT I WOULD HAVE DONE
# IF I WAS ABLE TO ANSWER Q6 & Q7.

# Assume that the North was the region with the highest number of crimes.
# To extract this as a subset, see below
attach(london_crime)
highest_region <- subset(london_crime, Region == 'North')

# Assume that the South was the region with the highest number of crimes.
# To extract this as a subset, see below
attach(london_crime)
lowest_region <- subset(london_crime, Region == 'South' )


# Question 10
# Using the write.csv() command, save the modified london_crime data
# frame as london-crime-modified.csv
write.csv(london_crime, file = "london-crime-modified.csv")




