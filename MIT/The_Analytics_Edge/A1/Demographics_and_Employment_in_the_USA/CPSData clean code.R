# CPSData clean code
setwd("D:/Coding_Exercises/R/The_Analytics_Edge/Assignment_1/Demographics_and_Employment_in_the_USA")
getwd()
wrkdir <- getwd()
wrkdir


# 1.1  load and summarize dataset
CPS <- read.csv("CPSData.csv", stringsAsFactors = FALSE)
tail(CPS)
head(CPS)
# check
list.files()
ls()
dir()
objects()

str(CPS)
nrow(CPS)
ncol(CPS)

### 1.1 ex 1 How many interviewees are in the dataset?
num_interviewees <- nrow(CPS)
num_interviewees
cat("There are ", num_interviewees, " interviewees in the dataset.")
### 1.1 end

### 1.2 ex 2: What is the most common industry of employment?
# per site 
summary(CPS)
table(CPS$Industry)

#1.2 ex2 max and min industry
industry_CPS_table <- table(CPS$Industry)
industry_CPS_table
min_industry_CPS <- names(industry_CPS_table)[which.min(industry_CPS_table)]
min_industry_CPS
max_industry_CPS <- names(industry_CPS_table)[which.max(industry_CPS_table)]
max_industry_CPS
max_industry_CPS_count <- industry_CPS_table[max_industry_CPS]
max_industry_CPS_count
min_industry_CPS_count <- industry_CPS_table[min_industry_CPS]
min_industry_CPS_count

# 1.2 answer statements
cat("The most common industry of employment was ", max_industry_CPS, "with a total of ",max_industry_CPS_count, "participants.")
cat("The least common industry of employment was ", min_industry_CPS, "with a total of ",min_industry_CPS_count, "participants.")
### 1.2 end


### 1.3 ex 3 which state has the fewest interviewees?
table(CPS$State)
state_CPS_table <- table(CPS$State)
state_CPS_table
min_state_CPS <- names(state_CPS_table)[which.min(state_CPS_table)]
min_state_CPS
max_state_CPS <- names(state_CPS_table)[which.max(state_CPS_table)]
max_state_CPS
max_state_CPS_count <- state_CPS_table[max_state_CPS]
max_state_CPS_count
min_state_CPS_count <- state_CPS_table[min_state_CPS]
min_state_CPS_count

#1.3 ex 3 & 4 answers
cat(max_state_CPS," is the state with the maximum interviews of",max_state_CPS_count,",while ",min_state_CPS, " is the state with the minimum number of interviews of ",min_state_CPS_count,".") 
### 1.3 end


### 1.4 ex 5 What proportion of interviewees are citizens of the United States?
table(CPS$Citizenship)
citizenship_CPS_table <- table(CPS$Citizenship)
citizenship_CPS_table
#1.4 citizenship group name
US_citizenship_groups_list <- names(citizenship_CPS_table)
US_citizenship_groups_list
# Printing the names of each citizenship group
for (group in US_citizenship_groups_list) {
  cat("Citizenship group:", group, "\n")
}

#1.4 percentages
US_citizenship_groups_percentages <- (citizenship_CPS_table / sum(table(CPS$Citizenship)))*100
US_citizenship_groups_percentages
# 1.4 extract Naturalized 
naturalized_US_citizen_percentage <- US_citizenship_groups_percentages["Citizen, Naturalized"]
naturalized_US_citizen_percentage
native_US_citizen_percentage <- US_citizenship_groups_percentages["Citizen, Native"]
native_US_citizen_percentage
non_US_citizen_percentage <- US_citizenship_groups_percentages["Non-Citizen"]
non_US_citizen_percentage
# Constructing the statement
US_citizen_percentage_statement <- paste0(native_US_citizen_percentage, "% identify as Citizen, Native Citizen; ", naturalized_US_citizen_percentage, "% identify as Naturalized Citizen; and ", non_US_citizen_percentage, "% identify as Non-Citizen.")
US_citizen_percentage_statement
# print statement
cat(US_citizen_percentage_statement)

