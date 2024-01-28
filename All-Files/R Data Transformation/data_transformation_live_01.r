
library(tidyverse)
library(glue)
library(lubridate)
library(readr)
library(sqldf)
library(RSQLite)
library(nycflights13)
library(dplyr)


## advice use print( ) for all result code
## when save and send to other people, they can use source button for see result in console window
print(1+1)
print(10/2)
print(5*10)
print(5**2)

## if any result code not use print( ) must press CTR+ENTER  for run
1+1
10/2
5*10
5**2

print("this is a R working file.")

## ***** learning terminal linux command line *****

pwd ## check position work directory

cd ## change directory to other position

cd .. ## move back position

cd ../.. ## move back 2 step position

cd input name position ## move to that name position

touch ## create new file .txt or .R or etc

mkdir ## create new folder

ls ## print all file in folder

ls + name folder ## print all file in that folder

echo ## print result

echo ... > file ## input data into file

echo ... >> file ## input data append into file

cat ## print data in file

Rscript ## use print all result code in R file

Rscript name folder/name file ## print all result code in R file from that folder

rmdir ## remove folder

## if that folder want remove have file, cannot remove must use
rm -r
## **********************************


## ****come back into R ***
## install 5 package
## 1. tidyverse
## 2. glue
## 3. RSQilte
## 4. RPostgreSQL
## 5. lubridate

library(tidyverse)
library(glue)
library(lubridate)

install.packages("glue")
library(glue)
## glue( ) function use easy more than paste( ) 
my_name <- "tama"
my_age <- 37

glue("Hi, my name is {my_name}.")

glue("Hi, my name is {my_name} and {my_age} years old.")

## tidyverse
## library(dplyr) have 5 main function
## 1. select

View(mtcars)

rownames(mtcars)
colnames(mtcars)

## dataframe mtcars don't have first name column for car name list
## use rownames_to_column(..., "...") to change it
rownames_to_column(mtcars, "model_cars")


view(mtcars) ## then press view still not change, must return this code to same value again.

mtcars <- rownames_to_column(mtcars, "model_cars")

view(mtcars) ## have model_cars column already!



## 1. select *************
select(mtcars, 1:3)

select(mtcars, 1,3,5)

select(mtcars, mpg, hp, wt)

select(mtcars, mpg, hp, 11)

select(mtcars, 11, mpg, hp)

## start_with("...")
select(mtcars, starts_with("a"))

## ends_with("...")
select(mtcars, ends_with("p"))

## contains("...")
select(mtcars, contains("a"))



## *** use %>% pipeline operator ***
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  head(5)



## 2. filter ************
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  filter(hp >= 200)

## filter AND condition
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  filter(hp >= 200 & mpg >= 15)

## filter OR condition
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  filter(hp >= 200 | mpg >= 15)

## filter with character with grepl( ) function
## example grep() vs grepl()

## grep >>> return TRUE or FALSE
grep("^D", mtcars$model_cars) ## $ use for choose column in dataframe
## grep >>> return data that is TRUE condition
grep("^D", mtcars$model_cars, value = TRUE)

## grep >>> return TRUE or FALSE same
grepl("^D", mtcars$model_cars)

## if want return >>> data TRUE condition must use Filter( ) too
filter(mtcars, grepl( "^D", mtcars$model_cars))

## use grepl with full syntax
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  filter( grepl("^D", model_cars) & hp >= 200)

## use between help filter
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  filter(hp >= 100 & hp <= 200)
## change syntax by between
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  filter( between( hp, 100, 200) )



## 3. arrange ********** for sort column
arrange(mtcars, hp)

arrange(mtcars, desc(hp) )

arrange(mtcars, am, desc(hp) )

## use in full syntax
mtcars %>%
  select(model_cars, am, hp) %>%
  filter( between( hp, 100, 200) ) %>%
  arrange( am, desc(hp) )

## write_csv( ) use for export file
m3 <- mtcars %>%
  select(model_cars, am, hp) %>%
  filter( between( hp, 100, 200) ) %>%
  arrange( am, desc(hp) )

write_csv(m3, "m3.csv")

## 4. mutate create new column *********

## mutate new column + toupper( )
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  mutate(model_new_upper = toupper( model_cars) ) %>%
  head(10)

## mutate new column + aggregate data
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  mutate(mpg_double = mpg*2) %>%
  head(10)

## aggregate sub aggregate data
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  mutate(mpg_double = mpg * 2,
         mpg_double_plus_ten = mpg_double + 10) %>%
  head(10)

## mutate new column with new data
## with numeric and character
mtcars %>%
  select(model_cars, mpg, hp, wt) %>%
  mutate( new_col = 100,
          new_col_02 = "tamakuku" ) %>%
  head(10)

