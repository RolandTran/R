setwd("D:/Coding Exercises/R/The Analytics Edge/Assignment 1/An Analytical Detective")
getwd()
wrkdir <- getwd()
wrkdir
mvt <- read.csv("mvtWeek1.csv", stringsAsFactors = FALSE)
mvt
str(mvt) # 1.1 loading data to see 19161
nrow(mvt) #1.1 to see number of row

ncol(mvt) #1.2 see num of column

max(mvt$ID) #1.3 max function ID
summary(mvt)

min(mvt$Beat) #1.4

sum(mvt$Arrest == TRUE)#1.5

sum(mvt$LocationDescription == "ALLEY") #1.6
table(mvt$LocationDescription) #1.6

mvt$Date[1] #2.1

DateConvert <- as.Date(strptime(mvt$Date, "%m/%d/%y %H:%M")) #2.2
DateConvert
summary(DateConvert)
date <- as.Date("2006-05-21")#2.2
date
month_year <- format(date, "%B %Y")
print(month_year) #2.2
summary(DateConvert)

median_date <- median(DateConvert) #2.2 alternative
formatted_median <- format(median_date, "%B %Y")
formatted_median #2.2 alternative
print(formatted_median)
summary(DateConvert) #2.2

mvt$Month = months(DateConvert) #2.3
mvt$Weekday = weekdays(DateConvert) #2.3
mvt$Date = DateConvert #2.3
table(mvt$Month)
month_counts <- table(mvt$Month) # Count number of observations for each month 2.3
min_month <- names(month_counts)[which.min(month_counts)] # 2.3 Find month with fewest thefts
print(min_month)
print(paste0("The month with the fewest number of thefts is ", min_month))
cat("The month with the fewest number of thefts is", min_month, "\n") #2.3 his code uses the cat() function to print the string "The month with the fewest number of thefts is ", followed by the min_month variable, which contains the name of the month with the fewest thefts. The "\n" character is added to create a new line after the output.
max_month <- names(month_counts)[which.max(month_counts)] 
max_month # 2.3 Find month with most thefts
print(paste0("The month with the most number of thefts is ", max_month)) #2.3
cat("The month with the most number of thefts is", max_month, "\n") #2.3

table(mvt$Weekday) #2.4
weekday_counts <- table(mvt$Weekday) #2.4 Count number of observations for each weekday
weekday_counts
max_weekday <- names(weekday_counts)[which.max(weekday_counts)]
max_weekday #2.4 weekday with most vehicle thefts
print(max_weekday)
print(paste0("The weekday with the most motor vehicle thefts is ", max_weekday)) #2.4
cat("The weekday with the most motor vehicle thefts is ", max_weekday, "\n")
min_weekday <- names(weekday_counts)[which.min(weekday_counts)] #2.4 find weekday with least thefts
print(min_weekday)
cat("The weekday with the least motor vehicle thefts is ", min_weekday, "\n") #2.4
print(paste0("The weekday with the least motor vehicle thefts is ", min_weekday)) #2.4

table(mvt$Arrest,mvt$Month) #2.5
arrests <- subset(mvt, Arrest == TRUE) #2.5 # Filter data to only include observations where an arrest was made
month_counts <- table(arrests$Month) #2.5 Count number of observations for each month
max_arrest_month <- names(month_counts)[which.max(month_counts)] #2.5 Find month with largest number of arrests
print(paste0("The month with the largest number of motor vehicle thefts for which an arrest was made is ", max_arrest_month)) #2.5
cat("The month with the largest number of motor vehicle thefts for which an arrest was made is ", max_arrest_month, "\n") #2.5
print(max_arrest_month)
min_arrest_month <- names(month_counts)[which.min(month_counts)] #2.5 Find month with smallest number of arrests
min_arrest_month
print(paste0("The month with the least number of motor vehicle thefts for which an arrest was made is ", min_arrest_month))
cat("The month with the least number of motor vehicle thefts for which an arrest was made is ", min_arrest_month, "\n") #2.5

library(ggplot2) #3.1 ex12
hist(mvt$Date, breaks=100) #3.1
# Create a new variable for year
mvt$Year <- lubridate::year(mvt$Date)
monthly_counts <- aggregate(Arrest ~ Month, data = mvt, FUN = length)
monthly_counts$Month <- factor(monthly_counts$Month, levels = month.name)
monthly_counts #arrests by month

ggplot(monthly_counts, aes(x = Month, y = Arrest)) +
  geom_line() +
  xlab("Month") +
  ylab("Number of motor vehicle thefts with arrests") +
  ggtitle("Trend in motor vehicle thefts with arrests from 2002-2012")

trend <- lm(DateConvert ~ 1, data = mvt)
abline(trend, col = "red")
trend
#3.1
crime_count <- aggregate(Date ~ Year, data = mvt, FUN = length)
#line plot from 2002-2012
ggplot(crime_count, aes(x = Year, y = Date)) + geom_line() + labs(x = "Year", y = "Number of Crimes")
crime_count <- aggregate(Date ~ Year, data = mvt, FUN = length)
crime_count
mvt$Year <- as.numeric(format(mvt$Date, "%Y"))