#1.4 non US citizen proportion
non_US_citizenship_proportion  <- citizenship_CPS_table["Non-Citizen"] /sum(table(CPS$Citizenship))*100
non_US_citizenship_proportion 
#1.4 US citizen proportion
US_citizenship_proportion <- (100 - non_US_citizenship_proportion)
US_citizenship_proportion
#1.4 alternative better method
US_citizenship_proportion <- sum(table(CPS$Citizenship)[c("Citizen, Native", "Citizen, Naturalized")]) / sum(table(CPS$Citizenship))*100
US_citizenship_proportion
### 1.4 end


### 1.5 A number of interviewees are of Hispanic ethnicity, as captured by the Hispanic variable. For which races are there at least 250 interviewees in the CPS dataset of Hispanic ethnicity? (Select all that apply.)
# ex 6 select all that apply
table(CPS$Race, CPS$Hispanic)
# specific that table classifies race as Hispanic ethnicity (1) ir not (0)
Hispanic_enthnicity_race_CPS_table <- table(CPS$Race, CPS$Hispanic)
Hispanic_enthnicity_race_CPS_table
Hispanic_ethnicity_race_over_250 <- rownames(Hispanic_enthnicity_race_CPS_table)[Hispanic_enthnicity_race_CPS_table[, "1"] > 250]
Hispanic_ethnicity_race_over_250
Hispanic_ethnicity_race_over_250_counts <- Hispanic_enthnicity_race_CPS_table[Hispanic_ethnicity_race_over_250, "1"]
Hispanic_ethnicity_race_over_250_counts
Hispanic_ethnicity_race_over_250_selected_CPS_table <- data.frame(Race = Hispanic_ethnicity_race_over_250, Count = Hispanic_ethnicity_race_over_250_counts)
Hispanic_ethnicity_race_over_250_selected_CPS_table
# sorted from least to greatest
Hispanic_ethnicity_race_over_250_selected_CPS_table_sorted <- Hispanic_ethnicity_race_over_250_selected_CPS_table[order(-Hispanic_ethnicity_race_over_250_selected_CPS_table$Count), ]
Hispanic_ethnicity_race_over_250_selected_CPS_table_sorted
# statement summary 
Hispanic_ethnicity_race_over_250_counts_statement <- paste("The following races in the survey identify as Hispanic with more than 250 entries: ",paste(Hispanic_ethnicity_race_over_250, "(",Hispanic_ethnicity_race_over_250_counts, ")", collapse = ", "), sep = "")
Hispanic_ethnicity_race_over_250_counts_statement

### text file explaining above code
# Create CPSData_Clean_Code.txt filer
# Create a character vector with the content you want to write to the file
CPSData_Clean_Code_txt <- "2. paste(\"The following races in the survey identify as Hispanic with more than 250 entries: \", ...) starts constructing the statement by providing the introductory part of the string. 3. paste(Hispanic_ethnicity_race_over_250, \"(\", Hispanic_ethnicity_race_over_250_counts, \")\", collapse = \", \") combines the race names (Hispanic_ethnicity_race_over_250) with their respective counts (Hispanic_ethnicity_race_over_250_counts), separating them with commas and enclosing the counts in parentheses. 4. sep = \"\" specifies that there should be no separator between the different parts of the string when they are concatenated."
CPSData_Clean_Code_txt
# Specify the file path and name
CPSData_Clean_Code_txt_file_path <- "D:/Coding Exercises/R/The Analytics Edge/Assignment 1/Demographics and Employment in the USA/CPSData_Clean_Code.txt"
CPSData_Clean_Code_txt_file_path
# Use the writeLines() function to write the content to the file
writeLines(CPSData_Clean_Code_txt, CPSData_Clean_Code_txt_file_path)
### end of explanation


