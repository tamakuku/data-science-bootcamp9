
library(readr)
library(sqldf)
library(nycflights13)
library(dplyr)

## ****** Home Work 01 *******
## install.packages("nycflights13")
## call library(nycflights13)
library(nycflights13)

## 1. transform data name "flights"
View(flights)

## 2. use all function from data transformation live for make data by any question make up
## use ?flights for see meaning each column that take for 5 questions

## 3. send HW with Notion

## 4. optional write answer by SQL syntax with library(sqldf)
library(sqldf)

## Answers Home Work 01 *****
library(readr)
write_csv(flights, "flights.csv")

## Q&A
## 1. How many avg flights delay on January?
## 2. What month have longest distance flights?
## 3. How many flights at noon time (6:00-18:00) on March?
## 4. How many flights have first character of Plane tail number with N8?
## 5. What is best five performance (shortest delay time) flight on 2013?

## install.packages("nycflights13") and call library(nycflights13) for use dataframe name flights
## install.packages("dpylr") and call library(dplyr) for use dpylr function
install.packages( c( "nycflights13", "dplyr" ) )
library(nycflights13)
library(dplyr)

## use View(flight) for preview dataframe first.
View(flights)

## or use write_csv( ) function for export to csv file for more easy preview data.
library(readr)
write_csv(flights, "flights.csv")

flights_df <- flights

## And list 5 question from flights dataframe
## 1. What is the best five performance (shortest delay time) flight on 2013?
## 2. How many avg flights delay on January?
## 3. What month have longest distance flights?
## 4. How many flights at noon time (6:00-18:00) on March?
## 5. How many flights have first character of Plane tail number with N8?
## then will use dplyr function with %>% pipeline operator for syntax style to find the answers.

## 1. What is the best five performance (shortest delay time) flight on 2013? *
flights_df %>%
  select ( year, month, day, flight, arr_delay ) %>%
  arrange ( arr_delay ) %>%
  head ( 5 )
## answers: flight number 193, 11, 612, 269, 7 is the best five performance.


## 2. How many avg flights delay on January? **
flights_df %>%
  filter( month == 1 & dep_delay != "" & arr_delay != "" ) %>%
  group_by( month ) %>%
  summarise( avg_dep_delay = mean(dep_delay),
             avg_arr_delay = mean(arr_delay) )
## answers: January avg_dep_delay = 9.99 & avg_arr_delay = 6.13


## 3. What month have longest distance flights? ***
flights_df %>%
  group_by ( month ) %>%
  summarise ( sum_distance = sum(distance) ) %>%
  arrange ( desc( sum_distance ) )
## answers: The longest distance flight is month 8 or August.


## 4. How many flights at noon time (6:00-18:00) on March? ***9
flights_df %>%
  filter ( month == 3 & dep_time >= 600 & dep_time <= 1800 ) %>%
  group_by ( month ) %>%
  summarise ( count_flights = n() )
## answers: its have 20,440 flights at noon time on March.
## recheck preview result for sure
flights_df %>%
  select ( month, dep_time ) %>%
  filter ( month == 3 & dep_time >= 600 & dep_time <= 1800 )


## 5. How many flights have first character of Plane tail number with N8 and come from United Air Lines Inc.(carrier = UA)? *****
flights_df %>%
  mutate ( carrier_airline = if_else ( carrier == "UA", "UA_airline", "other_airline" ) ) %>%
  filter ( grepl( "^N8", tailnum )) %>%
  group_by ( carrier_airline ) %>%
  summarise ( count_fligths = n() )
## answers: its have 7,253 flights that tailnum N8... and come from UA carrier.
## recheck preview result for sure.
flights_df %>%
  select ( tailnum, carrier ) %>%
  filter ( grepl( "^N8", tailnum) & carrier == "UA" )
