
library(tidyverse)
library(RPostgreSQL)


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
  password = "xeDps7-OWWr0ejmPAEIHdxhV-vG3Zgza", ## password will rotate every time for safety
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