#1.5 extra statement for most and least race which identify as Hispanic ethnicity
# Find the row with the greatest count
Hispanic_ethnicity_race_over_250_selected_CPS_table_sorted
max_Hispanic_enthnicity_race_row <- Hispanic_ethnicity_race_over_250_selected_CPS_table_sorted[which.max(Hispanic_ethnicity_race_over_250_selected_CPS_table_sorted$Count), ]
max_Hispanic_enthnicity_race_row
# Find the row with the least count
min_Hispanic_enthnicity_race_row <- Hispanic_ethnicity_race_over_250_selected_CPS_table_sorted[which.min(Hispanic_ethnicity_race_over_250_selected_CPS_table_sorted$Count), ]
min_Hispanic_enthnicity_race_row
# identify the max race
max_Hispanic_enthnicity_race <- max_Hispanic_enthnicity_race_row$Race
max_Hispanic_enthnicity_race
# max race count
max_Hispanic_enthnicity_race_count <- max_Hispanic_enthnicity_race_row$Count
max_Hispanic_enthnicity_race_count
# identify the least race
min_Hispanic_enthnicity_race <- min_Hispanic_enthnicity_race_row$Race
min_Hispanic_enthnicity_race
# least race count
min_Hispanic_enthnicity_race_count <- min_Hispanic_enthnicity_race_row$Count
min_Hispanic_enthnicity_race_count
# print statement max and least race
cat("The race with the greatest count who identifiy as Hispanic ethnicity is", max_Hispanic_enthnicity_race, "(", max_Hispanic_enthnicity_race_count, ")\n")
cat("The race with the least count is who identifiy as Hispanic ethnicity", min_Hispanic_enthnicity_race, "(", min_Hispanic_enthnicity_race_count, ")\n")

# alternative w/o using row Find the race with the least count
min_Hispanic_enthnicity_race <- names(Hispanic_ethnicity_race_over_250_counts)[which.min(Hispanic_ethnicity_race_over_250_counts)]
min_Hispanic_enthnicity_race
min_Hispanic_enthnicity_race_count <- Hispanic_ethnicity_race_over_250_counts[min_Hispanic_enthnicity_race]
min_Hispanic_enthnicity_race_count
# Find the race with the greatest count
max_Hispanic_enthnicity_race <- names(Hispanic_ethnicity_race_over_250_counts)[which.max(Hispanic_ethnicity_race_over_250_counts)]
max_Hispanic_enthnicity_race
max_Hispanic_enthnicity_race_count <- Hispanic_ethnicity_race_over_250_counts[max_Hispanic_enthnicity_race]
max_Hispanic_enthnicity_race_count
# Print the results
cat("From the survey, the race with the least count who identify to Hispanic ethnicity is", min_Hispanic_enthnicity_race, "(", min_Hispanic_enthnicity_race_count, ")\n")
cat("From the survey, the race with the greatest count who identify to Hispanic ethnicity is", max_Hispanic_enthnicity_race, "(", max_Hispanic_enthnicity_race_count, ")\n")

# 1.5 alternative easier way to max and min
# Find the maximum count
Hispanic_enthnicity_race_CPS_table
max_Hispanic_enthnicity_race_count <- max(Hispanic_enthnicity_race_CPS_table[, "1"])
max_Hispanic_enthnicity_race_count
# Find the race with the maximum count
max_Hispanic_enthnicity_race <- rownames(Hispanic_enthnicity_race_CPS_table)[which.max(Hispanic_enthnicity_race_CPS_table[, "1"])]
max_Hispanic_enthnicity_race
# Print the result
cat("From the survey: ",max_Hispanic_enthnicity_race, "(", max_Hispanic_enthnicity_race_count, ")\n")