library(ggplot2)
#3.1a
mvt$count <- 1
mvt_sub <- subset(mvt, Date >= as.Date("2005-01-01") & Date <= as.Date("2008-12-31"))
mvt_sub
# line 2005-2009 Num of crimes (Year vs Crimes)
ggplot(mvt_sub, aes(x = Date, y = count)) + geom_line() + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + ggtitle("Number of Crimes in Chicago, 2002-2012") + xlab("Year") + ylab("Number of Crimes") + xlim(as.Date("2005-01-01"), as.Date("2008-12-31"))

#2000-2013 crime noisy plot
ggplot(mvt, aes(x = Date)) + geom_line(stat = "count") + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + ggtitle("Number of Crimes in Chicago, 2002-2012") + xlab("Year") + ylab("Number of Crimes") #3.1 ex13 noisy line plot

#2005 thru 2009 noisy
ggplot(mvt, aes(x = Date)) + geom_line(stat = "count") + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + ggtitle("Number of Crimes in Chicago, 2002-2012") + xlab("Year") + ylab("Number of Crimes") + xlim(as.Date("2005-01-01"), as.Date("2008-12-31")) #3.1 ex13 zoom in 2005-2008

# 2009thru2012 noisy
ggplot(mvt, aes(x = Date)) + geom_line(stat = "count") + scale_x_date(date_breaks = "1 year", date_labels = "%Y") + ggtitle("Number of Crimes in Chicago, 2002-2012") + xlab("Year") + ylab("Number of Crimes") + xlim(as.Date("2009-01-01"), as.Date("2011-12-31")) #3.1 ex14

#boxplot
boxplot(mvt$Date ~ mvt$Arrest) #3.2 ex15
install.packages("lubridate")
> pause in code; restart R
# stop here to install packages
mvt$Year <- lubridate::year(mvt$Date)
table(mvt$Arrest, mvt$Year)
#2001 true arrest
library(lubridate)
library(dplyr)
library(base)

#3.3 ex 16
mvt_2001 <- mvt %>% filter(year(Date) == 2001)
mvt_2001
mvt_2001 <- subset(mvt, year(Date) == 2001)
mvt_2001
mvt_2001 <- base::subset(mvt, year(Date) == 2001)
mvt_2001
mvt_2001 <- dplyr::filter(mvt, year(Date) == 2001)
mvt_2001
mvt_2001 <- subset(mvt, year(Date) == 2001)
mvt_2001

#2001 
#arrest 3.3 ex16
arrest_table <- table(mvt$Arrest, mvt$Year)
arrest_table
prop.table(table(mvt_2001$Arrest))
prop_arrest_2001 <- arrest_table[2, "2001"] / sum(arrest_table[, "2001"])
prop_arrest_2001 #3.3 ex16
print(paste0("The fraction of motor vehicle thefts in 2001 for which an arrest was made is 2152/(2152+18517)= ", prop_arrest_2001)) #3.3 ex 16
cat("The fraction of motor vehicle thefts in 2001 for which an arrest was made is 1212/(1212+13068) = ", prop_arrest_2001, "\n") #3.3 ex17

#3.4 ex 17
# 2007 table
mvt_2007 <- mvt %>% filter(year(Date) == 2007)
mvt_2007
mvt_2007 <- subset(mvt, year(Date) == 2007)
mvt_2007
mvt_2007 <- base::subset(mvt, year(Date) == 2007)
mvt_2007
mvt_2007 <- dplyr::filter(mvt, year(Date) == 2007)
mvt_2007
#2007 proportion
prop.table(table(mvt_2012$Arrest))
prop_arrest_2007 <- arrest_table[2, "2007"] / sum(arrest_table[, "2007"])
prop_arrest_2007 #3.4 ex17
print(paste0("The fraction of motor vehicle thefts in 2007 for which an arrest was made is thus 1212/(1212+13068)  = ", prop_arrest_2007)) #3.5 ex18
cat("The fraction of motor vehicle thefts in 2007 for which an arrest was made is thus 1212/(1212+13068)  = ", prop_arrest_2007, "\n")

# 3.5 ex18
#2012 table
mvt_2012 <- mvt %>% filter(year(Date) == 2012)
mvt_2012
mvt_2012 <- subset(mvt, year(Date) == 2012)
mvt_2012
mvt_2012 <- base::subset(mvt, year(Date) == 2012)
mvt_2012
mvt_2012 <- dplyr::filter(mvt, year(Date) == 2012)
mvt_2012
print(paste0("The fraction of motor vehicle thefts in 2012 for which an arrest was made is thus 550/(550+13542) = ", prop_arrest_2012)) #3.5 ex18
cat("The fraction of motor vehicle thefts in 2012 for which an arrest was made is thus 550/(550+13542) = ", prop_arrest_2012, "\n")
#2012
mvt_2012 <- mvt %>% filter(year(Date) == 2012)
mvt_2012
arrest_count <- table(mvt_2012$Arrest)
arrest_count