## mutate new column with if_else()
mtcars %>%
  select(model_cars, mpg, am) %>%
  filter(mpg >= 20) %>%
  mutate(car_gear = if_else(am == 0, "auto", "manual") )


## 5. summarise + group_by **************
## find aggregate function
mtcars %>%
  summarise( mean(mpg) )

mtcars %>%
  summarise( avg_mpg = mean(mpg),
             sum_mpg = sum(mpg),
             min_mpg = min(mpg),
             max_mpg = max(mpg),
             count_cars = n() ) ## n() like count function can use only in summarise function

## must use group_by upper summarise*
mtcars %>%
  mutate(car_gear = if_else(am == 0, "auto", "manual") ) %>%
  group_by(car_gear) %>%
  summarise( avg_mpg = mean(mpg),
             sum_mpg = sum(mpg),
             min_mpg = min(mpg),
             max_mpg = max(mpg),
             count_cars = n() )

## return to m4 value
m4 <- mtcars %>%
  mutate(car_gear = if_else(am == 0, "auto", "manual") ) %>%
  group_by(car_gear) %>%
  summarise( avg_mpg = mean(mpg),
             sum_mpg = sum(mpg),
             min_mpg = min(mpg),
             max_mpg = max(mpg),
             count_cars = n() )

## export file m4
write_csv(m4, "m4.csv")


### join data ***********
## use example dataframe in R
## band_members and band_instruments

view(band_members)

view(band_instruments)

## left_join use name column for match like PK = FK
left_join(band_members, band_instruments)

## inner_join
inner_join(band_members, band_instruments)

## full_join
full_join(band_members, band_instruments)

## use join by %>% pipeline
band_members %>%
  select( name, band ) %>%
  left_join( band_instruments, by = "name" )

## use mutate + toupper for change character in name column to big type
band_members %>%
  mutate( name_upper = toupper(name)) %>%
  left_join(band_instruments, by = "name")

## if in condition name column for match not the same
## in join function use by = c("..." = "...")
## example us select change name column
band_members %>%
  select(member_name = name,
         band_name = band) %>%
  left_join( band_instruments, by = c("member_name" = "name") )

view(band_instruments)


## read_csv( ) and write_csv( ) *****
## install.packages("readr") and call library(readr)
install.packages("readr")
library(readr)

## read m4.csv file
m5 <- read_csv("m4.csv")
View(m5)

## write export to m5.csv file
write_csv(m5, "m5.csv")

## use sample_n( ) ********
## random every time when run code
mtcars %>%
  sample_n(5)

## random and choose column for show
mtcars %>%
  sample_n(5) %>%
  select(model_cars)

## use pull(...) instead select(...)  for turn result into vector
mtcars %>%
  sample_n(5) %>%
  pull(model_cars)


## use sample_frac( ) ********
## random data by percentage of all data
## example random 40% of data
mtcars %>%
  sample_frac(0.4) %>%
  select(model_cars)


## count() function ***********
## example count car that segment by am to auto and manual gear

## return am condition into value for short syntax
cars_gear <- mtcars %>%
  mutate( am = if_else(am == 0, "auto", "manual") )

## use count with %>% pipeline
cars_gear %>%
  count(am)

## if want contribution result by new column
cars_gear %>%
  count(am) %>%
  mutate(percentage = n / sum(n) )

## count to many column
cars_gear %>%
  count(am, hp)


## connect and use SQL syntax with 3 step******
## install.package("sqldf")
## install.package("RSQLite")
## call library(sqldf)
## call library(RSQLite)
library(sqldf)
library(RSQLite)

## step 1 connect .db file
dbCanConnect(SQLite(), "chin0ok.db")

## create connection and return into new value
con <- dbConnect(SQLite(), "chinook.db")
view(con)

## call list name tables
dbListTables(con)

## call list column in that table
dbListFields(con, "customers")