# use gsub to switch max for min
max_Hispanic_enthnicity_race_count_string <- '# 1.5 alternative easier way to max and min
# Find the maximum count
Hispanic_enthnicity_race_CPS_table
max_Hispanic_enthnicity_race_count <- max(Hispanic_enthnicity_race_CPS_table[, "1"])
max_Hispanic_enthnicity_race_count
# Find the race with the maximum count
max_Hispanic_enthnicity_race <- rownames(Hispanic_enthnicity_race_CPS_table)[which.max(Hispanic_enthnicity_race_CPS_table[, "1"])]
max_Hispanic_enthnicity_race
# Print the result
cat("From the survey: ",max_Hispanic_enthnicity_race, "(", max_Hispanic_enthnicity_race_count, ")\n")
'
cat(max_Hispanic_enthnicity_race_count_string)
min_Hispanic_enthnicity_race_count_string <- gsub ("max", "min",max_Hispanic_enthnicity_race_count_string)
cat(min_Hispanic_enthnicity_race_count_string) # paste output below
### start paste
# 1.5 alternative easier way to min and min
# Find the minimum count
Hispanic_enthnicity_race_CPS_table
min_Hispanic_enthnicity_race_count <- min(Hispanic_enthnicity_race_CPS_table[, "1"])
min_Hispanic_enthnicity_race_count
# Find the race with the minimum count
min_Hispanic_enthnicity_race <- rownames(Hispanic_enthnicity_race_CPS_table)[which.min(Hispanic_enthnicity_race_CPS_table[, "1"])]
min_Hispanic_enthnicity_race
# Print the result, output will be pacific islander
cat("From the survey: ",min_Hispanic_enthnicity_race, "(", min_Hispanic_enthnicity_race_count, ")
")
### end paste


#1.5 find the sums of each race
# Calculate the sum of each race
Hispanic_enthnicity_race_CPS_table
Hispanic_ethnicity_race_sums <- rowSums(Hispanic_enthnicity_race_CPS_table)
Hispanic_ethnicity_race_sums 
# Display the sums of each race
for (i in 1:length(Hispanic_ethnicity_race_sums)) {
  race <- names(Hispanic_ethnicity_race_sums)[i]
  sum_value <- Hispanic_ethnicity_race_sums[i]
  print(paste(race, ":", sum_value))
}

# Get the values under "1" column
Hispanic_ethnicty_race_values_1 <- Hispanic_enthnicity_race_CPS_table[, 2]
Hispanic_ethnicty_race_values_1
# Display the values
for (i in 1:length(values)) {
  race <- names(Hispanic_ethnicty_race_values_1)[i]
  value <- Hispanic_ethnicty_race_values_1[i]
  print(paste(race, ":", value))
}
# Calculate and display the percentages
for (i in 1:length(Hispanic_ethnicty_race_values_1)) {
  race <- names(Hispanic_ethnicty_race_values_1)[i]
  value <- Hispanic_ethnicty_race_values_1[i]
  sum_value <- Hispanic_ethnicity_race_sums[i]
  Hispanic_ethnicity_race_percentage <- (value / sum_value) * 100
  print(paste(race, ":", Hispanic_ethnicity_race_percentage, "%", sep = " "))
}

# 1.5 alternative to calculate the Hispanic ethnicity percentages
Hispanic_ethnicity_race_percentages <- (Hispanic_ethnicty_race_values_1 / Hispanic_ethnicity_race_sums) * 100
Hispanic_ethnicity_race_percentages 
# Find the minimum and maximum percentages
min_Hispanic_ethnicity_race_percentage <- min(Hispanic_ethnicity_race_percentages )
min_Hispanic_ethnicity_race_percentage
max_Hispanic_ethnicity_race_percentage <- max(Hispanic_ethnicity_race_percentages )
max_Hispanic_ethnicity_race_percentage
# Identify the races with the minimum and maximum percentages
min_Hispanic_ethnicity_race_by_percent <- names(Hispanic_ethnicity_race_percentages)[which.min(Hispanic_ethnicity_race_percentages)]
min_Hispanic_ethnicity_race_by_percent
max_Hispanic_ethnicity_race_by_percent <- names(Hispanic_ethnicity_race_percentages)[which.max(Hispanic_ethnicity_race_percentages)]
max_Hispanic_ethnicity_race_by_percent
# Display the results
print(paste("Race with minimum percentage that identify with Hispanic ethnicity:", min_Hispanic_ethnicity_race_by_percent, "-", min_Hispanic_ethnicity_race_percentage, "%", sep = " "))
print(paste("Race with maximum percentage that identify with Hispanic ethnicity:", max_Hispanic_ethnicity_race_by_percent, "-", max_Hispanic_ethnicity_race_percentage, "%", sep = " "))

# 1.5 alternative to calculate the non_Hispanic ethnicity percentages
Hispanic_ethnicty_race_values_0 <- Hispanic_enthnicity_race_CPS_table[, 1]
Hispanic_ethnicty_race_values_0
non_Hispanic_ethnicity_race_percentages <- (Hispanic_ethnicty_race_values_0 / Hispanic_ethnicity_race_sums) * 100
non_Hispanic_ethnicity_race_percentages
# Find the minimum and maximum percentages
min_non_Hispanic_ethnicity_race_percentage <- min(non_Hispanic_ethnicity_race_percentages )
min_non_Hispanic_ethnicity_race_percentage
max_non_Hispanic_ethnicity_race_percentage <- max(non_Hispanic_ethnicity_race_percentages )
max_non_Hispanic_ethnicity_race_percentage
# Identify the races with the minimum and maximum percentages
min_non_Hispanic_ethnicity_race_by_percent <- names(non_Hispanic_ethnicity_race_percentages)[which.min(non_Hispanic_ethnicity_race_percentages)]
min_non_Hispanic_ethnicity_race_by_percent
max_non_Hispanic_ethnicity_race_by_percent <- names(non_Hispanic_ethnicity_race_percentages)[which.max(non_Hispanic_ethnicity_race_percentages)]
max_non_Hispanic_ethnicity_race_by_percent
# Display the results
print(paste("Race with minimum percentage that identify with non Hispanic ethnicity:", min_non_Hispanic_ethnicity_race_by_percent, "-", min_non_Hispanic_ethnicity_race_percentage, "%", sep = " "))
print(paste("Race with maximum percentage that identify with non Hispanic ethnicity:", max_non_Hispanic_ethnicity_race_by_percent, "-", max_non_Hispanic_ethnicity_race_percentage, "%", sep = " "))
### 1.5 end


# 2.1 Evaluating missing values
# ex 7 Which variables have at least one interviewee with a missing (NA) value? 
# (Select all that apply.) Check for missing values in each column and store the result in a logical vector
one_NA_values <-  sapply(CPS, function(column) anyNA(column))
one_NA_values
one_NA_values_names <- names(CPS)[one_NA_values]
one_NA_values_names

#2.2
# ex 8 test the relationship between these four variable values and whether the 
# Married variable is missing with the following commands:
table(CPS$Region, is.na(CPS$Married))
table(CPS$Sex, is.na(CPS$Married))
table(CPS$Age, is.na(CPS$Married))
table(CPS$Citizenship, is.na(CPS$Married))


#2.3 ex 9 How many states had all interviewees living in a non-metropolitan area 
# (aka they have a missing MetroAreaCode value)? 
# For this question, treat the District of Columbia as a state (even though it is not technically a state).
table(CPS$State, is.na(CPS$MetroAreaCode))
non_metropololitan_state_table <- table(CPS$State, is.na(CPS$MetroAreaCode))
non_metropololitan_state_table
# Extract the row names (State names) where the value is 0 for FALSE
states_with_no_metropolotian <- rownames(non_metropololitan_state_table)[non_metropololitan_state_table[, "FALSE"] == 0]
states_with_no_metropolotian

# Calculate the number of states where all interviewees live in a non-metropolitan area
num_states_all_non_metropolitan <- sum(non_metropololitan_state_table[, "TRUE"] == rowSums(non_metropololitan_state_table))
cat("Number of states where all interviewees live in a non-metropolitan area:", num_states_all_non_metropolitan,"are of",states_with_no_metropolotian )


# ex10 states with all metropolitan
# Extract the row names (State names) where the value is 0 for TRUE
states_with_all_metropolotian <- rownames(non_metropololitan_state_table)[non_metropololitan_state_table[, "TRUE"] == 0]
states_with_all_metropolotian 
states_with_all_metropolotian_string <- toString(states_with_all_metropolotian)
states_with_all_metropolotian_string
# Print the result
cat(states_with_all_metropolotian_string, "have all interviewees living in metropolitan areas.")


# 2.4 Ex 11 Which region of the United States has the largest proportion of interviewees living in a non-metropolitan area?
table(CPS$Region, is.na(CPS$MetroAreaCode))
non_metropolitan_region_table <- table(CPS$Region, is.na(CPS$MetroAreaCode))
non_metropolitan_region_table
# Calculate the total number of interviewees in each region
total_non_metropolitan_region_count <- rowSums(non_metropolitan_region_table)
total_non_metropolitan_region_count
# Calculate the number of interviewees in each region living in a non-metropolitan area (TRUE count)
non_metropolitan_region_count <- non_metropolitan_region_table[, "TRUE"]
non_metropolitan_region_count
# Calculate the proportion of interviewees in each region living in a non-metropolitan area
non_metropolitan_region_proportions <- non_metropolitan_region_count / total_non_metropolitan_region_count * 100
non_metropolitan_region_proportions
# Create a vector of region names
non_metropolitan_regions <- rownames(non_metropolitan_region_table)
non_metropolitan_regions
# Combine region names with their respective proportions, separated by a comma
non_metropolitan_region_proportions_string <- paste(non_metropolitan_regions, "-", round(non_metropolitan_region_proportions, 1), "%", sep = " ", collapse = ", ") 
non_metropolitan_region_proportions_string
# Print the result
cat("We can then compute the proportion of interviewees in each region that live in a non-metropolitan area:", non_metropolitan_region_proportions_string, ".")

# ex 11a max and min non metropolitan proportions
# Identify the maximum and minimum proportions
max_non_metropolitan_region_proportions <- max(non_metropolitan_region_proportions)
max_non_metropolitan_region_proportions
min_non_metropolitan_region_proportions <- min(non_metropolitan_region_proportions)
min_non_metropolitan_region_proportions
# Get the index of the maximum and minimum proportions in the vector
max_non_metropolitan_region_proportions_index <- which.max(non_metropolitan_region_proportions)
max_non_metropolitan_region_proportions_index
min_non_metropolitan_region_proportions_index <- which.min(non_metropolitan_region_proportions)
min_non_metropolitan_region_proportions_index
max_non_metropolitan_region <- non_metropolitan_regions[max_non_metropolitan_region_proportions_index]
max_non_metropolitan_region
min_non_metropolitan_region <- non_metropolitan_regions[min_non_metropolitan_region_proportions_index]
min_non_metropolitan_region
# Print the results
cat("The maximum proportion is", round(max_non_metropolitan_region_proportions , 2), "% in the", max_non_metropolitan_region, "region identified as non-metropolitan.\n")
cat("The minimum proportion is", round(min_non_metropolitan_region_proportions, 2), "% in the", min_non_metropolitan_region, "region identified as non-metropolitan.\n")

# ex 11b metropolitan region proprotions
# Calculate the number of interviewees in each region living in a metropolitan area (FALSE count)
metropolitan_region_count <- non_metropolitan_region_table[, "FALSE"]
metropolitan_region_count
# Calculate the proportion of interviewees in each region living in a non-metropolitan area
metropolitan_region_proportions <- metropolitan_region_count / total_non_metropolitan_region_count * 100
metropolitan_region_proportions
# Create a vector of region names
non_metropolitan_regions <- rownames(non_metropolitan_region_table)
non_metropolitan_regions
# Combine region names with their respective proportions, separated by a comma
metropolitan_region_proportions_string <- paste(non_metropolitan_regions, "-", round(metropolitan_region_proportions, 1), "%", sep = " ", collapse = ", ") 
metropolitan_region_proportions_string
# Print the result
cat("We can then compute the proportion of interviewees in each region that live in a metropolitan area:", metropolitan_region_proportions_string, ".")

# ex 11c identify the max and min metropolitan region proportion
# Identify the maximum and minimum proportions
max_metropolitan_region_proportions <- max(metropolitan_region_proportions)
max_metropolitan_region_proportions
min_metropolitan_region_proportions <- min(metropolitan_region_proportions)
min_metropolitan_region_proportions
# Get the index of the maximum and minimum proportions in the vector
max_metropolitan_region_proportions_index <- which.max(metropolitan_region_proportions)
max_metropolitan_region_proportions_index
min_metropolitan_region_proportions_index <- which.min(metropolitan_region_proportions)
min_metropolitan_region_proportions_index
max_metropolitan_region <- non_metropolitan_regions[max_metropolitan_region_proportions_index]
max_metropolitan_region
min_metropolitan_region <- non_metropolitan_regions[min_metropolitan_region_proportions_index]
min_metropolitan_region
# Print the results
cat("The maximum proportion is", round(max_metropolitan_region_proportions , 2), "% in the", max_metropolitan_region, "region identified as metropolitan.\n")
cat("The minimum proportion is", round(min_metropolitan_region_proportions, 2), "% in the", min_metropolitan_region, "region identified as metropolitan.\n")


#2.5 ex12 Which state has a proportion of interviewees living in a non-metropolitan area closest to 30%?
# Extract the proportions of interviewees living in non-metropolitan areas
proportions_non_metropolitan <- non_metropololitan_state_table[, "TRUE"] / rowSums(non_metropololitan_state_table)
proportions_non_metropolitan
# Find the state closest to 30% non-metropolitan living
target_proportion_30 <- 0.3  # Target proportion
target_proportion_30
closest_state_index_30 <- which.min(abs(proportions_non_metropolitan - target_proportion_30))
closest_state_index_30
closest_state_30 <- rownames(non_metropololitan_state_table)[closest_state_index_30]
closest_state_30 
closest_proportion_non_metropolitan_30 <- proportions_non_metropolitan[closest_state_index_30]
closest_proportion_non_metropolitan_30
cat("Proportion of interviewees living in a non-metropolitan area:", closest_proportion_non_metropolitan_30, "in the state of",closest_state_30,".")

#ex 13 Which state has the largest proportion of non-metropolitan interviewees, ignoring states where all interviewees were non-metropolitan?
#from website
tapply(is.na(CPS$MetroAreaCode), CPS$State, mean)
sort(tapply(is.na(CPS$MetroAreaCode), CPS$State, mean))
# create sorted table
proportions_non_metropolitan_sorted <- sort(tapply(is.na(CPS$MetroAreaCode), CPS$State, mean))
proportions_non_metropolitan_sorted
# Find the state with the largest proportion of non-metropolitan interviewees (below 100%)
max_proportion_non_metropolitan_state_under_1 <- tail(proportions_non_metropolitan_sorted[proportions_non_metropolitan_sorted < 1], 1)
max_proportion_non_metropolitan_state_under_1
# name of state
max_non_metropolitan_state_under_1 <- names(max_proportion_non_metropolitan_state_under_1)
max_non_metropolitan_state_under_1
max_proportion_non_metropolitan_state_under_1 <- max_proportion_non_metropolitan_state_under_1 * 100
max_proportion_non_metropolitan_state_under_1
# print statement
cat(paste(max_non_metropolitan_state_under_1, "is the state with the highest proportion of non-metropolitan interviewees without them all being non-metropolitan, at", round(max_proportion_non_metropolitan_state_under_1, digits = 3), "%.\n"))


# 3.1 ex 14 How many observations (codes for metropolitan areas) are there in MetroAreaMap?
# Read MetroAreaCodes.csv into MetroAreaMap data frame
MetroAreaMap <- read.csv("MetroAreaCodes.csv")
head(MetroAreaMap)
tail(MetroAreaMap)
str(MetroAreaMap)
# Read CountryCodes.csv into CountryMap data frame
CountryMap <- read.csv("CountryCodes.csv")
head(CountryMap)
tail(CountryMap)
str(CountryMap)
# How many observations (codes for metropolitan areas) are there in MetroAreaMap?
cat("There are",nrow(MetroAreaMap),"observations in the MetroAreaMap.")

#ex 15 How many observations (codes for countries) are there in CountryMap?
cat("There are",nrow(CountryMap),"observations in the CountryMap.")


#3.2 ex 16
# Store column names before the merge
before_merge <- names(CPS)
before_merge
CPS <- merge(CPS, MetroAreaMap, by.x = "MetroAreaCode", by.y = "Code", all.x = TRUE)
CPS
# Get column names after the merge
after_merge <- names(CPS)
after_merge
summary(CPS)
str(CPS)
head(CPS)
tail(CPS)

# ex16 What is the name of the variable that was added to the data frame by the merge() operation?
# Identify the added variable by comparing column names
added_variable <- setdiff(after_merge, before_merge)
added_variable
# Check if an added variable exists and print the result
if (length(added_variable) > 0) {
  print(paste(added_variable, "is the name of the variable that was added to the data frame by the merge() operation"))
} else {
  print("No variable was added by the merge() operation")
}

# ex17 How many interviewees have a missing value for the new metropolitan area variable? Note that all of these interviewees would have been removed from the merged data frame if we did not include the all.x=TRUE parameter.
# Calculate the number of missing values in the MetroArea variable
missing_values <- sum(is.na(CPS$MetroArea))
missing_values
cat('The variable MetroArea was added to the CPS data frame and it is missing', missing_values,'values.')


# 3.3 ex 18 Which of the following metropolitan areas has the largest number of interviewees?
# from site
MetroArea_table <- table(CPS$MetroArea)
MetroArea_table
summary(MetroArea_table)
# Find the city with the maximum count of interviewees
MetroArea_max_interviewees <- max(MetroArea_table)
MetroArea_max_interviewees
# cities with max count
city_in_MetroArea_max_interviewees <- names(MetroArea_table[MetroArea_table == MetroArea_max_interviewees])
city_in_MetroArea_max_interviewees
# print the result
cat("The city/cities with the largest number of interviewees is/are: ",city_in_MetroArea_max_interviewees, "with",MetroArea_max_interviewees,"interviewees.")

# ex18 choose from the following: Exercise 18
# Atlanta-Sandy Springs-Marietta, GA ; Baltimore-Towson, MD ; Boston-Cambridge-Quincy, MA-NH ; San Francisco-Oakland-Fremont, CA 
# Subset the counts for the specific metropolitan areas
selected_areas <- c("Atlanta-Sandy Springs-Marietta, GA", 
                    "Baltimore-Towson, MD", 
                    "Boston-Cambridge-Quincy, MA-NH", 
                    "San Francisco-Oakland-Fremont, CA")
# Filter the counts for the selected areas
counts_selected <- MetroArea_table[selected_areas]
counts_selected
# Find the metropolitan area(s) with the maximum count
max_counts_selected <- max(counts_selected)
max_counts_selected
MetroAreas_max_count <- names(counts_selected[counts_selected == max_counts_selected])
MetroAreas_max_count
# Display the metropolitan area(s) with the largest number of interviewees
if (length(MetroAreas_max_count) == 1) {
  cat("The metropolitan area with the largest number of interviewees is:", MetroAreas_max_count, "with", max_counts_selected, "interviewees.")
} else {
  cat("Among the provided options, multiple metropolitan areas have the largest number of interviewees:", paste(MetroAreas_max_count, collapse = ", "), "with", max_counts_selected, "interviewees each.")
}


# 3.4 ex19 Which metropolitan area has the highest proportion of interviewees of Hispanic ethnicity? Hint: Use tapply() with mean, as in the previous subproblem. Calling sort() on the output of tapply() could also be helpful here.
tapply(CPS$Hispanic, CPS$MetroArea, mean)
sort(tapply(CPS$Hispanic, CPS$MetroArea, mean))
# printed response
MetroArea_Hispanic_proportion <- tapply(CPS$Hispanic, CPS$MetroArea, mean)
MetroArea_Hispanic_proportion
# Sort the proportions in ascending order
sorted_MetroArea_Hispanic_proportions <- sort(MetroArea_Hispanic_proportion, decreasing = TRUE)
sorted_MetroArea_Hispanic_proportions
# Extract the metropolitan area(s) with the highest proportion of Hispanic interviewees
max_MetroArea_Hispanic_area <- names(sorted_MetroArea_Hispanic_proportions[1])
max_MetroArea_Hispanic_area
# Get the highest proportion of Hispanic interviewees
max_MetroArea_Hispanic_proportion <- max(sorted_MetroArea_Hispanic_proportions) * 100  # Convert to percentage
max_MetroArea_Hispanic_proportion
# Display the result
cat(sprintf("%.1f%% of the interviewees from %s are of Hispanic ethnicity, the highest proportion among metropolitan areas in the United States.", max_MetroArea_Hispanic_proportion, max_MetroArea_Hispanic_area))
# first variable and then second variable


# 3.5 ex20 determine the number of metropolitan areas in the United States from which at least 20% of interviewees are Asian.
MetroArea_Asian_proportion <-tapply(CPS$Race == "Asian", CPS$MetroArea, mean)
MetroArea_Asian_proportion 
# Filter metropolitan areas with at least 20% of interviewees as Asian
MetroArea_20_Asian_selected_areas <- names(MetroArea_Asian_proportion [MetroArea_Asian_proportion  >= 0.20])
MetroArea_20_Asian_selected_areas
# Display the selected metropolitan areas
cat(paste(MetroArea_20_Asian_selected_areas, "had at least 20% of their interviewees of the Asian race."))