#4.1 ex 19
#sort
sort(table(mvt$LocationDescription))
#arrest
arrest_table <- table(mvt$Arrest, mvt$Year)
arrest_table

#4.1 ex19 including others
# location 1:5
top_5locations <- names(location_table)[1:5]
top_5locations # including others
print(paste0("The top five locations where motor vehicle thefts occur, not excluding the 'Other' category, based on the provided options is the following: ", top_5locations))
cat("The top five locations where motor vehicle thefts occur, not excluding the 'Other' category, based on the provided options are the following: ", top_5locations, "\n")

#4.1 ex19 excluding others
for (i in 1:5) {cat(i, ". ", top_locations[i], "\n", sep="")}
location_table <- sort(table(mvt$LocationDescription), decreasing = TRUE) #4.1 ex19
top_locations <- names(location_table)[which(names(location_table) != "OTHER")[1:5]] #4.2 ex20
top_locations #4.1 ex19
print(paste0("The top five locations where motor vehicle thefts occur, not excluding the 'Other' category, based on the provided options is the following: ", top_locations))
cat("The top five locations where motor vehicle thefts occur, excluding the 'Other' category, based on the provided options are the following: ", top_locations, "\n") #4.2 ex20



#4.2 ex20
Top5 <- mvt[mvt$LocationDescription %in% top_locations, ] #4.2 ex20
nrow(Top5) #4.2 ex20

#Top5
Top5$LocationDescription = factor(Top5$LocationDescription)
Top5
str(Top5) #4.2 ex 20 alternative
#table
table(Top5$LocationDescription, Top5$Arrest)

#arrest
arrest_rate <- aggregate(Top5$Arrest, by=list(Top5$LocationDescription), mean)
arrest_rate <- arrest_rate[order(-arrest_rate$x),]
print(arrest_rate) #4.3 ex21 gas station has highest arrest
#arrest table
arrest_table <- aggregate(Top5$Arrest, by=list(Top5$LocationDescription), FUN=function(x) mean(x == TRUE))
arrest_table #4.2
print(arrest_table)

#4.3 ex21 gas station
# sorted arrest table
sorted_table <- arrest_table[order(arrest_table$x, decreasing=TRUE), ]
names(sorted_table) <- c("Location", "Arrest rate")
print(sorted_table) #4.3 ex21 gas station highest arrest rate 
#max location
max_loc <- levels(Top5$LocationDescription)[which.max(arrest_table[, 2])]
max_loc #4.3 ex21 explicit gas station answer 
paste0("\"", max_loc, "\" has the highest percentage of arrests among the five locations in the Top5 dataset")
cat("\"", max_loc, "\" has the highest percentage of arrests among the five locations in the Top5 dataset", sep = "")
#4.3 ex21 past answer

is.na(arrest_table)
arrest_table <- na.omit(arrest_table)
arrest_table
any(is.na(sorted_table$ArrestFraction)) # false

table(Top5$LocationDescription, Top5$Weekday) #4.4 ex22
# gas station thefts
gas_station_thefts <- subset(Top5, LocationDescription == "GAS STATION")
gas_station_thefts

# 4.4 ex22 max day gas station thefts
gas_stations <- Top5[Top5$LocationDescription == "GAS STATION", ]
gas_stations_by_day <- table(gas_stations$Weekday)
gas_stations_by_day
day_max <- names(which.max(gas_stations_by_day))
max_val <- max(gas_stations_by_day)
max_val
day_max
cat(paste("On", day_max, "the most motor vehicle thefts at gas stations happen, with a total of", max_val, "thefts.")) #4.4 ex22


# 4.4 ex22 min day gast station
day_min <- names(which.min(gas_stations_by_day)) #4.4 ex23
min_val <- min(gas_stations_by_day) #4.4 ex22
day_min
min_val
cat(paste("On", day_min, "the least motor vehicle thefts at gas stations happen, with a total of", min_val, "thefts.")) #4.4 ex22

#4.5 residential driveway fewest
table(Top5$LocationDescription, Top5$Weekday)
residential <- subset(Top5, LocationDescription == "RESIDENTIAL DRIVEWAY")
residential_weekday <- table(residential$Weekday)
theft_counts <- table(Top5$LocationDescription, Top5$Weekday)
theft_counts
residential_weekday <- theft_counts["DRIVEWAY - RESIDENTIAL", ]
residential_weekday
day_min_residential <- names(residential_weekday)[which.min(residential_weekday)]
min_val_residential <- min(residential_weekday)
day_min_residential
min_val_residential
cat(paste("On", day_min_residential, "the fewest motor vehicle thefts in driveway residential happen, with a total of", min_val_residential, "thefts."))

#4.5 max residential vehicle thefts
residential_weekday
day_max_residential <- names(residential_weekday)[which.max(residential_weekday)] #4.4 ex23 Get the day with the most thefts in driveway residential
max_val_residential <- max(residential_weekday) #4.4 ex23 Get the count of thefts on the day with the most thefts in driveway residential
day_max_residential
max_val_residential
cat(paste("On", day_max_residential, "the most motor vehicle thefts in driveway residential happen, with a total of", max_val_residential, "thefts.")) #4.4 ex23