## step 2 get data
dbGetQuery(con, "
           select firstname, email
           from customers
           where country = 'USA'; ")
## and return into value for use
USA_customers <- dbGetQuery(con, "
           select firstname, email
           from customers
           where country = 'USA'; ")



## use tibble() vs data.frame *******
## tibble easy view more than data.frame
mtcars %>%
  tibble()

## create new dataframe by tribble() will easy preview data structure more than use data.frame()
## use data.frame() for create dataframe
products_df <- data.frame(
  id = 1:3,
  product_name = c("tama", "kuku", "auau")
)

View(products_df)

products_tribble <- tribble(
  ~id, ~product_name,
  1, "tama",
  2, "kuku",
  3, "auau")

View(products_tribble)

## and use tibble() for preview dataframe not use head() for limit preview data

df <- mtcars
head(df, 5)

library(tidyverse)

tibble_df <- tibble(mtcars)
tibble_df

## write table "products" into chinook.db by dbWriteTable()
dbWriteTable(con, "products", products)
## preview products table in chinook.db
dbListTables(con)

## remove table "products" from chinook.db
dbRemoveTable(con, "products")
## preiew products table is removed
dbListTables(con)

## step 3 close connection
dbDisconnect(con)



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


## How to working R connect with PostgreSQL sever
## connect to PostgreSQL sever
install.packages("RPostgreSQL")

library(RPostgreSQL)
library(tidyverse)

## create connection
con02 <- dbConnect(
  PostgreSQL(),
  host = "arjuna.db.elephantsql.com",
  dbname = "kmsejmes",
  user = "kmsejmes",
  password = "xxx",
  port = 5432 ## default port in PosgretSQL sever is 5432
)

con02

## write table "products" into this sever
View(products)

dbWriteTable(con02, "products", products)

## preview list table
dbListTables(con02)

## get data from this sever
dbGetQuery(con02, "
           select * from products")

## close connection from sever
dbDisconnect(con02)



## ****** Home Work 02 *****
## write data from Homework SQL (pizza shop) into PostgreSQL sever
## send answers code by Notion too

## 1. connect to PostgreSQL sever
install.packages("RPostgreSQL")

library(RPostgreSQL)
library(tidyverse)

## 2. use dbConnect( ) to create connection to sever and return into value.
con_tama_sever <- dbConnect(
  PostgreSQL(),
  host = "arjuna.db.elephantsql.com",
  dbname = "kmsejmes",
  user = "kmsejmes",
  password = "xeDps7-OWWr0ejmPAEIHdxhV-vG3Zgza", ## password will rotate everytime for safety
  port = 5432 ## default port in PostgreSQL sever is 5432
)

con_tama_sever

## 3. Take SQL code from homework pizza shop in SQL live into R and create to dataframe by tribble() function.

## install.packages("dpylr") and call library(tidyverse) for using tribble() function.
install.packages("dpylr")

library(dpylr)

## create 4 dataframe : 1) shops 2) customers 3) menu 4) orders.
shops_df <- tribble(
  ~shop_id, ~shop_location,
  1, "Bangkok",
  2, "Chaing Mai",
  3, "Ranong",
  4, "Udon Thani",
  5, "Chonburi" )

customers_df <- tribble(
  ~customer_id, ~customer_name, ~customer_country,
  1, "Tama", "Japan",
  2, "Kuku", "Korea",
  3, "Auau", "Thailand",
  4, "Jugjug", "Brazil",
  5, "Aokaok", "USA",
  6, "Toru", "Japan",
  7, "Yolo", "USA",
  8, "BugJeod", "Thailand" )

menu_df <- tribble(
  ~menu_id, ~menu_name, ~menu_price,
  1, "Ham_pizza", 500,
  2, "Cheese_pizza", 300,
  3, "Chicken_pizza", 200,
  4, "Pork_pizza", 400,
  5, "Beef_pizza", 1000,
  6, "Vagetable_pizza", 250,
  7, "Hawaiian_piza", 700,
  8, "Tomyumkung_pizza", 450,
  9, "Seafood_pizza", 600,
  10, "Tomato_pizza", 150 )

orders_df <- tribble(
  ~order_id, ~order_date, ~customer_id, ~shop_id, ~menu_id,
  1, "2022-07-01", 1, 3, 1,
  2, "2022-07-02", 2, 2, 6,
  3, "2022-07-03", 3, 2, 3,
  4, "2022-07-04", 4, 5, 4,
  5, "2022-07-05", 5, 1, 4,
  6, "2022-08-05", 2, 2, 4,
  7, "2022-08-06", 1, 4, 5,
  8, "2022-08-06", 3, 5, 4,
  9, "2022-08-07", 2, 5, 4,
  10, "2022-09-08", 2, 5, 8,
  11, "2022-09-08", 6, 1, 9,
  12, "2022-09-08", 7, 3, 10,
  13, "2022-09-09", 8, 2, 1,
  14, "2022-09-09", 8, 4, 7,
  15, "2022-09-10", 1, 2, 2 )

## 4. and use dbWriteTable() send these dataframe into PostgreSQL sever.
dbWriteTable(con_tama_sever, "shops", shops_df)

dbWriteTable(con_tama_sever, "customers", customers_df)

dbWriteTable(con_tama_sever, "menu", menu_df)

dbWriteTable(con_tama_sever, "orders", orders_df)

## then use dbListTables() recheck tables in PostgreSQL sever again.
dbListTables(con_tama_sever)

## 5. end with close connection from PostgreSQL sever.
dbDisconnect(con_tama_sever)
