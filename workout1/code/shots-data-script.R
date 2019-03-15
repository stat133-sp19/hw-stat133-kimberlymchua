##################################################
## title: shots-data-script.R
## description: this is a script of data 
## input(s): data from the nba
## output(s): the output is to create a csv file of the data that will
## contain data for the data visualization phase
## Date: 3/13/2019
## Author: kimberly chua
##################################################

curry <- read.csv(
  "data/stephen-curry.csv", stringsAsFactors = FALSE)
igudala <- read.csv(
  "data/andre-iguodala.csv", stringsAsFactors = FALSE)
green <- read.csv(
  "data/draymond-green.csv", stringsAsFactors = FALSE)
durant <- read.csv(
  "data/kevin-durant.csv", stringsAsFactors = FALSE)
thompson <- read.csv(
  "data/klay-thompson.csv", stringsAsFactors = FALSE)
