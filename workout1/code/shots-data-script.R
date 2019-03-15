##################################################
## title: shots-data-script.R
## description: this is a script of data 
## input(s): data from the nba
## output(s): the output is to create a csv file of the data that will
## contain data for the data visualization phase
## Date: 3/13/2019
## Author: kimberly chua
##################################################
library(dplyr)

curry <- read.csv(
  "data/stephen-curry.csv", stringsAsFactors = FALSE)
iguodala <- read.csv(
  "data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv(
  "data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv(
  "data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv(
  "data/klay-thompson.csv", stringsAsFactors = FALSE)

#add names to each data frame

curry$player <- "Stephen Curry"
iguodala$player <- "Andre Iguodala"
green$player <- "Draymond Green"
durant$player <- "Kevin Durant"
thompson$player <- "Klay Thompson"

#Change the original values of shot_made_flag to more descriptive values
curry$shot_made_flag <- recode(
  curry$shot_made_flag, 'y' = 'shot_yes', 'n' = 'shot_no')
green$shot_made_flag <- recode(
  green$shot_made_flag, 'y' = 'shot_yes', 'n' = 'shot_no')
iguodala$shot_made_flag <- recode(
  iguodala$shot_made_flag, 'y' = 'shot_yes', 'n' = 'shot_no')
durant$shot_made_flag <- recode(
  durant$shot_made_flag, 'y' = 'shot_yes', 'n' = 'shot_no')
thompson$shot_made_flag <- recode(
  thompson$shot_made_flag, 'y' = 'shot_yes', 'n' = 'shot_no')
#Add a column minute that contains the minute number where a shot occurred. For instance, 
#if a shot took place during period = 1 and minutes_remaining = 8, 
#then this should correspond to a value minute = 4. Likewise, if a shot took place during 
#period = 4 and minutes_remaining = 2 then this should correspond to a value
#minute = 46. Hint: you can use logical subsetting for these operations (no need to use
#programming structures that we haven’t covered yet).

#a total game has 48 minutes
curry$minutes <- (curry$period * 12) - curry$minutes_remaining
iguodala$minutes <- (iguodala$period * 12) - iguodala$minutes_remaining
green$minutes <- (green$period * 12) - green$minutes_remaining
durant$minutes <- (durant$period * 12) - durant$minutes_remaining
thompson$minutes <- (thompson$period * 12) - thompson$minutes_remaining

#Use sink() to send the summary() output of each imported data frame into individuals
text files: andre-iguodala-summary.txt, draymond-green-summary.txt, etc. During
each sinking operation, the produced summaries should be sent to the output/
  folder using relative paths.


#Use the row binding function rbind() to stack the tables into one single data frame
#(or tibble object).





#Export (i.e. write) the assembled table as a CSV file shots-data.csv inside the folder
#data/. Use a relative path for this operation.




#Use sink() to send the summary() output of the assembled table. Send this output to
#a text file named shots-data-summary.txt inside the output/ folder. Use a relative
#path when exporting the R output.



