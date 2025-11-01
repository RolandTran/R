# set wdls
setwd("D:/Coding_Exercises/R/The_Analytics_Edge/Assignment_1/Stock_Dynamics")
getwd()
wrkdir <- getwd()
wrkdir
list.files()


# useful sites
# www.statmethods.net
# www.rseek.org
# www.ats.ucla.edu/stat/r/
# finzi.psych.upenn.edu/searh.html

# start assignment

# List all files with the ".csv.csv" extension in the current directory
files <- list.files(pattern = "\\.csv\\.csv$")

# Rename each file to have a ".csv" extension
for (file in files) {
  new_file <- gsub("\\.csv\\.csv$", ".csv", file)
  file.rename(file, new_file)
}

# read files 
IBM <- read.csv("IBMStock.csv", stringsAsFactors = FALSE)
GE <- read.csv("GEStock.csv", stringsAsFactors = FALSE)
ProcterGamble <- read.csv("ProcterGambleStock.csv", stringsAsFactors = FALSE)
CocaCola <- read.csv("CocaColaStock.csv", stringsAsFactors = FALSE)
Boeing <- read.csv("BoeingStock.csv", stringsAsFactors = FALSE)
head(GE)
tail(GE)

# Create a new text file and write in it
cat("To read csv file, must use stringsAsFactors = FALSE", file = "NotesStockDynamics.txt")
# Add new text to an existing text file
cat("\n You may not want the character columns in your CSV file to be converted into factors, set stringsAsFactors = FALSE to prevent this conversion.", file = "NotesStockDynamics.txt", append = TRUE)
cat("\n working with text data that is not categorical (i.e., where the values should be treated as characters rather than levels in a factor variable), you would want to set stringsAsFactors = FALSE to prevent R from automatically converting the text into factors. This can also be useful when working with large datasets, as converting columns to factors can use up a lot of memory..", file = "NotesStockDynamics.txt", append = TRUE)

# error due to smart quotes
GE$Date <- as.Date(GE$Date, “%m/%d/%y”) 
#above error due to use of "smart quotes"

# 1.1 summary statistics ex1
IBM$Date <- as.Date(IBM$Date, "%m/%d/%y")
# Convert the date columns to date objects
GE$Date <- as.Date(GE$Date, "%m/%d/%y")
CocaCola$Date <- as.Date(CocaCola$Date, "%m/%d/%y")
ProcterGamble$Date <- as.Date(ProcterGamble$Date, "%m/%d/%y")
Boeing$Date <- as.Date(Boeing$Date, "%m/%d/%y")

#1.1 ex 1
# Check the number of observations in each dataset
nrow(IBM)
nrow(GE)
nrow(CocaCola)
nrow(ProcterGamble)
nrow(Boeing)
cat("There are ", nrow(Boeing), "observations in each data set.")
str(GE)


# 1.2 earliest year in dataset
# IBM Find the minimum and maximum dates in the dataset
IBM_min_date <- min(IBM$Date)
IBM_min_date
IBM_min_date <- as.Date(IBM_min_date, format = "%Y-%m-%d")
IBM_min_date
IBM_formatted_min_date <- format(IBM_min_date, "%B %d, %Y")
IBM_formatted_min_date
# same early and latest year in each dataset
cat("The earliest date in our dataset is on ",IBM_formatted_min_date, ".")
# 1.2 extra; get stock price on min date
IBM_price_at_min_date <- IBM$StockPrice[which(IBM$Date == IBM_min_date)]
IBM_price_at_min_date
cat("IBM's stock price was $", IBM_price_at_min_date, "on", IBM_formatted_min_date, ".")
summary(IBM)

# switch IBM to GE
IBM_price_at_min_date_string <- '
# 1.2 earliest year in dataset
# IBM Find the minimum and maximum dates in the dataset
IBM_min_date <- min(IBM$Date)
IBM_min_date
IBM_min_date <- as.Date(IBM_min_date, format = "%Y-%m-%d")
IBM_min_date
IBM_formatted_min_date <- format(IBM_min_date, "%B %d, %Y")
IBM_formatted_min_date
# same early and latest year in each dataset
cat("The earliest date in our dataset is on ",IBM_formatted_min_date, "." )
# 1.2 extra; get stock price on min date
IBM_price_at_min_date <- IBM$StockPrice[which(IBM$Date == IBM_min_date)]
IBM_price_at_min_date
cat(" IBM\'s stock price was $", IBM_price_at_min_date, "on", IBM_formatted_min_date, ".")
summary(IBM)
'
cat(IBM_price_at_min_date_string)
# use gsub to convert IBM to GE
GE_price_at_min_date_string <- gsub("IBM", "GE", IBM_price_at_min_date_string)
cat(GE_price_at_min_date_string) #paste 
# 1.2 earliest year in dataset
# GE Find the minimum and maximum dates in the dataset
GE_min_date <- min(GE$Date)
GE_min_date
GE_min_date <- as.Date(GE_min_date, format = "%Y-%m-%d")
GE_min_date
GE_formatted_min_date <- format(GE_min_date, "%B %d, %Y")
GE_formatted_min_date
# same early and latest year in each dataset
cat("The earliest date in our dataset is on ",GE_formatted_min_date, "." )
# 1.2 extra; get stock price on min date
GE_price_at_min_date <- GE$StockPrice[which(GE$Date == GE_min_date)]
GE_price_at_min_date
cat(" GE's stock price was $", GE_price_at_min_date, "on", GE_formatted_min_date, ".")
summary(GE)

# short methond using eval(parse)
eval(parse(text = GE_price_at_min_date_string)) #faster

# 1.2 min date IBM to Boeing(3)
# short methond using eval(parse)
Boeing_price_at_min_date_string <- gsub("IBM", "Boeing", IBM_price_at_min_date_string)
cat(Boeing_price_at_min_date_string) # paste below
### start paste
# 1.2 earliest year in dataset
# Boeing Find the minimum and maximum dates in the dataset
Boeing_min_date <- min(Boeing$Date)
Boeing_min_date
Boeing_min_date <- as.Date(Boeing_min_date, format = "%Y-%m-%d")
Boeing_min_date
Boeing_formatted_min_date <- format(Boeing_min_date, "%B %d, %Y")
Boeing_formatted_min_date
# same early and latest year in each dataset
cat("The earliest date in our dataset is on ",Boeing_formatted_min_date, "." )
# 1.2 extra; get stock price on min date
Boeing_price_at_min_date <- Boeing$StockPrice[which(Boeing$Date == Boeing_min_date)]
Boeing_price_at_min_date
cat(" Boeing's stock price was $", Boeing_price_at_min_date, "on", Boeing_formatted_min_date, ".")
summary(Boeing)
### end paste
eval(parse(text = Boeing_price_at_min_date_string)) #faster

# 1.2 extra sub IBM to CocaCola(4)
# short methond using eval(parse)
CocaCola_price_at_min_date_string <- gsub("IBM", "CocaCola", IBM_price_at_min_date_string)
cat(CocaCola_price_at_min_date_string) # paste below
# 1.2 earliest year in dataset
# CocaCola Find the minimum and maximum dates in the dataset
CocaCola_min_date <- min(CocaCola$Date)
CocaCola_min_date
CocaCola_min_date <- as.Date(CocaCola_min_date, format = "%Y-%m-%d")
CocaCola_min_date
CocaCola_formatted_min_date <- format(CocaCola_min_date, "%B %d, %Y")
CocaCola_formatted_min_date
# same early and latest year in each dataset
cat("The earliest date in our dataset is on ",CocaCola_formatted_min_date, "." )
# 1.2 extra; get stock price on min date
CocaCola_price_at_min_date <- CocaCola$StockPrice[which(CocaCola$Date == CocaCola_min_date)]
CocaCola_price_at_min_date
cat(" CocaCola's stock price was $", CocaCola_price_at_min_date, "on", CocaCola_formatted_min_date, ".")
summary(CocaCola)
eval(parse(text = CocaCola_price_at_min_date_string)) #faster

# 1.2 extra sub IBM to ProcterGamble(5)
# short methond using eval(parse)
ProcterGamble_price_at_min_date_string <- gsub("IBM", "ProcterGamble", IBM_price_at_min_date_string)
cat(ProcterGamble_price_at_min_date_string)
# 1.2 earliest year in dataset
# 1.2 earliest year in dataset
# ProcterGamble Find the minimum and maximum dates in the dataset
ProcterGamble_min_date <- min(ProcterGamble$Date)
ProcterGamble_min_date
ProcterGamble_min_date <- as.Date(ProcterGamble_min_date, format = "%Y-%m-%d")
ProcterGamble_min_date
ProcterGamble_formatted_min_date <- format(ProcterGamble_min_date, "%B %d, %Y")
ProcterGamble_formatted_min_date
# same early and latest year in each dataset
cat("The earliest date in our dataset is on ",ProcterGamble_formatted_min_date, "." )
# 1.2 extra; get stock price on min date
ProcterGamble_price_at_min_date <- ProcterGamble$StockPrice[which(ProcterGamble$Date == ProcterGamble_min_date)]
ProcterGamble_price_at_min_date
cat(" ProcterGamble's stock price was $", ProcterGamble_price_at_min_date, "on", ProcterGamble_formatted_min_date, ".")
summary(ProcterGamble)
eval(parse(text = ProcterGamble_price_at_min_date_string)) #faster


# 1.2 which stock had the lowest stock price at the earliest date
min_stock_price_earliest_date <- min(ProcterGamble_price_at_min_date, IBM_price_at_min_date, GE_price_at_min_date, Boeing_price_at_min_date, CocaCola_price_at_min_date)
min_stock_price_earliest_date

# 1.2 paste comments lowest stock price
ProcterGamble_price_at_min_date_text <- paste(" ProcterGamble's stock price was $", ProcterGamble_price_at_min_date, "on", ProcterGamble_formatted_min_date, ".")
ProcterGamble_price_at_min_date_text
CocaCola_price_at_min_date_text <- paste(" CocaCola's stock price was $", CocaCola_price_at_min_date, "on", CocaCola_formatted_min_date, ".")
CocaCola_price_at_min_date_text
Boeing_price_at_min_date_text <- paste(" Boeing's stock price was $", Boeing_price_at_min_date, "on", Boeing_formatted_min_date, ".")
Boeing_price_at_min_date_text
GE_price_at_min_date_text <- paste(" GE's stock price was $", GE_price_at_min_date, "on", GE_formatted_min_date, ".")
GE_price_at_min_date_text
IBM_price_at_min_date_text <- paste("IBM's stock price was $", IBM_price_at_min_date, "on", IBM_formatted_min_date, ".")
IBM_price_at_min_date_text

# similar in java
if (min_stock_price_earliest_date == IBM_price_at_min_date) {
  min_stock_price_earliest_date_name <- IBM_price_at_min_date_text
} else if (min_stock_price_earliest_date == CocaCola_price_at_min_date) {
  min_stock_price_earliest_date_name <- CocaCola_price_at_min_date_text
} else if (min_stock_price_earliest_date == GE_price_at_min_date) {
  min_stock_price_earliest_date_name <- GE_price_at_min_date_text
} else if (min_stock_price_earliest_date == ProcterGamble_price_at_min_date) {
  min_stock_price_earliest_date_name <- ProcterGamble_price_at_min_date_text
} else {
  min_stock_price_earliest_date_name <- Boeing_price_at_min_date_text
}
cat(min_stock_price_earliest_date_name)
# prints out the stock with the min mean stock price over the period
cat(min_stock_price_earliest_date_name, " This represents the minimum stock price of all 5 stocks on this date.")


#1.2 find the max stock price at earliest date
# 1.2 which stock had the lowest stock price at the earliest date
max_stock_price_earliest_date <- max(ProcterGamble_price_at_min_date, IBM_price_at_min_date, GE_price_at_min_date, Boeing_price_at_min_date, CocaCola_price_at_min_date)
max_stock_price_earliest_date

# 1.2 paste comments lowest stock price
ProcterGamble_price_at_min_date_text <- paste(" ProcterGamble's stock price was $", ProcterGamble_price_at_min_date, "on", ProcterGamble_formatted_min_date, ".")
ProcterGamble_price_at_min_date_text
CocaCola_price_at_min_date_text <- paste(" CocaCola's stock price was $", CocaCola_price_at_min_date, "on", CocaCola_formatted_min_date, ".")
CocaCola_price_at_min_date_text
Boeing_price_at_min_date_text <- paste(" Boeing's stock price was $", Boeing_price_at_min_date, "on", Boeing_formatted_min_date, ".")
Boeing_price_at_min_date_text
GE_price_at_min_date_text <- paste(" GE's stock price was $", GE_price_at_min_date, "on", GE_formatted_min_date, ".")
GE_price_at_min_date_text
IBM_price_at_min_date_text <- paste("IBM's stock price was $", IBM_price_at_min_date, "on", IBM_formatted_min_date, ".")
IBM_price_at_min_date_text

# similar in java
if (max_stock_price_earliest_date == IBM_price_at_min_date) {
  max_stock_price_earliest_date_name <- IBM_price_at_min_date_text
} else if (max_stock_price_earliest_date == CocaCola_price_at_min_date) {
  max_stock_price_earliest_date_name <- CocaCola_price_at_min_date_text
} else if (max_stock_price_earliest_date == GE_price_at_min_date) {
  max_stock_price_earliest_date_name <- GE_price_at_min_date_text
} else if (max_stock_price_earliest_date == ProcterGamble_price_at_min_date) {
  max_stock_price_earliest_date_name <- ProcterGamble_price_at_min_date_text
} else {
  max_stock_price_earliest_date_name <- Boeing_price_at_min_date_text
}
cat(max_stock_price_earliest_date_name)
# prints out the stock with the min mean stock price over the period
cat(max_stock_price_earliest_date_name, " This represents the maximum stock price of all 5 stocks on this date.")


# 1.3 latest year in our dataset; switch min to max
cat(IBM_price_at_min_date_string)
IBM_price_at_max_date_string <- gsub("min", "max", IBM_price_at_min_date_string)
cat(IBM_price_at_max_date_string) #paste to get max year data
#make minor edits
# 1.3 latest year in dataset
# IBM Find the latest dates in the dataset
IBM_max_date <- max(IBM$Date)
IBM_max_date
IBM_max_date <- as.Date(IBM_max_date, format = "%Y-%m-%d")
IBM_max_date
IBM_formatted_max_date <- format(IBM_max_date, "%B %d, %Y")
IBM_formatted_max_date
# same early and latest year in each dataset
cat("The latest date in our dataset is on ",IBM_formatted_max_date, "." )
# 1.2 extra; get stock price on max date
IBM_price_at_max_date <- IBM$StockPrice[which(IBM$Date == IBM_max_date)]
IBM_price_at_max_date
cat("IBM's stock price was $", IBM_price_at_max_date, "on", IBM_formatted_max_date, ".")
summary(IBM)

# slightly modify with edits
IBM_price_at_max_date_string <-'# 1.3 latest year in dataset
# IBM Find the latest dates in the dataset
IBM_max_date <- max(IBM$Date)
IBM_max_date
IBM_max_date <- as.Date(IBM_max_date, format = "%Y-%m-%d")
IBM_max_date
IBM_formatted_max_date <- format(IBM_max_date, "%B %d, %Y")
IBM_formatted_max_date
# same early and latest year in each dataset
cat("The latest date in our dataset is on ",IBM_formatted_max_date, "." )
# 1.2 extra; get stock price on max date
IBM_price_at_max_date <- IBM$StockPrice[which(IBM$Date == IBM_max_date)]
IBM_price_at_max_date
cat(" IBM\'s stock price was $", IBM_price_at_max_date, "on", IBM_formatted_max_date, ".")
summary(IBM)'
cat(IBM_price_at_max_date_string)

# 1.3 switch from IBM(1) to GE(2)
GE_price_at_max_date_string <- gsub("IBM", "GE", IBM_price_at_max_date_string)
cat(GE_price_at_max_date_string) # paste below
# 1.3 latest year in dataset
# GE Find the latest dates in the dataset
GE_max_date <- max(GE$Date)
GE_max_date
GE_max_date <- as.Date(GE_max_date, format = "%Y-%m-%d")
GE_max_date
GE_formatted_max_date <- format(GE_max_date, "%B %d, %Y")
GE_formatted_max_date
# same early and latest year in each dataset
cat("The latest date in our dataset is on ",GE_formatted_max_date, "." )
# 1.2 extra; get stock price on max date
GE_price_at_max_date <- GE$StockPrice[which(GE$Date == GE_max_date)]
GE_price_at_max_date
cat(" GE's stock price was $", GE_price_at_max_date, "on", GE_formatted_max_date, ".")
#alternative shorter parse
GE_price_at_max_date_string <- gsub("IBM", "GE", IBM_price_at_max_date_string)
eval(parse(text = GE_price_at_max_date_string)) #faster

# 1.3 switch from IBM to Boeing(3)
#alternative shorter parse
Boeing_price_at_max_date_string <- gsub("IBM", "Boeing", IBM_price_at_max_date_string)
cat(Boeing_price_at_max_date_string) # paste below
# 1.3 latest year in dataset
# Boeing Find the latest dates in the dataset
Boeing_max_date <- max(Boeing$Date)
Boeing_max_date
Boeing_max_date <- as.Date(Boeing_max_date, format = "%Y-%m-%d")
Boeing_max_date
Boeing_formatted_max_date <- format(Boeing_max_date, "%B %d, %Y")
Boeing_formatted_max_date
# same early and latest year in each dataset
cat("The latest date in our dataset is on ",Boeing_formatted_max_date, "." )
# 1.2 extra; get stock price on max date
Boeing_price_at_max_date <- Boeing$StockPrice[which(Boeing$Date == Boeing_max_date)]
Boeing_price_at_max_date
cat(" Boeing's stock price was $", Boeing_price_at_max_date, "on", Boeing_formatted_max_date, ".")
# end paste
eval(parse(text = Boeing_price_at_max_date_string)) #faster

# 1.3 switch from IBM to CocaCola(4)
#alternative shorter parse
CocaCola_price_at_max_date_string <- gsub("IBM", "CocaCola", IBM_price_at_max_date_string)
cat(CocaCola_price_at_max_date_string) # paste below
# 1.3 latest year in dataset
# CocaCola Find the latest dates in the dataset
CocaCola_max_date <- max(CocaCola$Date)
CocaCola_max_date
CocaCola_max_date <- as.Date(CocaCola_max_date, format = "%Y-%m-%d")
CocaCola_max_date
CocaCola_formatted_max_date <- format(CocaCola_max_date, "%B %d, %Y")
CocaCola_formatted_max_date
# same early and latest year in each dataset
cat("The latest date in our dataset is on ",CocaCola_formatted_max_date, "." )
# 1.2 extra; get stock price on max date
CocaCola_price_at_max_date <- CocaCola$StockPrice[which(CocaCola$Date == CocaCola_max_date)]
CocaCola_price_at_max_date
cat(" CocaCola's stock price was $", CocaCola_price_at_max_date, "on", CocaCola_formatted_max_date, ".")
eval(parse(text = CocaCola_price_at_max_date_string)) #faster

# 1.3 switch from GE to ProcterGamble(5)
ProcterGamble_price_at_max_date_string <- gsub("IBM", "ProcterGamble", IBM_price_at_max_date_string)
cat(ProcterGamble_price_at_max_date_string) # paste below
# 1.3 latest year in dataset
# ProcterGamble Find the latest dates in the dataset
ProcterGamble_max_date <- max(ProcterGamble$Date)
ProcterGamble_max_date
ProcterGamble_max_date <- as.Date(ProcterGamble_max_date, format = "%Y-%m-%d")
ProcterGamble_max_date
ProcterGamble_formatted_max_date <- format(ProcterGamble_max_date, "%B %d, %Y")
ProcterGamble_formatted_max_date
# same early and latest year in each dataset
cat("The latest date in our dataset is on ",ProcterGamble_formatted_max_date, "." )
# 1.2 extra; get stock price on max date
ProcterGamble_price_at_max_date <- ProcterGamble$StockPrice[which(ProcterGamble$Date == ProcterGamble_max_date)]
ProcterGamble_price_at_max_date
cat(" ProcterGamble's stock price was $", ProcterGamble_price_at_max_date, "on", ProcterGamble_formatted_max_date, ".")
# end of paste
eval(parse(text = ProcterGamble_price_at_max_date_string)) #faster

# 1.3 price at max date
min_stock_price_latest_date_string <-' # 1.2 which stock had the lowest stock price at the earliest date
min_stock_price_earliest_date <- min(ProcterGamble_price_at_min_date, IBM_price_at_min_date, GE_price_at_min_date, Boeing_price_at_min_date, CocaCola_price_at_min_date)
min_stock_price_earliest_date

# 1.2 paste comments lowest stock price
ProcterGamble_price_at_min_date_text <- paste(" ProcterGamble\'s stock price was $", ProcterGamble_price_at_min_date, "on", ProcterGamble_formatted_min_date, ".")
ProcterGamble_price_at_min_date_text
CocaCola_price_at_min_date_text <- paste(" CocaCola\'s stock price was $", CocaCola_price_at_min_date, "on", CocaCola_formatted_min_date, ".")
CocaCola_price_at_min_date_text
Boeing_price_at_min_date_text <- paste(" Boeing\'s stock price was $", Boeing_price_at_min_date, "on", Boeing_formatted_min_date, ".")
Boeing_price_at_min_date_text
GE_price_at_min_date_text <- paste(" GE\'s stock price was $", GE_price_at_min_date, "on", GE_formatted_min_date, ".")
GE_price_at_min_date
IBM_price_at_min_date_text <- paste("IBM\'s stock price was $", IBM_price_at_min_date, "on", IBM_formatted_min_date, ".")
IBM_price_at_min_date_text

# similar in java
if (min_stock_price_earliest_date == IBM_price_at_min_date) {
  min_stock_price_earliest_date_name <- IBM_price_at_min_date_text
} else if (min_stock_price_earliest_date == CocaCola_price_at_min_date) {
  min_stock_price_earliest_date_name <- CocaCola_price_at_min_date_text
} else if (min_stock_price_earliest_date == GE_price_at_min_date) {
  min_stock_price_earliest_date_name <- GE_price_at_min_date_text
} else if (min_stock_price_earliest_date == ProcterGamble_price_at_min_date) {
  min_stock_price_earliest_date_name <- ProcterGamble_price_at_min_date_text
} else {
  min_stock_price_earliest_date_name <- Boeing_price_at_min_date_text
}
cat(min_stock_price_earliest_date_name)
# prints out the stock with the min mean stock price over the period
cat(min_stock_price_earliest_date_name, " This represents the minimum stock price of all 5 stocks on this earliest date.")
'

# 1.3 switch earliest to latest
max_stock_price_latest_date_string <- gsub("earliest", "latest",min_stock_price_latest_date_string )
cat(max_stock_price_latest_date_string)
#1.3 switch min to max
max_stock_price_latest_date_string <- gsub("min", "max",max_stock_price_latest_date_string )
cat(max_stock_price_latest_date_string) # paste below
# start paste here
# 1.2 which stock had the lowest stock price at the latest date
max_stock_price_latest_date <- max(ProcterGamble_price_at_max_date, IBM_price_at_max_date, GE_price_at_max_date, Boeing_price_at_max_date, CocaCola_price_at_max_date)
max_stock_price_latest_date

# 1.2 paste comments lowest stock price
ProcterGamble_price_at_max_date_text <- paste(" ProcterGamble's stock price was $", ProcterGamble_price_at_max_date, "on", ProcterGamble_formatted_max_date, ".")
ProcterGamble_price_at_max_date_text
CocaCola_price_at_max_date_text <- paste(" CocaCola's stock price was $", CocaCola_price_at_max_date, "on", CocaCola_formatted_max_date, ".")
CocaCola_price_at_max_date_text
Boeing_price_at_max_date_text <- paste(" Boeing's stock price was $", Boeing_price_at_max_date, "on", Boeing_formatted_max_date, ".")
Boeing_price_at_max_date_text
GE_price_at_max_date_text <- paste(" GE's stock price was $", GE_price_at_max_date, "on", GE_formatted_max_date, ".")
GE_price_at_max_date
IBM_price_at_max_date_text <- paste("IBM's stock price was $", IBM_price_at_max_date, "on", IBM_formatted_max_date, ".")
IBM_price_at_max_date_text

# similar in java
if (max_stock_price_latest_date == IBM_price_at_max_date) {
  max_stock_price_latest_date_name <- IBM_price_at_max_date_text
} else if (max_stock_price_latest_date == CocaCola_price_at_max_date) {
  max_stock_price_latest_date_name <- CocaCola_price_at_max_date_text
} else if (max_stock_price_latest_date == GE_price_at_max_date) {
  max_stock_price_latest_date_name <- GE_price_at_max_date_text
} else if (max_stock_price_latest_date == ProcterGamble_price_at_max_date) {
  max_stock_price_latest_date_name <- ProcterGamble_price_at_max_date_text
} else {
  max_stock_price_latest_date_name <- Boeing_price_at_max_date_text
}
cat(max_stock_price_latest_date_name)
# prints out the stock with the max mean stock price over the period
cat(max_stock_price_latest_date_name, " This represents the maximum stock price of all 5 stocks on this latest date.")
# end paste here, double check
tail(IBM) # make sure there is a match

# 1.3 find the min stock price at the latest date
# 1.2 which stock had the lowest stock price at the latest date
min_stock_price_latest_date <- min(ProcterGamble_price_at_max_date, IBM_price_at_max_date, GE_price_at_max_date, Boeing_price_at_max_date, CocaCola_price_at_max_date)
min_stock_price_latest_date

# similar in java
if (min_stock_price_latest_date == IBM_price_at_max_date) {
  min_stock_price_latest_date_name <- IBM_price_at_max_date_text
} else if (min_stock_price_latest_date == CocaCola_price_at_max_date) {
  min_stock_price_latest_date_name <- CocaCola_price_at_max_date_text
} else if (min_stock_price_latest_date == GE_price_at_max_date) {
  min_stock_price_latest_date_name <- GE_price_at_max_date_text
} else if (min_stock_price_latest_date == ProcterGamble_price_at_max_date) {
  min_stock_price_latest_date_name <- ProcterGamble_price_at_max_date_text
} else {
  min_stock_price_latest_date_name <- Boeing_price_at_max_date_text
}
cat(min_stock_price_latest_date_name)
# prints out the stock with the max mean stock price over the period
cat(min_stock_price_latest_date_name, " This represents the minimum stock price of all 5 stocks on this latest date.")
# double check
tail(GE)

# 1.4 mean stock price of IBM# 1.3 switch from IBM to Boeing(3)
#alternative shorter parse
Boeing_price_at_max_date_string <- gsub("IBM", "Boeing", IBM_price_at_max_date_string)
cat(Boeing_price_at_max_date_string)
eval(parse(text = Boeing_price_at_max_date_string)) #faster

# 1.3 switch from IBM to CocaCola(4)
#alternative shorter parse
CocaCola_price_at_max_date_string <- gsub("IBM", "CocaCola", IBM_price_at_max_date_string)
eval(parse(text = CocaCola_price_at_max_date_string)) #faster

# 1.3 switch from GE to ProcterGamble(5)
ProcterGamble_price_at_max_date_string <- gsub("IBM", "ProcterGamble", IBM_price_at_max_date_string)
eval(parse(text = ProcterGamble_price_at_max_date_string)) #faster


summary(IBM)
IBM_mean_price <- mean(IBM$StockPrice)
IBM_mean_price
cat("The mean stock price of IBM over this period of time was ", IBM_mean_price, ".")

#1.4 switch from IBM to GE(2)
IBM_mean_price_string <- '# 1.4 mean stock price of IBM
summary(IBM)
IBM_mean_price <- mean(IBM$StockPrice)
IBM_mean_price
cat("The mean stock price of IBM over this period of time was ", IBM_mean_price, ".")
'
GE_mean_price_string <- gsub("IBM", "GE", IBM_mean_price_string)
cat(GE_mean_price_string) # paste below
# 1.4 mean stock price of GE
summary(GE)
GE_mean_price <- mean(GE$StockPrice)
GE_mean_price
cat("The mean stock price of GE over this period of time was ", GE_mean_price, ".")
# alternatively replace "IBM" with "GE" in the string
GE_mean_price_string <- gsub("IBM", "GE", IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = GE_mean_price_string))

#1.4 switch from IBM to Boeing(3)
Boeing_mean_price_string <- gsub("IBM", "Boeing",IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = Boeing_mean_price_string))
summary(Boeing)

#1.4 switch from IBM to CocaCola(4)
CocaCola_mean_price_string <- gsub("IBM", "CocaCola",IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = CocaCola_mean_price_string))
summary(CocaCola)

#1.4 switch from IBM to ProcterGamble(5)
ProcterGamble_mean_price_string <- gsub("IBM", "ProcterGamble",IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = ProcterGamble_mean_price_string))
summary(ProcterGamble)


# 1.4 mean stock price of GE over period of time
summary(GE)
summary(IBM)
IBM_mean_price <- mean(IBM$StockPrice)
IBM_mean_price
cat("The mean stock price of IBM over this period of time was ", IBM_mean_price, ".")

#1.4 switch from IBM to GE(2)
IBM_mean_price_string <- '# 1.4 mean stock price of IBM
summary(IBM)
IBM_mean_price <- mean(IBM$StockPrice)
IBM_mean_price
cat("The mean stock price of IBM over this period of time was ", IBM_mean_price, ".")
'
GE_mean_price_string <- gsub("IBM", "GE", IBM_mean_price_string)
cat(GE_mean_price_string) # paste below
# 1.4 mean stock price of GE
summary(GE)
GE_mean_price <- mean(GE$StockPrice)
GE_mean_price
cat("The mean stock price of GE over this period of time was ", GE_mean_price, ".")
# alternatively replace "IBM" with "GE" in the string
GE_mean_price_string <- gsub("IBM", "GE", IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = GE_mean_price_string))

#1.4 switch from IBM to Boeing(3)
Boeing_mean_price_string <- gsub("IBM", "Boeing",IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = Boeing_mean_price_string))
summary(Boeing)

#1.4 switch from IBM to CocaCola(4)
CocaCola_mean_price_string <- gsub("IBM", "CocaCola",IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = CocaCola_mean_price_string))
summary(CocaCola)

#1.4 switch from IBM to ProcterGamble(5)
ProcterGamble_mean_price_string <- gsub("IBM", "ProcterGamble",IBM_mean_price_string)
# Evaluate the modified string as code
eval(parse(text = ProcterGamble_mean_price_string))
summary(ProcterGamble)


# 1.4 stock with min mean price, same format as Java if else
min_mean_stock_price <- min(GE_mean_price, CocaCola_mean_price, ProcterGamble_mean_price, Boeing_mean_price, IBM_mean_price)
min_mean_stock_price

# similar in java
if (min_mean_stock_price == IBM_mean_price) {
  min_mean_stock_price_name <- "IBM's_mean_price"
} else if (min_mean_stock_price == CocaCola_mean_price) {
  min_mean_stock_price_name <- "CocaCola's_mean_price"
} else if (min_mean_stock_price == GE_mean_price) {
  min_mean_stock_price_name <- "GE's_mean_price"
} else if (min_mean_stock_price == ProcterGamble_mean_price) {
  min_mean_stock_price_name <- "ProcterGamble's_mean_price"
} else {
  min_mean_stock_price_name <- "Boeing's_mean_price"
}
cat(min_mean_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat("The minimum mean stock price over this period was", min_mean_stock_price_name, "with a value of", min_mean_stock_price, ".")


# find max min mean stock price
min_mean_stock_price_string <- '# 1.4 stock with min mean price, same format as Java if else
min_mean_stock_price <- min(GE_mean_price, CocaCola_mean_price, ProcterGamble_mean_price, Boeing_mean_price, IBM_mean_price)
min_mean_stock_price
# similar in java
if (min_mean_stock_price == IBM_mean_price) {
  min_mean_stock_price_name <- "IBM\'s_mean_price"
} else if (min_mean_stock_price == CocaCola_mean_price) {
  min_mean_stock_price_name <- "CocaCola\'s_mean_price"
} else if (min_mean_stock_price == GE_mean_price) {
  min_mean_stock_price_name <- "GE\'s_mean_price"
} else if (min_mean_stock_price == ProcterGamble_mean_price) {
  min_mean_stock_price_name <- "ProcterGamble\'s_mean_price"
} else {
  min_mean_stock_price_name <- "Boeing\'s_mean_price"
}
cat(min_mean_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat("The minimum mean stock price over this period was", min_mean_stock_price_name, "with a value of", min_mean_stock_price, ".")
'
### N use "\'" to include single quote in a string

# switch min to max using gsub
max_mean_stock_price_string <- gsub("min", "max",min_mean_stock_price_string ) 
cat(max_mean_stock_price_string) # paste below
#### start paste
# 1.4 stock with max mean price, same format as Java if else
max_mean_stock_price <- max(GE_mean_price, CocaCola_mean_price, ProcterGamble_mean_price, Boeing_mean_price, IBM_mean_price)
max_mean_stock_price
# similar in java
if (max_mean_stock_price == IBM_mean_price) {
  max_mean_stock_price_name <- "IBM's_mean_price"
} else if (max_mean_stock_price == CocaCola_mean_price) {
  max_mean_stock_price_name <- "CocaCola's_mean_price"
} else if (max_mean_stock_price == GE_mean_price) {
  max_mean_stock_price_name <- "GE's_mean_price"
} else if (max_mean_stock_price == ProcterGamble_mean_price) {
  max_mean_stock_price_name <- "ProcterGamble's_mean_price"
} else {
  max_mean_stock_price_name <- "Boeing's_mean_price"
}
cat(max_mean_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat("The maximum mean stock price over this period was", max_mean_stock_price_name, "with a value of", max_mean_stock_price, ".")
### end paste


# 1.5 ex5 find date of min price
GE_min_price <- min(GE$StockPrice)
GE_min_price
cat("The minimum stock price of GE over this period of time was ", GE_min_price, ".")
# Find the corresponding date for the minimum stock price
GE_date_at_min_price <- GE$Date[which.min(GE$StockPrice)]
GE_date_at_min_price
# Format the date
GE_formatted_date_at_min_price <- format(as.Date(GE_date_at_min_price), "%B %d, %Y")
GE_formatted_date_at_min_price
# Output the result
cat("The minimum stock price for GE was $", GE_min_price, "on", GE_formatted_date_at_min_price, ".")

#1.5 ex 5; switch GE to IBM(2)
GE_date_at_min_price_string <-'# 1.5 min stock price of GE over period of time
summary(GE)
GE_min_price <- min(GE$StockPrice)
GE_min_price
cat("The minimum stock price of GE over this period of time was ", GE_min_price, ".")
# 1.5 ex5 find date of min price
# Find the corresponding date for the minimum stock price
GE_date_at_min_price <- GE$Date[which.min(GE$StockPrice)]
GE_date_at_min_price
# Format the date
GE_formatted_date_at_min_price <- format(as.Date(GE_date_at_min_price), "%B %d, %Y")
GE_formatted_date_at_min_price
# Output the result
cat("The minimum stock price for GE was $", GE_min_price, "on", GE_formatted_date_at_min_price, ".")
'
cat(GE_date_at_min_price_string)
#switch GE to IBM(2)
IBM_date_at_mean_price_string <- gsub("GE", "IBM",GE_date_at_min_price_string)
cat(IBM_date_at_mean_price_string) #paste below
# 1.5 min stock price of IBM over period of time
summary(IBM)
IBM_min_price <- min(IBM$StockPrice)
IBM_min_price
cat("The minimum stock price of IBM over this period of time was ", IBM_min_price, ".")
# 1.5 ex5 find date of min price
# Find the corresponding date for the minimum stock price
IBM_date_at_min_price <- IBM$Date[which.min(IBM$StockPrice)]
IBM_date_at_min_price
# Format the date
IBM_formatted_date_at_min_price <- format(as.Date(IBM_date_at_min_price), "%B %d, %Y")
IBM_formatted_date_at_min_price
# Output the result
cat("The minimum stock price for IBM was $", IBM_min_price, "on", IBM_formatted_date_at_min_price, ".")

# 1.5 shorter alternative switch from GE to IBM(2)
IBM_date_at_min_price_string <- gsub("GE", "IBM",GE_date_at_min_price_string)
# Evaluate the modified string as code
eval(parse(text = IBM_date_at_min_price_string))
summary(IBM)

# 1.5 shorter switch from GE to Boeing(3)
Boeing_date_at_min_price_string <- gsub("GE", "Boeing", GE_date_at_min_price_string)
cat(Boeing_date_at_min_price_string)
# Evaluate the modified string as code
eval(parse(text = Boeing_date_at_min_price_string))
summary(Boeing)

# 1.5 shorter alternative switch from GE to CocaCola(4)
CocaCola_date_at_min_price_string <- gsub("GE", "CocaCola", GE_date_at_min_price_string)
cat(CocaCola_date_at_min_price_string)
# Evaluate the modified string as code
eval(parse(text = CocaCola_date_at_min_price_string))
summary(CocaCola)

# 1.5 shorter switch from GE to ProcterGamble(5)
ProcterGamble_date_at_min_price_string <- gsub("GE", "ProcterGamble", GE_date_at_min_price_string)
cat(ProcterGamble_date_at_min_price_string)
# Evaluate the modified string as code
eval(parse(text = ProcterGamble_date_at_min_price_string))
summary(ProcterGamble)


# 1.5 find the max min stock price over time period
IBM_max_min_stock_price_text <- paste("The minimum stock price for IBM was $", IBM_min_price, "on", IBM_formatted_date_at_min_price, ".")
cat(IBM_max_min_stock_price_text)
ProcterGamble_max_min_stock_price_text <- paste("The minimum stock price for ProcterGamble was $", ProcterGamble_min_price, "on", ProcterGamble_formatted_date_at_min_price,".")
cat(ProcterGamble_max_min_stock_price_text)
CocaCola_max_min_stock_price_text <- paste("The minimum stock price for CocaCola was $", CocaCola_min_price, "on", CocaCola_formatted_date_at_min_price, ".")
cat(CocaCola_max_min_stock_price_text)
Boeing_max_min_stock_price_text <- paste("The minimum stock price for Boeing was $", Boeing_min_price, "on", Boeing_formatted_date_at_min_price, ".")
cat(Boeing_max_min_stock_price_text)  
GE_max_min_stock_price_text <- paste("The minimum stock price for GE was $", GE_min_price, "on", GE_formatted_date_at_min_price, ".")
cat(GE_max_min_stock_price_text)

# 1.5 else statement stock with max min price, same format as Java if else
max_min_stock_price <- max(GE_min_price, CocaCola_min_price, ProcterGamble_min_price, Boeing_min_price, IBM_min_price)
max_min_stock_price
# similar in java
if (max_min_stock_price == IBM_min_price) {
  max_min_stock_price_name <- IBM_max_min_stock_price_text
} else if (max_min_stock_price == CocaCola_min_price) {
  max_min_stock_price_name <- CocaCola_max_min_stock_price_text
} else if (max_min_stock_price == GE_min_price) {
  max_min_stock_price_name <- GE_max_min_stock_price_text
} else if (max_min_stock_price == ProcterGamble_min_price) {
  max_min_stock_price_name <- ProcterGamble_max_min_stock_price_text
} else {
  max_min_stock_price_name <- Boeing_max_min_stock_price_text
}
cat(max_min_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(max_min_stock_price_name, "This was the maximum minimum stock price of all stocks over this period.")
# prints out max min stock price

# 1.5 find min min stock price over period using gsub
max_min_stock_price_name_string <- '# 1.5 find the max min stock price over time period
IBM_max_min_stock_price_text <- paste("The minimum stock price for IBM was $", IBM_min_price, "on", IBM_formatted_date_at_min_price, ".")
cat(IBM_max_min_stock_price_text)
ProcterGamble_max_min_stock_price_text <- paste("The minimum stock price for ProcterGamble was $", ProcterGamble_min_price, "on", ProcterGamble_formatted_date_at_min_price,".")
cat(ProcterGamble_max_min_stock_price_text)
CocaCola_max_min_stock_price_text <- paste("The minimum stock price for CocaCola was $", CocaCola_min_price, "on", CocaCola_formatted_date_at_min_price, ".")
cat(CocaCola_max_min_stock_price_text)
Boeing_max_min_stock_price_text <- paste("The minimum stock price for Boeing was $", Boeing_min_price, "on", Boeing_formatted_date_at_min_price, ".")
cat(Boeing_max_min_stock_price_text)  
GE_max_min_stock_price_text <- paste("The minimum stock price for GE was $", GE_min_price, "on", GE_formatted_date_at_min_price, ".")
cat(GE_max_min_stock_price_text)

# 1.5 else statement stock with max min price, same format as Java if else
max_min_stock_price <- max(GE_min_price, CocaCola_min_price, ProcterGamble_min_price, Boeing_min_price, IBM_min_price)
max_min_stock_price
# similar in java
if (max_min_stock_price == IBM_min_price) {
  max_min_stock_price_name <- IBM_max_min_stock_price_text
} else if (max_min_stock_price == CocaCola_min_price) {
  max_min_stock_price_name <- CocaCola_max_min_stock_price_text
} else if (max_min_stock_price == GE_min_price) {
  max_min_stock_price_name <- GE_max_min_stock_price_text
} else if (max_min_stock_price == ProcterGamble_min_price) {
  max_min_stock_price_name <- ProcterGamble_max_min_stock_price_text
} else {
  max_min_stock_price_name <- Boeing_max_min_stock_price_text
}
cat(max_min_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(max_min_stock_price_name, "This was the maximum minimum stock price of all stocks over this period.")
'
# use gsub to switch max for min
min_min_stock_price_name_string <- gsub("max", "min", max_min_stock_price_name_string)
cat(min_min_stock_price_name_string) # paste below
### start paste
# 1.5 find the min min stock price over time period
IBM_min_stock_price_text <- paste("The minimum stock price for IBM was $", IBM_min_price, "on", IBM_formatted_date_at_min_price, ".")
cat(IBM_min_stock_price_text)
ProcterGamble_min_stock_price_text <- paste("The minimum stock price for ProcterGamble was $", ProcterGamble_min_price, "on", ProcterGamble_formatted_date_at_min_price,".")
cat(ProcterGamble_min_stock_price_text)
CocaCola_min_stock_price_text <- paste("The minimum stock price for CocaCola was $", CocaCola_min_price, "on", CocaCola_formatted_date_at_min_price, ".")
cat(CocaCola_min_stock_price_text)
Boeing_min_stock_price_text <- paste("The minimum stock price for Boeing was $", Boeing_min_price, "on", Boeing_formatted_date_at_min_price, ".")
cat(Boeing_min_stock_price_text)  
GE_min_stock_price_text <- paste("The minimum stock price for GE was $", GE_min_price, "on", GE_formatted_date_at_min_price, ".")
cat(GE_min_stock_price_text)

# 1.5 else statement stock with min min price, same format as Java if else
min_min_stock_price <- min(GE_min_price, CocaCola_min_price, ProcterGamble_min_price, Boeing_min_price, IBM_min_price)
min_min_stock_price
# similar in java
if (min_min_stock_price == IBM_min_price) {
  min_min_stock_price_name <- IBM_min_stock_price_text
} else if (min_min_stock_price == CocaCola_min_price) {
  min_min_stock_price_name <- CocaCola_min_stock_price_text
} else if (min_min_stock_price == GE_min_price) {
  min_min_stock_price_name <- GE_min_stock_price_text
} else if (min_min_stock_price == ProcterGamble_min_price) {
  min_min_stock_price_name <- ProcterGamble_min_stock_price_text
} else {
  min_min_stock_price_name <- Boeing_min_stock_price_text
}
cat(min_min_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat(min_min_stock_price_name, "This was the minimum min stock price of all stocks over this period.")
### end paste, pritns out min min stock price

# 1.5 find the earliest date of the min stock price
IBM_date_at_min_stock_price_text <- paste("On", IBM_formatted_date_at_min_price,",the minimum stock price for IBM was $", IBM_min_price, ".")
cat(IBM_date_at_min_stock_price_text)
ProcterGamble_date_at_min_stock_price_text <- paste("On", ProcterGamble_formatted_date_at_min_price, ", the minimum stock price for ProcterGamble was $", ProcterGamble_min_price,".")
cat(ProcterGamble_date_at_min_stock_price_text)
CocaCola_date_at_min_stock_price_text <- paste("On", CocaCola_formatted_date_at_min_price,",the minimum stock price for CocaCola was $", CocaCola_min_price,".")
cat(CocaCola_date_at_min_stock_price_text)
Boeing_date_at_min_stock_price_text <- paste("On", Boeing_formatted_date_at_min_price,",the minimum stock price for Boeing was $", Boeing_min_price,".")
cat(Boeing_date_at_min_stock_price_text)  
GE_date_at_min_stock_price_text <- paste("On", GE_formatted_date_at_min_price, ",the minimum stock price for GE was $", GE_min_price,".")
cat(GE_date_at_min_stock_price_text)

# 1.5 else statement stock with earliest date at min price, same format as Java if else
earliest_date_at_min_stock_price <- min(GE_date_at_min_price, CocaCola_date_at_min_price, ProcterGamble_date_at_min_price, Boeing_date_at_min_price, IBM_date_at_min_price)
earliest_date_at_min_stock_price
# above uses date strings as date objects
formatted_earliest_date_at_min_stock_price <- format(earliest_date_at_min_stock_price, "%B %d, %Y")
formatted_earliest_date_at_min_stock_price # converts back to desired date format

# similar in java
if (formatted_earliest_date_at_min_stock_price == IBM_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- IBM_date_at_min_stock_price_text
} else if (formatted_earliest_date_at_min_stock_price == CocaCola_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- CocaCola_date_at_min_stock_price_text
} else if (formatted_earliest_date_at_min_stock_price ==  GE_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- GE_date_at_min_stock_price_text
} else if (formatted_earliest_date_at_min_stock_price == ProcterGamble_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- ProcterGamble_date_at_min_stock_price_text
} else {
  earliest_date_at_min_stock_price_name <- Boeing_date_at_min_stock_price_text
}
cat(earliest_date_at_min_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat(earliest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")

# alternative method
# Convert date strings to Date objects
dates_at_min_stock_price <- as.Date(c(GE_formatted_date_at_min_price, CocaCola_formatted_date_at_min_price, ProcterGamble_formatted_date_at_min_price, Boeing_formatted_date_at_min_price,IBM_formatted_date_at_min_price), format = "%B %d, %Y")
dates_at_min_stock_price 
earliest_date_at_min_stock_price <- min(dates_at_min_stock_price)
earliest_date_at_min_stock_price
formatted_earliest_date_at_min_stock_price <- format(earliest_date_at_min_stock_price, "%B %d, %Y")
formatted_earliest_date_at_min_stock_price

# similar in java
if (formatted_earliest_date_at_min_stock_price == IBM_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- IBM_date_at_min_stock_price_text
} else if (formatted_earliest_date_at_min_stock_price == CocaCola_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- CocaCola_date_at_min_stock_price_text
} else if (formatted_earliest_date_at_min_stock_price ==  GE_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- GE_date_at_min_stock_price_text
} else if (formatted_earliest_date_at_min_stock_price == ProcterGamble_formatted_date_at_min_price) {
  earliest_date_at_min_stock_price_name <- ProcterGamble_date_at_min_stock_price_text
} else {
  earliest_date_at_min_stock_price_name <- Boeing_date_at_min_stock_price_text
}
cat(earliest_date_at_min_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat(earliest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")
# same output as above

# 1.5 find the latest date at min stock price
# 1.5 else statement stock with earliest date at min price, same format as Java if else
latest_date_at_min_stock_price <- max(GE_date_at_min_price, CocaCola_date_at_min_price, ProcterGamble_date_at_min_price, Boeing_date_at_min_price, IBM_date_at_min_price)
latest_date_at_min_stock_price
# above uses date strings as date objects
formatted_latest_date_at_min_stock_price <- format(latest_date_at_min_stock_price, "%B %d, %Y")
formatted_latest_date_at_min_stock_price # converts back to desired date format

# similar in java
if (formatted_latest_date_at_min_stock_price == IBM_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- IBM_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price == CocaCola_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- CocaCola_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price ==  GE_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- GE_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price == ProcterGamble_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- ProcterGamble_date_at_min_stock_price_text
} else {
  latest_date_at_min_stock_price_name <- Boeing_date_at_min_stock_price_text
}
cat(latest_date_at_min_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat(latest_date_at_min_stock_price_name, "This was the latest date at a minimum stock price of all 5 stocks over this period.")

# alternative method
# Convert date strings to Date objects
dates_at_min_stock_price <- as.Date(c(GE_formatted_date_at_min_price, CocaCola_formatted_date_at_min_price, ProcterGamble_formatted_date_at_min_price, Boeing_formatted_date_at_min_price,IBM_formatted_date_at_min_price), format = "%B %d, %Y")
dates_at_min_stock_price 
latest_date_at_min_stock_price <- max(dates_at_min_stock_price)
latest_date_at_min_stock_price
formatted_latest_date_at_min_stock_price <- format(latest_date_at_min_stock_price, "%B %d, %Y")
formatted_latest_date_at_min_stock_price

# similar in java
if (formatted_latest_date_at_min_stock_price == IBM_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- IBM_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price == CocaCola_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- CocaCola_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price ==  GE_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- GE_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price == ProcterGamble_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- ProcterGamble_date_at_min_stock_price_text
} else {
  latest_date_at_min_stock_price_name <- Boeing_date_at_min_stock_price_text
}
cat(latest_date_at_min_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat(latest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")
# same output as above
cat(earliest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")
# same output as above

# find the number of days between earliest and latest date at min price
# Calculate the difference in days between dates
latest_earliest_date_at_min_price_days_difference <- as.numeric(difftime(latest_date_at_min_stock_price, earliest_date_at_min_stock_price, units = "days"))
latest_earliest_date_at_min_price_days_difference
# Convert days to years, months, and days
difference_date_min_stock_price_years <- floor(latest_earliest_date_at_min_price_days_difference / 365)
difference_date_min_stock_price_years
difference_date_min_stock_price_months <- floor((latest_earliest_date_at_min_price_days_difference %% 365) / 30)
difference_date_min_stock_price_months
difference_date_min_stock_price_remaining_days <- latest_earliest_date_at_min_price_days_difference %% 30
difference_date_min_stock_price_remaining_days
# Output the result
cat(earliest_date_at_min_stock_price_name, latest_date_at_min_stock_price_name, "The difference is approximately:", difference_date_min_stock_price_years, "years,", difference_date_min_stock_price_months, "months, and", difference_date_min_stock_price_remaining_days, "days between the earliest and latest date at the minimum stock price.")
cat(latest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")
cat(earliest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")


#1.6 max stock price of CocaCola
summary(CocaCola)
CocaCola_max_price <- max(CocaCola$StockPrice)
CocaCola_max_price
cat("The maximum stock price of CocaCola over this period of time was ", CocaCola_max_price, ".")
# match date with max stock price CocaCola
# 1.6 shorter alternative switch from GE min to max price date
GE_date_at_max_price_string <- gsub("min", "max", GE_date_at_min_price_string)
cat(GE_date_at_max_price_string)
# Evaluate the modified string as code
eval(parse(text = GE_date_at_max_price_string))
summary(GE)

# switch from GE max to CocaCola (2) date of max stock price
CocaCola_date_at_max_price_string <- gsub("GE", "CocaCola", GE_date_at_max_price_string)
cat(CocaCola_date_at_max_price_string)
# Evaluate the modified string as code
eval(parse(text = CocaCola_date_at_max_price_string))
summary(CocaCola)

# switch from GE max to IBM (3) date of max stock price
IBM_date_at_max_price_string <- gsub("GE", "IBM", GE_date_at_max_price_string)
cat(IBM_date_at_max_price_string)
# Evaluate the modified string as code
eval(parse(text = IBM_date_at_max_price_string))
summary(IBM)

# switch from GE max to Boeing (4) date of max stock price
Boeing_date_at_max_price_string <- gsub("GE", "Boeing", GE_date_at_max_price_string)
cat(Boeing_date_at_max_price_string)
# Evaluate the modified string as code
eval(parse(text = Boeing_date_at_max_price_string))
summary(Boeing)

# switch from GE max to ProcterGamble(5) date of max stock price
ProcterGamble_date_at_max_price_string <- gsub("GE", "ProcterGamble", GE_date_at_max_price_string)
cat(ProcterGamble_date_at_max_price_string)
# Evaluate the modified string as code
eval(parse(text = ProcterGamble_date_at_max_price_string))
summary(ProcterGamble)

# use gsub to switch min to max
dates_at_min_stock_price_string <-'
# 1.5 find the earliest date of the min stock price
IBM_date_at_min_stock_price_text <- paste("On", IBM_formatted_date_at_min_price,",the minimum stock price for IBM was $", IBM_min_price, ".")
cat(IBM_date_at_min_stock_price_text)
ProcterGamble_date_at_min_stock_price_text <- paste("On", ProcterGamble_formatted_date_at_min_price, ", the minimum stock price for ProcterGamble was $", ProcterGamble_min_price,".")
cat(ProcterGamble_date_at_min_stock_price_text)
CocaCola_date_at_min_stock_price_text <- paste("On", CocaCola_formatted_date_at_min_price,",the minimum stock price for CocaCola was $", CocaCola_min_price,".")
cat(CocaCola_date_at_min_stock_price_text)
Boeing_date_at_min_stock_price_text <- paste("On", Boeing_formatted_date_at_min_price,",the minimum stock price for Boeing was $", Boeing_min_price,".")
cat(Boeing_date_at_min_stock_price_text)  
GE_date_at_min_stock_price_text <- paste("On", GE_formatted_date_at_min_price, ",the minimum stock price for GE was $", GE_min_price,".")
cat(GE_date_at_min_stock_price_text)
'
cat(dates_at_min_stock_price_string)
# use gsub to switch min to max
dates_at_max_stock_price_string <- gsub("min", "max", dates_at_min_stock_price_string)
cat(dates_at_max_stock_price_string)
# paste all below
# 1.5 find the earliest date of the max stock price
IBM_date_at_max_stock_price_text <- paste("On", IBM_formatted_date_at_max_price,",the maximum stock price for IBM was $", IBM_max_price, ".")
cat(IBM_date_at_max_stock_price_text)
ProcterGamble_date_at_max_stock_price_text <- paste("On", ProcterGamble_formatted_date_at_max_price, ", the maximum stock price for ProcterGamble was $", ProcterGamble_max_price,".")
cat(ProcterGamble_date_at_max_stock_price_text)
CocaCola_date_at_max_stock_price_text <- paste("On", CocaCola_formatted_date_at_max_price,",the maximum stock price for CocaCola was $", CocaCola_max_price,".")
cat(CocaCola_date_at_max_stock_price_text)
Boeing_date_at_max_stock_price_text <- paste("On", Boeing_formatted_date_at_max_price,",the maximum stock price for Boeing was $", Boeing_max_price,".")
cat(Boeing_date_at_max_stock_price_text)  
GE_date_at_max_stock_price_text <- paste("On", GE_formatted_date_at_max_price, ",the maximum stock price for GE was $", GE_max_price,".")
cat(GE_date_at_max_stock_price_text)

# find date at max stock price
dates_at_max_stock_price_string <- gsub("min", "max",dates_at_min_stock_price_string)
cat(dates_at_max_stock_price_string)
# paste below
# Convert date strings to Date objects
dates_at_max_stock_price <- as.Date(c(GE_formatted_date_at_max_price, CocaCola_formatted_date_at_max_price, ProcterGamble_formatted_date_at_max_price, Boeing_formatted_date_at_max_price,IBM_formatted_date_at_max_price), format = "%B %d, %Y")
dates_at_max_stock_price 
latest_date_at_max_stock_price <- max(dates_at_max_stock_price)
latest_date_at_max_stock_price
formatted_latest_date_at_max_stock_price <- format(latest_date_at_max_stock_price, "%B %d, %Y")
formatted_latest_date_at_max_stock_price

# similar in java
if (formatted_latest_date_at_max_stock_price == IBM_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- IBM_date_at_max_stock_price_text
} else if (formatted_latest_date_at_max_stock_price == CocaCola_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- CocaCola_date_at_max_stock_price_text
} else if (formatted_latest_date_at_max_stock_price ==  GE_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- GE_date_at_max_stock_price_text
} else if (formatted_latest_date_at_max_stock_price == ProcterGamble_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- ProcterGamble_date_at_max_stock_price_text
} else {
  latest_date_at_max_stock_price_name <- Boeing_date_at_max_stock_price_text
}
cat(latest_date_at_max_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(latest_date_at_max_stock_price_name, "This was the latest date at a maximum stock price of all 5 stocks over this period.")
# same output as above

# gsub switch latest to earliest
latest_dates_at_max_stock_price_string <- '
# Convert date strings to Date objects
dates_at_max_stock_price <- as.Date(c(GE_formatted_date_at_max_price, CocaCola_formatted_date_at_max_price, ProcterGamble_formatted_date_at_max_price, Boeing_formatted_date_at_max_price,IBM_formatted_date_at_max_price), format = "%B %d, %Y")
dates_at_max_stock_price 
latest_date_at_max_stock_price <- max(dates_at_max_stock_price)
latest_date_at_max_stock_price
formatted_latest_date_at_max_stock_price <- format(latest_date_at_max_stock_price, "%B %d, %Y")
formatted_latest_date_at_max_stock_price

# similar in java
if (formatted_latest_date_at_max_stock_price == IBM_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- IBM_date_at_max_stock_price_text
} else if (formatted_latest_date_at_max_stock_price == CocaCola_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- CocaCola_date_at_max_stock_price_text
} else if (formatted_latest_date_at_max_stock_price ==  GE_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- GE_date_at_max_stock_price_text
} else if (formatted_latest_date_at_max_stock_price == ProcterGamble_formatted_date_at_max_price) {
  latest_date_at_max_stock_price_name <- ProcterGamble_date_at_max_stock_price_text
} else {
  latest_date_at_max_stock_price_name <- Boeing_date_at_max_stock_price_text
}
cat(latest_date_at_max_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(latest_date_at_max_stock_price_name, "This was the latest date at a maximum stock price of all 5 stocks over this period.")
# same output as above
'
cat(latest_dates_at_max_stock_price_string)

# use gsub to switch latest to earliest
earliest_dates_at_max_stock_price_string <- gsub("latest","earliest", latest_dates_at_max_stock_price_string)
cat(earliest_dates_at_max_stock_price_string)
# paste and swtich max to min
# Convert date strings to Date objects
dates_at_max_stock_price <- as.Date(c(GE_formatted_date_at_max_price, CocaCola_formatted_date_at_max_price, ProcterGamble_formatted_date_at_max_price, Boeing_formatted_date_at_max_price,IBM_formatted_date_at_max_price), format = "%B %d, %Y")
dates_at_max_stock_price 
earliest_date_at_max_stock_price <- min(dates_at_max_stock_price)
earliest_date_at_max_stock_price
formatted_earliest_date_at_max_stock_price <- format(earliest_date_at_max_stock_price, "%B %d, %Y")
formatted_earliest_date_at_max_stock_price

# similar in java
if (formatted_earliest_date_at_max_stock_price == IBM_formatted_date_at_max_price) {
  earliest_date_at_max_stock_price_name <- IBM_date_at_max_stock_price_text
} else if (formatted_earliest_date_at_max_stock_price == CocaCola_formatted_date_at_max_price) {
  earliest_date_at_max_stock_price_name <- CocaCola_date_at_max_stock_price_text
} else if (formatted_earliest_date_at_max_stock_price ==  GE_formatted_date_at_max_price) {
  earliest_date_at_max_stock_price_name <- GE_date_at_max_stock_price_text
} else if (formatted_earliest_date_at_max_stock_price == ProcterGamble_formatted_date_at_max_price) {
  earliest_date_at_max_stock_price_name <- ProcterGamble_date_at_max_stock_price_text
} else {
  earliest_date_at_max_stock_price_name <- Boeing_date_at_max_stock_price_text
}
cat(earliest_date_at_max_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(earliest_date_at_max_stock_price_name, "This was the earliest date at a maximum stock price of all 5 stocks over this period.")
# same output as above
cat(latest_date_at_max_stock_price_name, "This was the latest date at a maximum stock price of all 5 stocks over this period.")
#compare

# days between earliest and latest
latest_earliest_date_at_min_price_days_difference_string <-'
# find the number of days between earliest and latest date at min price
# Calculate the difference in days between dates
latest_earliest_date_at_min_price_days_difference <- as.numeric(difftime(latest_date_at_min_stock_price, earliest_date_at_min_stock_price, units = "days"))
latest_earliest_date_at_min_price_days_difference
# Convert days to years, months, and days
difference_date_min_stock_price_years <- floor(latest_earliest_date_at_min_price_days_difference / 365)
difference_date_min_stock_price_years
difference_date_min_stock_price_months <- floor((latest_earliest_date_at_min_price_days_difference %% 365) / 30)
difference_date_min_stock_price_months
difference_date_min_stock_price_remaining_days <- latest_earliest_date_at_min_price_days_difference %% 30
difference_date_min_stock_price_remaining_days
# Output the result
cat(earliest_date_at_min_stock_price_name, latest_date_at_min_stock_price_name, "The difference is approximately:", difference_date_min_stock_price_years, "years,", difference_date_min_stock_price_months, "months, and", difference_date_min_stock_price_remaining_days, "days between the earliest and latest date at the minimum stock price.")
cat(latest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")
cat(earliest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")
'
cat(latest_earliest_date_at_min_price_days_difference_string)
# use gsub to switch from min to max
latest_earliest_date_at_max_price_days_difference_string <- gsub("min", "max", latest_earliest_date_at_min_price_days_difference_string)
cat(latest_earliest_date_at_max_price_days_difference_string)
# paste below
# find the number of days between earliest and latest date at max price
# Calculate the difference in days between dates
latest_earliest_date_at_max_price_days_difference <- as.numeric(difftime(latest_date_at_max_stock_price, earliest_date_at_max_stock_price, units = "days"))
latest_earliest_date_at_max_price_days_difference
# Convert days to years, months, and days
difference_date_max_stock_price_years <- floor(latest_earliest_date_at_max_price_days_difference / 365)
difference_date_max_stock_price_years
difference_date_max_stock_price_months <- floor((latest_earliest_date_at_max_price_days_difference %% 365) / 30)
difference_date_max_stock_price_months
difference_date_max_stock_price_remaining_days <- latest_earliest_date_at_max_price_days_difference %% 30
difference_date_max_stock_price_remaining_days
# Output the result
cat(latest_earliest_date_at_max_price_days_difference,"is the number of days between the earliest and latest date at the maximum stock price.")
cat(earliest_date_at_max_stock_price_name, latest_date_at_max_stock_price_name, "The difference is approximately:", difference_date_max_stock_price_years, "years,", difference_date_max_stock_price_months, "months, and", difference_date_max_stock_price_remaining_days, "days between the earliest and latest date at the maximum stock price.")
#compare
cat(latest_date_at_max_stock_price_name, "This was the earliest date at a maximum stock price of all 5 stocks over this period.")
cat(earliest_date_at_max_stock_price_name, "This was the earliest date at a maximum stock price of all 5 stocks over this period.")


# 1.6 extra: find the days in between the max and min of each stock price
GE_max_price
GE_date_at_max_price <- GE$Date[which.max(GE$StockPrice)]
GE_date_at_max_price
GE_date_at_max_price <-as.Date(GE_date_at_max_price)
GE_date_at_max_price
GE_formatted_date_at_max_price
GE_min_price
GE_date_at_min_price <- GE$Date[which.min(GE$StockPrice)]
GE_date_at_min_price
GE_date_at_min_price <-as.Date(GE_date_at_min_price)
GE_date_at_min_price
GE_formatted_date_at_min_price

# Initialize variables to store the first and last date at min price
GE_first_date <- ""
GE_last_date <- ""
# Check which date came first and which came last
if (GE_date_at_max_price < GE_date_at_min_price) {
  cat("The date at max price came first:", format(GE_date_at_max_price, "%Y-%m-%d"), "and", format(GE_date_at_max_price, "%B %d, %Y"), "\n")
  cat("The date at min price came last:", format(GE_date_at_min_price, "%Y-%m-%d"), "and", format(GE_date_at_min_price, "%B %d, %Y"), "\n")
  GE_first_date <- GE_date_at_max_price
  GE_last_date <- GE_date_at_min_price
} else if (GE_date_at_max_price > GE_date_at_min_price) {
  cat("The date at min price came first:",format(GE_date_at_min_price, "%Y-%m-%d"), "and", format(GE_date_at_min_price, "%B %d, %Y"),  "\n")
  cat("The date at max price came last:", format(GE_date_at_max_price, "%Y-%m-%d"), "and", format(GE_date_at_max_price, "%B %d, %Y"), "\n")
  GE_first_date <- GE_date_at_min_price
  GE_last_date <- GE_date_at_max_price
} else {
  cat("Both dates are the same:", format(GE_date_at_max_price, "%Y-%m-%d"), "and", format(GE_date_at_max_price, "%B %d, %Y"), "\n")
}
# Display the values of GE_first_date_at_min_price and GE_last_date_at_min_price
# run new code under variable
GE_last_date
GE_last_date <- as.Date(GE_last_date)
GE_last_date
GE_last_date_formatted <- format(GE_last_date,"%B %d, %Y" )
GE_last_date_formatted
GE_first_date
GE_first_date <- as.Date(GE_first_date)
GE_first_date
GE_first_date_formatted  <- format(GE_first_date,"%B %d, %Y" )
GE_first_date_formatted 

# create variable for price on first and last day
GE_price_at_first_date <- ""
GE_price_at_last_date <- ""
# match date and assign variable to price
if (GE_first_date_formatted  == GE_formatted_date_at_max_price) {
  cat("The price at the first date was on ", GE_first_date_formatted, "was", GE_max_price,"." )
  cat(" The price at the last date was on ", GE_last_date_formatted, " was", GE_min_price,"." )
  GE_price_at_first_date <- GE_max_price
  GE_price_at_last_date <- GE_min_price
} else {
  cat("The price at the first date was on ", GE_first_date_formatted, "was", GE_min_price,"." )
  cat(" The price at the last date was on ", GE_last_date_formatted, " was", GE_max_price,"." )
  GE_price_at_first_date <- GE_min_price
  GE_price_at_last_date <- GE_max_price
}
# type out the variables
cat("The variable GE_price_at_first_date is", GE_price_at_first_date )
cat("The variable GE_price_at_last_date is", GE_price_at_last_date )
GE_price_at_first_date
GE_price_at_last_date

# price difference
GE_last_first_date_price_difference <- GE_price_at_last_date - GE_price_at_first_date
GE_last_first_date_price_difference
GE_last_first_date_price_difference_percentage <- (GE_last_first_date_price_difference / GE_price_at_first_date) *100
GE_last_first_date_price_difference_percentage
# Check if the price difference is negative
output <- capture.output ({
if (GE_last_first_date_price_difference < 0) {
  cat("There was a decrease in stock price of GE of", abs(GE_last_first_date_price_difference), "USD.\n")
  cat("The percentage decrease is", abs(GE_last_first_date_price_difference_percentage), "%\n")
} else if (GE_last_first_date_price_difference > 0) {
  cat("There was an increase in price of GE of", GE_last_first_date_price_difference, "units\n")
  cat("The percentage increase is", GE_last_first_date_price_difference_percentage, "%.\n")
} else {
  cat("There was no change in price\n")
}
})
GE_last_first_date_price_difference_percentage_text <- output
cat(GE_last_first_date_price_difference_percentage_text)

# Display the formatted values of GE_first_date and GE_last_date
cat("GE_first_date:", format(GE_first_date, "%Y-%m-%d"),"or",GE_first_date_formatted, ".")
cat("GE_last_date:", format(GE_last_date, "%Y-%m-%d"), "or",GE_last_date_formatted, ".")

# date days difference
GE_difference_date_min_max_days_difference <- as.numeric(difftime(GE_last_date, GE_first_date, units = "days"))
GE_difference_date_min_max_days_difference 
# Convert days to years, months, and days
GE_difference_date_min_max_years <- floor(GE_difference_date_min_max_days_difference  / 365)
GE_difference_date_min_max_years
GE_difference_date_min_max_months <- floor((GE_difference_date_min_max_days_difference %% 365) / 30)
GE_difference_date_min_max_months
GE_difference_date_min_max_remaining_days <- GE_difference_date_min_max_days_difference %% 30
GE_difference_date_min_max_remaining_days

# get which came first
output <- capture.output({
  if (GE_first_date_formatted == GE_formatted_date_at_max_price){
    cat("The date at the max price came first.", GE_date_at_max_stock_price_text, "\n\n")
    cat("The date at the min price came last.", GE_date_at_min_stock_price_text, "\n\n")
    cat("There are", GE_difference_date_min_max_days_difference, "days in between the date of GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD and the date of GE's minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD.", "\n\n")
    cat("The are", GE_difference_date_min_max_years, "years,", GE_difference_date_min_max_months, "months, and", GE_difference_date_min_max_remaining_days, "days between the date of GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD and the date GE's minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD.", "\n\n")
    cat(GE_last_first_date_price_difference_percentage_text)
  } else {
    cat("The date at the min price came first.", GE_date_at_min_stock_price_text, "\n\n")
    cat("The date at the max price came last.", GE_date_at_max_stock_price_text, "\n\n") 
    cat("There are", GE_difference_date_min_max_days_difference, "days in between the date of GE's minimum stock price on", GE_formatted_date_at_max_price, "at", GE_min_price, "USD and the date of GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
    cat("The are", GE_difference_date_min_max_years, "years,", GE_difference_date_min_max_months, "months, and", GE_difference_date_min_max_remaining_days, "days between the date of GE's minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD and the date GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
    cat(GE_last_first_date_price_difference_percentage_text)
  }
})
# save output as series of texg
GE_max_min_price_date_difference_text <- paste(output, collapse = "\n")
cat(GE_max_min_price_date_difference_text)

# create a string and use gsub to switch GE to IBM(2)
GE_max_min_price_date_difference_text_string <- '
# 1.6 extra: find the days in between the max and min of each stock price
GE_max_price
GE_date_at_max_price <- GE$Date[which.max(GE$StockPrice)]
GE_date_at_max_price
GE_date_at_max_price <-as.Date(GE_date_at_max_price)
GE_date_at_max_price
GE_formatted_date_at_max_price
GE_min_price
GE_date_at_min_price <- GE$Date[which.min(GE$StockPrice)]
GE_date_at_min_price
GE_date_at_min_price <-as.Date(GE_date_at_min_price)
GE_date_at_min_price
GE_formatted_date_at_min_price

# Initialize variables to store the first and last date at min price
GE_first_date <- ""
GE_last_date <- ""
# Check which date came first and which came last
if (GE_date_at_max_price < GE_date_at_min_price) {
  cat("The date at max price came first:", format(GE_date_at_max_price, "%Y-%m-%d"), "and", format(GE_date_at_max_price, "%B %d, %Y"), "\n")
  cat("The date at min price came last:", format(GE_date_at_min_price, "%Y-%m-%d"), "and", format(GE_date_at_min_price, "%B %d, %Y"), "\n")
  GE_first_date <- GE_date_at_max_price
  GE_last_date <- GE_date_at_min_price
} else if (GE_date_at_max_price > GE_date_at_min_price) {
  cat("The date at min price came first:",format(GE_date_at_min_price, "%Y-%m-%d"), "and", format(GE_date_at_min_price, "%B %d, %Y"),  "\n")
  cat(" The date at max price came last:", format(GE_date_at_max_price, "%Y-%m-%d"), "and", format(GE_date_at_max_price, "%B %d, %Y"), "\n")
  GE_first_date <- GE_date_at_min_price
  GE_last_date <- GE_date_at_max_price
} else {
  cat("Both dates are the same:", format(GE_date_at_max_price, "%Y-%m-%d"), "and", format(GE_date_at_max_price, "%B %d, %Y"), "\n")
}
# Display the values of GE_first_date_at_min_price and GE_last_date_at_min_price
# run new code under variable
GE_last_date
GE_last_date <- as.Date(GE_last_date)
GE_last_date
GE_last_date_formatted <- format(GE_last_date,"%B %d, %Y" )
GE_last_date_formatted
GE_first_date
GE_first_date <- as.Date(GE_first_date)
GE_first_date
GE_first_date_formatted  <- format(GE_first_date,"%B %d, %Y" )
GE_first_date_formatted 

# create variable for price on first and last day
GE_price_at_first_date <- ""
GE_price_at_last_date <- ""
# match date and assign variable to price
if (GE_first_date_formatted  == GE_formatted_date_at_max_price) {
  cat("The price at the first date was on ", GE_first_date_formatted, "was", GE_max_price,"." )
  cat(" The price at the last date was on ", GE_last_date_formatted, " was", GE_min_price,"." )
  GE_price_at_first_date <- GE_max_price
  GE_price_at_last_date <- GE_min_price
} else {
  cat("The price at the first date was on ", GE_first_date_formatted, "was", GE_min_price,"." )
  cat(" The price at the last date was on ", GE_last_date_formatted, " was", GE_max_price,"." )
  GE_price_at_first_date <- GE_min_price
  GE_price_at_last_date <- GE_max_price
}
# type out the variables
cat("The variable GE_price_at_first_date is", GE_price_at_first_date )
cat("The variable GE_price_at_last_date is", GE_price_at_last_date )
GE_price_at_first_date
GE_price_at_last_date

# price difference
GE_last_first_date_price_difference <- GE_price_at_last_date - GE_price_at_first_date
GE_last_first_date_price_difference
GE_last_first_date_price_difference_percentage <- (GE_last_first_date_price_difference / GE_price_at_first_date) *100
GE_last_first_date_price_difference_percentage
# Check if the price difference is negative
output <- capture.output ({
if (GE_last_first_date_price_difference < 0) {
  cat("There was a decrease in stock price of GE of", abs(GE_last_first_date_price_difference), "USD.\n")
  cat(" The percentage decrease is", abs(GE_last_first_date_price_difference_percentage), "%\n")
} else if (GE_last_first_date_price_difference > 0) {
  cat("There was an increase in price of GE of", GE_last_first_date_price_difference, "USD.\n")
  cat(" The percentage increase is", GE_last_first_date_price_difference_percentage, "%.\n")
} else {
  cat("There was no change in price\n")
}
})
GE_last_first_date_price_difference_percentage_text <- output
cat(GE_last_first_date_price_difference_percentage_text)

# Display the formatted values of GE_first_date and GE_last_date
cat("GE_first_date:", format(GE_first_date, "%Y-%m-%d"),"or",GE_first_date_formatted, ".")
cat("GE_last_date:", format(GE_last_date, "%Y-%m-%d"), "or",GE_last_date_formatted, ".")

# date days difference
GE_difference_date_min_max_days_difference <- as.numeric(difftime(GE_last_date, GE_first_date, units = "days"))
GE_difference_date_min_max_days_difference 
# Convert days to years, months, and days
GE_difference_date_min_max_years <- floor(GE_difference_date_min_max_days_difference  / 365)
GE_difference_date_min_max_years
GE_difference_date_min_max_months <- floor((GE_difference_date_min_max_days_difference %% 365) / 30)
GE_difference_date_min_max_months
GE_difference_date_min_max_remaining_days <- GE_difference_date_min_max_days_difference %% 30
GE_difference_date_min_max_remaining_days

# get which came first
output <- capture.output({
  if (GE_first_date_formatted == GE_formatted_date_at_max_price){
    cat("The date at the max price came first.", GE_date_at_max_stock_price_text, "\n\n")
    cat("The date at the min price came last.", GE_date_at_min_stock_price_text, "\n\n")
    cat("There are", GE_difference_date_min_max_days_difference, "days in between the date of GE\'s maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD and the date of GE\'s minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD.", "\n\n")
    cat("The are", GE_difference_date_min_max_years, "years,", GE_difference_date_min_max_months, "months, and", GE_difference_date_min_max_remaining_days, "days between the date of GE\'s maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD and the date GE\'s minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD.", "\n\n")
    cat(GE_last_first_date_price_difference_percentage_text)
  } else {
    cat("The date at the min price came first.", GE_date_at_min_stock_price_text, "\n\n")
    cat("The date at the max price came last.", GE_date_at_max_stock_price_text, "\n\n") 
    cat("There are", GE_difference_date_min_max_days_difference, "days in between the date of GE\'s minimum stock price on", GE_formatted_date_at_max_price, "at", GE_min_price, "USD and the date of GE\'s maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
    cat("The are", GE_difference_date_min_max_years, "years,", GE_difference_date_min_max_months, "months, and", GE_difference_date_min_max_remaining_days, "days between the date of GE\'s minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD and the date GE\'s maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
    cat(GE_last_first_date_price_difference_percentage_text)
  }
})
# save output as series of texg
GE_max_min_price_date_difference_text <- paste(output, collapse = "\n")
cat(GE_max_min_price_date_difference_text)
'
cat(GE_max_min_price_date_difference_text_string) # check that it is correct

# use gsub to switch from GE to IBM
IBM_max_min_price_date_difference_text_string <- gsub("GE", "IBM", GE_max_min_price_date_difference_text_string)
cat(IBM_max_min_price_date_difference_text_string) 
# start paste below
# 1.6 extra: find the days in between the max and min of each stock price
IBM_max_price
IBM_date_at_max_price <- IBM$Date[which.max(IBM$StockPrice)]
IBM_date_at_max_price
IBM_date_at_max_price <-as.Date(IBM_date_at_max_price)
IBM_date_at_max_price
IBM_formatted_date_at_max_price
IBM_min_price
IBM_date_at_min_price <- IBM$Date[which.min(IBM$StockPrice)]
IBM_date_at_min_price
IBM_date_at_min_price <-as.Date(IBM_date_at_min_price)
IBM_date_at_min_price
IBM_formatted_date_at_min_price

# Initialize variables to store the first and last date at min price
IBM_first_date <- ""
IBM_last_date <- ""
# Check which date came first and which came last
if (IBM_date_at_max_price < IBM_date_at_min_price) {
  cat("The date at max price came first:", format(IBM_date_at_max_price, "%Y-%m-%d"), "and", format(IBM_date_at_max_price, "%B %d, %Y"), ".")
  cat("The date at min price came last:", format(IBM_date_at_min_price, "%Y-%m-%d"), "and", format(IBM_date_at_min_price, "%B %d, %Y"), ".")
  IBM_first_date <- IBM_date_at_max_price
  IBM_last_date <- IBM_date_at_min_price
} else if (IBM_date_at_max_price > IBM_date_at_min_price) {
  cat("The date at min price came first:",format(IBM_date_at_min_price, "%Y-%m-%d"), "and", format(IBM_date_at_min_price, "%B %d, %Y"),  ".")
  cat("The date at max price came last:", format(IBM_date_at_max_price, "%Y-%m-%d"), "and", format(IBM_date_at_max_price, "%B %d, %Y"), ".")
  IBM_first_date <- IBM_date_at_min_price
  IBM_last_date <- IBM_date_at_max_price
} else {
  cat("Both dates are the same:", format(IBM_date_at_max_price, "%Y-%m-%d"), "and", format(IBM_date_at_max_price, "%B %d, %Y"), ".")
}
# Display the values of IBM_first_date_at_min_price and IBM_last_date_at_min_price
# run new code under variable
IBM_last_date
IBM_last_date <- as.Date(IBM_last_date)
IBM_last_date
IBM_last_date_formatted <- format(IBM_last_date,"%B %d, %Y" )
IBM_last_date_formatted
IBM_first_date
IBM_first_date <- as.Date(IBM_first_date)
IBM_first_date
IBM_first_date_formatted  <- format(IBM_first_date,"%B %d, %Y" )
IBM_first_date_formatted 

# create variable for price on first and last day
IBM_price_at_first_date <- ""
IBM_price_at_last_date <- ""
# match date and assign variable to price
if (IBM_first_date_formatted  == IBM_formatted_date_at_max_price) {
  cat("The price at the first date was on ", IBM_first_date_formatted, "was", IBM_max_price,"." )
  cat(" The price at the last date was on ", IBM_last_date_formatted, " was", IBM_min_price,"." )
  IBM_price_at_first_date <- IBM_max_price
  IBM_price_at_last_date <- IBM_min_price
} else {
  cat("The price at the first date was on ", IBM_first_date_formatted, "was", IBM_min_price,"." )
  cat(" The price at the last date was on ", IBM_last_date_formatted, " was", IBM_max_price,"." )
  IBM_price_at_first_date <- IBM_min_price
  IBM_price_at_last_date <- IBM_max_price
}
# type out the variables
cat("The variable IBM_price_at_first_date is", IBM_price_at_first_date )
cat("The variable IBM_price_at_last_date is", IBM_price_at_last_date )
IBM_price_at_first_date
IBM_price_at_last_date

# price difference
IBM_last_first_date_price_difference <- IBM_price_at_last_date - IBM_price_at_first_date
IBM_last_first_date_price_difference
IBM_last_first_date_price_difference_percentage <- (IBM_last_first_date_price_difference / IBM_price_at_first_date) *100
IBM_last_first_date_price_difference_percentage
# Check if the price difference is negative
output <- capture.output ({
  if (IBM_last_first_date_price_difference < 0) {
    cat("There was a decrease in stock price of IBM of", abs(IBM_last_first_date_price_difference), "USD.")
    cat(" The percentage decrease is", abs(IBM_last_first_date_price_difference_percentage), "%")
  } else if (IBM_last_first_date_price_difference > 0) {
    cat("There was an increase in price of IBM of", IBM_last_first_date_price_difference, "USD")
    cat("The percentage increase is", IBM_last_first_date_price_difference_percentage, "%.")
  } else {
    cat("There was no change in price.")
  }
})
IBM_last_first_date_price_difference_percentage_text <- output
cat(IBM_last_first_date_price_difference_percentage_text)

# Display the formatted values of IBM_first_date and IBM_last_date
cat("IBM_first_date:", format(IBM_first_date, "%Y-%m-%d"),"or",IBM_first_date_formatted, ".")
cat("IBM_last_date:", format(IBM_last_date, "%Y-%m-%d"), "or",IBM_last_date_formatted, ".")

# date days difference
IBM_difference_date_min_max_days_difference <- as.numeric(difftime(IBM_last_date, IBM_first_date, units = "days"))
IBM_difference_date_min_max_days_difference 
# Convert days to years, months, and days
IBM_difference_date_min_max_years <- floor(IBM_difference_date_min_max_days_difference  / 365)
IBM_difference_date_min_max_years
IBM_difference_date_min_max_months <- floor((IBM_difference_date_min_max_days_difference %% 365) / 30)
IBM_difference_date_min_max_months
IBM_difference_date_min_max_remaining_days <- IBM_difference_date_min_max_days_difference %% 30
IBM_difference_date_min_max_remaining_days

# get which came first
output <- capture.output({
  if (IBM_first_date_formatted == IBM_formatted_date_at_max_price){
    cat("The date at the max price came first.", IBM_date_at_max_stock_price_text, "\n\n")
    cat("The date at the min price came last.", IBM_date_at_min_stock_price_text, "\n\n")
    cat("There are", IBM_difference_date_min_max_days_difference, "days in between the date of IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD and the date of IBM's minimum stock price on", IBM_formatted_date_at_min_price, "at", IBM_min_price, "USD.", "\n\n")
    cat("The are", IBM_difference_date_min_max_years, "years,", IBM_difference_date_min_max_months, "months, and", IBM_difference_date_min_max_remaining_days, "days between the date of IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD and the date IBM's minimum stock price on", IBM_formatted_date_at_min_price, "at", IBM_min_price, "USD.", "\n\n")
    cat(IBM_last_first_date_price_difference_percentage_text)
  } else {
    cat("The date at the min price came first.", IBM_date_at_min_stock_price_text, "\n\n")
    cat("The date at the max price came last.", IBM_date_at_max_stock_price_text, "\n\n") 
    cat("There are", IBM_difference_date_min_max_days_difference, "days in between the date of IBM's minimum stock price on", IBM_formatted_date_at_max_price, "at", IBM_min_price, "USD and the date of IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD.", "\n\n")
    cat("The are", IBM_difference_date_min_max_years, "years,", IBM_difference_date_min_max_months, "months, and", IBM_difference_date_min_max_remaining_days, "days between the date of IBM's minimum stock price on", IBM_formatted_date_at_min_price, "at", IBM_min_price, "USD and the date IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD.", "\n\n")
    cat(IBM_last_first_date_price_difference_percentage_text)
  }
})
# save output as series of texg
IBM_max_min_price_date_difference_text <- paste(output, collapse = "\n")
cat(IBM_max_min_price_date_difference_text)
# end paste

# use gsub to switch from GE to CocaCola(3)
CocaCola_max_min_price_date_difference_text_string <- gsub("GE", "CocaCola", GE_max_min_price_date_difference_text_string)
cat(CocaCola_max_min_price_date_difference_text_string)
# start paste below "\n\n" and "\n"
# 1.6 extra: find the days in between the max and min of each stock price
CocaCola_max_price
CocaCola_date_at_max_price <- CocaCola$Date[which.max(CocaCola$StockPrice)]
CocaCola_date_at_max_price
CocaCola_date_at_max_price <-as.Date(CocaCola_date_at_max_price)
CocaCola_date_at_max_price
CocaCola_formatted_date_at_max_price
CocaCola_min_price
CocaCola_date_at_min_price <- CocaCola$Date[which.min(CocaCola$StockPrice)]
CocaCola_date_at_min_price
CocaCola_date_at_min_price <-as.Date(CocaCola_date_at_min_price)
CocaCola_date_at_min_price
CocaCola_formatted_date_at_min_price

# Initialize variables to store the first and last date at min price
CocaCola_first_date <- ""
CocaCola_last_date <- ""
# Check which date came first and which came last
if (CocaCola_date_at_max_price < CocaCola_date_at_min_price) {
  cat("The date at max price came first:", format(CocaCola_date_at_max_price, "%Y-%m-%d"), "and", format(CocaCola_date_at_max_price, "%B %d, %Y"), "\n\n")
  cat("The date at min price came last:", format(CocaCola_date_at_min_price, "%Y-%m-%d"), "and", format(CocaCola_date_at_min_price, "%B %d, %Y"), "\n\n")
  CocaCola_first_date <- CocaCola_date_at_max_price
  CocaCola_last_date <- CocaCola_date_at_min_price
} else if (CocaCola_date_at_max_price > CocaCola_date_at_min_price) {
  cat("The date at min price came first:",format(CocaCola_date_at_min_price, "%Y-%m-%d"), "and", format(CocaCola_date_at_min_price, "%B %d, %Y"), "\n\n")
  cat("The date at max price came last:", format(CocaCola_date_at_max_price, "%Y-%m-%d"), "and", format(CocaCola_date_at_max_price, "%B %d, %Y"), "\n\n")
  CocaCola_first_date <- CocaCola_date_at_min_price
  CocaCola_last_date <- CocaCola_date_at_max_price
} else {
  cat("Both dates are the same:", format(CocaCola_date_at_max_price, "%Y-%m-%d"), "and", format(CocaCola_date_at_max_price, "%B %d, %Y"), "\n\n")
}
# Display the values of CocaCola_first_date_at_min_price and CocaCola_last_date_at_min_price
# run new code under variable
CocaCola_last_date
CocaCola_last_date <- as.Date(CocaCola_last_date)
CocaCola_last_date
CocaCola_last_date_formatted <- format(CocaCola_last_date,"%B %d, %Y" )
CocaCola_last_date_formatted
CocaCola_first_date
CocaCola_first_date <- as.Date(CocaCola_first_date)
CocaCola_first_date
CocaCola_first_date_formatted  <- format(CocaCola_first_date,"%B %d, %Y" )
CocaCola_first_date_formatted 

# create variable for price on first and last day
CocaCola_price_at_first_date <- ""
CocaCola_price_at_last_date <- ""
# match date and assign variable to price
if (CocaCola_first_date_formatted  == CocaCola_formatted_date_at_max_price) {
  cat("The price at the first date was on ", CocaCola_first_date_formatted, "was", CocaCola_max_price,"." )
  cat(" The price at the last date was on ", CocaCola_last_date_formatted, " was", CocaCola_min_price,"." )
  CocaCola_price_at_first_date <- CocaCola_max_price
  CocaCola_price_at_last_date <- CocaCola_min_price
} else {
  cat("The price at the first date was on ", CocaCola_first_date_formatted, "was", CocaCola_min_price,"." )
  cat(" The price at the last date was on ", CocaCola_last_date_formatted, " was", CocaCola_max_price,"." )
  CocaCola_price_at_first_date <- CocaCola_min_price
  CocaCola_price_at_last_date <- CocaCola_max_price
}
# type out the variables
cat("The variable CocaCola_price_at_first_date is", CocaCola_price_at_first_date )
cat("The variable CocaCola_price_at_last_date is", CocaCola_price_at_last_date )
CocaCola_price_at_first_date
CocaCola_price_at_last_date

# price difference
CocaCola_last_first_date_price_difference <- CocaCola_price_at_last_date - CocaCola_price_at_first_date
CocaCola_last_first_date_price_difference
CocaCola_last_first_date_price_difference_percentage <- (CocaCola_last_first_date_price_difference / CocaCola_price_at_first_date) *100
CocaCola_last_first_date_price_difference_percentage
# Check if the price difference is negative
output <- capture.output ({
  if (CocaCola_last_first_date_price_difference < 0) {
    cat("There was a decrease in stock price of CocaCola of", abs(CocaCola_last_first_date_price_difference), "USD.")
    cat("The percentage decrease is", abs(CocaCola_last_first_date_price_difference_percentage), "%")
  } else if (CocaCola_last_first_date_price_difference > 0) {
    cat("There was an increase in price of CocaCola of", CocaCola_last_first_date_price_difference, "USD")
    cat("The percentage increase is", CocaCola_last_first_date_price_difference_percentage, "%.")
  } else {
    cat("There was no change in price.")
  }
})
CocaCola_last_first_date_price_difference_percentage_text <- output
cat(CocaCola_last_first_date_price_difference_percentage_text)

# Display the formatted values of CocaCola_first_date and CocaCola_last_date
cat("CocaCola_first_date:", format(CocaCola_first_date, "%Y-%m-%d"),"or",CocaCola_first_date_formatted, ".")
cat("CocaCola_last_date:", format(CocaCola_last_date, "%Y-%m-%d"), "or",CocaCola_last_date_formatted, ".")

# date days difference
CocaCola_difference_date_min_max_days_difference <- as.numeric(difftime(CocaCola_last_date, CocaCola_first_date, units = "days"))
CocaCola_difference_date_min_max_days_difference 
# Convert days to years, months, and days
CocaCola_difference_date_min_max_years <- floor(CocaCola_difference_date_min_max_days_difference  / 365)
CocaCola_difference_date_min_max_years
CocaCola_difference_date_min_max_months <- floor((CocaCola_difference_date_min_max_days_difference %% 365) / 30)
CocaCola_difference_date_min_max_months
CocaCola_difference_date_min_max_remaining_days <- CocaCola_difference_date_min_max_days_difference %% 30
CocaCola_difference_date_min_max_remaining_days

# get which came first
output <- capture.output({
  if (CocaCola_first_date_formatted == CocaCola_formatted_date_at_max_price){
    cat("The date at the max price came first.", CocaCola_date_at_max_stock_price_text, "\n\n")
    cat("The date at the min price came last.", CocaCola_date_at_min_stock_price_text, "\n\n")
    cat("There are", CocaCola_difference_date_min_max_days_difference, "days in between the date of CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD and the date of CocaCola's minimum stock price on", CocaCola_formatted_date_at_min_price, "at", CocaCola_min_price, "USD.", "\n\n")
    cat("The are", CocaCola_difference_date_min_max_years, "years,", CocaCola_difference_date_min_max_months, "months, and", CocaCola_difference_date_min_max_remaining_days, "days between the date of CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD and the date CocaCola's minimum stock price on", CocaCola_formatted_date_at_min_price, "at", CocaCola_min_price, "USD.", "\n\n")
    cat(CocaCola_last_first_date_price_difference_percentage_text)
  } else {
    cat("The date at the min price came first.", CocaCola_date_at_min_stock_price_text, "\n\n")
    cat("The date at the max price came last.", CocaCola_date_at_max_stock_price_text, "\n\n") 
    cat("There are", CocaCola_difference_date_min_max_days_difference, "days in between the date of CocaCola's minimum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_min_price, "USD and the date of CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD.", "\n\n")
    cat("The are", CocaCola_difference_date_min_max_years, "years,", CocaCola_difference_date_min_max_months, "months, and", CocaCola_difference_date_min_max_remaining_days, "days between the date of CocaCola's minimum stock price on", CocaCola_formatted_date_at_min_price, "at", CocaCola_min_price, "USD and the date CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD.", "\n\n")
    cat(CocaCola_last_first_date_price_difference_percentage_text)
  }
})
# save output as series of texg
CocaCola_max_min_price_date_difference_text <- paste(output, collapse = "\n")
cat(CocaCola_max_min_price_date_difference_text)
# end paste

# use gsub to switch from GE to Boeing(4)
Boeing_max_min_price_date_difference_text_string <- gsub("GE", "Boeing", GE_max_min_price_date_difference_text_string)
cat(Boeing_max_min_price_date_difference_text_string)
# start paste below
# 1.6 extra: find the days in between the max and min of each stock price
Boeing_max_price
Boeing_date_at_max_price <- Boeing$Date[which.max(Boeing$StockPrice)]
Boeing_date_at_max_price
Boeing_date_at_max_price <-as.Date(Boeing_date_at_max_price)
Boeing_date_at_max_price
Boeing_formatted_date_at_max_price
Boeing_min_price
Boeing_date_at_min_price <- Boeing$Date[which.min(Boeing$StockPrice)]
Boeing_date_at_min_price
Boeing_date_at_min_price <-as.Date(Boeing_date_at_min_price)
Boeing_date_at_min_price
Boeing_formatted_date_at_min_price

# Initialize variables to store the first and last date at min price
Boeing_first_date <- ""
Boeing_last_date <- ""
# Check which date came first and which came last
if (Boeing_date_at_max_price < Boeing_date_at_min_price) {
  cat("The date at max price came first:", format(Boeing_date_at_max_price, "%Y-%m-%d"), "and", format(Boeing_date_at_max_price, "%B %d, %Y"), "\n\n")
  cat("The date at min price came last:", format(Boeing_date_at_min_price, "%Y-%m-%d"), "and", format(Boeing_date_at_min_price, "%B %d, %Y"), "\n\n")
  Boeing_first_date <- Boeing_date_at_max_price
  Boeing_last_date <- Boeing_date_at_min_price
} else if (Boeing_date_at_max_price > Boeing_date_at_min_price) {
  cat("The date at min price came first:",format(Boeing_date_at_min_price, "%Y-%m-%d"), "and", format(Boeing_date_at_min_price, "%B %d, %Y"),  "\n\n")
  cat(" The date at max price came last:", format(Boeing_date_at_max_price, "%Y-%m-%d"), "and", format(Boeing_date_at_max_price, "%B %d, %Y"), "\n\n")
  Boeing_first_date <- Boeing_date_at_min_price
  Boeing_last_date <- Boeing_date_at_max_price
} else {
  cat("Both dates are the same:", format(Boeing_date_at_max_price, "%Y-%m-%d"), "and", format(Boeing_date_at_max_price, "%B %d, %Y"), "\n\n")
}
# Display the values of Boeing_first_date_at_min_price and Boeing_last_date_at_min_price
# run new code under variable
Boeing_last_date
Boeing_last_date <- as.Date(Boeing_last_date)
Boeing_last_date
Boeing_last_date_formatted <- format(Boeing_last_date,"%B %d, %Y" )
Boeing_last_date_formatted
Boeing_first_date
Boeing_first_date <- as.Date(Boeing_first_date)
Boeing_first_date
Boeing_first_date_formatted  <- format(Boeing_first_date,"%B %d, %Y" )
Boeing_first_date_formatted 

# create variable for price on first and last day
Boeing_price_at_first_date <- ""
Boeing_price_at_last_date <- ""
# match date and assign variable to price
if (Boeing_first_date_formatted  == Boeing_formatted_date_at_max_price) {
  cat("The price at the first date was on ", Boeing_first_date_formatted, "was", Boeing_max_price,"." )
  cat(" The price at the last date was on ", Boeing_last_date_formatted, " was", Boeing_min_price,"." )
  Boeing_price_at_first_date <- Boeing_max_price
  Boeing_price_at_last_date <- Boeing_min_price
} else {
  cat("The price at the first date was on ", Boeing_first_date_formatted, "was", Boeing_min_price,"." )
  cat(" The price at the last date was on ", Boeing_last_date_formatted, " was", Boeing_max_price,"." )
  Boeing_price_at_first_date <- Boeing_min_price
  Boeing_price_at_last_date <- Boeing_max_price
}
# type out the variables
cat("The variable Boeing_price_at_first_date is", Boeing_price_at_first_date )
cat("The variable Boeing_price_at_last_date is", Boeing_price_at_last_date )
Boeing_price_at_first_date
Boeing_price_at_last_date

# price difference
Boeing_last_first_date_price_difference <- Boeing_price_at_last_date - Boeing_price_at_first_date
Boeing_last_first_date_price_difference
Boeing_last_first_date_price_difference_percentage <- (Boeing_last_first_date_price_difference / Boeing_price_at_first_date) *100
Boeing_last_first_date_price_difference_percentage
# Check if the price difference is negative
output <- capture.output ({
  if (Boeing_last_first_date_price_difference < 0) {
    cat("There was a decrease in stock price of Boeing of", abs(Boeing_last_first_date_price_difference), "USD.")
    cat(" The percentage decrease is", abs(Boeing_last_first_date_price_difference_percentage), "%")
  } else if (Boeing_last_first_date_price_difference > 0) {
    cat("There was an increase in price of Boeing of", Boeing_last_first_date_price_difference, "USD.")
    cat(" The percentage increase is", Boeing_last_first_date_price_difference_percentage, "%.")
  } else {
    cat("There was no change in price.")
  }
})
Boeing_last_first_date_price_difference_percentage_text <- output
cat(Boeing_last_first_date_price_difference_percentage_text)

# Display the formatted values of Boeing_first_date and Boeing_last_date
cat("Boeing_first_date:", format(Boeing_first_date, "%Y-%m-%d"),"or",Boeing_first_date_formatted, ".")
cat("Boeing_last_date:", format(Boeing_last_date, "%Y-%m-%d"), "or",Boeing_last_date_formatted, ".")

# date days difference
Boeing_difference_date_min_max_days_difference <- as.numeric(difftime(Boeing_last_date, Boeing_first_date, units = "days"))
Boeing_difference_date_min_max_days_difference 
# Convert days to years, months, and days
Boeing_difference_date_min_max_years <- floor(Boeing_difference_date_min_max_days_difference  / 365)
Boeing_difference_date_min_max_years
Boeing_difference_date_min_max_months <- floor((Boeing_difference_date_min_max_days_difference %% 365) / 30)
Boeing_difference_date_min_max_months
Boeing_difference_date_min_max_remaining_days <- Boeing_difference_date_min_max_days_difference %% 30
Boeing_difference_date_min_max_remaining_days

# get which came first
output <- capture.output({
  if (Boeing_first_date_formatted == Boeing_formatted_date_at_max_price){
    cat("The date at the max price came first.", Boeing_date_at_max_stock_price_text, "\n\n")
    cat("The date at the min price came last.", Boeing_date_at_min_stock_price_text, "\n\n")
    cat("There are", Boeing_difference_date_min_max_days_difference, "days in between the date of Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD and the date of Boeing's minimum stock price on", Boeing_formatted_date_at_min_price, "at", Boeing_min_price, "USD.", "\n\n")
    cat("The are", Boeing_difference_date_min_max_years, "years,", Boeing_difference_date_min_max_months, "months, and", Boeing_difference_date_min_max_remaining_days, "days between the date of Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD and the date Boeing's minimum stock price on", Boeing_formatted_date_at_min_price, "at", Boeing_min_price, "USD.", "\n\n")
    cat(Boeing_last_first_date_price_difference_percentage_text)
  } else {
    cat("The date at the min price came first.", Boeing_date_at_min_stock_price_text, "\n\n")
    cat("The date at the max price came last.", Boeing_date_at_max_stock_price_text, "\n\n") 
    cat("There are", Boeing_difference_date_min_max_days_difference, "days in between the date of Boeing's minimum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_min_price, "USD and the date of Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD.", "\n\n")
    cat("The are", Boeing_difference_date_min_max_years, "years,", Boeing_difference_date_min_max_months, "months, and", Boeing_difference_date_min_max_remaining_days, "days between the date of Boeing's minimum stock price on", Boeing_formatted_date_at_min_price, "at", Boeing_min_price, "USD and the date Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD.", "\n\n")
    cat(Boeing_last_first_date_price_difference_percentage_text)
  }
})
# save output as series of texg
Boeing_max_min_price_date_difference_text <- paste(output, collapse = "\n")
cat(Boeing_max_min_price_date_difference_text)
# end paste

# use gsub to switch GE to ProcterGamble(5)
ProcterGamble_max_min_price_date_difference_text_string <- gsub("GE", "ProcterGamble", GE_max_min_price_date_difference_text_string)
cat(ProcterGamble_max_min_price_date_difference_text_string)
# paste below
# 1.6 extra: find the days in between the max and min of each stock price
ProcterGamble_max_price
ProcterGamble_date_at_max_price <- ProcterGamble$Date[which.max(ProcterGamble$StockPrice)]
ProcterGamble_date_at_max_price
ProcterGamble_date_at_max_price <-as.Date(ProcterGamble_date_at_max_price)
ProcterGamble_date_at_max_price
ProcterGamble_formatted_date_at_max_price
ProcterGamble_min_price
ProcterGamble_date_at_min_price <- ProcterGamble$Date[which.min(ProcterGamble$StockPrice)]
ProcterGamble_date_at_min_price
ProcterGamble_date_at_min_price <-as.Date(ProcterGamble_date_at_min_price)
ProcterGamble_date_at_min_price
ProcterGamble_formatted_date_at_min_price

# Initialize variables to store the first and last date at min price
ProcterGamble_first_date <- ""
ProcterGamble_last_date <- ""
# Check which date came first and which came last
if (ProcterGamble_date_at_max_price < ProcterGamble_date_at_min_price) {
  cat("The date at max price came first:", format(ProcterGamble_date_at_max_price, "%Y-%m-%d"), "and", format(ProcterGamble_date_at_max_price, "%B %d, %Y"), "\n\n")
  cat("The date at min price came last:", format(ProcterGamble_date_at_min_price, "%Y-%m-%d"), "and", format(ProcterGamble_date_at_min_price, "%B %d, %Y"), "\n\n")
  ProcterGamble_first_date <- ProcterGamble_date_at_max_price
  ProcterGamble_last_date <- ProcterGamble_date_at_min_price
} else if (ProcterGamble_date_at_max_price > ProcterGamble_date_at_min_price) {
  cat("The date at min price came first:",format(ProcterGamble_date_at_min_price, "%Y-%m-%d"), "and", format(ProcterGamble_date_at_min_price, "%B %d, %Y"),  "\n\n")
  cat(" The date at max price came last:", format(ProcterGamble_date_at_max_price, "%Y-%m-%d"), "and", format(ProcterGamble_date_at_max_price, "%B %d, %Y"), "\n\n")
  ProcterGamble_first_date <- ProcterGamble_date_at_min_price
  ProcterGamble_last_date <- ProcterGamble_date_at_max_price
} else {
  cat("Both dates are the same:", format(ProcterGamble_date_at_max_price, "%Y-%m-%d"), "and", format(ProcterGamble_date_at_max_price, "%B %d, %Y"), "\n\n")
}
# Display the values of ProcterGamble_first_date_at_min_price and ProcterGamble_last_date_at_min_price
# run new code under variable
ProcterGamble_last_date
ProcterGamble_last_date <- as.Date(ProcterGamble_last_date)
ProcterGamble_last_date
ProcterGamble_last_date_formatted <- format(ProcterGamble_last_date,"%B %d, %Y" )
ProcterGamble_last_date_formatted
ProcterGamble_first_date
ProcterGamble_first_date <- as.Date(ProcterGamble_first_date)
ProcterGamble_first_date
ProcterGamble_first_date_formatted  <- format(ProcterGamble_first_date,"%B %d, %Y" )
ProcterGamble_first_date_formatted 

# create variable for price on first and last day
ProcterGamble_price_at_first_date <- ""
ProcterGamble_price_at_last_date <- ""
# match date and assign variable to price
if (ProcterGamble_first_date_formatted  == ProcterGamble_formatted_date_at_max_price) {
  cat("The price at the first date was on ", ProcterGamble_first_date_formatted, "was", ProcterGamble_max_price,"." )
  cat(" The price at the last date was on ", ProcterGamble_last_date_formatted, " was", ProcterGamble_min_price,"." )
  ProcterGamble_price_at_first_date <- ProcterGamble_max_price
  ProcterGamble_price_at_last_date <- ProcterGamble_min_price
} else {
  cat("The price at the first date was on ", ProcterGamble_first_date_formatted, "was", ProcterGamble_min_price,"." )
  cat(" The price at the last date was on ", ProcterGamble_last_date_formatted, " was", ProcterGamble_max_price,"." )
  ProcterGamble_price_at_first_date <- ProcterGamble_min_price
  ProcterGamble_price_at_last_date <- ProcterGamble_max_price
}
# type out the variables
cat("The variable ProcterGamble_price_at_first_date is", ProcterGamble_price_at_first_date )
cat("The variable ProcterGamble_price_at_last_date is", ProcterGamble_price_at_last_date )
ProcterGamble_price_at_first_date
ProcterGamble_price_at_last_date

# price difference
ProcterGamble_last_first_date_price_difference <- ProcterGamble_price_at_last_date - ProcterGamble_price_at_first_date
ProcterGamble_last_first_date_price_difference
ProcterGamble_last_first_date_price_difference_percentage <- (ProcterGamble_last_first_date_price_difference / ProcterGamble_price_at_first_date) *100
ProcterGamble_last_first_date_price_difference_percentage
# Check if the price difference is negative
output <- capture.output ({
  if (ProcterGamble_last_first_date_price_difference < 0) {
    cat("There was a decrease in stock price of ProcterGamble of", abs(ProcterGamble_last_first_date_price_difference), "USD.")
    cat(" The percentage decrease is", abs(ProcterGamble_last_first_date_price_difference_percentage), "%")
  } else if (ProcterGamble_last_first_date_price_difference > 0) {
    cat("There was an increase in price of ProcterGamble of", ProcterGamble_last_first_date_price_difference, "USD.")
    cat(" The percentage increase is", ProcterGamble_last_first_date_price_difference_percentage, "%.")
  } else {
    cat("There was no change in price.")
  }
})
ProcterGamble_last_first_date_price_difference_percentage_text <- output
cat(ProcterGamble_last_first_date_price_difference_percentage_text)

# Display the formatted values of ProcterGamble_first_date and ProcterGamble_last_date
cat("ProcterGamble_first_date:", format(ProcterGamble_first_date, "%Y-%m-%d"),"or",ProcterGamble_first_date_formatted, ".")
cat("ProcterGamble_last_date:", format(ProcterGamble_last_date, "%Y-%m-%d"), "or",ProcterGamble_last_date_formatted, ".")

# date days difference
ProcterGamble_difference_date_min_max_days_difference <- as.numeric(difftime(ProcterGamble_last_date, ProcterGamble_first_date, units = "days"))
ProcterGamble_difference_date_min_max_days_difference 
# Convert days to years, months, and days
ProcterGamble_difference_date_min_max_years <- floor(ProcterGamble_difference_date_min_max_days_difference  / 365)
ProcterGamble_difference_date_min_max_years
ProcterGamble_difference_date_min_max_months <- floor((ProcterGamble_difference_date_min_max_days_difference %% 365) / 30)
ProcterGamble_difference_date_min_max_months
ProcterGamble_difference_date_min_max_remaining_days <- ProcterGamble_difference_date_min_max_days_difference %% 30
ProcterGamble_difference_date_min_max_remaining_days

# get which came first
output <- capture.output({
  if (ProcterGamble_first_date_formatted == ProcterGamble_formatted_date_at_max_price){
    cat("The date at the max price came first.", ProcterGamble_date_at_max_stock_price_text, "\n\n")
    cat("The date at the min price came last.", ProcterGamble_date_at_min_stock_price_text, "\n\n")
    cat("There are", ProcterGamble_difference_date_min_max_days_difference, "days in between the date of ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD and the date of ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_min_price, "at", ProcterGamble_min_price, "USD.", "\n\n")
    cat("The are", ProcterGamble_difference_date_min_max_years, "years,", ProcterGamble_difference_date_min_max_months, "months, and", ProcterGamble_difference_date_min_max_remaining_days, "days between the date of ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD and the date ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_min_price, "at", ProcterGamble_min_price, "USD.", "\n\n")
    cat(ProcterGamble_last_first_date_price_difference_percentage_text)
  } else {
    cat("The date at the min price came first.", ProcterGamble_date_at_min_stock_price_text, "\n\n")
    cat("The date at the max price came last.", ProcterGamble_date_at_max_stock_price_text, "\n\n") 
    cat("There are", ProcterGamble_difference_date_min_max_days_difference, "days in between the date of ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_min_price, "USD and the date of ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD.", "\n\n")
    cat("The are", ProcterGamble_difference_date_min_max_years, "years,", ProcterGamble_difference_date_min_max_months, "months, and", ProcterGamble_difference_date_min_max_remaining_days, "days between the date of ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_min_price, "at", ProcterGamble_min_price, "USD and the date ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD.", "\n\n")
    cat(ProcterGamble_last_first_date_price_difference_percentage_text)
  }
})
# save output as series of texg
ProcterGamble_max_min_price_date_difference_text <- paste(output, collapse = "\n")
cat(ProcterGamble_max_min_price_date_difference_text)
# end paste


#1.6 extra find the stock with the max/min days between max and min price
max_difference_date_min_max_days_difference <- max(ProcterGamble_difference_date_min_max_days_difference, CocaCola_difference_date_min_max_days_difference, GE_difference_date_min_max_days_difference, Boeing_difference_date_min_max_days_difference, IBM_difference_date_min_max_days_difference)
max_difference_date_min_max_days_difference
# find max using if and else
output <- capture.output({
if (max_difference_date_min_max_days_difference == ProcterGamble_difference_date_min_max_days_difference ) {
  cat("There are", ProcterGamble_difference_date_min_max_days_difference, "days in between the date of ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_min_price, "USD and the date of ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD.", "\n\n")
  cat("The are", ProcterGamble_difference_date_min_max_years, "years,", ProcterGamble_difference_date_min_max_months, "months, and", ProcterGamble_difference_date_min_max_remaining_days, "days between the date of ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_min_price, "at", ProcterGamble_min_price, "USD and the date ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD.", "\n\n")
  cat("This represent the max number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
  cat(ProcterGamble_last_first_date_price_difference_percentage_text)
} else if (max_difference_date_min_max_days_difference == Boeing_difference_date_min_max_days_difference ) {
  cat("There are", Boeing_difference_date_min_max_days_difference, "days in between the date of Boeing's minimum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_min_price, "USD and the date of Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD.", "\n\n")
  cat("The are", Boeing_difference_date_min_max_years, "years,", Boeing_difference_date_min_max_months, "months, and", Boeing_difference_date_min_max_remaining_days, "days between the date of Boeing's minimum stock price on", Boeing_formatted_date_at_min_price, "at", Boeing_min_price, "USD and the date Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD.", "\n\n")
  cat("This represent the max number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
  cat(Boeing_last_first_date_price_difference_percentage_text)
} else if (max_difference_date_min_max_days_difference == CocaCola_difference_date_min_max_days_difference ) {
  cat("There are", CocaCola_difference_date_min_max_days_difference, "days in between the date of CocaCola's minimum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_min_price, "USD and the date of CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD.", "\n\n")
  cat("The are", CocaCola_difference_date_min_max_years, "years,", CocaCola_difference_date_min_max_months, "months, and", CocaCola_difference_date_min_max_remaining_days, "days between the date of CocaCola's minimum stock price on", CocaCola_formatted_date_at_min_price, "at", CocaCola_min_price, "USD and the date CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD.", "\n\n")
  cat("This represent the max number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
  cat(CocaCola_last_first_date_price_difference_percentage_text)
} else if (max_difference_date_min_max_days_difference == IBM_difference_date_min_max_days_difference ) {
  cat("There are", IBM_difference_date_min_max_days_difference, "days in between the date of IBM's minimum stock price on", IBM_formatted_date_at_max_price, "at", IBM_min_price, "USD and the date of IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD.", "\n\n")
  cat("The are", IBM_difference_date_min_max_years, "years,", IBM_difference_date_min_max_months, "months, and", IBM_difference_date_min_max_remaining_days, "days between the date of IBM's minimum stock price on", IBM_formatted_date_at_min_price, "at", IBM_min_price, "USD and the date IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD.", "\n\n")
  cat("This represent the max number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
  cat(IBM_last_first_date_price_difference_percentage_text)
} else {
  cat("There are", GE_difference_date_min_max_days_difference, "days in between the date of GE's minimum stock price on", GE_formatted_date_at_max_price, "at", GE_min_price, "USD and the date of GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
  cat("The are", GE_difference_date_min_max_years, "years,", GE_difference_date_min_max_months, "months, and", GE_difference_date_min_max_remaining_days, "days between the date of GE's minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD and the date GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
  cat("This represent the max number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
  cat(GE_last_first_date_price_difference_percentage_text)
}
})
max_difference_date_min_max_days_difference_text <- paste(output, collapse = "\n")
cat(max_difference_date_min_max_days_difference_text)

#1.6 find min number
min_difference_date_min_max_days_difference <- min(ProcterGamble_difference_date_min_max_days_difference, CocaCola_difference_date_min_max_days_difference, GE_difference_date_min_max_days_difference, Boeing_difference_date_min_max_days_difference, IBM_difference_date_min_max_days_difference)
min_difference_date_min_max_days_difference
# find max using if and else
output <- capture.output({
  if (min_difference_date_min_max_days_difference == ProcterGamble_difference_date_min_max_days_difference ) {
    cat("There are", ProcterGamble_difference_date_min_max_days_difference, "days in between the date of ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_min_price, "USD and the date of ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD.", "\n\n")
    cat("The are", ProcterGamble_difference_date_min_max_years, "years,", ProcterGamble_difference_date_min_max_months, "months, and", ProcterGamble_difference_date_min_max_remaining_days, "days between the date of ProcterGamble's minimum stock price on", ProcterGamble_formatted_date_at_min_price, "at", ProcterGamble_min_price, "USD and the date ProcterGamble's maximum stock price on", ProcterGamble_formatted_date_at_max_price, "at", ProcterGamble_max_price, "USD.", "\n\n")
    cat("This represent the max number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
    cat(ProcterGamble_last_first_date_price_difference_percentage_text)
  } else if (min_difference_date_min_max_days_difference == Boeing_difference_date_min_max_days_difference ) {
    cat("There are", Boeing_difference_date_min_max_days_difference, "days in between the date of Boeing's minimum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_min_price, "USD and the date of Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD.", "\n\n")
    cat("The are", Boeing_difference_date_min_max_years, "years,", Boeing_difference_date_min_max_months, "months, and", Boeing_difference_date_min_max_remaining_days, "days between the date of Boeing's minimum stock price on", Boeing_formatted_date_at_min_price, "at", Boeing_min_price, "USD and the date Boeing's maximum stock price on", Boeing_formatted_date_at_max_price, "at", Boeing_max_price, "USD.", "\n\n")
    cat("This represent the min number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
    cat(Boeing_last_first_date_price_difference_percentage_text)
  } else if (min_difference_date_min_max_days_difference == CocaCola_difference_date_min_max_days_difference ) {
    cat("There are", CocaCola_difference_date_min_max_days_difference, "days in between the date of CocaCola's minimum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_min_price, "USD and the date of CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD.", "\n\n")
    cat("The are", CocaCola_difference_date_min_max_years, "years,", CocaCola_difference_date_min_max_months, "months, and", CocaCola_difference_date_min_max_remaining_days, "days between the date of CocaCola's minimum stock price on", CocaCola_formatted_date_at_min_price, "at", CocaCola_min_price, "USD and the date CocaCola's maximum stock price on", CocaCola_formatted_date_at_max_price, "at", CocaCola_max_price, "USD.", "\n\n")
    cat("This represent the min number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
    cat(CocaCola_last_first_date_price_difference_percentage_text)
  } else if (min_difference_date_min_max_days_difference == IBM_difference_date_min_max_days_difference ) {
    cat("There are", IBM_difference_date_min_max_days_difference, "days in between the date of IBM's minimum stock price on", IBM_formatted_date_at_max_price, "at", IBM_min_price, "USD and the date of IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD.", "\n\n")
    cat("The are", IBM_difference_date_min_max_years, "years,", IBM_difference_date_min_max_months, "months, and", IBM_difference_date_min_max_remaining_days, "days between the date of IBM's minimum stock price on", IBM_formatted_date_at_min_price, "at", IBM_min_price, "USD and the date IBM's maximum stock price on", IBM_formatted_date_at_max_price, "at", IBM_max_price, "USD.", "\n\n")
    cat("This represent the min number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
    cat(IBM_last_first_date_price_difference_percentage_text)
  } else {
    cat("There are", GE_difference_date_min_max_days_difference, "days in between the date of GE's minimum stock price on", GE_formatted_date_at_max_price, "at", GE_min_price, "USD and the date of GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
    cat("The are", GE_difference_date_min_max_years, "years,", GE_difference_date_min_max_months, "months, and", GE_difference_date_min_max_remaining_days, "days between the date of GE's minimum stock price on", GE_formatted_date_at_min_price, "at", GE_min_price, "USD and the date GE's maximum stock price on", GE_formatted_date_at_max_price, "at", GE_max_price, "USD.", "\n\n")
    cat("This represent the min number of days between the dates of the highest and lowest price of the 5 stocks surveyed.", "\n\n")
    cat(GE_last_first_date_price_difference_percentage_text)
  }
})
min_difference_date_min_max_days_difference_text <- paste(output, collapse = "\n")
cat(min_difference_date_min_max_days_difference_text)


#1.6 find the biggest price difference %
max_last_first_date_price_difference_percentage <- max(Boeing_last_first_date_price_difference_percentage, ProcterGamble_last_first_date_price_difference_percentage, CocaCola_last_first_date_price_difference_percentage, GE_last_first_date_price_difference_percentage, IBM_last_first_date_price_difference_percentage)
max_last_first_date_price_difference_percentage
# create if else statement to max % diff
output <- capture.output ({
if (max_last_first_date_price_difference_percentage == ProcterGamble_last_first_date_price_difference_percentage) {
  cat("The max and min stock price of ProcterGamble was", ProcterGamble_max_price, "and ",ProcterGamble_min_price, "respectively on", ProcterGamble_formatted_date_at_max_price, "and", ProcterGamble_formatted_date_at_min_price, "respectively.", "\n\n")
  cat(ProcterGamble_last_first_date_price_difference_percentage_text, "\n\n")
  cat("This represent the max percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
} else if (max_last_first_date_price_difference_percentage == CocaCola_last_first_date_price_difference_percentage) {
  cat("The max and min stock price of CocaCola was", CocaCola_max_price, "and ",CocaCola_min_price, "respectively on", CocaCola_formatted_date_at_max_price, "and", CocaCola_formatted_date_at_min_price, "respectively.", "\n\n")
  cat(CocaCola_last_first_date_price_difference_percentage_text, "\n\n")
  cat("This represent the max percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
} else if (max_last_first_date_price_difference_percentage == Boeing_last_first_date_price_difference_percentage) {
  cat("The max and min stock price of Boeing was", Boeing_max_price, "and ", Boeing_min_price, "respectively on", Boeing_formatted_date_at_max_price, "and", Boeing_formatted_date_at_min_price, "respectively.", "\n\n")
  cat(Boeing_last_first_date_price_difference_percentage_text, "\n\n")
  cat("This represent the max percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
} else if (max_last_first_date_price_difference_percentage == IBM_last_first_date_price_difference_percentage) {
  cat("The max and min stock price of IBM was", IBM_max_price, "and ", IBM_min_price, "respectively on", IBM_formatted_date_at_max_price, "and", IBM_formatted_date_at_min_price, "respectively.", "\n\n")
  cat(IBM_last_first_date_price_difference_percentage_text, "\n\n")
  cat("This represent the max percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
} else {
  cat("The max and min stock price of GE was", GE_max_price, "and ", GE_min_price, "respectively on", GE_formatted_date_at_max_price, "and", GE_formatted_date_at_min_price, "respectively.", "\n\n")
  cat(GE_last_first_date_price_difference_percentage_text, "\n\n")
  cat("This represent the max percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
}
})
max_last_first_date_price_difference_percentage_text <- paste(output, collapse = "\n")
cat(max_last_first_date_price_difference_percentage_text)

#1.6 find the lowest price difference % between max and min price
min_last_first_date_price_difference_percentage <- min(Boeing_last_first_date_price_difference_percentage, ProcterGamble_last_first_date_price_difference_percentage, CocaCola_last_first_date_price_difference_percentage, GE_last_first_date_price_difference_percentage, IBM_last_first_date_price_difference_percentage)
min_last_first_date_price_difference_percentage
# create if else statement to max % diff
output <- capture.output ({
  if (min_last_first_date_price_difference_percentage == ProcterGamble_last_first_date_price_difference_percentage) {
    cat("The max and min stock price of ProcterGamble was", ProcterGamble_max_price, "and ",ProcterGamble_min_price, "respectively on", ProcterGamble_formatted_date_at_max_price, "and", ProcterGamble_formatted_date_at_min_price, "respectively.", "\n\n")
    cat(ProcterGamble_last_first_date_price_difference_percentage_text, "\n\n")
    cat("This represent the min percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
  } else if (min_last_first_date_price_difference_percentage == CocaCola_last_first_date_price_difference_percentage) {
    cat("The max and min stock price of CocaCola was", CocaCola_max_price, "and ",CocaCola_min_price, "respectively on", CocaCola_formatted_date_at_max_price, "and", CocaCola_formatted_date_at_min_price, "respectively.", "\n\n")
    cat(CocaCola_last_first_date_price_difference_percentage_text, "\n\n")
    cat("This represent the min percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
  } else if (min_last_first_date_price_difference_percentage == Boeing_last_first_date_price_difference_percentage) {
    cat("The max and min stock price of Boeing was", Boeing_max_price, "and ", Boeing_min_price, "respectively on", Boeing_formatted_date_at_max_price, "and", Boeing_formatted_date_at_min_price, "respectively.", "\n\n")
    cat(Boeing_last_first_date_price_difference_percentage_text, "\n\n")
    cat("This represent the min percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
  } else if (min_last_first_date_price_difference_percentage == IBM_last_first_date_price_difference_percentage) {
    cat("The max and min stock price of IBM was", IBM_max_price, "and ", IBM_min_price, "respectively on", IBM_formatted_date_at_max_price, "and", IBM_formatted_date_at_min_price, "respectively.", "\n\n")
    cat(IBM_last_first_date_price_difference_percentage_text, "\n\n")
    cat("This represent the min percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
  } else {
    cat("The max and min stock price of GE was", GE_max_price, "and ", GE_min_price, "respectively on", GE_formatted_date_at_max_price, "and", GE_formatted_date_at_min_price, "respectively.", "\n\n")
    cat(GE_last_first_date_price_difference_percentage_text, "\n\n")
    cat("This represent the min percntage change between highest and lowest stock price of the 5 stocks surveyed.", "\n\n")
  }
})
min_last_first_date_price_difference_percentage_text <- paste(output, collapse = "\n")
cat(min_last_first_date_price_difference_percentage_text)

# 1.6 find the maximum max stock price
max_max_stock_price_name_string <- gsub("min", "max",max_min_stock_price_name_string)
cat(max_max_stock_price_name_string) # paste output below
### start paste
# 1.5 find the max max stock price over time period
IBM_max_max_stock_price_text <- paste("The maximum stock price for IBM was $", IBM_max_price, "on", IBM_formatted_date_at_max_price, ".")
cat(IBM_max_max_stock_price_text)
ProcterGamble_max_max_stock_price_text <- paste("The maximum stock price for ProcterGamble was $", ProcterGamble_max_price, "on", ProcterGamble_formatted_date_at_max_price,".")
cat(ProcterGamble_max_max_stock_price_text)
CocaCola_max_max_stock_price_text <- paste("The maximum stock price for CocaCola was $", CocaCola_max_price, "on", CocaCola_formatted_date_at_max_price, ".")
cat(CocaCola_max_max_stock_price_text)
Boeing_max_max_stock_price_text <- paste("The maximum stock price for Boeing was $", Boeing_max_price, "on", Boeing_formatted_date_at_max_price, ".")
cat(Boeing_max_max_stock_price_text)  
GE_max_max_stock_price_text <- paste("The maximum stock price for GE was $", GE_max_price, "on", GE_formatted_date_at_max_price, ".")
cat(GE_max_max_stock_price_text)

# 1.5 else statement stock with max max price, same format as Java if else
max_max_stock_price <- max(GE_max_price, CocaCola_max_price, ProcterGamble_max_price, Boeing_max_price, IBM_max_price)
max_max_stock_price
# similar in java
if (max_max_stock_price == IBM_max_price) {
  max_max_stock_price_name <- IBM_max_max_stock_price_text
} else if (max_max_stock_price == CocaCola_max_price) {
  max_max_stock_price_name <- CocaCola_max_max_stock_price_text
} else if (max_mean_stock_price == GE_max_price) {
  max_max_stock_price_name <- GE_max_max_stock_price_text
} else if (max_max_stock_price == ProcterGamble_max_price) {
  max_max_stock_price_name <- ProcterGamble_max_max_stock_price_text
} else {
  max_max_stock_price_name <- Boeing_max_max_stock_price_text
}
cat(max_max_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(max_max_stock_price_name, "This was the maximum maximum stock price of all stocks over this period.")
### end paste, prints out max max stock price

# 1.6 else statement stock with min max price, same format as Java if else
min_max_stock_price <- min(GE_max_price, CocaCola_max_price, ProcterGamble_max_price, Boeing_max_price, IBM_max_price)
min_max_stock_price
# similar in java
if (min_max_stock_price == IBM_max_price) {
  min_max_stock_price_name <- IBM_max_max_stock_price_text
} else if (min_max_stock_price == CocaCola_max_price) {
  min_max_stock_price_name <- CocaCola_max_max_stock_price_text
} else if (min_mean_stock_price == GE_max_price) {
  min_max_stock_price_name <- GE_max_max_stock_price_text
} else if (max_max_stock_price == ProcterGamble_max_price) {
  min_max_stock_price_name <- ProcterGamble_max_max_stock_price_text
} else {
  min_max_stock_price_name <- Boeing_max_max_stock_price_text
}
cat(min_max_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(min_max_stock_price_name, "This was the minimum maximum stock price of all stocks over this period.")
### end paste, prints out min max stock price



#1.7 median stock price of Boeing
summary(Boeing)
Boeing_median_price <- median(Boeing$StockPrice)
Boeing_median_price
cat("The median stock price of Boeing over this period of time was ", Boeing_median_price, ".")
# long way to match date to median price Boeing
# 1.7 ex7 find date of median price
# Find the corresponding date for the median stock price
Boeing_date_at_median_price <- Boeing$Date[which.min(abs(Boeing$StockPrice - Boeing_median_price))]
Boeing_date_at_median_price #no which.median() exists
# Format the date
Boeing_formatted_date_at_median_price <- format(as.Date(Boeing_date_at_median_price), "%B %d, %Y")
Boeing_formatted_date_at_median_price
# Output the result
cat("The median stock price for Boeing was $", Boeing_median_price, "on", Boeing_formatted_date_at_median_price, ".")

# 1.7 extra, swich to Boeing to IBM(2)
Boeing_date_at_median_price_string <- '#1.7 median stock price of Boeing
summary(Boeing)
Boeing_median_price <- median(Boeing$StockPrice)
Boeing_median_price
cat("The median stock price of Boeing over this period of time was ", Boeing_median_price, ".")
# long way to match date to median price Boeing
# 1.7 ex7 find date of median price
# Find the corresponding date for the median stock price
Boeing_date_at_median_price <- Boeing$Date[which.min(abs(Boeing$StockPrice - Boeing_median_price))]
Boeing_date_at_median_price #no which.median() exists
# Format the date
Boeing_formatted_date_at_median_price <- format(as.Date(Boeing_date_at_median_price), "%B %d, %Y")
Boeing_formatted_date_at_median_price
# Output the result
cat("The median stock price for Boeing was $", Boeing_median_price, "on", Boeing_formatted_date_at_median_price, ".")
'
cat(Boeing_date_at_median_price_string)

# long way to switch Boeing to IBM 
IBM_date_at_median_price_string <- gsub("Boeing", "IBM", Boeing_date_at_median_price_string)
cat(IBM_date_at_median_price_string) # paste
#1.7 median stock price of IBM
summary(IBM)
IBM_median_price <- median(IBM$StockPrice)
IBM_median_price
cat("The median stock price of IBM over this period of time was ", IBM_median_price, ".")
# long way to match date to median price IBM
# 1.7 ex7 find date of median price
# Find the corresponding date for the median stock price
IBM_date_at_median_price <- IBM$Date[which.min(abs(IBM$StockPrice - IBM_median_price))]
IBM_date_at_median_price #no which.median() exists
# Format the date
IBM_formatted_date_at_median_price <- format(as.Date(IBM_date_at_median_price), "%B %d, %Y")
IBM_formatted_date_at_median_price
# Output the result
cat("The median stock price for IBM was $", IBM_median_price, "on", IBM_formatted_date_at_median_price, ".")

#short way to parse only text
# switch from Boeing to IBM(2) date of median stock price
IBM_date_at_median_price_string <- gsub("Boeing", "IBM", Boeing_date_at_median_price_string)
cat(IBM_date_at_median_price_string) # can omit
# Evaluate the modified string as code
eval(parse(text = IBM_date_at_median_price_string))
summary(IBM)

# switch from Boeing to GE(3) date of median stock price
GE_date_at_median_price_string <- gsub("Boeing", "GE", Boeing_date_at_median_price_string)
cat(GE_date_at_median_price_string) # can omit
# Evaluate the modified string as code
eval(parse(text = GE_date_at_median_price_string))
summary(GE)

# switch from Boeing to CocaCola(4) date of median stock price
CocaCola_date_at_median_price_string <- gsub("Boeing", "CocaCola", Boeing_date_at_median_price_string)
cat(CocaCola_date_at_median_price_string) # can omit
# Evaluate the modified string as code
eval(parse(text = CocaCola_date_at_median_price_string))
summary(CocaCola)

# switch from Boeing to ProcterGamble(5) date of median stock price
ProcterGamble_date_at_median_price_string <- gsub("Boeing", "ProcterGamble", Boeing_date_at_median_price_string)
cat(ProcterGamble_date_at_median_price_string) # can omit
# Evaluate the modified string as code
eval(parse(text = ProcterGamble_date_at_median_price_string))
summary(ProcterGamble)

# text for answers
# 1.7 find the median stock price over time period
IBM_median_stock_price_text <- paste("The median stock price for IBM was $", IBM_median_price, "on", IBM_formatted_date_at_median_price, ".")
cat(IBM_median_stock_price_text)
ProcterGamble_median_stock_price_text <- paste("The median stock price for ProcterGamble was $", ProcterGamble_median_price, "on", ProcterGamble_formatted_date_at_median_price, ".")
cat(ProcterGamble_median_stock_price_text)
CocaCola_median_stock_price_text <- paste("The median stock price for CocaCola was $", CocaCola_median_price, "on", CocaCola_formatted_date_at_median_price, ".")
cat(CocaCola_median_stock_price_text)
Boeing_median_stock_price_text <- paste("The median stock price for Boeing was $", Boeing_median_price, "on", Boeing_formatted_date_at_median_price, ".")
cat(Boeing_median_stock_price_text)  
GE_median_stock_price_text <- paste("The median stock price for GE was $", GE_median_price, "on", GE_formatted_date_at_median_price, ".")
cat(GE_mmedian_stock_price_text)

# find the latest date at median price
max_dates_at_min_stock_price_string <- '
# Convert date strings to Date objects
dates_at_min_stock_price <- as.Date(c(GE_formatted_date_at_min_price, CocaCola_formatted_date_at_min_price, ProcterGamble_formatted_date_at_min_price, Boeing_formatted_date_at_min_price,IBM_formatted_date_at_min_price), format = "%B %d, %Y")
dates_at_min_stock_price 
latest_date_at_min_stock_price <- max(dates_at_min_stock_price)
latest_date_at_min_stock_price
formatted_latest_date_at_min_stock_price <- format(latest_date_at_min_stock_price, "%B %d, %Y")
formatted_latest_date_at_min_stock_price

# similar in java
if (formatted_latest_date_at_min_stock_price == IBM_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- IBM_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price == CocaCola_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- CocaCola_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price ==  GE_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- GE_date_at_min_stock_price_text
} else if (formatted_latest_date_at_min_stock_price == ProcterGamble_formatted_date_at_min_price) {
  latest_date_at_min_stock_price_name <- ProcterGamble_date_at_min_stock_price_text
} else {
  latest_date_at_min_stock_price_name <- Boeing_date_at_min_stock_price_text
}
cat(latest_date_at_min_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat(latest_date_at_min_stock_price_name, "This was the earliest date at a minimum stock price of all 5 stocks over this period.")
# same output as above
'
cat(max_dates_at_min_stock_price_string)
# use gsub to switch min to median
max_dates_at_median_stock_price_string <- gsub ("min", "median", max_dates_at_min_stock_price_string)
cat(max_dates_at_median_stock_price_string)
#paste below, edit
# Convert date strings to Date objects
dates_at_median_stock_price <- as.Date(c(GE_formatted_date_at_median_price, CocaCola_formatted_date_at_median_price, ProcterGamble_formatted_date_at_median_price, Boeing_formatted_date_at_median_price,IBM_formatted_date_at_median_price), format = "%B %d, %Y")
dates_at_median_stock_price 
latest_date_at_median_stock_price <- max(dates_at_median_stock_price)
latest_date_at_median_stock_price
formatted_latest_date_at_median_stock_price <- format(latest_date_at_median_stock_price, "%B %d, %Y")
formatted_latest_date_at_median_stock_price

# similar in java
if (formatted_latest_date_at_median_stock_price == IBM_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- IBM_median_stock_price_text
} else if (formatted_latest_date_at_median_stock_price == CocaCola_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- CocaCola_median_stock_price_text
} else if (formatted_latest_date_at_median_stock_price ==  GE_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- GE_median_stock_price_text
} else if (formatted_latest_date_at_median_stock_price == ProcterGamble_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- ProcterGamble_median_stock_price_text
} else {
  latest_date_at_median_stock_price_name <- Boeing_median_stock_price_text
}
cat(latest_date_at_median_stock_price_name)
# prints out the stock with the median mean stock price over the period
cat(latest_date_at_median_stock_price_name, "This was the latest date at a median stock price of all 5 stocks over this period.")
# same output as above

# find the earliest date at a median stock price
latest_date_at_median_stock_price_name_string <-'
# Convert date strings to Date objects
dates_at_median_stock_price <- as.Date(c(GE_formatted_date_at_median_price, CocaCola_formatted_date_at_median_price, ProcterGamble_formatted_date_at_median_price, Boeing_formatted_date_at_median_price,IBM_formatted_date_at_median_price), format = "%B %d, %Y")
dates_at_median_stock_price 
latest_date_at_median_stock_price <- max(dates_at_median_stock_price)
latest_date_at_median_stock_price
formatted_latest_date_at_median_stock_price <- format(latest_date_at_median_stock_price, "%B %d, %Y")
formatted_latest_date_at_median_stock_price

# similar in java
if (formatted_latest_date_at_median_stock_price == IBM_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- IBM_median_stock_price_text
} else if (formatted_latest_date_at_median_stock_price == CocaCola_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- CocaCola_median_stock_price_text
} else if (formatted_latest_date_at_median_stock_price ==  GE_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- GE_median_stock_price_text
} else if (formatted_latest_date_at_median_stock_price == ProcterGamble_formatted_date_at_median_price) {
  latest_date_at_median_stock_price_name <- ProcterGamble_median_stock_price_text
} else {
  latest_date_at_median_stock_price_name <- Boeing_median_stock_price_text
}
cat(latest_date_at_median_stock_price_name)
# prints out the stock with the median mean stock price over the period
cat(latest_date_at_median_stock_price_name, "This was the latest date at a median stock price of all 5 stocks over this period.")
# same 
'
cat(latest_date_at_median_stock_price_name_string)
# use gsub for latest to earliest
earliest_date_at_median_stock_price_name_string <- gsub("latest", "earliest", latest_date_at_median_stock_price_name_string)
cat(earliest_date_at_median_stock_price_name_string)
# paste below, edit max to min
# Convert date strings to Date objects
dates_at_median_stock_price <- as.Date(c(GE_formatted_date_at_median_price, CocaCola_formatted_date_at_median_price, ProcterGamble_formatted_date_at_median_price, Boeing_formatted_date_at_median_price,IBM_formatted_date_at_median_price), format = "%B %d, %Y")
dates_at_median_stock_price 
earliest_date_at_median_stock_price <- min(dates_at_median_stock_price)
earliest_date_at_median_stock_price
formatted_earliest_date_at_median_stock_price <- format(earliest_date_at_median_stock_price, "%B %d, %Y")
formatted_earliest_date_at_median_stock_price

# similar in java
if (formatted_earliest_date_at_median_stock_price == IBM_formatted_date_at_median_price) {
  earliest_date_at_median_stock_price_name <- IBM_median_stock_price_text
} else if (formatted_earliest_date_at_median_stock_price == CocaCola_formatted_date_at_median_price) {
  earliest_date_at_median_stock_price_name <- CocaCola_median_stock_price_text
} else if (formatted_earliest_date_at_median_stock_price ==  GE_formatted_date_at_median_price) {
  earliest_date_at_median_stock_price_name <- GE_median_stock_price_text
} else if (formatted_earliest_date_at_median_stock_price == ProcterGamble_formatted_date_at_median_price) {
  earliest_date_at_median_stock_price_name <- ProcterGamble_median_stock_price_text
} else {
  earliest_date_at_median_stock_price_name <- Boeing_median_stock_price_text
}
cat(earliest_date_at_median_stock_price_name)
# prints out the stock with the median mean stock price over the period
cat(earliest_date_at_median_stock_price_name, "This was the earliest date at a median stock price of all 5 stocks over this period.")
# compare to latest
cat(latest_date_at_median_stock_price_name, "This was the latest date at a median stock price of all 5 stocks over this period.")

# find the number of days between the latest and earliest date
latest_earliest_date_at_median_price_days_difference <- difftime(latest_date_at_median_stock_price, earliest_date_at_median_stock_price, units = "days")
latest_earliest_date_at_median_price_days_difference 
cat("The number of days between the earliest and latest median stock price dates is:", as.numeric(latest_earliest_date_at_median_price_days_difference ), "days.")

# reformat to years, months, days
# Convert days to years, months, and days
# Calculate the difference in days between dates
latest_earliest_date_at_median_price_days_difference <- as.numeric(difftime(latest_date_at_median_stock_price, earliest_date_at_median_stock_price, units = "days"))
latest_earliest_date_at_median_price_days_difference 

# Convert days to years, months, and days
median_difference_years <- floor(latest_earliest_date_at_median_price_days_difference / 365)
median_difference_years
median_difference_months <- floor((latest_earliest_date_at_median_price_days_difference %% 365) / 30)
median_difference_months
median_difference_remaining_days <- latest_earliest_date_at_median_price_days_difference %% 30
median_difference_remaining_days
# Output the result
cat("The difference is approximately:", median_difference_years, "years,", median_difference_months, "months, and", median_difference_remaining_days, "days between the earliest and latest date at the median price.")


# 1.7 find the max median stock price over time period
IBM_median_stock_price_text <- paste("The median stock price for IBM was $", IBM_median_price, "on", IBM_formatted_date_at_median_price, ".")
cat(IBM_median_stock_price_text)
ProcterGamble_median_stock_price_text <- paste("The median stock price for ProcterGamble was $", ProcterGamble_median_price, "on", ProcterGamble_formatted_date_at_median_price, ".")
cat(ProcterGamble_median_stock_price_text)
CocaCola_median_stock_price_text <- paste("The median stock price for CocaCola was $", CocaCola_median_price, "on", CocaCola_formatted_date_at_median_price, ".")
cat(CocaCola_median_stock_price_text)
Boeing_median_stock_price_text <- paste("The median stock price for Boeing was $", Boeing_median_price, "on", Boeing_formatted_date_at_median_price, ".")
cat(Boeing_median_stock_price_text)  
GE_median_stock_price_text <- paste("The median stock price for GE was $", GE_median_price, "on", GE_formatted_date_at_median_price, ".")
cat(GE_mmedian_stock_price_text)

# 1.7 else statement stock with max median price, same format as Java if else
max_median_stock_price <- max(GE_median_price, CocaCola_median_price, ProcterGamble_median_price, Boeing_median_price, IBM_median_price)
max_median_stock_price
# similar in java
if (max_median_stock_price == IBM_median_price) {
  max_median_stock_price_name <- IBM_median_stock_price_text
} else if (max_median_stock_price == CocaCola_median_price) {
  max_median_stock_price_name <- CocaCola_median_stock_price_text
} else if (max_mean_stock_price == GE_median_price) {
  max_median_stock_price_name <- GE_median_stock_price_text
} else if (max_median_stock_price == ProcterGamble_median_price) {
  max_median_stock_price_name <- ProcterGamble_median_stock_price_text
} else {
  max_median_stock_price_name <- Boeing_median_stock_price_text
}
cat(max_median_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(max_median_stock_price_name, "This was the maximum median stock price of all stocks over this period.")
# prints out max median stock price

# 1.7 switch from max to min median
max_median_stock_price_name_string <- '# 1.7 find the max median stock price over time period
IBM_max_median_stock_price_text <- paste("The median stock price for IBM was $", IBM_median_price, "on", IBM_formatted_date_at_median_price, ".")
cat(IBM_max_median_stock_price_text)
ProcterGamble_max_median_stock_price_text <- paste("The median stock price for ProcterGamble was $", ProcterGamble_median_price, "on", ProcterGamble_formatted_date_at_median_price, ".")
cat(ProcterGamble_max_median_stock_price_text)
CocaCola_max_median_stock_price_text <- paste("The median stock price for CocaCola was $", CocaCola_median_price, "on", CocaCola_formatted_date_at_median_price, ".")
cat(CocaCola_max_median_stock_price_text)
Boeing_max_median_stock_price_text <- paste("The median stock price for Boeing was $", Boeing_median_price, "on", Boeing_formatted_date_at_median_price, ".")
cat(Boeing_max_median_stock_price_text)  
GE_max_median_stock_price_text <- paste("The median stock price for GE was $", GE_median_price, "on", GE_formatted_date_at_median_price, ".")
cat(GE_max_median_stock_price_text)

# 1.7 else statement stock with max median price, same format as Java if else
max_median_stock_price <- max(GE_median_price, CocaCola_median_price, ProcterGamble_median_price, Boeing_median_price, IBM_median_price)
max_median_stock_price
# similar in java
if (max_median_stock_price == IBM_median_price) {
  max_median_stock_price_name <- IBM_max_median_stock_price_text
} else if (max_median_stock_price == CocaCola_median_price) {
  max_median_stock_price_name <- CocaCola_max_median_stock_price_text
} else if (max_mean_stock_price == GE_median_price) {
  max_median_stock_price_name <- GE_max_median_stock_price_text
} else if (max_median_stock_price == ProcterGamble_median_price) {
  max_median_stock_price_name <- ProcterGamble_max_median_stock_price_text
} else {
  max_median_stock_price_name <- Boeing_max_median_stock_price_text
}
cat(max_median_stock_price_name)
# prints out the stock with the max mean stock price over the period
cat(max_median_stock_price_name, "This was the maximum median stock price of all stocks over this period.")
'
# use gsub to switch max to min median
min_median_stock_price_name_string <- gsub("max", "min", max_median_stock_price_name_string )
cat(min_median_stock_price_name_string) # paste below
### start paste
# 1.7 find the min median stock price over time period
IBM_min_median_stock_price_text <- paste("The median stock price for IBM was $", IBM_median_price, "on", IBM_formatted_date_at_median_price, ".")
cat(IBM_min_median_stock_price_text)
ProcterGamble_min_median_stock_price_text <- paste("The median stock price for ProcterGamble was $", ProcterGamble_median_price, "on", ProcterGamble_formatted_date_at_median_price, ".")
cat(ProcterGamble_min_median_stock_price_text)
CocaCola_min_median_stock_price_text <- paste("The median stock price for CocaCola was $", CocaCola_median_price, "on", CocaCola_formatted_date_at_median_price, ".")
cat(CocaCola_min_median_stock_price_text)
Boeing_min_median_stock_price_text <- paste("The median stock price for Boeing was $", Boeing_median_price, "on", Boeing_formatted_date_at_median_price, ".")
cat(Boeing_min_median_stock_price_text)  
GE_min_median_stock_price_text <- paste("The median stock price for GE was $", GE_median_price, "on", GE_formatted_date_at_median_price, ".")
cat(GE_min_median_stock_price_text)

# 1.7 else statement stock with min median price, same format as Java if else
min_median_stock_price <- min(GE_median_price, CocaCola_median_price, ProcterGamble_median_price, Boeing_median_price, IBM_median_price)
min_median_stock_price
# similar in java
if (min_median_stock_price == IBM_median_price) {
  min_median_stock_price_name <- IBM_min_median_stock_price_text
} else if (min_median_stock_price == CocaCola_median_price) {
  min_median_stock_price_name <- CocaCola_min_median_stock_price_text
} else if (min_mean_stock_price == GE_median_price) {
  min_median_stock_price_name <- GE_min_median_stock_price_text
} else if (min_median_stock_price == ProcterGamble_median_price) {
  min_median_stock_price_name <- ProcterGamble_min_median_stock_price_text
} else {
  min_median_stock_price_name <- Boeing_min_median_stock_price_text
}
cat(min_median_stock_price_name)
# prints out the stock with the min mean stock price over the period
cat(min_median_stock_price_name, "This was the minimum median stock price of all stocks over this period.")
### end paste, prints out min median stock price


# 1.8 std stock price of ProctorGamble
ProcterGamble_std <- sd(ProcterGamble$StockPrice)
ProcterGamble_std
cat("The standard deviation of the stock price of Procter & Gamble over this 
time period was ",ProcterGamble_std, ".")


# format answer to Month, date, year
summary(IBM$Date)
summary_dates <- format(summary(IBM$Date), "%B %e, %Y")
for (i in seq_along(summary_dates)) {summary_dates[i] <- format(as.Date(summary_dates[i]), "%B %e, %Y")}
summary_dates


# 2.1 Visualizing stock dynamics, ex 9 and 10
plot(CocaCola$Date, CocaCola$StockPrice, type="l")
summary(CocaCola)

# ex 9 CocaCola year at max price
cat(CocaCola_date_at_max_price_string) # paste to get code
CocaCola_date_at_max_price
CocaCola_formatted_date_at_max_price
# Evaluate the modified string as code
eval(parse(text = CocaCola_date_at_max_price_string))

# ex 10 CocaCola year at min price
cat(CocaCola_date_at_min_price) # paste to get code
CocaCola_date_at_min_price
CocaCola_formatted_date_at_min_price
# Evaluate the modified string as code
eval(parse(text = CocaCola_date_at_min_price_string))


# 2.2 ex 11 visualizng stock dynamics
# NB careful "" from web smart quotes
lines(ProcterGamble$Date, ProcterGamble$StockPrice)
# can't tell so use red and blue lines
plot(CocaCola$Date, CocaCola$StockPrice, type="l", col="red")
lines(ProcterGamble$Date, ProcterGamble$StockPrice, col="blue")
# add in vertical line
abline(v=as.Date(c("2000-03-01")), lwd=2)
legend("topleft", c("CocaCola", "ProcterGamble"),col=c("red", "blue"), lty=1)

# find the 2000 return of CocaCola and ProcterGamble
# Filter the data to the desired time frame
CocaCola_2000_sub <- subset(CocaCola, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))
CocaCola_2000_sub
ProcterGamble_2000_sub <- subset(ProcterGamble, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))
ProcterGamble_2000_sub
# Calculate the stock price difference for the two companies
CocaCola_diff <- CocaCola_2000_sub$StockPrice[length(CocaCola_2000_sub$StockPrice)] - CocaCola_2000_sub$StockPrice[1]
CocaCola_diff
ProcterGamble_diff <- ProcterGamble_2000_sub$StockPrice[length(ProcterGamble_2000_sub$StockPrice)] - ProcterGamble_2000_sub$StockPrice[1]
ProcterGamble_diff

# Print the results
cat("In 2000, CocaCola stock price difference:", CocaCola_diff, "\n")
cat("In 2000, ProcterGamble stock price difference:", ProcterGamble_diff, "\n")

# Filter the CocaCola data for 01-01-2000
CocaCola_2000_01_01 <- subset(CocaCola, Date == as.Date("2000-01-01"))
CocaCola_2000_01_01
ProcterGamble_2000_01_01 <- subset(ProcterGamble, Date == as.Date("2000-01-01"))
ProcterGamble_2000_01_01
# Print the result
cat("Coca Cola stock price on 01-01-2000:", CocaCola_2000_01_01$StockPrice, "\n")
cat("ProcterGamble stock price on 01-01-2000:", ProcterGamble_2000_01_01$StockPrice, "\n")

# divide diff by stockprice
CocaCola_2000_return <- (CocaCola_diff / CocaCola_2000_01_01$StockPrice)* 100
CocaCola_2000_return
ProcterGamble_2000_return <- (ProcterGamble_diff / ProcterGamble_2000_01_01$StockPrice)* 100
ProcterGamble_2000_return
cat("In the year 2000, ProcterGamble's return was ", ProcterGamble_2000_return, "percent, while Coca Cola's return was", CocaCola_2000_return, "percent.\n")

# plot year 2000 for CocaCola & ProcterGamble
plot(CocaCola$Date[361:372], CocaCola$StockPrice[361:372], type="l", col="red", ylim=c(0,210), main="Stock Prices of Selected Companies in 2000-2001", xlab="Date", ylab="Stock Price ($)")
lines(ProcterGamble$Date[361:372], ProcterGamble$StockPrice[361:372], col="blue")
lines(Boeing$Date[361:372], Boeing$StockPrice[361:372], col="green")
lines(GE$Date[361:372], GE$StockPrice[361:372], col="orange")
lines(IBM$Date[361:372], IBM$StockPrice[361:372], col="yellow")
legend("topleft", c("CocaCola", "ProcterGamble","Boeing", "GE","IBM"),col=c("red", "blue","green","orange","yellow"), lty=1)

# alternative plot for year 2000 CocaCola & ProcterGamble
library(ggplot2)
# Filter data for dates from 2000-01-01 to 2000-12-31
CocaCola_2000 <- CocaCola[CocaCola$Date >= as.Date("2000-01-01") & CocaCola$Date <= as.Date("2000-12-31"),]
# Create line plot
ggplot(CocaCola_2000, aes(x = Date, y = StockPrice)) +
  geom_line() + labs(x = "Date", y = "Stock Price") +
  ggtitle("CocaCola Stock Prices in 2000")
# Merge CocaCola and ProcterGamble data frames
combined_data <- merge(CocaCola_2000, ProcterGamble, by = "Date", suffixes = c("_CocaCola", "_ProcterGamble"))
# Create line plot with both companies' data and legend
ggplot(combined_data, aes(x = Date)) +
  geom_line(aes(y = StockPrice_CocaCola, color = "CocaCola")) +
  geom_line(aes(y = StockPrice_ProcterGamble, color = "ProcterGamble")) +
  labs(x = "Date", y = "Stock Price", color = "Company") +
  scale_color_manual(values = c("red", "blue")) +
  ggtitle("CocaCola and ProcterGamble Stock Prices in 2000")

# merge all plots

# numerically find return of 2000 for all stocks
# Filter the data to the desired time frame
CocaCola_2000_sub <- subset(CocaCola, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))
CocaCola_2000_sub
CocaCola_diff <- CocaCola_2000_sub$StockPrice[length(CocaCola_2000_sub$StockPrice)] - CocaCola_2000_sub$StockPrice[1]
CocaCola_diff
# Filter the CocaCola data for 01-01-2000
CocaCola_2000_01_01 <- subset(CocaCola, Date == as.Date("2000-01-01"))
CocaCola_2000_01_01
cat("In 2000, CocaCola stock price difference:", CocaCola_diff, "\n")
CocaCola_2000_return <- (CocaCola_diff / CocaCola_2000_01_01$StockPrice)* 100
CocaCola_2000_return
cat("In 2000, CocaCola return was",CocaCola_2000_return,"percent.")

# make a string
CocaCola_2000_return_string <- '# numerically find return of 2000 for all stocks
# Filter the data to the desired time frame
CocaCola_2000_sub <- subset(CocaCola, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))
CocaCola_2000_sub
CocaCola_diff <- CocaCola_2000_sub$StockPrice[length(CocaCola_2000_sub$StockPrice)] - CocaCola_2000_sub$StockPrice[1]
CocaCola_diff
# Filter the CocaCola data for 01-01-2000
CocaCola_2000_01_01 <- subset(CocaCola, Date == as.Date("2000-01-01"))
CocaCola_2000_01_01
cat("In 2000, CocaCola stock price difference:", CocaCola_diff, "\n")
CocaCola_2000_return <- (CocaCola_diff / CocaCola_2000_01_01$StockPrice)* 100
CocaCola_2000_return
cat("In 2000, CocaCola return was",CocaCola_2000_return,"percent.")
'

# switch from CocaCola to ProcterGamble(2)
ProcterGamble_2000_return_string <- gsub("CocaCola", "ProcterGamble",CocaCola_2000_return_string)
cat(ProcterGamble_2000_return_string) # paste output below
# start output paste
# numerically find return of 2000 for all stocks
# Filter the data to the desired time frame
ProcterGamble_2000_sub <- subset(ProcterGamble, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))
ProcterGamble_2000_sub
ProcterGamble_diff <- ProcterGamble_2000_sub$StockPrice[length(ProcterGamble_2000_sub$StockPrice)] - ProcterGamble_2000_sub$StockPrice[1]
ProcterGamble_diff
# Filter the ProcterGamble data for 01-01-2000
ProcterGamble_2000_01_01 <- subset(ProcterGamble, Date == as.Date("2000-01-01"))
ProcterGamble_2000_01_01
cat("In 2000, ProcterGamble stock price difference:", ProcterGamble_diff, "
")
ProcterGamble_2000_return <- (ProcterGamble_diff / ProcterGamble_2000_01_01$StockPrice)* 100
ProcterGamble_2000_return
cat("In 2000, ProcterGamble return was",ProcterGamble_2000_return,"percent.")
# end output paste
# Evaluate the modified string as code
eval(parse(text = ProcterGamble_2000_return_string))


# switch from CocaCola to Boeing(3)
Boeing_2000_return_string <- gsub("CocaCola", "Boeing",CocaCola_2000_return_string)
# Evaluate the modified string as code
eval(parse(text = Boeing_2000_return_string))
# long way
cat(Boeing_2000_return_string) # can omit paste
# numerically find return of 2000 for all stocks
# Filter the data to the desired time frame
Boeing_2000_sub <- subset(Boeing, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))
Boeing_2000_sub
Boeing_diff <- Boeing_2000_sub$StockPrice[length(Boeing_2000_sub$StockPrice)] - Boeing_2000_sub$StockPrice[1]
Boeing_diff
# Filter the Boeing data for 01-01-2000
Boeing_2000_01_01 <- subset(Boeing, Date == as.Date("2000-01-01"))
Boeing_2000_01_01
cat("In 2000, Boeing stock price difference:", Boeing_diff, "
")
Boeing_2000_return <- (Boeing_diff / Boeing_2000_01_01$StockPrice)* 100
Boeing_2000_return
cat("In 2000, Boeing return was",Boeing_2000_return,"percent.")

# switch from CocaCola to GE(4)
GE_2000_return_string <- gsub("CocaCola", "GE",CocaCola_2000_return_string)
# Evaluate the modified string as code
eval(parse(text = GE_2000_return_string))
# long way
cat(GE_2000_return_string) # can omit here

# switch from CocaCola to IBM(4)
IBM_2000_return_string <- gsub("CocaCola", "IBM", CocaCola_2000_return_string)
# Evaluate the modified string as code
eval(parse(text = IBM_2000_return_string))
# long way
cat(IBM_2000_return_string) # can omit here

# same format as Java if else
lowest_2000_return <- min(IBM_2000_return, CocaCola_2000_return, GE_2000_return, ProcterGamble_2000_return, Boeing_2000_return)
lowest_2000_return

# similar in java
if (lowest_2000_return == IBM_2000_return) {
  lowest_return_name <- "IBM_2000_return"
} else if (lowest_2000_return == CocaCola_2000_return) {
  lowest_return_name <- "CocaCola_2000_return"
} else if (lowest_2000_return == GE_2000_return) {
  lowest_return_name <- "GE_2000_return"
} else if (lowest_2000_return == ProcterGamble_2000_return) {
  lowest_return_name <- "ProcterGamble_2000_return"
} else {
  lowest_return_name <- "Boeing_2000_return"
}
# prints out the stock with the lowest return
cat("The lowest return is", lowest_return_name, "with a value of", lowest_2000_return)

# find highest 2000 return, use gsub
lowest_2000_return_string <- '# same format as Java if else
lowest_2000_return <- min(IBM_2000_return, CocaCola_2000_return, GE_2000_return, ProcterGamble_2000_return, Boeing_2000_return)
lowest_2000_return

# similar in java
if (lowest_2000_return == IBM_2000_return) {
  lowest_return_name <- "IBM_2000_return"
} else if (lowest_2000_return == CocaCola_2000_return) {
  lowest_return_name <- "CocaCola_2000_return"
} else if (lowest_2000_return == GE_2000_return) {
  lowest_return_name <- "GE_2000_return"
} else if (lowest_2000_return == ProcterGamble_2000_return) {
  lowest_return_name <- "ProcterGamble_2000_return"
} else {
  lowest_return_name <- "Boeing_2000_return"
}
# prints out the stock with the lowest return
cat("The lowest return is", lowest_return_name, "with a value of", lowest_2000_return)
'
highest_2000_return_string <- gsub("lowest", "highest", lowest_2000_return_string)
cat(highest_2000_return_string) # switch min for max
# paste here
# same format as Java if else
highest_2000_return <- max(IBM_2000_return, CocaCola_2000_return, GE_2000_return, ProcterGamble_2000_return, Boeing_2000_return)
highest_2000_return

# similar in java
if (highest_2000_return == IBM_2000_return) {
  highest_return_name <- "IBM_2000_return"
} else if (highest_2000_return == CocaCola_2000_return) {
  highest_return_name <- "CocaCola_2000_return"
} else if (highest_2000_return == GE_2000_return) {
  highest_return_name <- "GE_2000_return"
} else if (highest_2000_return == ProcterGamble_2000_return) {
  highest_return_name <- "ProcterGamble_2000_return"
} else {
  highest_return_name <- "Boeing_2000_return"
}
# prints out the stock with the highest return
cat("The highest return is", highest_return_name, "with a value of", highest_2000_return)


# plot of all 5 stocks for 2000
plot(CocaCola$Date[361:372], CocaCola$StockPrice[361:372], type="l", col="red", ylim=c(0,210),
     main="Stock Prices of Selected Companies in 2000-2001", xlab="Date", ylab="Stock Price ($)")
lines(ProcterGamble$Date[361:372], ProcterGamble$StockPrice[361:372], col="blue")
lines(IBM$Date[361:372], IBM$StockPrice[361:372], col="green")
lines(GE$Date[361:372], GE$StockPrice[361:372], col="purple")
lines(Boeing$Date[361:372], Boeing$StockPrice[361:372], col="orange")
abline(v=as.Date(c("2000-03-01")), lwd=2)
abline(v=as.Date(c("2000-06-01")), lwd=2)
legend("topleft", c("CocaCola", "ProcterGamble", "IBM", "GE", "Boeing"),
       col=c("red", "blue", "green", "purple", "orange"), lty=1)


# 2.3 ex12,13 ProcterGamble and CocaCola in 1983
# plot of 1983
plot(CocaCola$Date[157:169], CocaCola$StockPrice[157:169], type="l", col="red", ylim=c(0,210), main="Stock Prices of Selected Companies in 1983-1984", xlab="Date", ylab="Stock Price ($)")
lines(ProcterGamble$Date[157:169], ProcterGamble$StockPrice[157:169], col="blue")
legend("topleft", c("CocaCola", "ProcterGamble"),col=c("red", "blue"), lty=1)

# alternative 1983 plot
CocaCola_ProcterGamble_2000_plot_string <- "# alternative plot for year 2000 CocaCola & ProcterGamble
library(ggplot2)
# Filter data for dates from 2000-01-01 to 2000-12-31
CocaCola_2000 <- CocaCola[CocaCola$Date >= as.Date('2000-01-01') & CocaCola$Date <= as.Date('2000-12-31'),]
# Create line plot
ggplot(CocaCola_2000, aes(x = Date, y = StockPrice)) +
  geom_line() + labs(x = 'Date', y = 'Stock Price') +
  ggtitle('CocaCola Stock Prices in 2000')
# Merge CocaCola and ProcterGamble data frames
combined_data <- merge(CocaCola_2000, ProcterGamble, by = 'Date', suffixes = c('_CocaCola', '_ProcterGamble'))
# Create line plot with both companies' data and legend
ggplot(combined_data, aes(x = Date)) +
  geom_line(aes(y = StockPrice_CocaCola, color = 'CocaCola')) +
  geom_line(aes(y = StockPrice_ProcterGamble, color = 'ProcterGamble')) +
  labs(x = 'Date', y = 'Stock Price', color = 'Company') +
  scale_color_manual(values = c('red', 'blue')) +
  ggtitle('CocaCola and ProcterGamble Stock Prices in 2000')
"
cat(CocaCola_ProcterGamble_2000_plot_string)
CocaCola_ProcterGamble_1983_plot_string <- gsub("2000", "1983", CocaCola_ProcterGamble_2000_plot_string)
cat(CocaCola_ProcterGamble_1983_plot_string)
# alternative plot for year 1983 CocaCola & ProcterGamble
library(ggplot2)
# Filter data for dates from 1983-01-01 to 1983-12-31
CocaCola_1983 <- CocaCola[CocaCola$Date >= as.Date('1983-01-01') & CocaCola$Date <= as.Date('1983-12-31'),]
# Create line plot
ggplot(CocaCola_1983, aes(x = Date, y = StockPrice)) +
  geom_line() + labs(x = 'Date', y = 'Stock Price') +
  ggtitle('CocaCola Stock Prices in 1983')
# Merge CocaCola and ProcterGamble data frames
combined_data <- merge(CocaCola_1983, ProcterGamble, by = 'Date', suffixes = c('_CocaCola', '_ProcterGamble'))
# Create line plot with both companies' data and legend
ggplot(combined_data, aes(x = Date)) +
  geom_line(aes(y = StockPrice_CocaCola, color = 'CocaCola')) +
  geom_line(aes(y = StockPrice_ProcterGamble, color = 'ProcterGamble')) +
  labs(x = 'Date', y = 'Stock Price', color = 'Company') +
  scale_color_manual(values = c('red', 'blue')) +
  ggtitle('CocaCola and ProcterGamble Stock Prices in 1983')

CocaCola_and_ProcterGamble_2000_sub_string <- '# find the 2000 return of CocaCola and ProcterGamble
# Filter the data to the desired time frame
CocaCola_2000_sub <- subset(CocaCola, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))
ProcterGamble_2000_sub <- subset(ProcterGamble, Date >= as.Date("2000-01-01") & Date <= as.Date("2000-12-31"))

# Calculate the stock price difference for the two companies
CocaCola_diff <- CocaCola_2000_sub$StockPrice[length(CocaCola_2000_sub$StockPrice)] - CocaCola_2000_sub$StockPrice[1]
CocaCola_diff
ProcterGamble_diff <- ProcterGamble_2000_sub$StockPrice[length(ProcterGamble_2000_sub$StockPrice)] - ProcterGamble_2000_sub$StockPrice[1]
ProcterGamble_diff

# Print the results
cat("In 2000, CocaCola stock price difference:", CocaCola_diff, "\n")
cat("In 2000, ProcterGamble stock price difference:", ProcterGamble_diff, "\n")

# Filter the CocaCola data for 01-01-2000
CocaCola_2000_01_01 <- subset(CocaCola, Date == as.Date("2000-01-01"))
CocaCola_2000_01_01
ProcterGamble_2000_01_01 <- subset(ProcterGamble, Date == as.Date("2000-01-01"))
ProcterGamble_2000_01_01
# Print the result
cat("Coca Cola stock price on 01-01-2000:", CocaCola_2000_01_01$StockPrice, "\n")
cat("ProcterGamble stock price on 01-01-2000:", ProcterGamble_2000_01_01$StockPrice, "\n")

# divide diff by stockprice
CocaCola_2000_return <- (CocaCola_diff / CocaCola_2000_01_01$StockPrice)* 100
CocaCola_2000_return
ProcterGamble_2000_return <- (ProcterGamble_diff / ProcterGamble_2000_01_01$StockPrice)* 100
ProcterGamble_2000_return
cat("In the year 2000, ProcterGambles return was ", ProcterGamble_2000_return, "percent, while Coca Colas return was", CocaCola_2000_return, "percent.\n")
'
# take away quotes above

CocaCola_and_ProcterGamble_1983_sub_string <- gsub("2000", "1983", CocaCola_and_ProcterGamble_2000_sub_string)
# Evaluate the modified string as code
eval(parse(text = CocaCola_and_ProcterGamble_1983_sub_string))
# long way paste
cat(CocaCola_and_ProcterGamble_1983_sub_string) # paste
# find the 1983 return of CocaCola and ProcterGamble
# Filter the data to the desired time frame
CocaCola_1983_sub <- subset(CocaCola, Date >= as.Date("1983-01-01") & Date <= as.Date("1983-12-31"))
ProcterGamble_1983_sub <- subset(ProcterGamble, Date >= as.Date("1983-01-01") & Date <= as.Date("1983-12-31"))

# Calculate the stock price difference for the two companies
CocaCola_diff <- CocaCola_1983_sub$StockPrice[length(CocaCola_1983_sub$StockPrice)] - CocaCola_1983_sub$StockPrice[1]
CocaCola_diff
ProcterGamble_diff <- ProcterGamble_1983_sub$StockPrice[length(ProcterGamble_1983_sub$StockPrice)] - ProcterGamble_1983_sub$StockPrice[1]
ProcterGamble_diff

# Print the results
cat("In 1983, CocaCola stock price difference:", CocaCola_diff, "
")
cat("In 1983, ProcterGamble stock price difference:", ProcterGamble_diff, "
")

# Filter the CocaCola data for 01-01-1983
CocaCola_1983_01_01 <- subset(CocaCola, Date == as.Date("1983-01-01"))
CocaCola_1983_01_01
CocaCola_1984_01_01 <- subset(CocaCola, Date == as.Date("1984-01-01"))
CocaCola_1984_01_01
ProcterGamble_1983_01_01 <- subset(ProcterGamble, Date == as.Date("1983-01-01"))
ProcterGamble_1983_01_01
ProcterGamble_1984_01_01 <- subset(ProcterGamble, Date == as.Date("1984-01-01"))
ProcterGamble_1984_01_01
# Print the result
cat("Coca Cola stock price on 01-01-1983:", CocaCola_1983_01_01$StockPrice, "
")
cat("ProcterGamble stock price on 01-01-1983:", ProcterGamble_1983_01_01$StockPrice, "
")

# divide diff by stockprice
CocaCola_1983_return <- (CocaCola_diff / CocaCola_1983_01_01$StockPrice)* 100
CocaCola_1983_return
ProcterGamble_1983_return <- (ProcterGamble_diff / ProcterGamble_1983_01_01$StockPrice)* 100
ProcterGamble_1983_return
cat("In the year 1983, ProcterGambles return was ", ProcterGamble_1983_return, "percent, while Coca Colas return was", CocaCola_1983_return, "percent.
")


# 3.1 visualize data
# Plot CocaCola, ProcterGamble, IBM, GE and Boeing stock prices from 2000-03 to 2000-12
CocaCola_95to05_subset <- subset(CocaCola, Date >= "1995-01-01" & Date <= "2005-12-31")
CocaCola_95to05_subset
# different from site, # locate start and end index
# Get indices for time period 1995-2005
start_1995_index <- which(CocaCola$Date == CocaCola_95to05_subset$Date[1])
start_1995_index
end_2005_index <- which(CocaCola$Date == CocaCola_95to05_subset$Date[nrow(CocaCola_95to05_subset)])
end_2005_index
#plot add titles and legend manually 301:432
plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210),
     main="Stock Prices of Selected Companies in 2000-2001", xlab="Date", ylab="Stock Price ($)")
lines(ProcterGamble$Date[301:432], ProcterGamble$StockPrice[301:432], col="blue")
lines(IBM$Date[301:432], IBM$StockPrice[301:432], col="green")
lines(GE$Date[301:432], GE$StockPrice[301:432], col="purple")
lines(Boeing$Date[301:432], Boeing$StockPrice[301:432], col="orange")
abline(v=as.Date(c("2000-03-01")), lwd=2)
legend("topleft", c("CocaCola", "ProcterGamble", "IBM", "GE", "Boeing"),
       col=c("red", "blue", "green", "purple", "orange"), lty=1)



# 3.2 ex15 highest value in 1995-2005
# Subset CocaCola data for the time period 1995-2005
CocaCola_95to05_subset <- subset(CocaCola, Date >= "1995-01-01" & Date <= "2005-12-31")
CocaCola_95to05_subset
# Find the row with the maximum stock price
max_row <- which.max(CocaCola_95to05_subset$StockPrice)
# Find the highest value of Coca-Cola stock price
CocaCola_max_95to05_date <- CocaCola_95to05_subset$Date[max_row]
CocaCola_max_95to05_date
CocaCola_max_95to05_price <- max(CocaCola_95to05_subset$StockPrice)
CocaCola_max_95to05_price
cat("CocaCola has a max price of", CocaCola_max_95to05_price, "on",format(CocaCola_max_95to05_date, "%Y-%m-%d"),".") 
# format date to "%B %d, %Y"
CocaCola_max_95to05_date_actual <- as.Date(CocaCola_max_95to05_date)
CocaCola_max_95to05_date_actual <- format(CocaCola_max_95to05_date, "%B %d, %Y")
cat("Date of max stock price for CocaCola:", CocaCola_max_95to05_date_actual, "\n")
cat("CocaCola has a max price of", CocaCola_max_95to05_price, "on",CocaCola_max_95to05_date_actual,".") 

# find max stock price and date for other stocks
CocaCola_max_95to05_price_on_date_string <-'# 3.2 highest value in 1995-2005
# Subset CocaCola data for the time period 1995-2005
CocaCola_95to05_subset <- subset(CocaCola, Date >= "1995-01-01" & Date <= "2005-12-31")
CocaCola_95to05_subset
# Find the row with the maximum stock price
max_row <- which.max(CocaCola_95to05_subset$StockPrice)
# Find the highest value of Coca-Cola stock price
CocaCola_max_95to05_date <- CocaCola_95to05_subset$Date[max_row]
CocaCola_max_95to05_date
CocaCola_max_95to05_price <- max(CocaCola_95to05_subset$StockPrice)
CocaCola_max_95to05_price
cat("CocaCola has a max price of", CocaCola_max_95to05_price, "on",format(CocaCola_max_95to05_date, "%Y-%m-%d"),".") 
# format date to "%B %d, %Y"
CocaCola_max_95to05_date_actual <- as.Date(CocaCola_max_95to05_date)
CocaCola_max_95to05_date_actual <- format(CocaCola_max_95to05_date, "%B %d, %Y")
cat("Date of max stock price for CocaCola:", CocaCola_max_95to05_date_actual, "\n")
cat("CocaCola has a max price of", CocaCola_max_95to05_price, "on",CocaCola_max_95to05_date_actual,".")
'

# switch from CocaCola to GE(2)
GE_max_95to05_price_on_date_string <- gsub("CocaCola", "GE",CocaCola_max_95to05_price_on_date_string) 
cat(GE_max_95to05_price_on_date_string) # paste and run
# 3.2 highest value in 1995-2005
# Subset GE data for the time period 1995-2005
GE_95to05_subset <- subset(GE, Date >= "1995-01-01" & Date <= "2005-12-31")
GE_95to05_subset
# Find the row with the maximum stock price
max_row <- which.max(GE_95to05_subset$StockPrice)
# Find the highest value of Coca-Cola stock price
GE_max_95to05_date <- GE_95to05_subset$Date[max_row]
GE_max_95to05_date
GE_max_95to05_price <- max(GE_95to05_subset$StockPrice)
GE_max_95to05_price
cat("GE has a max price of", GE_max_95to05_price, "on",format(GE_max_95to05_date, "%Y-%m-%d"),".") 
# format date to "%B %d, %Y"
GE_max_95to05_date_actual <- as.Date(GE_max_95to05_date)
GE_max_95to05_date_actual <- format(GE_max_95to05_date, "%B %d, %Y")
cat("Date of max stock price for GE:", GE_max_95to05_date_actual, "
")
cat("GE has a max price of", GE_max_95to05_price, "on",GE_max_95to05_date_actual,".")

# switch from CocaCola to Boeing(3)
Boeing_max_95to05_price_on_date_string <- gsub("CocaCola", "Boeing",CocaCola_max_95to05_price_on_date_string) 
# Evaluate the modified string as code
eval(parse(text = Boeing_max_95to05_price_on_date_string))
cat(Boeing_max_95to05_price_on_date_string) # don't paste here
#double check

# switch from CocaCola to ProcterGamble(4)
ProcterGamble_max_95to05_price_on_date_string <- gsub("CocaCola", "ProcterGamble",CocaCola_max_95to05_price_on_date_string) 
# Evaluate the modified string as code
eval(parse(text = ProcterGamble_max_95to05_price_on_date_string))
cat(ProcterGamble_max_95to05_price_on_date_string) # don't paste here
#double check

# switch from CocaCola to IBM(5)
IBM_max_95to05_price_on_date_string <- gsub("CocaCola", "IBM", CocaCola_max_95to05_price_on_date_string) 
eval(parse(text = IBM_max_95to05_price_on_date_string))
cat(IBM_max_95to05_price_on_date_string) # don't paste here
#double check


# comparing max stock price 95to05
IBM_stock_95to05 <- paste("IBM has a max price of", IBM_max_95to05_price, "on", IBM_max_95to05_date_actual, ".")
IBM_stock_95to05
Boeing_stock_95to05 <- paste("Boeing has a max price of", Boeing_max_95to05_price, "on", Boeing_max_95to05_date_actual, ".")
Boeing_stock_95to05
GE_stock_95to05 <- paste("GE has a max price of", GE_max_95to05_price, "on", GE_max_95to05_date_actual, ".")
GE_stock_95to05
ProcterGamble_stock_95to05 <- paste("Procter & Gamble has a max price of", ProcterGamble_max_95to05_price, "on", ProcterGamble_max_95to05_date_actual, ".")
ProcterGamble_stock_95to05
CocaCola_stock_95to05 <- paste("CocaCola has a max price of", CocaCola_max_95to05_price, "on", CocaCola_max_95to05_date_actual, ".")
CocaCola_stock_95to05
# comparing max stock price 95to05
# same format as Java if else
Max_95to05_Stock_Price <- max(IBM_max_95to05_price, CocaCola_max_95to05_price, GE_max_95to05_price, ProcterGamble_max_95to05_price, Boeing_max_95to05_price)
Max_95to05_Stock_Price

# similar in java
if (Max_95to05_Stock_Price == IBM_max_95to05_price) {
  highest_value_from_1995to2005 <- IBM_stock_95to05
} else if (Max_95to05_Stock_Price == CocaCola_max_95to05_price) {
  highest_value_from_1995to2005 <- CocaCola_stock_95to05
} else if (Max_95to05_Stock_Price == GE_max_95to05_price) {
  highest_value_from_1995to2005 <- GE_stock_95to05
} else if (Max_95to05_Stock_Price == ProcterGamble_max_95to05_price) {
  highest_value_from_1995to2005 <- ProcterGamble_stock_95to05
} else {
  highest_value_from_1995to2005 <- Boeing_stock_95to05
}
# prints out the stock with the highest value
cat("Of the five stocks from 1995-2005,", highest_value_from_1995to2005)



# 3.3 ex16 Plot CocaCola, ProcterGamble, IBM, GE and Boeing stock prices from  to 2000-12
CocaCola_Sep97toNov97_subset <- subset(CocaCola, Date >= "1997-09-01" & Date <= "1997-11-30")
CocaCola_Sep97toNov97_subset
start_Sep97toNov97_index <- which(CocaCola$Date == CocaCola_Sep97toNov97_subset$Date[1])
start_Sep97toNov97_index
end_Sep97toNov97_index <- which(CocaCola$Date == CocaCola_Sep97toNov97_subset$Date[nrow(CocaCola_Sep97toNov97_subset)])
end_Sep97toNov97_index

#plot add titles and legend manually 332:336, view from aug to dec
plot(CocaCola$Date[332:336],CocaCola$StockPrice[332:336], type="l", col="red", ylim=c(0,210),
     main="Stock Prices of Selected Companies in Oct97-Nov97", xlab="Date", ylab="Stock Price ($)")
lines(ProcterGamble$Date[332:336], ProcterGamble$StockPrice[332:336], col="blue")
lines(IBM$Date[332:336], IBM$StockPrice[332:336], col="green")
lines(GE$Date[332:336], GE$StockPrice[332:336], col="purple")
lines(Boeing$Date[332:336], Boeing$StockPrice[332:336], col="orange")
abline(v = as.Date(c("1997-09-01")), lwd = 2)
abline(v=as.Date(c("1997-11-01")), lwd=2)
legend("topleft", c("CocaCola", "ProcterGamble", "IBM", "GE", "Boeing"),
       col=c("red", "blue", "green", "purple", "orange"), lty=1)
# observe  between Sep and Nov, PG down most than Boeing

#3.3 ex16 Numerically
# Filter the data to the desired time frame
CocaCola_Sep97toNov97_subset <- subset(CocaCola, Date >= "1997-09-01" & Date <= "1997-11-30")
CocaCola_Sep97toNov97_subset
CocaCola_Sep97toNov97_diff <- CocaCola_Sep97toNov97_subset$StockPrice[length(CocaCola_Sep97toNov97_subset$StockPrice)] - CocaCola_Sep97toNov97_subset$StockPrice[1]
CocaCola_Sep97toNov97_diff
cat("From Sept. to Nov. 1997, CocaCola's stock price difference was", CocaCola_Sep97toNov97_diff, ".\n")
# Filter the CocaCola data for 1997-09-01
CocaCola_Sep97_price <- subset(CocaCola, Date == as.Date("1997-09-01"))
CocaCola_Sep97_price
CocaCola_Sep97toNov97_return <- (CocaCola_Sep97toNov97_diff / CocaCola_Sep97_price$StockPrice)* 100
CocaCola_Sep97toNov97_return
cat("From Sept. to Nov. 1997, CocaCola's return was",CocaCola_Sep97toNov97_return,"percent.\n")
# create CocaCola_Sep97toNov97_return_string
CocaCola_Sep97toNov97_return_string <-'#3.3 ex16 Numerically
# Filter the data to the desired time frame
CocaCola_Sep97toNov97_subset <- subset(CocaCola, Date >= "1997-09-01" & Date <= "1997-11-30")
CocaCola_Sep97toNov97_subset
CocaCola_Sep97toNov97_diff <- CocaCola_Sep97toNov97_subset$StockPrice[length(CocaCola_Sep97toNov97_subset$StockPrice)] - CocaCola_Sep97toNov97_subset$StockPrice[1]
CocaCola_Sep97toNov97_diff
cat("From Sept. to Nov. 1997, CocaCola\'s stock price difference was", CocaCola_Sep97toNov97_diff, ".\n")
# Filter the CocaCola data for 1997-09-01
CocaCola_Sep97_price <- subset(CocaCola, Date == as.Date("1997-09-01"))
CocaCola_Sep97_price
CocaCola_Sep97toNov97_return <- (CocaCola_Sep97toNov97_diff / CocaCola_Sep97_price$StockPrice)* 100
CocaCola_Sep97toNov97_return
cat("From Sept. to Nov. 1997, CocaCola\'s return was",CocaCola_Sep97toNov97_return,"percent.")
# double check
'
# gsub "CocaCola" "GE(2)"
GE_Sep97toNov97_return_string <- gsub("CocaCola", "GE", CocaCola_Sep97toNov97_return_string)
eval(parse(text = GE_Sep97toNov97_return_string))
cat(GE_Sep97toNov97_return_string) # paste return $ cat
GE_Sep97toNov97_return
cat("From Sept. to Nov. 1997, GE's return was",GE_Sep97toNov97_return,"percent.")


# gsub "CocaCola" "Boeing" (3)
Boeing_Sep97toNov97_return_string <- gsub("CocaCola", "Boeing", CocaCola_Sep97toNov97_return_string)
eval(parse(text = Boeing_Sep97toNov97_return_string))
cat(Boeing_Sep97toNov97_return_string) # paste return $ cat
Boeing_Sep97toNov97_return
cat("From Sept. to Nov. 1997, Boeing's return was",Boeing_Sep97toNov97_return,"percent.")


# gsub "CocaCola" "ProcterGamble" (4)
ProcterGamble_Sep97toNov97_return_string <- gsub("CocaCola", "ProcterGamble", CocaCola_Sep97toNov97_return_string)
eval(parse(text = ProcterGamble_Sep97toNov97_return_string))
cat(ProcterGamble_Sep97toNov97_return_string) # paste return $ cat
ProcterGamble_Sep97toNov97_return
cat("From Sept. to Nov. 1997, ProcterGamble's return was",ProcterGamble_Sep97toNov97_return,"percent.")


# gsub "CocaCola" "IBM" (5)
IBM_Sep97toNov97_return_string <- gsub("CocaCola", "IBM", CocaCola_Sep97toNov97_return_string)
eval(parse(text = IBM_Sep97toNov97_return_string))
cat(IBM_Sep97toNov97_return_string) # paste return $ cat
IBM_Sep97toNov97_return
cat("From Sept. to Nov. 1997, IBM's return was",IBM_Sep97toNov97_return,"percent.")


# same format as Java if else
lowest_Sep97toNov97_return <- min(IBM_Sep97toNov97_return, CocaCola_Sep97toNov97_return, GE_Sep97toNov97_return, ProcterGamble_Sep97toNov97_return, Boeing_Sep97toNov97_return)
lowest_Sep97toNov97_return

# type in name comment to print
IBM_Sep97toNov97_return_name <- paste("From Sept. to Nov. 1997, IBM's return was",IBM_Sep97toNov97_return,"percent, which was the lowest drop in stock price.")
IBM_Sep97toNov97_return_name
GE_Sep97toNov97_return_name <- paste("From Sept. to Nov. 1997, GE's return was",GE_Sep97toNov97_return,"percent, which was the lowest drop in stock price.")
GE_Sep97toNov97_return_name
CocaCola_Sep97toNov97_return_name <- paste("From Sept. to Nov. 1997, CocaCola's return was",CocaCola_Sep97toNov97_return,"percent, which was the lowest drop in stock price.")
CocaCola_Sep97toNov97_return_name
Boeing_Sep97toNov97_return_name <- paste("From Sept. to Nov. 1997, Boeing's return was",Boeing_Sep97toNov97_return,"percent, which was the lowest drop in stock price.")
Boeing_Sep97toNov97_return_name
ProcterGamble_Sep97toNov97_return_name <- paste("From Sept. to Nov. 1997, Procter Gamble's return was",ProcterGamble_Sep97toNov97_return,"percent, which was the lowest drop in stock price.")
ProcterGamble_Sep97toNov97_return_name

# similar in java
if (lowest_Sep97toNov97_return == IBM_Sep97toNov97_return) {
  IBM_Sep97toNov97_return_name
} else if (lowest_Sep97toNov97_return == CocaCola_Sep97toNov97_return) {
  CocaCola_Sep97toNov97_return_name
} else if (lowest_Sep97toNov97_return == GE_Sep97toNov97_return) {
  GE_Sep97toNov97_return_name
} else if (lowest_Sep97toNov97_return == ProcterGamble_Sep97toNov97_return) {
  ProcterGamble_Sep97toNov97_return_name 
} else {
  Boeing_Sep97toNov97_return_name
}
# should paste the ProcterGamble with the lowest return



# 3.4 ex17 top increase from 2004 tp 2005
# 3.3 ex16 Plot CocaCola, ProcterGamble, IBM, GE and Boeing stock prices from  2004-2006
CocaCola_04to06_subset <- subset(CocaCola, Date >= "2003-11-01" & Date <= "2006-02-01")
CocaCola_04to06_subset
start_04to06_index <- which(CocaCola$Date == CocaCola_04to06_subset$Date[1])
start_04to06_index
end_04to06_index <- which(CocaCola$Date == CocaCola_04to06_subset$Date[nrow(CocaCola_04to06_subset)])
end_04to06_index

#plot add titles and legend manually 407:434, view from aug to dec
plot(CocaCola$Date[407:434],CocaCola$StockPrice[407:434], type="l", col="red", ylim=c(0,210),
     main="Stock Prices of Selected Companies in Oct97-Nov97", xlab="Date", ylab="Stock Price ($)")
lines(ProcterGamble$Date[407:434], ProcterGamble$StockPrice[407:434], col="blue")
lines(IBM$Date[407:434], IBM$StockPrice[407:434], col="green")
lines(GE$Date[407:434], GE$StockPrice[407:434], col="purple")
lines(Boeing$Date[407:434], Boeing$StockPrice[407:434], col="orange")
abline(v = as.Date(c("2004-01-01")), lwd = 2)
abline(v=as.Date(c("2005-12-31")), lwd=2)
legend("topleft", c("CocaCola", "ProcterGamble", "IBM", "GE", "Boeing"),
       col=c("red", "blue", "green", "purple", "orange"), lty=1)
# observe  between 2004 to 2006, PG down most than Boeing

# 3.4 ex17 top increase from 2004to2006; numerically solve
GE_04to06_subset <- subset(GE, Date >= "2004-01-01" & Date <= "2006-12-31")
head(GE_04to06_subset)
GE_04to06_diff_diff <-GE_04to06_subset$StockPrice[length(GE_04to06_subset$StockPrice)] - GE_04to06_subset$StockPrice[1]
GE_04to06_diff_diff
GE_Jan04_price_subset <- subset(GE, Date == as.Date("2004-01-01"))
GE_Jan04_price_subset
GE_Jan04_price <- GE_Jan04_price_subset$StockPrice
GE_Jan04_price
GE_04to06_return <- (GE_04to06_diff_diff / GE_Jan04_price)* 100
GE_04to06_return
cat("From 2004 to 2006, GE's stock price return was",GE_04to06_return,"percent.\n")

# switch from GE to IBM(2), make string
GE_04to06_return_string <- '# 3.4 ex17 top increase from 2004to2006; numerically solve
GE_04to06_subset <- subset(GE, Date >= "2004-01-01" & Date <= "2006-12-31")
head(GE_04to06_subset)
GE_04to06_diff_diff <-GE_04to06_subset$StockPrice[length(GE_04to06_subset$StockPrice)] - GE_04to06_subset$StockPrice[1]
GE_04to06_diff_diff
GE_Jan04_price_subset <- subset(GE, Date == as.Date("2004-01-01"))
GE_Jan04_price_subset
GE_Jan04_price <- GE_Jan04_price_subset$StockPrice
GE_Jan04_price
GE_04to06_return <- (GE_04to06_diff_diff / GE_Jan04_price)* 100
GE_04to06_return
cat("From 2004 to 2006, GE\'s stock price return was",GE_04to06_return,"percent.\n")
'
# using gsub to switch GE for IBM(2)
IBM_04to06_return_string <- gsub("GE", "IBM",GE_04to06_return_string)
eval(parse(text = IBM_04to06_return_string))
cat(IBM_04to06_return_string) # check and paste return, cat value
IBM_04to06_return
cat("From 2004 to 2006, IBM's stock price return was",IBM_04to06_return,"percent.")

# gsub switch GE to Boeing(3)
Boeing_04to06_return_string <- gsub("GE", "Boeing",GE_04to06_return_string)
eval(parse(text = Boeing_04to06_return_string))
cat(Boeing_04to06_return_string) # check and paste return, cat value
Boeing_04to06_return
cat("From 2004 to 2006, Boeing's stock price return was",Boeing_04to06_return,"percent.")

# gsub switch GE to CocaCola(4)
CocaCola_04to06_return_string <- gsub("GE", "CocaCola",GE_04to06_return_string)
eval(parse(text = CocaCola_04to06_return_string))
cat(CocaCola_04to06_return_string) # check and paste return, cat value
CocaCola_04to06_return
cat("From 2004 to 2006, CocaCola's stock price return was",CocaCola_04to06_return,"percent.")

# gsub switch GE to ProcterGamble(5)
ProcterGamble_04to06_return_string <- gsub("GE", "ProcterGamble",GE_04to06_return_string)
eval(parse(text = ProcterGamble_04to06_return_string))
cat(ProcterGamble_04to06_return_string) # check and paste return, cat value
ProcterGamble_04to06_return
cat("From 2004 to 2006, ProcterGamble's stock price return was",ProcterGamble_04to06_return,"percent.")

# paste cat comments for output
IBM_04to06_stock_return <- paste("From 2004 to 2006, IBM's stock price return was",IBM_04to06_return,"percent.")
IBM_04to06_stock_return
ProcterGamble_04to06_stock_return <- paste("From 2004 to 2006, ProcterGamble's stock price return was",ProcterGamble_04to06_return,"percent.")
ProcterGamble_04to06_stock_return
CocaCola_04to06_stock_return <- paste("From 2004 to 2006, CocaCola's stock price return was",CocaCola_04to06_return,"percent.")
CocaCola_04to06_stock_return
Boeing_04to06_stock_return <- paste("From 2004 to 2006, Boeing's stock price return was",Boeing_04to06_return,"percent.")
Boeing_04to06_stock_return
GE_04to06_stock_return <- paste("From 2004 to 2006, GE's stock price return was",GE_04to06_return,"percent.")
GE_04to06_stock_return

# search for max return 04to06
Max_04to06_Stock_return <- max(ProcterGamble_04to06_return, GE_04to06_return, CocaCola_04to06_return, IBM_04to06_return, Boeing_04to06_return)
Max_04to06_Stock_return

# similar in java
if (Max_04to06_Stock_return == ProcterGamble_04to06_return) {
  Max_04to06_Stock_return_name <- ProcterGamble_04to06_stock_return
} else if (Max_04to06_Stock_return == GE_04to06_return) {
  Max_04to06_Stock_return_name <- GE_04to06_stock_return
} else if (Max_04to06_Stock_return == CocaCola_04to06_return) {
  Max_04to06_Stock_return_name <- CocaCola_04to06_stock_return
} else if (Max_04to06_Stock_return == IBM_04to06_return) {
  Max_04to06_Stock_return_name <- IBM_04to06_stock_return
} else {
  Max_04to06_Stock_return_name <- Boeing_04to06_stock_return
}
Max_04to06_Stock_return_name # double check
# prints out the stock with the highest value
cat("", Max_04to06_Stock_return_name, "This represents the highest increase in stock price of the 5 comapnies.")

# search for min stock return
# search for min return 04to06# paste cat comments for output
IBM_04to06_stock_return <- paste("From 2004 to 2006, IBM's stock price return was",IBM_04to06_return,"percent.")
IBM_04to06_stock_return
ProcterGamble_04to06_stock_return <- paste("From 2004 to 2006, ProcterGamble's stock price return was",ProcterGamble_04to06_return,"percent.")
ProcterGamble_04to06_stock_return
CocaCola_04to06_stock_return <- paste("From 2004 to 2006, CocaCola's stock price return was",CocaCola_04to06_return,"percent.")
CocaCola_04to06_stock_return
Boeing_04to06_stock_return <- paste("From 2004 to 2006, Boeing's stock price return was",Boeing_04to06_return,"percent.")
Boeing_04to06_stock_return
GE_04to06_stock_return <- paste("From 2004 to 2006, GE's stock price return was",GE_04to06_return,"percent.")
GE_04to06_stock_return

Min_04to06_Stock_return <- min(ProcterGamble_04to06_return, GE_04to06_return, CocaCola_04to06_return, IBM_04to06_return, Boeing_04to06_return)
Min_04to06_Stock_return

# similar in java
if (Min_04to06_Stock_return == ProcterGamble_04to06_return) {
  Min_04to06_Stock_return_name <- ProcterGamble_04to06_stock_return
} else if (Max_04to06_Stock_return == GE_04to06_return) {
  Min_04to06_Stock_return_name <- GE_04to06_stock_return
} else if (Max_04to06_Stock_return == CocaCola_04to06_return) {
  Min_04to06_Stock_return_name <- CocaCola_04to06_stock_return
} else if (Max_04to06_Stock_return == IBM_04to06_return) {
  Min_04to06_Stock_return_name <- IBM_04to06_stock_return
} else {
  Min_04to06_Stock_return_name <- Boeing_04to06_stock_return
}
Min_04to06_Stock_return_name # double check
# prints out the stock with the highest value
cat("", Min_04to06_Stock_return_name, "This represents the greatest decrease in stock price of the 5 comapnies.")


# 4.1 Montly trends ex18, from web site
months(IBM$Date)
mean(IBM$StockPrice)
tapply(IBM$StockPrice, months(IBM$Date), mean)
# compare monthly mean to overall mean
IBM_overall_mean <- mean(IBM$StockPrice)
IBM_overall_mean
IBM_monthly_mean <- tapply(IBM$StockPrice, months(IBM$Date), mean)
IBM_monthly_mean
# put months in order
IBM_monthly_mean_sorted <- IBM_monthly_mean[order(match(names(IBM_monthly_mean), month.name))]
IBM_monthly_mean_sorted
IBM_monthly_mean_diff <- IBM_monthly_mean_sorted - IBM_overall_mean
IBM_monthly_mean_diff
IBM_monthly_mean_percent_diff <- (IBM_monthly_mean_diff /IBM_overall_mean)*100
IBM_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
IBM_month_compare_mean <- IBM_monthly_mean_sorted > IBM_overall_mean
IBM_month_compare_mean # month put in alphabetitcal order
# convert to binary
IBM_month_compare_table_mean <- cbind(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# in true false format true, false
IBM_month_compare_table_mean <- data.frame(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# find the month with greatest price diff and % diff
IBM_max_monthly_mean_price_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)
IBM_max_monthly_mean_price_diff
IBM_max_mean_price_diff_month <- rownames(IBM_month_compare_table_mean)[which.max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)]
IBM_max_mean_price_diff_month
IBM_max_mean_price_percent_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_percent_diff)
IBM_max_mean_price_percent_diff 
cat("In", IBM_max_mean_price_diff_month, " IBM had the greatest monthly mean stockprice difference from the overal mean stockprice of ", IBM_max_mean_price_percent_diff , " percent higher.")

# switch from IBM to GE(2)
IBM_max_mean_monthly_price_percent_diff_string <- '
# 4.1 Montly trends ex18, from web site
months(IBM$Date)
mean(IBM$StockPrice)
tapply(IBM$StockPrice, months(IBM$Date), mean)
# compare monthly mean to overall mean
IBM_overall_mean <- mean(IBM$StockPrice)
IBM_overall_mean
IBM_monthly_mean <- tapply(IBM$StockPrice, months(IBM$Date), mean)
IBM_monthly_mean
# put months in order
IBM_monthly_mean_sorted <- IBM_monthly_mean[order(match(names(IBM_monthly_mean), month.name))]
IBM_monthly_mean_sorted
IBM_monthly_mean_diff <- IBM_monthly_mean_sorted - IBM_overall_mean
IBM_monthly_mean_diff
IBM_monthly_mean_percent_diff <- (IBM_monthly_mean_diff /IBM_overall_mean)*100
IBM_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
IBM_month_compare_mean <- IBM_monthly_mean_sorted > IBM_overall_mean
IBM_month_compare_mean # month put in alphabetitcal order
# convert to binary
IBM_month_compare_table_mean <- cbind(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# in true false format true, false
IBM_month_compare_table_mean <- data.frame(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# find the month with greatest price diff and % diff
IBM_max_monthly_mean_price_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)
IBM_max_monthly_mean_price_diff
IBM_max_mean_price_diff_month <- rownames(IBM_month_compare_table_mean)[which.max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)]
IBM_max_mean_price_diff_month
IBM_max_mean_price_percent_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_percent_diff)
IBM_max_mean_price_percent_diff 
cat("In", IBM_max_mean_price_diff_month, " IBM had the greatest monthly mean stockprice difference from the overal mean stockprice of ", IBM_max_mean_price_percent_diff , " percent higher.")
'

# switch IBM to GE(2) using gsub
GE_max_mean_monthly_price_percent_diff_string <- gsub("IBM", "GE", IBM_max_mean_monthly_price_percent_diff_string)
cat(GE_max_mean_monthly_price_percent_diff_string) # paste cat and price diff
##########t##################### run output code above
# 4.1 Montly trends ex18, from web site
months(GE$Date)
mean(GE$StockPrice)
tapply(GE$StockPrice, months(GE$Date), mean)
# compare monthly mean to overall mean
GE_overall_mean <- mean(GE$StockPrice)
GE_overall_mean
GE_monthly_mean <- tapply(GE$StockPrice, months(GE$Date), mean)
GE_monthly_mean
# put months in order
GE_monthly_mean_sorted <- GE_monthly_mean[order(match(names(GE_monthly_mean), month.name))]
GE_monthly_mean_sorted
GE_monthly_mean_diff <- GE_monthly_mean_sorted - GE_overall_mean
GE_monthly_mean_diff
GE_monthly_mean_percent_diff <- (GE_monthly_mean_diff /GE_overall_mean)*100
GE_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
GE_month_compare_mean <- GE_monthly_mean_sorted > GE_overall_mean
GE_month_compare_mean # month put in alphabetitcal order
# convert to binary
GE_month_compare_table_mean <- cbind(GE_monthly_mean_sorted, GE_overall_mean, GE_monthly_mean_diff,GE_monthly_mean_percent_diff, GE_month_compare_mean)
GE_month_compare_table_mean
# in true false format true, false
GE_month_compare_table_mean <- data.frame(GE_monthly_mean_sorted, GE_overall_mean, GE_monthly_mean_diff,GE_monthly_mean_percent_diff, GE_month_compare_mean)
GE_month_compare_table_mean
# find the month with greatest price diff and % diff
GE_max_monthly_mean_price_diff <- max(GE_month_compare_table_mean$GE_monthly_mean_diff)
GE_max_monthly_mean_price_diff
GE_max_mean_price_diff_month <- rownames(GE_month_compare_table_mean)[which.max(GE_month_compare_table_mean$GE_monthly_mean_diff)]
GE_max_mean_price_diff_month
GE_max_mean_price_percent_diff <- max(GE_month_compare_table_mean$GE_monthly_mean_percent_diff)
GE_max_mean_price_percent_diff 
cat("In", GE_max_mean_price_diff_month, " GE had the greatest monthly mean stockprice difference from the overal mean stockprice of ", GE_max_mean_price_percent_diff , " percent higher.")
########### finish copy output
eval(parse(text = GE_max_mean_monthly_price_percent_diff_string))
eval(parse(text = IBM_max_mean_monthly_price_percent_diff_string))

# switch IBM to Boeing(3) using gsub
Boeing_max_mean_monthly_price_percent_diff_string <- gsub("IBM", "Boeing", IBM_max_mean_monthly_price_percent_diff_string)
cat(Boeing_max_mean_monthly_price_percent_diff_string) # paste cat and price diff
############## run output code above
# 4.1 Montly trends ex18, from web site
months(Boeing$Date)
mean(Boeing$StockPrice)
tapply(Boeing$StockPrice, months(Boeing$Date), mean)
# compare monthly mean to overall mean
Boeing_overall_mean <- mean(Boeing$StockPrice)
Boeing_overall_mean
Boeing_monthly_mean <- tapply(Boeing$StockPrice, months(Boeing$Date), mean)
Boeing_monthly_mean
# put months in order
Boeing_monthly_mean_sorted <- Boeing_monthly_mean[order(match(names(Boeing_monthly_mean), month.name))]
Boeing_monthly_mean_sorted
Boeing_monthly_mean_diff <- Boeing_monthly_mean_sorted - Boeing_overall_mean
Boeing_monthly_mean_diff
Boeing_monthly_mean_percent_diff <- (Boeing_monthly_mean_diff /Boeing_overall_mean)*100
Boeing_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
Boeing_month_compare_mean <- Boeing_monthly_mean_sorted > Boeing_overall_mean
Boeing_month_compare_mean # month put in alphabetitcal order
# convert to binary
Boeing_month_compare_table_mean <- cbind(Boeing_monthly_mean_sorted, Boeing_overall_mean, Boeing_monthly_mean_diff,Boeing_monthly_mean_percent_diff, Boeing_month_compare_mean)
Boeing_month_compare_table_mean
# in true false format true, false
Boeing_month_compare_table_mean <- data.frame(Boeing_monthly_mean_sorted, Boeing_overall_mean, Boeing_monthly_mean_diff,Boeing_monthly_mean_percent_diff, Boeing_month_compare_mean)
Boeing_month_compare_table_mean
# find the month with greatest price diff and % diff
Boeing_max_monthly_mean_price_diff <- max(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)
Boeing_max_monthly_mean_price_diff
Boeing_max_mean_price_diff_month <- rownames(Boeing_month_compare_table_mean)[which.max(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)]
Boeing_max_mean_price_diff_month
Boeing_max_mean_price_percent_diff <- max(Boeing_month_compare_table_mean$Boeing_monthly_mean_percent_diff)
Boeing_max_mean_price_percent_diff 
cat("In", Boeing_max_mean_price_diff_month, " Boeing had the greatest monthly mean stockprice difference from the overal mean stockprice of ", Boeing_max_mean_price_percent_diff , " percent higher.")
########## finish run output
eval(parse(text = Boeing_max_mean_monthly_price_percent_diff_string))
eval(parse(text = GE_max_mean_monthly_price_percent_diff_string))
eval(parse(text = IBM_max_mean_monthly_price_percent_diff_string))

# switch IBM to CocaCola(4) using gsub
CocaCola_max_mean_monthly_price_percent_diff_string <- gsub("IBM", "CocaCola", IBM_max_mean_monthly_price_percent_diff_string)
cat(CocaCola_max_mean_monthly_price_percent_diff_string) # paste cat and price diff
############ paste of output
# 4.1 Montly trends ex18, from web site
months(CocaCola$Date)
mean(CocaCola$StockPrice)
tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
# compare monthly mean to overall mean
CocaCola_overall_mean <- mean(CocaCola$StockPrice)
CocaCola_overall_mean
CocaCola_monthly_mean <- tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
CocaCola_monthly_mean
# put months in order
CocaCola_monthly_mean_sorted <- CocaCola_monthly_mean[order(match(names(CocaCola_monthly_mean), month.name))]
CocaCola_monthly_mean_sorted
CocaCola_monthly_mean_diff <- CocaCola_monthly_mean_sorted - CocaCola_overall_mean
CocaCola_monthly_mean_diff
CocaCola_monthly_mean_percent_diff <- (CocaCola_monthly_mean_diff /CocaCola_overall_mean)*100
CocaCola_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
CocaCola_month_compare_mean <- CocaCola_monthly_mean_sorted > CocaCola_overall_mean
CocaCola_month_compare_mean # month put in alphabetitcal order
# convert to binary
CocaCola_month_compare_table_mean <- cbind(CocaCola_monthly_mean_sorted, CocaCola_overall_mean, CocaCola_monthly_mean_diff,CocaCola_monthly_mean_percent_diff, CocaCola_month_compare_mean)
CocaCola_month_compare_table_mean
# in true false format true, false
CocaCola_month_compare_table_mean <- data.frame(CocaCola_monthly_mean_sorted, CocaCola_overall_mean, CocaCola_monthly_mean_diff,CocaCola_monthly_mean_percent_diff, CocaCola_month_compare_mean)
CocaCola_month_compare_table_mean
# find the month with greatest price diff and % diff
CocaCola_max_monthly_mean_price_diff <- max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)
CocaCola_max_monthly_mean_price_diff
CocaCola_max_mean_price_diff_month <- rownames(CocaCola_month_compare_table_mean)[which.max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)]
CocaCola_max_mean_price_diff_month
CocaCola_max_mean_price_percent_diff <- max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_percent_diff)
CocaCola_max_mean_price_percent_diff 
cat("In", CocaCola_max_mean_price_diff_month, " CocaCola had the greatest monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_max_mean_price_percent_diff , " percent higher.")
##### finish run ouptut
eval(parse(text = CocaCola_max_mean_monthly_price_percent_diff_string))
eval(parse(text = Boeing_max_mean_monthly_price_percent_diff_string))
eval(parse(text = GE_max_mean_monthly_price_percent_diff_string))
eval(parse(text = IBM_max_mean_monthly_price_percent_diff_string))

# switch IBM to ProcterGamble(5) using gsub
ProcterGamble_max_mean_monthly_price_percent_diff_string <- gsub("IBM", "ProcterGamble", IBM_max_mean_monthly_price_percent_diff_string)
cat(ProcterGamble_max_mean_monthly_price_percent_diff_string) # paste cat and price diff
############## copy output
# 4.1 Montly trends ex18, from web site
months(ProcterGamble$Date)
mean(ProcterGamble$StockPrice)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
# compare monthly mean to overall mean
ProcterGamble_overall_mean <- mean(ProcterGamble$StockPrice)
ProcterGamble_overall_mean
ProcterGamble_monthly_mean <- tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
ProcterGamble_monthly_mean
# put months in order
ProcterGamble_monthly_mean_sorted <- ProcterGamble_monthly_mean[order(match(names(ProcterGamble_monthly_mean), month.name))]
ProcterGamble_monthly_mean_sorted
ProcterGamble_monthly_mean_diff <- ProcterGamble_monthly_mean_sorted - ProcterGamble_overall_mean
ProcterGamble_monthly_mean_diff
ProcterGamble_monthly_mean_percent_diff <- (ProcterGamble_monthly_mean_diff /ProcterGamble_overall_mean)*100
ProcterGamble_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
ProcterGamble_month_compare_mean <- ProcterGamble_monthly_mean_sorted > ProcterGamble_overall_mean
ProcterGamble_month_compare_mean # month put in alphabetitcal order
# convert to binary
ProcterGamble_month_compare_table_mean <- cbind(ProcterGamble_monthly_mean_sorted, ProcterGamble_overall_mean, ProcterGamble_monthly_mean_diff,ProcterGamble_monthly_mean_percent_diff, ProcterGamble_month_compare_mean)
ProcterGamble_month_compare_table_mean
# in true false format true, false
ProcterGamble_month_compare_table_mean <- data.frame(ProcterGamble_monthly_mean_sorted, ProcterGamble_overall_mean, ProcterGamble_monthly_mean_diff,ProcterGamble_monthly_mean_percent_diff, ProcterGamble_month_compare_mean)
ProcterGamble_month_compare_table_mean
# find the month with greatest price diff and % diff
ProcterGamble_max_monthly_mean_price_diff <- max(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)
ProcterGamble_max_monthly_mean_price_diff
ProcterGamble_max_mean_price_diff_month <- rownames(ProcterGamble_month_compare_table_mean)[which.max(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)]
ProcterGamble_max_mean_price_diff_month
ProcterGamble_max_mean_price_percent_diff <- max(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_percent_diff)
ProcterGamble_max_mean_price_percent_diff 
cat("In", ProcterGamble_max_mean_price_diff_month, " ProcterGamble had the greatest monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_max_mean_price_percent_diff , " percent higher.")
######### finish copy output
eval(parse(text = ProcterGamble_max_mean_monthly_price_percent_diff_string))
eval(parse(text = CocaCola_max_mean_monthly_price_percent_diff_string))
eval(parse(text = Boeing_max_mean_monthly_price_percent_diff_string))
eval(parse(text = GE_max_mean_monthly_price_percent_diff_string))
eval(parse(text = IBM_max_mean_monthly_price_percent_diff_string))
# find which stock had the greatest difference between monthly mean and overall mean
max_month_mean_price_percent_diff <- max(ProcterGamble_max_mean_price_percent_diff , CocaCola_max_mean_price_percent_diff, Boeing_max_mean_price_percent_diff , IBM_max_mean_price_percent_diff , GE_max_mean_price_percent_diff )
max_month_mean_price_percent_diff
#assign variables to string
ProctorGamble_max_month_price_percent_diff <- paste("In", ProcterGamble_max_mean_price_diff_month, " ProcterGamble had the greatest monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_max_mean_price_percent_diff , " percent higher.")
ProctorGamble_max_month_price_percent_diff
CocaCola_max_month_price_percent_diff <- paste("In", CocaCola_max_mean_price_diff_month, " CocaCola had the greatest monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_max_mean_price_percent_diff , " percent higher.")
CocaCola_max_month_price_percent_diff
GE_max_month_price_percent_diff <- paste("In", GE_max_mean_price_diff_month, " GE had the greatest monthly mean stockprice difference from the overal mean stockprice of ", GE_max_mean_price_percent_diff , " percent higher.")
GE_max_month_price_percent_diff
IBM_max_month_price_percent_diff <- paste("In", IBM_max_mean_price_diff_month, " IBM had the greatest monthly mean stockprice difference from the overal mean stockprice of ", IBM_max_mean_price_percent_diff , " percent higher.")
IBM_max_month_price_percent_diff
Boeing_max_month_price_percent_diff <- paste("In", Boeing_max_mean_price_diff_month, " Boeing had the greatest monthly mean stockprice difference from the overal mean stockprice of ", Boeing_max_mean_price_percent_diff , " percent higher.")
Boeing_max_month_price_percent_diff
# find which stock had the least difference between monthly mean and overall mean
max_month_mean_price_percent_diff <- max(ProcterGamble_max_mean_price_percent_diff , CocaCola_max_mean_price_percent_diff, Boeing_max_mean_price_percent_diff , IBM_max_mean_price_percent_diff , GE_max_mean_price_percent_diff )
max_month_mean_price_percent_diff
# similar in java, if statement
if (max_month_mean_price_percent_diff == ProcterGamble_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- ProctorGamble_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == CocaCola_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <-CocaCola_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == Boeing_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- Boeing_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == IBM_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- IBM_max_month_price_percent_diff
} else {
  max_month_mean_price_percent_diff_name <- GE_max_month_price_percent_diff
}
max_month_mean_price_percent_diff_name # double check
# prints out the stock with the highest value
cat("", max_month_mean_price_percent_diff_name, "This represents the maximum increase in stock price between the monthly and overall mean of the 5 comapnies.")


#4.1 find the month with the min monthly mean difference from overall mean
max_month_mean_price_percent_diff_name_string <-'
# IBM diff
IBM_max_monthly_mean_price_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)
IBM_max_monthly_mean_price_diff
IBM_max_mean_price_diff_month <- rownames(IBM_month_compare_table_mean)[which.max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)]
IBM_max_mean_price_diff_month
IBM_max_mean_price_percent_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_percent_diff)
IBM_max_mean_price_percent_diff 
# GE diff
GE_max_monthly_mean_price_diff <- max(GE_month_compare_table_mean$GE_monthly_mean_diff)
GE_max_monthly_mean_price_diff
GE_max_mean_price_diff_month <- rownames(GE_month_compare_table_mean)[which.max(GE_month_compare_table_mean$GE_monthly_mean_diff)]
GE_max_mean_price_diff_month
GE_max_mean_price_percent_diff <- max(GE_month_compare_table_mean$GE_monthly_mean_percent_diff)
GE_max_mean_price_percent_diff 
# Boeing diff
Boeing_max_monthly_mean_price_diff <- max(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)
Boeing_max_monthly_mean_price_diff
Boeing_max_mean_price_diff_month <- rownames(Boeing_month_compare_table_mean)[which.max(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)]
Boeing_max_mean_price_diff_month
Boeing_max_mean_price_percent_diff <- max(Boeing_month_compare_table_mean$Boeing_monthly_mean_percent_diff)
Boeing_max_mean_price_percent_diff 
# CocaCola diff
CocaCola_max_monthly_mean_price_diff <- max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)
CocaCola_max_monthly_mean_price_diff
CocaCola_max_mean_price_diff_month <- rownames(CocaCola_month_compare_table_mean)[which.max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)]
CocaCola_max_mean_price_diff_month
CocaCola_max_mean_price_percent_diff <- max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_percent_diff)
CocaCola_max_mean_price_percent_diff 
# ProcterGamble diff
ProcterGamble_max_monthly_mean_price_diff <- max(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)
ProcterGamble_max_monthly_mean_price_diff
ProcterGamble_max_mean_price_diff_month <- rownames(ProcterGamble_month_compare_table_mean)[which.max(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)]
ProcterGamble_max_mean_price_diff_month
ProcterGamble_max_mean_price_percent_diff <- max(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_percent_diff)
ProcterGamble_max_mean_price_percent_diff 
#assign variables to string
ProctorGamble_max_month_price_percent_diff <- paste("In", ProcterGamble_max_mean_price_diff_month, " ProcterGamble had the maximum monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_max_mean_price_percent_diff , " percent lower.")
ProctorGamble_max_month_price_percent_diff
CocaCola_max_month_price_percent_diff <- paste("In", CocaCola_max_mean_price_diff_month, " CocaCola had the maximum monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_max_mean_price_percent_diff , " percent lower.")
CocaCola_max_month_price_percent_diff
GE_max_month_price_percent_diff <- paste("In", GE_max_mean_price_diff_month, " GE had the maximum monthly mean stockprice difference from the overal mean stockprice of ", GE_max_mean_price_percent_diff , " percent lower.")
GE_max_month_price_percent_diff
IBM_max_month_price_percent_diff <- paste("In", IBM_max_mean_price_diff_month, " IBM had the maximum monthly mean stockprice difference from the overal mean stockprice of ", IBM_max_mean_price_percent_diff , " percent lower.")
IBM_max_month_price_percent_diff
Boeing_max_month_price_percent_diff <- paste("In", Boeing_max_mean_price_diff_month, " Boeing had the maximum monthly mean stockprice difference from the overal mean stockprice of ", Boeing_max_mean_price_percent_diff , " percent lower.")
Boeing_max_month_price_percent_diff
# find which stock had the least difference between monthly mean and overall mean
max_month_mean_price_percent_diff <- max(ProcterGamble_max_mean_price_percent_diff , CocaCola_max_mean_price_percent_diff, Boeing_max_mean_price_percent_diff , IBM_max_mean_price_percent_diff , GE_max_mean_price_percent_diff )
max_month_mean_price_percent_diff
# similar in java
if (max_month_mean_price_percent_diff == ProcterGamble_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- ProctorGamble_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == CocaCola_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <-CocaCola_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == Boeing_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- Boeing_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == IBM_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- IBM_max_month_price_percent_diff
} else {
  max_month_mean_price_percent_diff_name <- GE_max_month_price_percent_diff
}
max_month_mean_price_percent_diff_name # double check
# prints out the stock with the highest value
cat(max_month_mean_price_percent_diff_name, "This represents the greatest decrease in stock price between the monthly and overall mean of the 5 comapnies.")
'
# use gsub max to min
min_month_mean_price_percent_diff_name_string <- gsub("max","min", max_month_mean_price_percent_diff_name_string)
cat(min_month_mean_price_percent_diff_name_string) # paste below
### start paste
# IBM diff
IBM_min_monthly_mean_price_diff <- min(IBM_month_compare_table_mean$IBM_monthly_mean_diff)
IBM_min_monthly_mean_price_diff
IBM_min_mean_price_diff_month <- rownames(IBM_month_compare_table_mean)[which.min(IBM_month_compare_table_mean$IBM_monthly_mean_diff)]
IBM_min_mean_price_diff_month
IBM_min_mean_price_percent_diff <- min(IBM_month_compare_table_mean$IBM_monthly_mean_percent_diff)
IBM_min_mean_price_percent_diff 
# GE diff
GE_min_monthly_mean_price_diff <- min(GE_month_compare_table_mean$GE_monthly_mean_diff)
GE_min_monthly_mean_price_diff
GE_min_mean_price_diff_month <- rownames(GE_month_compare_table_mean)[which.min(GE_month_compare_table_mean$GE_monthly_mean_diff)]
GE_min_mean_price_diff_month
GE_min_mean_price_percent_diff <- min(GE_month_compare_table_mean$GE_monthly_mean_percent_diff)
GE_min_mean_price_percent_diff 
# Boeing diff
Boeing_min_monthly_mean_price_diff <- min(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)
Boeing_min_monthly_mean_price_diff
Boeing_min_mean_price_diff_month <- rownames(Boeing_month_compare_table_mean)[which.min(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)]
Boeing_min_mean_price_diff_month
Boeing_min_mean_price_percent_diff <- min(Boeing_month_compare_table_mean$Boeing_monthly_mean_percent_diff)
Boeing_min_mean_price_percent_diff 
# CocaCola diff
CocaCola_min_monthly_mean_price_diff <- min(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)
CocaCola_min_monthly_mean_price_diff
CocaCola_min_mean_price_diff_month <- rownames(CocaCola_month_compare_table_mean)[which.min(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)]
CocaCola_min_mean_price_diff_month
CocaCola_min_mean_price_percent_diff <- min(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_percent_diff)
CocaCola_min_mean_price_percent_diff 
# ProcterGamble diff
ProcterGamble_min_monthly_mean_price_diff <- min(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)
ProcterGamble_min_monthly_mean_price_diff
ProcterGamble_min_mean_price_diff_month <- rownames(ProcterGamble_month_compare_table_mean)[which.min(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)]
ProcterGamble_min_mean_price_diff_month
ProcterGamble_min_mean_price_percent_diff <- min(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_percent_diff)
ProcterGamble_min_mean_price_percent_diff 
#assign variables to string
ProctorGamble_min_month_price_percent_diff <- paste("In", ProcterGamble_min_mean_price_diff_month, " ProcterGamble had the minimum monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_min_mean_price_percent_diff , " percent lower.")
ProctorGamble_min_month_price_percent_diff
CocaCola_min_month_price_percent_diff <- paste("In", CocaCola_min_mean_price_diff_month, " CocaCola had the minimum monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_min_mean_price_percent_diff , " percent lower.")
CocaCola_min_month_price_percent_diff
GE_min_month_price_percent_diff <- paste("In", GE_min_mean_price_diff_month, " GE had the minimum monthly mean stockprice difference from the overal mean stockprice of ", GE_min_mean_price_percent_diff , " percent lower.")
GE_min_month_price_percent_diff
IBM_min_month_price_percent_diff <- paste("In", IBM_min_mean_price_diff_month, " IBM had the minimum monthly mean stockprice difference from the overal mean stockprice of ", IBM_min_mean_price_percent_diff , " percent lower.")
IBM_min_month_price_percent_diff
Boeing_min_month_price_percent_diff <- paste("In", Boeing_min_mean_price_diff_month, " Boeing had the minimum monthly mean stockprice difference from the overal mean stockprice of ", Boeing_min_mean_price_percent_diff , " percent lower.")
Boeing_min_month_price_percent_diff
# find which stock had the least difference between monthly mean and overall mean
min_month_mean_price_percent_diff <- min(ProcterGamble_min_mean_price_percent_diff , CocaCola_min_mean_price_percent_diff, Boeing_min_mean_price_percent_diff , IBM_min_mean_price_percent_diff , GE_min_mean_price_percent_diff )
min_month_mean_price_percent_diff
# similar in java
if (min_month_mean_price_percent_diff == ProcterGamble_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <- ProctorGamble_min_month_price_percent_diff
} else if (min_month_mean_price_percent_diff == CocaCola_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <-CocaCola_min_month_price_percent_diff
} else if (min_month_mean_price_percent_diff == Boeing_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <- Boeing_min_month_price_percent_diff
} else if (min_month_mean_price_percent_diff == IBM_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <- IBM_min_month_price_percent_diff
} else {
  min_month_mean_price_percent_diff_name <- GE_min_month_price_percent_diff
}
min_month_mean_price_percent_diff_name # double check
# prints out the stock with the highest value
cat(min_month_mean_price_percent_diff_name, "This represents the greatest decrease in stock price between the monthly and overall mean of the 5 comapnies.")
### end paste

#4.2 ex 19 per site
tapply(GE$StockPrice, months(GE$Date), mean)
tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)

# Extract the month with the highest price difference for each company
GE_max_mean_price_diff_month <- rownames(GE_month_compare_table_mean)[which.max(GE_month_compare_table_mean$GE_monthly_mean_diff)]
GE_max_mean_price_diff_month
CocaCola_max_mean_price_diff_month <- rownames(CocaCola_month_compare_table_mean)[which.max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)]
CocaCola_max_mean_price_diff_month
# Extract the maximum price difference percentage for each company
GE_max_mean_price_percent_diff <- max(GE_month_compare_table_mean$GE_monthly_mean_percent_diff)
GE_max_mean_price_percent_diff
CocaCola_max_mean_price_percent_diff <- max(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_percent_diff)
CocaCola_max_mean_price_percent_diff
# Check if both companies have the highest monthly_mean_percent_diff in January
# &(AND) operator vs |(OR)operator
if (CocaCola_max_mean_price_percent_diff == GE_max_mean_price_percent_diff | 
    CocaCola_max_mean_price_diff_month == GE_max_mean_price_diff_month) {
  print(paste("Both GE and CocaCola have the highest monthly mean percent differnce from the overall mean of", GE_max_mean_price_percent_diff," and", CocaCola_max_mean_price_percent_diff, "percent respectively, in the same month of", CocaCola_max_mean_price_diff_month,"."))
} else {
  print("There is no highest monthly_mean_percent_diff in January for both GE and CocaCola.")
}


# 4.3 monthly trends
tapply(IBM$StockPrice, months(IBM$Date), mean)
tapply(GE$StockPrice, months(GE$Date), mean)
tapply(Boeing$StockPrice, months(Boeing$Date), mean)
tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
# Create a new data frame with mean stock prices for each month for all 5 companies
monthly_means <- data.frame(
  IBM = tapply(IBM$StockPrice, months(IBM$Date), mean),
  GE = tapply(GE$StockPrice, months(GE$Date), mean),
  Boeing = tapply(Boeing$StockPrice, months(Boeing$Date), mean),
  CocaCola = tapply(CocaCola$StockPrice, months(CocaCola$Date), mean),
  ProcterGamble = tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
)
# Check if December is lower than January for all 5 companies
all(monthly_means$December < monthly_means$January) # true to show that December is lower than January


#alternative way using tables we created
GE_month_compare_table_mean
IBM_month_compare_table_mean
Boeing_month_compare_table_mean
CocaCola_month_compare_table_mean
ProcterGamble_month_compare_table_mean
# Filter the rows for December and January
GE_dec_jan_mean <- GE_month_compare_table_mean[c("December", "January"), "GE_monthly_mean_percent_diff"]
GE_dec_jan_mean
IBM_dec_jan_mean <- IBM_month_compare_table_mean[c("December", "January"), "IBM_monthly_mean_percent_diff"]
IBM_dec_jan_mean
Boeing_dec_jan_mean <- Boeing_month_compare_table_mean[c("December", "January"), "Boeing_monthly_mean_percent_diff"]
Boeing_dec_jan_mean
CocaCola_dec_jan_mean <- CocaCola_month_compare_table_mean[c("December", "January"), "CocaCola_monthly_mean_percent_diff"]
CocaCola_dec_jan_mean
ProcterGamble_dec_jan_mean <- ProcterGamble_month_compare_table_mean[c("December", "January"), "ProcterGamble_monthly_mean_percent_diff"]
ProcterGamble_dec_jan_mean
# Check if December is lower than January for all companies
all(GE_dec_jan_mean[1] < GE_dec_jan_mean[2], 
    IBM_dec_jan_mean[1] < IBM_dec_jan_mean[2], 
    Boeing_dec_jan_mean[1] < Boeing_dec_jan_mean[2], 
    CocaCola_dec_jan_mean[1] < CocaCola_dec_jan_mean[2], 
    ProcterGamble_dec_jan_mean[1] < ProcterGamble_dec_jan_mean[2])
# should return TRUE


#4.4 compare monthly median stock price vs overall median stockprice
# switch max to median using gsub 
IBM_max_median_monthly_price_percent_diff_string <- gsub("mean", "median", IBM_max_mean_monthly_price_percent_diff_string)
cat(IBM_max_median_monthly_price_percent_diff_string) # paste median price percent diff and cat
########### run above code output
# 4.1 Montly trends ex18, from web site
months(IBM$Date)
median(IBM$StockPrice)
tapply(IBM$StockPrice, months(IBM$Date), median)
# compare monthly median to overall median
IBM_overall_median <- median(IBM$StockPrice)
IBM_overall_median
IBM_monthly_median <- tapply(IBM$StockPrice, months(IBM$Date), median)
IBM_monthly_median
# put months in order
IBM_monthly_median_sorted <- IBM_monthly_median[order(match(names(IBM_monthly_median), month.name))]
IBM_monthly_median_sorted
IBM_monthly_median_diff <- IBM_monthly_median_sorted - IBM_overall_median
IBM_monthly_median_diff
IBM_monthly_median_percent_diff <- (IBM_monthly_median_diff /IBM_overall_median)*100
IBM_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
IBM_month_compare_median <- IBM_monthly_median_sorted > IBM_overall_median
IBM_month_compare_median # month put in alphabetitcal order
# convert to binary
IBM_month_compare_table_median <- cbind(IBM_monthly_median_sorted, IBM_overall_median, IBM_monthly_median_diff,IBM_monthly_median_percent_diff, IBM_month_compare_median)
IBM_month_compare_table_median
# in true false format true, false
IBM_month_compare_table_median <- data.frame(IBM_monthly_median_sorted, IBM_overall_median, IBM_monthly_median_diff,IBM_monthly_median_percent_diff, IBM_month_compare_median)
IBM_month_compare_table_median
# find the month with greatest price diff and % diff
IBM_max_monthly_median_price_diff <- max(IBM_month_compare_table_median$IBM_monthly_median_diff)
IBM_max_monthly_median_price_diff
IBM_max_median_price_diff_month <- rownames(IBM_month_compare_table_median)[which.max(IBM_month_compare_table_median$IBM_monthly_median_diff)]
IBM_max_median_price_diff_month
IBM_max_median_price_percent_diff <- max(IBM_month_compare_table_median$IBM_monthly_median_percent_diff)
IBM_max_median_price_percent_diff 
cat("In", IBM_max_median_price_diff_month, " IBM had the greatest monthly median stockprice difference from the overal median stockprice of ", IBM_max_median_price_percent_diff , " percent higher.")
######## finish run above output code
# switch from IBM to GE(2) using gsub
GE_max_median_monthly_price_percent_diff_string <- gsub("IBM", "GE", IBM_max_median_monthly_price_percent_diff_string)
cat(GE_max_median_monthly_price_percent_diff_string) # paste 2 inputs
########## copy output of run code above
# 4.1 Montly trends ex18, from web site
months(GE$Date)
median(GE$StockPrice)
tapply(GE$StockPrice, months(GE$Date), median)
# compare monthly median to overall median
GE_overall_median <- median(GE$StockPrice)
GE_overall_median
GE_monthly_median <- tapply(GE$StockPrice, months(GE$Date), median)
GE_monthly_median
# put months in order
GE_monthly_median_sorted <- GE_monthly_median[order(match(names(GE_monthly_median), month.name))]
GE_monthly_median_sorted
GE_monthly_median_diff <- GE_monthly_median_sorted - GE_overall_median
GE_monthly_median_diff
GE_monthly_median_percent_diff <- (GE_monthly_median_diff /GE_overall_median)*100
GE_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
GE_month_compare_median <- GE_monthly_median_sorted > GE_overall_median
GE_month_compare_median # month put in alphabetitcal order
# convert to binary
GE_month_compare_table_median <- cbind(GE_monthly_median_sorted, GE_overall_median, GE_monthly_median_diff,GE_monthly_median_percent_diff, GE_month_compare_median)
GE_month_compare_table_median
# in true false format true, false
GE_month_compare_table_median <- data.frame(GE_monthly_median_sorted, GE_overall_median, GE_monthly_median_diff,GE_monthly_median_percent_diff, GE_month_compare_median)
GE_month_compare_table_median
# find the month with greatest price diff and % diff
GE_max_monthly_median_price_diff <- max(GE_month_compare_table_median$GE_monthly_median_diff)
GE_max_monthly_median_price_diff
GE_max_median_price_diff_month <- rownames(GE_month_compare_table_median)[which.max(GE_month_compare_table_median$GE_monthly_median_diff)]
GE_max_median_price_diff_month
GE_max_median_price_percent_diff <- max(GE_month_compare_table_median$GE_monthly_median_percent_diff)
GE_max_median_price_percent_diff 
cat("In", GE_max_median_price_diff_month, " GE had the greatest monthly median stockprice difference from the overal median stockprice of ", GE_max_median_price_percent_diff , " percent higher.")
######## finish output of run code above
# switch from IBM to Boeing(3)
Boeing_max_median_monthly_price_percent_diff_string <- gsub("IBM", "Boeing", IBM_max_median_monthly_price_percent_diff_string)
cat(Boeing_max_median_monthly_price_percent_diff_string)
########### start run output
# 4.1 Montly trends ex18, from web site
months(Boeing$Date)
median(Boeing$StockPrice)
tapply(Boeing$StockPrice, months(Boeing$Date), median)
# compare monthly median to overall median
Boeing_overall_median <- median(Boeing$StockPrice)
Boeing_overall_median
Boeing_monthly_median <- tapply(Boeing$StockPrice, months(Boeing$Date), median)
Boeing_monthly_median
# put months in order
Boeing_monthly_median_sorted <- Boeing_monthly_median[order(match(names(Boeing_monthly_median), month.name))]
Boeing_monthly_median_sorted
Boeing_monthly_median_diff <- Boeing_monthly_median_sorted - Boeing_overall_median
Boeing_monthly_median_diff
Boeing_monthly_median_percent_diff <- (Boeing_monthly_median_diff /Boeing_overall_median)*100
Boeing_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
Boeing_month_compare_median <- Boeing_monthly_median_sorted > Boeing_overall_median
Boeing_month_compare_median # month put in alphabetitcal order
# convert to binary
Boeing_month_compare_table_median <- cbind(Boeing_monthly_median_sorted, Boeing_overall_median, Boeing_monthly_median_diff,Boeing_monthly_median_percent_diff, Boeing_month_compare_median)
Boeing_month_compare_table_median
# in true false format true, false
Boeing_month_compare_table_median <- data.frame(Boeing_monthly_median_sorted, Boeing_overall_median, Boeing_monthly_median_diff,Boeing_monthly_median_percent_diff, Boeing_month_compare_median)
Boeing_month_compare_table_median
# find the month with greatest price diff and % diff
Boeing_max_monthly_median_price_diff <- max(Boeing_month_compare_table_median$Boeing_monthly_median_diff)
Boeing_max_monthly_median_price_diff
Boeing_max_median_price_diff_month <- rownames(Boeing_month_compare_table_median)[which.max(Boeing_month_compare_table_median$Boeing_monthly_median_diff)]
Boeing_max_median_price_diff_month
Boeing_max_median_price_percent_diff <- max(Boeing_month_compare_table_median$Boeing_monthly_median_percent_diff)
Boeing_max_median_price_percent_diff 
cat("In", Boeing_max_median_price_diff_month, " Boeing had the greatest monthly median stockprice difference from the overal median stockprice of ", Boeing_max_median_price_percent_diff , " percent higher.")
######### finish run output
# switch from IBM to CocaCola(4)
CocaCola_max_median_monthly_price_percent_diff_string <- gsub("IBM", "CocaCola", IBM_max_median_monthly_price_percent_diff_string)
cat(CocaCola_max_median_monthly_price_percent_diff_string)
########### start run output
# 4.1 Montly trends ex18, from web site
months(CocaCola$Date)
median(CocaCola$StockPrice)
tapply(CocaCola$StockPrice, months(CocaCola$Date), median)
# compare monthly median to overall median
CocaCola_overall_median <- median(CocaCola$StockPrice)
CocaCola_overall_median
CocaCola_monthly_median <- tapply(CocaCola$StockPrice, months(CocaCola$Date), median)
CocaCola_monthly_median
# put months in order
CocaCola_monthly_median_sorted <- CocaCola_monthly_median[order(match(names(CocaCola_monthly_median), month.name))]
CocaCola_monthly_median_sorted
CocaCola_monthly_median_diff <- CocaCola_monthly_median_sorted - CocaCola_overall_median
CocaCola_monthly_median_diff
CocaCola_monthly_median_percent_diff <- (CocaCola_monthly_median_diff /CocaCola_overall_median)*100
CocaCola_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
CocaCola_month_compare_median <- CocaCola_monthly_median_sorted > CocaCola_overall_median
CocaCola_month_compare_median # month put in alphabetitcal order
# convert to binary
CocaCola_month_compare_table_median <- cbind(CocaCola_monthly_median_sorted, CocaCola_overall_median, CocaCola_monthly_median_diff,CocaCola_monthly_median_percent_diff, CocaCola_month_compare_median)
CocaCola_month_compare_table_median
# in true false format true, false
CocaCola_month_compare_table_median <- data.frame(CocaCola_monthly_median_sorted, CocaCola_overall_median, CocaCola_monthly_median_diff,CocaCola_monthly_median_percent_diff, CocaCola_month_compare_median)
CocaCola_month_compare_table_median
# find the month with greatest price diff and % diff
CocaCola_max_monthly_median_price_diff <- max(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)
CocaCola_max_monthly_median_price_diff
CocaCola_max_median_price_diff_month <- rownames(CocaCola_month_compare_table_median)[which.max(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)]
CocaCola_max_median_price_diff_month
CocaCola_max_median_price_percent_diff <- max(CocaCola_month_compare_table_median$CocaCola_monthly_median_percent_diff)
CocaCola_max_median_price_percent_diff 
cat("In", CocaCola_max_median_price_diff_month, " CocaCola had the greatest monthly median stockprice difference from the overal median stockprice of ", CocaCola_max_median_price_percent_diff , " percent higher.")
##### finish run output
# switch IBM to ProcterGamble(5)
ProcterGamble_max_median_monthly_price_percent_diff_string <- gsub("IBM", "ProcterGamble", IBM_max_median_monthly_price_percent_diff_string)
cat(ProcterGamble_max_median_monthly_price_percent_diff_string)
############  start run output
# 4.1 Montly trends ex18, from web site
months(ProcterGamble$Date)
median(ProcterGamble$StockPrice)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), median)
# compare monthly median to overall median
ProcterGamble_overall_median <- median(ProcterGamble$StockPrice)
ProcterGamble_overall_median
ProcterGamble_monthly_median <- tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), median)
ProcterGamble_monthly_median
# put months in order
ProcterGamble_monthly_median_sorted <- ProcterGamble_monthly_median[order(match(names(ProcterGamble_monthly_median), month.name))]
ProcterGamble_monthly_median_sorted
ProcterGamble_monthly_median_diff <- ProcterGamble_monthly_median_sorted - ProcterGamble_overall_median
ProcterGamble_monthly_median_diff
ProcterGamble_monthly_median_percent_diff <- (ProcterGamble_monthly_median_diff /ProcterGamble_overall_median)*100
ProcterGamble_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
ProcterGamble_month_compare_median <- ProcterGamble_monthly_median_sorted > ProcterGamble_overall_median
ProcterGamble_month_compare_median # month put in alphabetitcal order
# convert to binary
ProcterGamble_month_compare_table_median <- cbind(ProcterGamble_monthly_median_sorted, ProcterGamble_overall_median, ProcterGamble_monthly_median_diff,ProcterGamble_monthly_median_percent_diff, ProcterGamble_month_compare_median)
ProcterGamble_month_compare_table_median
# in true false format true, false
ProcterGamble_month_compare_table_median <- data.frame(ProcterGamble_monthly_median_sorted, ProcterGamble_overall_median, ProcterGamble_monthly_median_diff,ProcterGamble_monthly_median_percent_diff, ProcterGamble_month_compare_median)
ProcterGamble_month_compare_table_median
# find the month with greatest price diff and % diff
ProcterGamble_max_monthly_median_price_diff <- max(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)
ProcterGamble_max_monthly_median_price_diff
ProcterGamble_max_median_price_diff_month <- rownames(ProcterGamble_month_compare_table_median)[which.max(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)]
ProcterGamble_max_median_price_diff_month
ProcterGamble_max_median_price_percent_diff <- max(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_percent_diff)
ProcterGamble_max_median_price_percent_diff 
cat("In", ProcterGamble_max_median_price_diff_month, " ProcterGamble had the greatest monthly median stockprice difference from the overal median stockprice of ", ProcterGamble_max_median_price_percent_diff , " percent higher.")
########### finish run output
# compare all five
eval(parse(text = IBM_max_median_monthly_price_percent_diff_string))
eval(parse(text = GE_max_median_monthly_price_percent_diff_string))
eval(parse(text = Boeing_max_median_monthly_price_percent_diff_string))
eval(parse(text = CocaCola_max_median_monthly_price_percent_diff_string))
eval(parse(text = ProcterGamble_max_median_monthly_price_percent_diff_string))
# find the month with max median diff from overal median
# create string
max_month_mean_price_percent_diff_string <-'# find which stock had the greatest difference between monthly mean and overall mean
max_month_mean_price_percent_diff <- max(ProcterGamble_max_mean_price_percent_diff , CocaCola_max_mean_price_percent_diff, Boeing_max_mean_price_percent_diff , IBM_max_mean_price_percent_diff , GE_max_mean_price_percent_diff )
max_month_mean_price_percent_diff
#assign variables to string
ProctorGamble_max_month_mean_price_percent_diff <- paste("In", ProcterGamble_max_mean_price_diff_month, " ProcterGamble had the greatest monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_max_mean_price_percent_diff , " percent higher.")
ProctorGamble_max_month_mean_price_percent_diff
CocaCola_max_month_mean_price_percent_diff <- paste("In", CocaCola_max_mean_price_diff_month, " CocaCola had the greatest monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_max_mean_price_percent_diff , " percent higher.")
CocaCola_max_month_mean_price_percent_diff
GE_max_month_mean_price_percent_diff <- paste("In", GE_max_mean_price_diff_month, " GE had the greatest monthly mean stockprice difference from the overal mean stockprice of ", GE_max_mean_price_percent_diff , " percent higher.")
GE_max_month_mean_price_percent_diff
IBM_max_month_mean_price_percent_diff <- paste("In", IBM_max_mean_price_diff_month, " IBM had the greatest monthly mean stockprice difference from the overal mean stockprice of ", IBM_max_mean_price_percent_diff , " percent higher.")
IBM_max_month_mean_price_percent_diff
Boeing_max_month_mean_price_percent_diff <- paste("In", Boeing_max_mean_price_diff_month, " Boeing had the greatest monthly mean stockprice difference from the overal mean stockprice of ", Boeing_max_mean_price_percent_diff , " percent higher.")
Boeing_max_month_mean_price_percent_diff

# similar in java
if (max_month_mean_price_percent_diff == ProcterGamble_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- ProctorGamble_max_month_mean_price_percent_diff
} else if (max_month_mean_price_percent_diff == CocaCola_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- CocaCola_max_month_mean_price_percent_diff
} else if (max_month_mean_price_percent_diff == Boeing_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- Boeing_max_month_mean_price_percent_diff
} else if (max_month_mean_price_percent_diff == IBM_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- IBM_max_month_mean_price_percent_diff
} else {
  max_month_mean_price_percent_diff_name <- GE_max_month_mean_price_percent_diff
}
max_month_mean_price_percent_diff_name # double check
# prints out the stock with the highest value
cat("", max_month_mean_price_percent_diff_name, "This represents the highest increase in stock price between the monthly and overall mean of the 5 comapnies.")
'
# gsub switch mean to median
max_month_median_price_percent_diff_string <- gsub("mean", "median", max_month_mean_price_percent_diff_string)
cat(max_month_median_price_percent_diff_string) # paste below
####### start run output
# find which stock had the greatest difference between monthly median and overall median
max_month_median_price_percent_diff <- max(ProcterGamble_max_median_price_percent_diff , CocaCola_max_median_price_percent_diff, Boeing_max_median_price_percent_diff , IBM_max_median_price_percent_diff , GE_max_median_price_percent_diff )
max_month_median_price_percent_diff
#assign variables to string
ProctorGamble_max_month_median_price_percent_diff <- paste("In", ProcterGamble_max_median_price_diff_month, " ProcterGamble had the greatest monthly median stockprice difference from the overal median stockprice of ", ProcterGamble_max_median_price_percent_diff , " percent higher.")
ProctorGamble_max_month_median_price_percent_diff
CocaCola_max_month_median_price_percent_diff <- paste("In", CocaCola_max_median_price_diff_month, " CocaCola had the greatest monthly median stockprice difference from the overal median stockprice of ", CocaCola_max_median_price_percent_diff , " percent higher.")
CocaCola_max_month_median_price_percent_diff
GE_max_month_median_price_percent_diff <- paste("In", GE_max_median_price_diff_month, " GE had the greatest monthly median stockprice difference from the overal median stockprice of ", GE_max_median_price_percent_diff , " percent higher.")
GE_max_month_median_price_percent_diff
IBM_max_month_median_price_percent_diff <- paste("In", IBM_max_median_price_diff_month, " IBM had the greatest monthly median stockprice difference from the overal median stockprice of ", IBM_max_median_price_percent_diff , " percent higher.")
IBM_max_month_median_price_percent_diff
Boeing_max_month_median_price_percent_diff <- paste("In", Boeing_max_median_price_diff_month, " Boeing had the greatest monthly median stockprice difference from the overal median stockprice of ", Boeing_max_median_price_percent_diff , " percent higher.")
Boeing_max_month_median_price_percent_diff

# similar in java
if (max_month_median_price_percent_diff == ProcterGamble_max_median_price_percent_diff) {
  max_month_median_price_percent_diff_name <- ProctorGamble_max_month_median_price_percent_diff
} else if (max_month_median_price_percent_diff == CocaCola_max_median_price_percent_diff) {
  max_month_median_price_percent_diff_name <- CocaCola_max_month_median_price_percent_diff
} else if (max_month_median_price_percent_diff == Boeing_max_median_price_percent_diff) {
  max_month_median_price_percent_diff_name <- Boeing_max_month_median_price_percent_diff
} else if (max_month_median_price_percent_diff == IBM_max_median_price_percent_diff) {
  max_month_median_price_percent_diff_name <- IBM_max_month_median_price_percent_diff
} else {
  max_month_median_price_percent_diff_name <- GE_max_month_median_price_percent_diff
}
max_month_median_price_percent_diff_name # double check
# prints out the stock with the highest value
cat("", max_month_median_price_percent_diff_name, "This represents the highest increase in stock price between the monthly and overall median of the 5 comapnies.")
### end paste

# find min monthly median price diff
max_monthly_median_price_diff_string <- '
IBM_max_monthly_median_price_diff <- max(IBM_month_compare_table_median$IBM_monthly_median_diff)
IBM_max_monthly_median_price_diff
IBM_max_median_price_diff_month <- rownames(IBM_month_compare_table_median)[which.max(IBM_month_compare_table_median$IBM_monthly_median_diff)]
IBM_max_median_price_diff_month
IBM_max_median_price_percent_diff <- max(IBM_month_compare_table_median$IBM_monthly_median_percent_diff)
IBM_max_median_price_percent_diff 
cat("In", IBM_max_median_price_diff_month, " IBM had the greatest monthly median stockprice difference from the overal median stockprice of ", IBM_max_median_price_percent_diff , " percent higher.")
GE_max_monthly_median_price_diff <- max(GE_month_compare_table_median$GE_monthly_median_diff)
GE_max_monthly_median_price_diff
GE_max_median_price_diff_month <- rownames(GE_month_compare_table_median)[which.max(GE_month_compare_table_median$GE_monthly_median_diff)]
GE_max_median_price_diff_month
GE_max_median_price_percent_diff <- max(GE_month_compare_table_median$GE_monthly_median_percent_diff)
GE_max_median_price_percent_diff 
cat("In", GE_max_median_price_diff_month, " GE had the greatest monthly median stockprice difference from the overal median stockprice of ", GE_max_median_price_percent_diff , " percent higher.")
Boeing_max_monthly_median_price_diff <- max(Boeing_month_compare_table_median$Boeing_monthly_median_diff)
Boeing_max_monthly_median_price_diff
Boeing_max_median_price_diff_month <- rownames(Boeing_month_compare_table_median)[which.max(Boeing_month_compare_table_median$Boeing_monthly_median_diff)]
Boeing_max_median_price_diff_month
Boeing_max_median_price_percent_diff <- max(Boeing_month_compare_table_median$Boeing_monthly_median_percent_diff)
Boeing_max_median_price_percent_diff 
cat("In", Boeing_max_median_price_diff_month, " Boeing had the greatest monthly median stockprice difference from the overal median stockprice of ", Boeing_max_median_price_percent_diff , " percent higher.")
CocaCola_max_monthly_median_price_diff <- max(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)
CocaCola_max_monthly_median_price_diff
CocaCola_max_median_price_diff_month <- rownames(CocaCola_month_compare_table_median)[which.max(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)]
CocaCola_max_median_price_diff_month
CocaCola_max_median_price_percent_diff <- max(CocaCola_month_compare_table_median$CocaCola_monthly_median_percent_diff)
CocaCola_max_median_price_percent_diff 
cat("In", CocaCola_max_median_price_diff_month, " CocaCola had the greatest monthly median stockprice difference from the overal median stockprice of ", CocaCola_max_median_price_percent_diff , " percent higher.")
ProcterGamble_max_monthly_median_price_diff <- max(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)
ProcterGamble_max_monthly_median_price_diff
ProcterGamble_max_median_price_diff_month <- rownames(ProcterGamble_month_compare_table_median)[which.max(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)]
ProcterGamble_max_median_price_diff_month
ProcterGamble_max_median_price_percent_diff <- max(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_percent_diff)
ProcterGamble_max_median_price_percent_diff 
cat("In", ProcterGamble_max_median_price_diff_month, " ProcterGamble had the greatest monthly median stockprice difference from the overal median stockprice of ", ProcterGamble_max_median_price_percent_diff , " percent higher.")
'
min_monthly_median_price_diff_string <- gsub("max","min", max_monthly_median_price_diff_string)
cat (min_monthly_median_price_diff_string) # paste with some modification
### start paste
IBM_min_monthly_median_price_diff <- min(IBM_month_compare_table_median$IBM_monthly_median_diff)
IBM_min_monthly_median_price_diff
IBM_min_median_price_diff_month <- rownames(IBM_month_compare_table_median)[which.min(IBM_month_compare_table_median$IBM_monthly_median_diff)]
IBM_min_median_price_diff_month
IBM_min_median_price_percent_diff <- min(IBM_month_compare_table_median$IBM_monthly_median_percent_diff)
IBM_min_median_price_percent_diff 
cat("In", IBM_min_median_price_diff_month, " IBM had the greatest monthly median stockprice difference from the overal median stockprice of ", IBM_min_median_price_percent_diff , " percent lower.")
GE_min_monthly_median_price_diff <- min(GE_month_compare_table_median$GE_monthly_median_diff)
GE_min_monthly_median_price_diff
GE_min_median_price_diff_month <- rownames(GE_month_compare_table_median)[which.min(GE_month_compare_table_median$GE_monthly_median_diff)]
GE_min_median_price_diff_month
GE_min_median_price_percent_diff <- min(GE_month_compare_table_median$GE_monthly_median_percent_diff)
GE_min_median_price_percent_diff 
cat("In", GE_min_median_price_diff_month, " GE had the greatest monthly median stockprice difference from the overal median stockprice of ", GE_min_median_price_percent_diff , " percent lower.")
Boeing_min_monthly_median_price_diff <- min(Boeing_month_compare_table_median$Boeing_monthly_median_diff)
Boeing_min_monthly_median_price_diff
Boeing_min_median_price_diff_month <- rownames(Boeing_month_compare_table_median)[which.min(Boeing_month_compare_table_median$Boeing_monthly_median_diff)]
Boeing_min_median_price_diff_month
Boeing_min_median_price_percent_diff <- min(Boeing_month_compare_table_median$Boeing_monthly_median_percent_diff)
Boeing_min_median_price_percent_diff 
cat("In", Boeing_min_median_price_diff_month, " Boeing had the greatest monthly median stockprice difference from the overal median stockprice of ", Boeing_min_median_price_percent_diff , " percent lower.")
CocaCola_min_monthly_median_price_diff <- min(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)
CocaCola_min_monthly_median_price_diff
CocaCola_min_median_price_diff_month <- rownames(CocaCola_month_compare_table_median)[which.min(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)]
CocaCola_min_median_price_diff_month
CocaCola_min_median_price_percent_diff <- min(CocaCola_month_compare_table_median$CocaCola_monthly_median_percent_diff)
CocaCola_min_median_price_percent_diff 
cat("In", CocaCola_min_median_price_diff_month, " CocaCola had the greatest monthly median stockprice difference from the overal median stockprice of ", CocaCola_min_median_price_percent_diff , " percent lower.")
ProcterGamble_min_monthly_median_price_diff <- min(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)
ProcterGamble_min_monthly_median_price_diff
ProcterGamble_min_median_price_diff_month <- rownames(ProcterGamble_month_compare_table_median)[which.min(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)]
ProcterGamble_min_median_price_diff_month
ProcterGamble_min_median_price_percent_diff <- min(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_percent_diff)
ProcterGamble_min_median_price_percent_diff 
cat("In", ProcterGamble_min_median_price_diff_month, " ProcterGamble had the greatest monthly median stockprice difference from the overal median stockprice of ", ProcterGamble_min_median_price_percent_diff , " percent lower.")
### end paste

# switch max to min for medians
min_month_median_price_percent_diff_string <- gsub ("max", "min", max_month_median_price_percent_diff_string) 
cat(min_month_median_price_percent_diff_string ) # paste below with some modifications
### start paste
# find which stock had the greatest difference between monthly median and overall median
min_month_median_price_percent_diff <- min(ProcterGamble_min_median_price_percent_diff , CocaCola_min_median_price_percent_diff, Boeing_min_median_price_percent_diff , IBM_min_median_price_percent_diff , GE_min_median_price_percent_diff )
min_month_median_price_percent_diff
#assign variables to string
ProctorGamble_min_month_median_price_percent_diff <- paste("In", ProcterGamble_min_median_price_diff_month, " ProcterGamble had the greatest monthly median stockprice difference from the overal median stockprice of ", ProcterGamble_min_median_price_percent_diff , " percent lower.")
ProctorGamble_min_month_median_price_percent_diff
CocaCola_min_month_median_price_percent_diff <- paste("In", CocaCola_min_median_price_diff_month, " CocaCola had the greatest monthly median stockprice difference from the overal median stockprice of ", CocaCola_min_median_price_percent_diff , " percent lower.")
CocaCola_min_month_median_price_percent_diff
GE_min_month_median_price_percent_diff <- paste("In", GE_min_median_price_diff_month, " GE had the greatest monthly median stockprice difference from the overal median stockprice of ", GE_min_median_price_percent_diff , " percent lower.")
GE_min_month_median_price_percent_diff
IBM_min_month_median_price_percent_diff <- paste("In", IBM_min_median_price_diff_month, " IBM had the greatest monthly median stockprice difference from the overal median stockprice of ", IBM_min_median_price_percent_diff , " percent lower.")
IBM_min_month_median_price_percent_diff
Boeing_min_month_median_price_percent_diff <- paste("In", Boeing_min_median_price_diff_month, " Boeing had the greatest monthly median stockprice difference from the overal median stockprice of ", Boeing_min_median_price_percent_diff , " percent lower.")
Boeing_min_month_median_price_percent_diff

# similar in java
if (min_month_median_price_percent_diff == ProcterGamble_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <- ProctorGamble_min_month_median_price_percent_diff
} else if (min_month_median_price_percent_diff == CocaCola_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <- CocaCola_min_month_median_price_percent_diff
} else if (min_month_median_price_percent_diff == Boeing_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <- Boeing_min_month_median_price_percent_diff
} else if (min_month_median_price_percent_diff == IBM_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <- IBM_min_month_median_price_percent_diff
} else {
  min_month_median_price_percent_diff_name <- GE_min_month_median_price_percent_diff
}
min_month_median_price_percent_diff_name # double check
# prints out the stock with the highest value
cat("", min_month_median_price_percent_diff_name, "This represents the highest decrease in stock price between the monthly and overall median of the 5 comapnies.")


# check for medians in Dec and Jan use string
Dec_Jan_mean_string <-'# 4.3 monthly trends
tapply(IBM$StockPrice, months(IBM$Date), mean)
tapply(GE$StockPrice, months(GE$Date), mean)
tapply(Boeing$StockPrice, months(Boeing$Date), mean)
tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
# Create a new data frame with mean stock prices for each month for all 5 companies
monthly_means <- data.frame(
  IBM = tapply(IBM$StockPrice, months(IBM$Date), mean),
  GE = tapply(GE$StockPrice, months(GE$Date), mean),
  Boeing = tapply(Boeing$StockPrice, months(Boeing$Date), mean),
  CocaCola = tapply(CocaCola$StockPrice, months(CocaCola$Date), mean),
  ProcterGamble = tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
)
# Check if December is lower than January for all 5 companies
all(monthly_means$December < monthly_means$January) # true to show that December is lower than January


#alternative way using tables we created
GE_month_compare_table_mean
IBM_month_compare_table_mean
Boeing_month_compare_table_mean
CocaCola_month_compare_table_mean
ProcterGamble_month_compare_table_mean
# Filter the rows for December and January
GE_dec_jan_mean <- GE_month_compare_table_mean[c("December", "January"), "GE_monthly_mean_percent_diff"]
GE_dec_jan_mean
IBM_dec_jan_mean <- IBM_month_compare_table_mean[c("December", "January"), "IBM_monthly_mean_percent_diff"]
IBM_dec_jan_mean
Boeing_dec_jan_mean <- Boeing_month_compare_table_mean[c("December", "January"), "Boeing_monthly_mean_percent_diff"]
Boeing_dec_jan_mean
CocaCola_dec_jan_mean <- CocaCola_month_compare_table_mean[c("December", "January"), "CocaCola_monthly_mean_percent_diff"]
CocaCola_dec_jan_mean
ProcterGamble_dec_jan_mean <- ProcterGamble_month_compare_table_mean[c("December", "January"), "ProcterGamble_monthly_mean_percent_diff"]
ProcterGamble_dec_jan_mean
# Check if December is lower than January for all companies
all(GE_dec_jan_mean[1] < GE_dec_jan_mean[2], 
    IBM_dec_jan_mean[1] < IBM_dec_jan_mean[2], 
    Boeing_dec_jan_mean[1] < Boeing_dec_jan_mean[2], 
    CocaCola_dec_jan_mean[1] < CocaCola_dec_jan_mean[2], 
    ProcterGamble_dec_jan_mean[1] < ProcterGamble_dec_jan_mean[2])
# should return TRUE
'
Dec_Jan_median_string <- gsub("mean","median", Dec_Jan_mean_string) 
cat(Dec_Jan_median_string)# paste below
######### start output
# 4.3 monthly trends
tapply(IBM$StockPrice, months(IBM$Date), median)
tapply(GE$StockPrice, months(GE$Date), median)
tapply(Boeing$StockPrice, months(Boeing$Date), median)
tapply(CocaCola$StockPrice, months(CocaCola$Date), median)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), median)
# Create a new data frame with median stock prices for each month for all 5 companies
monthly_medians <- data.frame(
  IBM = tapply(IBM$StockPrice, months(IBM$Date), median),
  GE = tapply(GE$StockPrice, months(GE$Date), median),
  Boeing = tapply(Boeing$StockPrice, months(Boeing$Date), median),
  CocaCola = tapply(CocaCola$StockPrice, months(CocaCola$Date), median),
  ProcterGamble = tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), median)
)
# Check if December is lower than January for all 5 companies
all(monthly_medians$December < monthly_medians$January) # true to show that December is lower than January


#alternative way using tables we created
GE_month_compare_table_median
IBM_month_compare_table_median
Boeing_month_compare_table_median
CocaCola_month_compare_table_median
ProcterGamble_month_compare_table_median
# Filter the rows for December and January
GE_dec_jan_median <- GE_month_compare_table_median[c("December", "January"), "GE_monthly_median_percent_diff"]
GE_dec_jan_median
IBM_dec_jan_median <- IBM_month_compare_table_median[c("December", "January"), "IBM_monthly_median_percent_diff"]
IBM_dec_jan_median
Boeing_dec_jan_median <- Boeing_month_compare_table_median[c("December", "January"), "Boeing_monthly_median_percent_diff"]
Boeing_dec_jan_median
CocaCola_dec_jan_median <- CocaCola_month_compare_table_median[c("December", "January"), "CocaCola_monthly_median_percent_diff"]
CocaCola_dec_jan_median
ProcterGamble_dec_jan_median <- ProcterGamble_month_compare_table_median[c("December", "January"), "ProcterGamble_monthly_median_percent_diff"]
ProcterGamble_dec_jan_median
# Check if December is lower than January for all companies
all(GE_dec_jan_median[1] < GE_dec_jan_median[2], 
    IBM_dec_jan_median[1] < IBM_dec_jan_median[2], 
    Boeing_dec_jan_median[1] < Boeing_dec_jan_median[2], 
    CocaCola_dec_jan_median[1] < CocaCola_dec_jan_median[2], 
    ProcterGamble_dec_jan_median[1] < ProcterGamble_dec_jan_median[2])
# should return TRUE
####### finish output



### extra credit
# find the month with greatest min diff between the min month mean and overall mean

# switch from max to min
IBM_max_mean_monthly_price_percent_diff_string <- '
# 4.1 Montly trends ex18, from web site
months(IBM$Date)
mean(IBM$StockPrice)
tapply(IBM$StockPrice, months(IBM$Date), mean)
# compare monthly mean to overall mean
IBM_overall_mean <- mean(IBM$StockPrice)
IBM_overall_mean
IBM_monthly_mean <- tapply(IBM$StockPrice, months(IBM$Date), mean)
IBM_monthly_mean
# put months in order
IBM_monthly_mean_sorted <- IBM_monthly_mean[order(match(names(IBM_monthly_mean), month.name))]
IBM_monthly_mean_sorted
IBM_monthly_mean_diff <- IBM_monthly_mean_sorted - IBM_overall_mean
IBM_monthly_mean_diff
IBM_monthly_mean_percent_diff <- (IBM_monthly_mean_diff /IBM_overall_mean)*100
IBM_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
IBM_month_compare_mean <- IBM_monthly_mean_sorted > IBM_overall_mean
IBM_month_compare_mean # month put in alphabetitcal order
# convert to binary
IBM_month_compare_table_mean <- cbind(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# in true false format true, false
IBM_month_compare_table_mean <- data.frame(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# find the month with greatest price diff and % diff
IBM_max_monthly_mean_price_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)
IBM_max_monthly_mean_price_diff
IBM_max_mean_price_diff_month <- rownames(IBM_month_compare_table_mean)[which.max(IBM_month_compare_table_mean$IBM_monthly_mean_diff)]
IBM_max_mean_price_diff_month
IBM_max_mean_price_percent_diff <- max(IBM_month_compare_table_mean$IBM_monthly_mean_percent_diff)
IBM_max_mean_price_percent_diff 
cat("In", IBM_max_mean_price_diff_month, " IBM had the maximum monthly mean stockprice difference from the overal mean stockprice of ", IBM_max_mean_price_percent_diff , " percent higher.")
'

# switch max to min
IBM_min_mean_monthly_price_percent_diff_string <- gsub("max", "min", IBM_max_mean_monthly_price_percent_diff_string)
cat(IBM_min_mean_monthly_price_percent_diff_string) # paste cat and price diff
##########t##################### run output code above
# 4.1 Montly trends ex18, from web site
months(IBM$Date)
mean(IBM$StockPrice)
tapply(IBM$StockPrice, months(IBM$Date), mean)
# compare monthly mean to overall mean
IBM_overall_mean <- mean(IBM$StockPrice)
IBM_overall_mean
IBM_monthly_mean <- tapply(IBM$StockPrice, months(IBM$Date), mean)
IBM_monthly_mean
# put months in order
IBM_monthly_mean_sorted <- IBM_monthly_mean[order(match(names(IBM_monthly_mean), month.name))]
IBM_monthly_mean_sorted
IBM_monthly_mean_diff <- IBM_monthly_mean_sorted - IBM_overall_mean
IBM_monthly_mean_diff
IBM_monthly_mean_percent_diff <- (IBM_monthly_mean_diff /IBM_overall_mean)*100
IBM_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
IBM_month_compare_mean <- IBM_monthly_mean_sorted > IBM_overall_mean
IBM_month_compare_mean # month put in alphabetitcal order
# convert to binary
IBM_month_compare_table_mean <- cbind(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# in true false format true, false
IBM_month_compare_table_mean <- data.frame(IBM_monthly_mean_sorted, IBM_overall_mean, IBM_monthly_mean_diff,IBM_monthly_mean_percent_diff, IBM_month_compare_mean)
IBM_month_compare_table_mean
# find the month with greatest price diff and % diff
IBM_min_monthly_mean_price_diff <- min(IBM_month_compare_table_mean$IBM_monthly_mean_diff)
IBM_min_monthly_mean_price_diff
IBM_min_mean_price_diff_month <- rownames(IBM_month_compare_table_mean)[which.min(IBM_month_compare_table_mean$IBM_monthly_mean_diff)]
IBM_min_mean_price_diff_month
IBM_min_mean_price_percent_diff <- min(IBM_month_compare_table_mean$IBM_monthly_mean_percent_diff)
IBM_min_mean_price_percent_diff 
cat("In", IBM_min_mean_price_diff_month, " IBM had the minimum monthly mean stockprice difference from the overal mean stockprice of ", IBM_min_mean_price_percent_diff , " percent higher.")
# gsub switch IBM t GE(2)
GE_min_mean_monthly_price_percent_diff_string <- gsub("IBM", "GE", IBM_min_mean_monthly_price_percent_diff_string)
cat(GE_min_mean_monthly_price_percent_diff_string) ### paste output
##### start output
# 4.1 Montly trends ex18, from web site
months(GE$Date)
mean(GE$StockPrice)
tapply(GE$StockPrice, months(GE$Date), mean)
# compare monthly mean to overall mean
GE_overall_mean <- mean(GE$StockPrice)
GE_overall_mean
GE_monthly_mean <- tapply(GE$StockPrice, months(GE$Date), mean)
GE_monthly_mean
# put months in order
GE_monthly_mean_sorted <- GE_monthly_mean[order(match(names(GE_monthly_mean), month.name))]
GE_monthly_mean_sorted
GE_monthly_mean_diff <- GE_monthly_mean_sorted - GE_overall_mean
GE_monthly_mean_diff
GE_monthly_mean_percent_diff <- (GE_monthly_mean_diff /GE_overall_mean)*100
GE_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
GE_month_compare_mean <- GE_monthly_mean_sorted > GE_overall_mean
GE_month_compare_mean # month put in alphabetitcal order
# convert to binary
GE_month_compare_table_mean <- cbind(GE_monthly_mean_sorted, GE_overall_mean, GE_monthly_mean_diff,GE_monthly_mean_percent_diff, GE_month_compare_mean)
GE_month_compare_table_mean
# in true false format true, false
GE_month_compare_table_mean <- data.frame(GE_monthly_mean_sorted, GE_overall_mean, GE_monthly_mean_diff,GE_monthly_mean_percent_diff, GE_month_compare_mean)
GE_month_compare_table_mean
# find the month with greatest price diff and % diff
GE_min_monthly_mean_price_diff <- min(GE_month_compare_table_mean$GE_monthly_mean_diff)
GE_min_monthly_mean_price_diff
GE_min_mean_price_diff_month <- rownames(GE_month_compare_table_mean)[which.min(GE_month_compare_table_mean$GE_monthly_mean_diff)]
GE_min_mean_price_diff_month
GE_min_mean_price_percent_diff <- min(GE_month_compare_table_mean$GE_monthly_mean_percent_diff)
GE_min_mean_price_percent_diff 
cat("In", GE_min_mean_price_diff_month, " GE had the minimum monthly mean stockprice difference from the overal mean stockprice of ", GE_min_mean_price_percent_diff , " percent higher.")
#### finish output
# gsub switch IBM t Boeing(3)
Boeing_min_mean_monthly_price_percent_diff_string <- gsub("IBM", "Boeing", IBM_min_mean_monthly_price_percent_diff_string)
cat(Boeing_min_mean_monthly_price_percent_diff_string) ### paste output
### start paste output
# 4.1 Montly trends ex18, from web site
months(Boeing$Date)
mean(Boeing$StockPrice)
tapply(Boeing$StockPrice, months(Boeing$Date), mean)
# compare monthly mean to overall mean
Boeing_overall_mean <- mean(Boeing$StockPrice)
Boeing_overall_mean
Boeing_monthly_mean <- tapply(Boeing$StockPrice, months(Boeing$Date), mean)
Boeing_monthly_mean
# put months in order
Boeing_monthly_mean_sorted <- Boeing_monthly_mean[order(match(names(Boeing_monthly_mean), month.name))]
Boeing_monthly_mean_sorted
Boeing_monthly_mean_diff <- Boeing_monthly_mean_sorted - Boeing_overall_mean
Boeing_monthly_mean_diff
Boeing_monthly_mean_percent_diff <- (Boeing_monthly_mean_diff /Boeing_overall_mean)*100
Boeing_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
Boeing_month_compare_mean <- Boeing_monthly_mean_sorted > Boeing_overall_mean
Boeing_month_compare_mean # month put in alphabetitcal order
# convert to binary
Boeing_month_compare_table_mean <- cbind(Boeing_monthly_mean_sorted, Boeing_overall_mean, Boeing_monthly_mean_diff,Boeing_monthly_mean_percent_diff, Boeing_month_compare_mean)
Boeing_month_compare_table_mean
# in true false format true, false
Boeing_month_compare_table_mean <- data.frame(Boeing_monthly_mean_sorted, Boeing_overall_mean, Boeing_monthly_mean_diff,Boeing_monthly_mean_percent_diff, Boeing_month_compare_mean)
Boeing_month_compare_table_mean
# find the month with greatest price diff and % diff
Boeing_min_monthly_mean_price_diff <- min(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)
Boeing_min_monthly_mean_price_diff
Boeing_min_mean_price_diff_month <- rownames(Boeing_month_compare_table_mean)[which.min(Boeing_month_compare_table_mean$Boeing_monthly_mean_diff)]
Boeing_min_mean_price_diff_month
Boeing_min_mean_price_percent_diff <- min(Boeing_month_compare_table_mean$Boeing_monthly_mean_percent_diff)
Boeing_min_mean_price_percent_diff 
cat("In", Boeing_min_mean_price_diff_month, " Boeing had the minimum monthly mean stockprice difference from the overal mean stockprice of ", Boeing_min_mean_price_percent_diff , " percent higher.")
### finish output
# gsub switch IBM t0 CocaCola(4)
CocaCola_min_mean_monthly_price_percent_diff_string <- gsub("IBM", "CocaCola", IBM_min_mean_monthly_price_percent_diff_string)
cat(CocaCola_min_mean_monthly_price_percent_diff_string) ### paste output
### start paste output
# 4.1 Montly trends ex18, from web site
months(CocaCola$Date)
mean(CocaCola$StockPrice)
tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
# compare monthly mean to overall mean
CocaCola_overall_mean <- mean(CocaCola$StockPrice)
CocaCola_overall_mean
CocaCola_monthly_mean <- tapply(CocaCola$StockPrice, months(CocaCola$Date), mean)
CocaCola_monthly_mean
# put months in order
CocaCola_monthly_mean_sorted <- CocaCola_monthly_mean[order(match(names(CocaCola_monthly_mean), month.name))]
CocaCola_monthly_mean_sorted
CocaCola_monthly_mean_diff <- CocaCola_monthly_mean_sorted - CocaCola_overall_mean
CocaCola_monthly_mean_diff
CocaCola_monthly_mean_percent_diff <- (CocaCola_monthly_mean_diff /CocaCola_overall_mean)*100
CocaCola_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
CocaCola_month_compare_mean <- CocaCola_monthly_mean_sorted > CocaCola_overall_mean
CocaCola_month_compare_mean # month put in alphabetitcal order
# convert to binary
CocaCola_month_compare_table_mean <- cbind(CocaCola_monthly_mean_sorted, CocaCola_overall_mean, CocaCola_monthly_mean_diff,CocaCola_monthly_mean_percent_diff, CocaCola_month_compare_mean)
CocaCola_month_compare_table_mean
# in true false format true, false
CocaCola_month_compare_table_mean <- data.frame(CocaCola_monthly_mean_sorted, CocaCola_overall_mean, CocaCola_monthly_mean_diff,CocaCola_monthly_mean_percent_diff, CocaCola_month_compare_mean)
CocaCola_month_compare_table_mean
# find the month with greatest price diff and % diff
CocaCola_min_monthly_mean_price_diff <- min(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)
CocaCola_min_monthly_mean_price_diff
CocaCola_min_mean_price_diff_month <- rownames(CocaCola_month_compare_table_mean)[which.min(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_diff)]
CocaCola_min_mean_price_diff_month
CocaCola_min_mean_price_percent_diff <- min(CocaCola_month_compare_table_mean$CocaCola_monthly_mean_percent_diff)
CocaCola_min_mean_price_percent_diff 
cat("In", CocaCola_min_mean_price_diff_month, " CocaCola had the minimum monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_min_mean_price_percent_diff , " percent higher.")
#### finish paste output
# gsub switch IBM to ProcterGamble(5)
ProcterGamble_min_mean_monthly_price_percent_diff_string <- gsub("IBM", "ProcterGamble", IBM_min_mean_monthly_price_percent_diff_string)
cat(ProcterGamble_min_mean_monthly_price_percent_diff_string) ### paste output
### start paste output
# 4.1 Montly trends ex18, from web site
months(ProcterGamble$Date)
mean(ProcterGamble$StockPrice)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
# compare monthly mean to overall mean
ProcterGamble_overall_mean <- mean(ProcterGamble$StockPrice)
ProcterGamble_overall_mean
ProcterGamble_monthly_mean <- tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), mean)
ProcterGamble_monthly_mean
# put months in order
ProcterGamble_monthly_mean_sorted <- ProcterGamble_monthly_mean[order(match(names(ProcterGamble_monthly_mean), month.name))]
ProcterGamble_monthly_mean_sorted
ProcterGamble_monthly_mean_diff <- ProcterGamble_monthly_mean_sorted - ProcterGamble_overall_mean
ProcterGamble_monthly_mean_diff
ProcterGamble_monthly_mean_percent_diff <- (ProcterGamble_monthly_mean_diff /ProcterGamble_overall_mean)*100
ProcterGamble_monthly_mean_percent_diff
# compare monthly mean to overall mean,  automatically converts in binary
ProcterGamble_month_compare_mean <- ProcterGamble_monthly_mean_sorted > ProcterGamble_overall_mean
ProcterGamble_month_compare_mean # month put in alphabetitcal order
# convert to binary
ProcterGamble_month_compare_table_mean <- cbind(ProcterGamble_monthly_mean_sorted, ProcterGamble_overall_mean, ProcterGamble_monthly_mean_diff,ProcterGamble_monthly_mean_percent_diff, ProcterGamble_month_compare_mean)
ProcterGamble_month_compare_table_mean
# in true false format true, false
ProcterGamble_month_compare_table_mean <- data.frame(ProcterGamble_monthly_mean_sorted, ProcterGamble_overall_mean, ProcterGamble_monthly_mean_diff,ProcterGamble_monthly_mean_percent_diff, ProcterGamble_month_compare_mean)
ProcterGamble_month_compare_table_mean
# find the month with greatest price diff and % diff
ProcterGamble_min_monthly_mean_price_diff <- min(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)
ProcterGamble_min_monthly_mean_price_diff
ProcterGamble_min_mean_price_diff_month <- rownames(ProcterGamble_month_compare_table_mean)[which.min(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_diff)]
ProcterGamble_min_mean_price_diff_month
ProcterGamble_min_mean_price_percent_diff <- min(ProcterGamble_month_compare_table_mean$ProcterGamble_monthly_mean_percent_diff)
ProcterGamble_min_mean_price_percent_diff 
cat("In", ProcterGamble_min_mean_price_diff_month, " ProcterGamble had the minimum monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_min_mean_price_percent_diff , " percent higher.")
#### finish paste output
## find minimum mean difference from overall mean
# create string
max_month_mean_price_percent_diff_string <-'# find which stock had the greatest difference between monthly mean and overall mean
max_month_mean_price_percent_diff <- max(ProcterGamble_max_mean_price_percent_diff , CocaCola_max_mean_price_percent_diff, Boeing_max_mean_price_percent_diff , IBM_max_mean_price_percent_diff , GE_max_mean_price_percent_diff )
max_month_mean_price_percent_diff
#assign variables to string
ProctorGamble_max_month_price_percent_diff <- paste("In", ProcterGamble_max_mean_price_diff_month, " ProcterGamble had the greatest monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_max_mean_price_percent_diff , " percent higher.")
ProctorGamble_max_month_price_percent_diff
CocaCola_max_month_price_percent_diff <- paste("In", CocaCola_max_mean_price_diff_month, " CocaCola had the greatest monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_max_mean_price_percent_diff , " percent higher.")
CocaCola_max_month_price_percent_diff
GE_max_month_price_percent_diff <- paste("In", GE_max_mean_price_diff_month, " GE had the greatest monthly mean stockprice difference from the overal mean stockprice of ", GE_max_mean_price_percent_diff , " percent higher.")
GE_max_month_price_percent_diff
IBM_max_month_price_percent_diff <- paste("In", IBM_max_mean_price_diff_month, " IBM had the greatest monthly mean stockprice difference from the overal mean stockprice of ", IBM_max_mean_price_percent_diff , " percent higher.")
IBM_max_month_price_percent_diff
Boeing_max_month_price_percent_diff <- paste("In", Boeing_max_mean_price_diff_month, " Boeing had the greatest monthly mean stockprice difference from the overal mean stockprice of ", Boeing_max_mean_price_percent_diff , " percent higher.")
Boeing_max_month_price_percent_diff

# similar in java
if (max_month_mean_price_percent_diff == ProcterGamble_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- ProctorGamble_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == CocaCola_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <-CocaCola_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == Boeing_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- Boeing_max_month_price_percent_diff
} else if (max_month_mean_price_percent_diff == IBM_max_mean_price_percent_diff) {
  max_month_mean_price_percent_diff_name <- IBM_max_month_price_percent_diff
} else {
  max_month_mean_price_percent_diff_name <- GE_max_month_price_percent_diff
}
max_month_mean_price_percent_diff_name # double check
# prints out the stock with the highest value
cat("", max_month_mean_price_percent_diff_name, "This represents the highest increase in stock price between the monthly and overall mean of the 5 comapnies.")
'
# gsub switch Max to Min
min_month_mean_price_percent_diff_string <- gsub("max", "min", max_month_mean_price_percent_diff_string)
# gsub switch max to min
min_month_mean_price_percent_diff_string <- gsub("max", "min", min_month_mean_price_percent_diff_string) # paste below
cat(min_month_mean_price_percent_diff_string)
####### start run output
# find which stock had the greatest difference between monthly mean and overall mean
min_month_mean_price_percent_diff <- min(ProcterGamble_min_mean_price_percent_diff , CocaCola_min_mean_price_percent_diff, Boeing_min_mean_price_percent_diff , IBM_min_mean_price_percent_diff , GE_min_mean_price_percent_diff )
min_month_mean_price_percent_diff
#assign variables to string
ProctorGamble_min_month_mean_price_percent_diff <- paste("In", ProcterGamble_min_mean_price_diff_month, " ProcterGamble had the greatest monthly mean stockprice difference from the overal mean stockprice of ", ProcterGamble_min_mean_price_percent_diff , " percent lower.")
ProctorGamble_min_month_mean_price_percent_diff
CocaCola_min_month_price_mean_percent_diff <- paste("In", CocaCola_min_mean_price_diff_month, " CocaCola had the greatest monthly mean stockprice difference from the overal mean stockprice of ", CocaCola_min_mean_price_percent_diff , " percent lower.")
CocaCola_min_month_price_mean_percent_diff
GE_min_month_mean_price_percent_diff <- paste("In", GE_min_mean_price_diff_month, " GE had the greatest monthly mean stockprice difference from the overal mean stockprice of ", GE_min_mean_price_percent_diff , " percent lower.")
GE_min_month_mean_price_percent_diff
IBM_min_month_mean_price_percent_diff <- paste("In", IBM_min_mean_price_diff_month, " IBM had the greatest monthly mean stockprice difference from the overal mean stockprice of ", IBM_min_mean_price_percent_diff , " percent lower.")
IBM_min_month_mean_price_percent_diff
Boeing_min_month_mean_price_percent_diff <- paste("In", Boeing_min_mean_price_diff_month, " Boeing had the greatest monthly mean stockprice difference from the overal mean stockprice of ", Boeing_min_mean_price_percent_diff , " percent lower.")
Boeing_min_month_mean_price_percent_diff

# similar in java
if (min_month_mean_price_percent_diff == ProcterGamble_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <- ProctorGamble_min_month_mean_price_percent_diff
} else if (min_month_mean_price_percent_diff == CocaCola_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <-CocaCola_min_month_mean_price_percent_diff
} else if (min_month_mean_price_percent_diff == Boeing_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <- Boeing_min_month_mean_price_percent_diff
} else if (min_month_mean_price_percent_diff == IBM_min_mean_price_percent_diff) {
  min_month_mean_price_percent_diff_name <- IBM_min_month_mean_price_percent_diff
} else {
  min_month_mean_price_percent_diff_name <- GE_min_month_mean_price_percent_diff
}
min_month_mean_price_percent_diff_name # double check
# prints out the stock with the highest value
cat("", min_month_mean_price_percent_diff_name, "This represents the greatest decreaes in stock price between the monthly and overall mean of the 5 comapnies.")
#### finish run output

# switch from mean to median
IBM_min_median_monthly_price_percent_diff_string <- gsub("mean", "median", IBM_min_mean_monthly_price_percent_diff_string)
cat(IBM_min_median_monthly_price_percent_diff_string)
# paste median price percent diff and cat
########### run above code output
# 4.1 Montly trends ex18, from web site
months(IBM$Date)
median(IBM$StockPrice)
tapply(IBM$StockPrice, months(IBM$Date), median)
# compare monthly median to overall median
IBM_overall_median <- median(IBM$StockPrice)
IBM_overall_median
IBM_monthly_median <- tapply(IBM$StockPrice, months(IBM$Date), median)
IBM_monthly_median
# put months in order
IBM_monthly_median_sorted <- IBM_monthly_median[order(match(names(IBM_monthly_median), month.name))]
IBM_monthly_median_sorted
IBM_monthly_median_diff <- IBM_monthly_median_sorted - IBM_overall_median
IBM_monthly_median_diff
IBM_monthly_median_percent_diff <- (IBM_monthly_median_diff /IBM_overall_median)*100
IBM_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
IBM_month_compare_median <- IBM_monthly_median_sorted > IBM_overall_median
IBM_month_compare_median # month put in alphabetitcal order
# convert to binary
IBM_month_compare_table_median <- cbind(IBM_monthly_median_sorted, IBM_overall_median, IBM_monthly_median_diff,IBM_monthly_median_percent_diff, IBM_month_compare_median)
IBM_month_compare_table_median
# in true false format true, false
IBM_month_compare_table_median <- data.frame(IBM_monthly_median_sorted, IBM_overall_median, IBM_monthly_median_diff,IBM_monthly_median_percent_diff, IBM_month_compare_median)
IBM_month_compare_table_median
# find the month with greatest price diff and % diff
IBM_min_monthly_median_price_diff <- min(IBM_month_compare_table_median$IBM_monthly_median_diff)
IBM_min_monthly_median_price_diff
IBM_min_median_price_diff_month <- rownames(IBM_month_compare_table_median)[which.min(IBM_month_compare_table_median$IBM_monthly_median_diff)]
IBM_min_median_price_diff_month
IBM_min_median_price_percent_diff <- min(IBM_month_compare_table_median$IBM_monthly_median_percent_diff)
IBM_min_median_price_percent_diff 
cat("In", IBM_min_median_price_diff_month, " IBM had the minimum monthly median stockprice difference from the overal median stockprice of ", IBM_min_median_price_percent_diff , " percent lower.")
######## finish run above output code
# switch from IBM to GE(2) using gsub
GE_min_median_monthly_price_percent_diff_string <- gsub("IBM", "GE", IBM_min_median_monthly_price_percent_diff_string)
cat(GE_min_median_monthly_price_percent_diff_string) # paste 
########## start output of run code above
# 4.1 Montly trends ex18, from web site
months(GE$Date)
median(GE$StockPrice)
tapply(GE$StockPrice, months(GE$Date), median)
# compare monthly median to overall median
GE_overall_median <- median(GE$StockPrice)
GE_overall_median
GE_monthly_median <- tapply(GE$StockPrice, months(GE$Date), median)
GE_monthly_median
# put months in order
GE_monthly_median_sorted <- GE_monthly_median[order(match(names(GE_monthly_median), month.name))]
GE_monthly_median_sorted
GE_monthly_median_diff <- GE_monthly_median_sorted - GE_overall_median
GE_monthly_median_diff
GE_monthly_median_percent_diff <- (GE_monthly_median_diff /GE_overall_median)*100
GE_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
GE_month_compare_median <- GE_monthly_median_sorted > GE_overall_median
GE_month_compare_median # month put in alphabetitcal order
# convert to binary
GE_month_compare_table_median <- cbind(GE_monthly_median_sorted, GE_overall_median, GE_monthly_median_diff,GE_monthly_median_percent_diff, GE_month_compare_median)
GE_month_compare_table_median
# in true false format true, false
GE_month_compare_table_median <- data.frame(GE_monthly_median_sorted, GE_overall_median, GE_monthly_median_diff,GE_monthly_median_percent_diff, GE_month_compare_median)
GE_month_compare_table_median
# find the month with greatest price diff and % diff
GE_min_monthly_median_price_diff <- min(GE_month_compare_table_median$GE_monthly_median_diff)
GE_min_monthly_median_price_diff
GE_min_median_price_diff_month <- rownames(GE_month_compare_table_median)[which.min(GE_month_compare_table_median$GE_monthly_median_diff)]
GE_min_median_price_diff_month
GE_min_median_price_percent_diff <- min(GE_month_compare_table_median$GE_monthly_median_percent_diff)
GE_min_median_price_percent_diff 
cat("In", GE_min_median_price_diff_month, " GE had the minimum monthly median stockprice difference from the overal median stockprice of ", GE_min_median_price_percent_diff , " percent lower.")
### finish output
# switch from IBM to Boeing(3)
Boeing_min_median_monthly_price_percent_diff_string <- gsub("IBM", "Boeing", IBM_min_median_monthly_price_percent_diff_string)
cat(Boeing_min_median_monthly_price_percent_diff_string) # paste 
## start paste output
# 4.1 Montly trends ex18, from web site
months(Boeing$Date)
median(Boeing$StockPrice)
tapply(Boeing$StockPrice, months(Boeing$Date), median)
# compare monthly median to overall median
Boeing_overall_median <- median(Boeing$StockPrice)
Boeing_overall_median
Boeing_monthly_median <- tapply(Boeing$StockPrice, months(Boeing$Date), median)
Boeing_monthly_median
# put months in order
Boeing_monthly_median_sorted <- Boeing_monthly_median[order(match(names(Boeing_monthly_median), month.name))]
Boeing_monthly_median_sorted
Boeing_monthly_median_diff <- Boeing_monthly_median_sorted - Boeing_overall_median
Boeing_monthly_median_diff
Boeing_monthly_median_percent_diff <- (Boeing_monthly_median_diff /Boeing_overall_median)*100
Boeing_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
Boeing_month_compare_median <- Boeing_monthly_median_sorted > Boeing_overall_median
Boeing_month_compare_median # month put in alphabetitcal order
# convert to binary
Boeing_month_compare_table_median <- cbind(Boeing_monthly_median_sorted, Boeing_overall_median, Boeing_monthly_median_diff,Boeing_monthly_median_percent_diff, Boeing_month_compare_median)
Boeing_month_compare_table_median
# in true false format true, false
Boeing_month_compare_table_median <- data.frame(Boeing_monthly_median_sorted, Boeing_overall_median, Boeing_monthly_median_diff,Boeing_monthly_median_percent_diff, Boeing_month_compare_median)
Boeing_month_compare_table_median
# find the month with greatest price diff and % diff
Boeing_min_monthly_median_price_diff <- min(Boeing_month_compare_table_median$Boeing_monthly_median_diff)
Boeing_min_monthly_median_price_diff
Boeing_min_median_price_diff_month <- rownames(Boeing_month_compare_table_median)[which.min(Boeing_month_compare_table_median$Boeing_monthly_median_diff)]
Boeing_min_median_price_diff_month
Boeing_min_median_price_percent_diff <- min(Boeing_month_compare_table_median$Boeing_monthly_median_percent_diff)
Boeing_min_median_price_percent_diff 
cat("In", Boeing_min_median_price_diff_month, " Boeing had the minimum monthly median stockprice difference from the overal median stockprice of ", Boeing_min_median_price_percent_diff , " percent lower.")
### finish paste output
# switch from IBM to CocaCola(4)
CocaCola_min_median_monthly_price_percent_diff_string <- gsub("IBM", "CocaCola", IBM_min_median_monthly_price_percent_diff_string)
cat(CocaCola_min_median_monthly_price_percent_diff_string) # paste 
## start paste output
# 4.1 Montly trends ex18, from web site
months(CocaCola$Date)
median(CocaCola$StockPrice)
tapply(CocaCola$StockPrice, months(CocaCola$Date), median)
# compare monthly median to overall median
CocaCola_overall_median <- median(CocaCola$StockPrice)
CocaCola_overall_median
CocaCola_monthly_median <- tapply(CocaCola$StockPrice, months(CocaCola$Date), median)
CocaCola_monthly_median
# put months in order
CocaCola_monthly_median_sorted <- CocaCola_monthly_median[order(match(names(CocaCola_monthly_median), month.name))]
CocaCola_monthly_median_sorted
CocaCola_monthly_median_diff <- CocaCola_monthly_median_sorted - CocaCola_overall_median
CocaCola_monthly_median_diff
CocaCola_monthly_median_percent_diff <- (CocaCola_monthly_median_diff /CocaCola_overall_median)*100
CocaCola_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
CocaCola_month_compare_median <- CocaCola_monthly_median_sorted > CocaCola_overall_median
CocaCola_month_compare_median # month put in alphabetitcal order
# convert to binary
CocaCola_month_compare_table_median <- cbind(CocaCola_monthly_median_sorted, CocaCola_overall_median, CocaCola_monthly_median_diff,CocaCola_monthly_median_percent_diff, CocaCola_month_compare_median)
CocaCola_month_compare_table_median
# in true false format true, false
CocaCola_month_compare_table_median <- data.frame(CocaCola_monthly_median_sorted, CocaCola_overall_median, CocaCola_monthly_median_diff,CocaCola_monthly_median_percent_diff, CocaCola_month_compare_median)
CocaCola_month_compare_table_median
# find the month with greatest price diff and % diff
CocaCola_min_monthly_median_price_diff <- min(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)
CocaCola_min_monthly_median_price_diff
CocaCola_min_median_price_diff_month <- rownames(CocaCola_month_compare_table_median)[which.min(CocaCola_month_compare_table_median$CocaCola_monthly_median_diff)]
CocaCola_min_median_price_diff_month
CocaCola_min_median_price_percent_diff <- min(CocaCola_month_compare_table_median$CocaCola_monthly_median_percent_diff)
CocaCola_min_median_price_percent_diff 
cat("In", CocaCola_min_median_price_diff_month, " CocaCola had the minimum monthly median stockprice difference from the overal median stockprice of ", CocaCola_min_median_price_percent_diff , " percent lower.")
### finish paste output
# switch from IBM to ProcterGamble(5)
ProcterGamble_min_median_monthly_price_percent_diff_string <- gsub("IBM", "ProcterGamble", IBM_min_median_monthly_price_percent_diff_string)
cat(ProcterGamble_min_median_monthly_price_percent_diff_string) # paste 
### start paste
# 4.1 Montly trends ex18, from web site
months(ProcterGamble$Date)
median(ProcterGamble$StockPrice)
tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), median)
# compare monthly median to overall median
ProcterGamble_overall_median <- median(ProcterGamble$StockPrice)
ProcterGamble_overall_median
ProcterGamble_monthly_median <- tapply(ProcterGamble$StockPrice, months(ProcterGamble$Date), median)
ProcterGamble_monthly_median
# put months in order
ProcterGamble_monthly_median_sorted <- ProcterGamble_monthly_median[order(match(names(ProcterGamble_monthly_median), month.name))]
ProcterGamble_monthly_median_sorted
ProcterGamble_monthly_median_diff <- ProcterGamble_monthly_median_sorted - ProcterGamble_overall_median
ProcterGamble_monthly_median_diff
ProcterGamble_monthly_median_percent_diff <- (ProcterGamble_monthly_median_diff /ProcterGamble_overall_median)*100
ProcterGamble_monthly_median_percent_diff
# compare monthly median to overall median,  automatically converts in binary
ProcterGamble_month_compare_median <- ProcterGamble_monthly_median_sorted > ProcterGamble_overall_median
ProcterGamble_month_compare_median # month put in alphabetitcal order
# convert to binary
ProcterGamble_month_compare_table_median <- cbind(ProcterGamble_monthly_median_sorted, ProcterGamble_overall_median, ProcterGamble_monthly_median_diff,ProcterGamble_monthly_median_percent_diff, ProcterGamble_month_compare_median)
ProcterGamble_month_compare_table_median
# in true false format true, false
ProcterGamble_month_compare_table_median <- data.frame(ProcterGamble_monthly_median_sorted, ProcterGamble_overall_median, ProcterGamble_monthly_median_diff,ProcterGamble_monthly_median_percent_diff, ProcterGamble_month_compare_median)
ProcterGamble_month_compare_table_median
# find the month with greatest price diff and % diff
ProcterGamble_min_monthly_median_price_diff <- min(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)
ProcterGamble_min_monthly_median_price_diff
ProcterGamble_min_median_price_diff_month <- rownames(ProcterGamble_month_compare_table_median)[which.min(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_diff)]
ProcterGamble_min_median_price_diff_month
ProcterGamble_min_median_price_percent_diff <- min(ProcterGamble_month_compare_table_median$ProcterGamble_monthly_median_percent_diff)
ProcterGamble_min_median_price_percent_diff 
cat("In", ProcterGamble_min_median_price_diff_month, " ProcterGamble had the minimum monthly median stockprice difference from the overal median stockprice of ", ProcterGamble_min_median_price_percent_diff , " percent lower.")
### finish paste

# find which stock had the greatest min difference between monthly median and overall median
min_month_median_price_percent_diff_string <- gsub("mean", "median", min_month_mean_price_percent_diff_string) # paste below
cat(min_month_median_price_percent_diff_string) ## paste output
### start paste output
# find which stock had the greatest difference between monthly median and overall median
min_month_median_price_percent_diff <- min(ProcterGamble_min_median_price_percent_diff , CocaCola_min_median_price_percent_diff, Boeing_min_median_price_percent_diff , IBM_min_median_price_percent_diff , GE_min_median_price_percent_diff )
min_month_median_price_percent_diff
#assign variables to string
ProctorGamble_min_month_median_price_percent_diff <- paste("In", ProcterGamble_min_median_price_diff_month, " ProcterGamble had the greatest monthly median stockprice difference from the overal median stockprice of ", ProcterGamble_min_median_price_percent_diff , " percent lower.")
ProctorGamble_min_month_median_price_percent_diff
CocaCola_min_month_median_price_percent_diff <- paste("In", CocaCola_min_median_price_diff_month, " CocaCola had the greatest monthly median stockprice difference from the overal median stockprice of ", CocaCola_min_median_price_percent_diff , " percent lower.")
CocaCola_min_month_median_price_percent_diff
GE_min_month_median_price_percent_diff <- paste("In", GE_min_median_price_diff_month, " GE had the greatest monthly median stockprice difference from the overal median stockprice of ", GE_min_median_price_percent_diff , " percent lower.")
GE_min_month_median_price_percent_diff
IBM_min_month_median_price_percent_diff <- paste("In", IBM_min_median_price_diff_month, " IBM had the greatest monthly median stockprice difference from the overal median stockprice of ", IBM_min_median_price_percent_diff , " percent lower.")
IBM_min_month_median_price_percent_diff
Boeing_min_month_median_price_percent_diff <- paste("In", Boeing_min_median_price_diff_month, " Boeing had the greatest monthly median stockprice difference from the overal median stockprice of ", Boeing_min_median_price_percent_diff , " percent lower.")
Boeing_min_month_median_price_percent_diff

# similar in java
if (min_month_median_price_percent_diff == ProcterGamble_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <- ProctorGamble_min_month_median_price_percent_diff
} else if (min_month_median_price_percent_diff == CocaCola_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <-CocaCola_min_month_median_price_percent_diff
} else if (min_month_median_price_percent_diff == Boeing_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <- Boeing_min_month_median_price_percent_diff
} else if (min_month_median_price_percent_diff == IBM_min_median_price_percent_diff) {
  min_month_median_price_percent_diff_name <- IBM_min_month_median_price_percent_diff
} else {
  min_month_median_price_percent_diff_name <- GE_min_month_median_price_percent_diff
}
min_month_median_price_percent_diff_name # double check
# prints out the stock with the highest value
cat("", min_month_median_price_percent_diff_name, "This represents the greatest decrease in stock price between the monthly and overall median of the 5 comapnies.")
### finish paste output


### type cleaner comments next time

### remove all memory from R console
rm(list = ls())
ls()
list.files()
dir()

