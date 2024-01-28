## install basic package
install.packages(c("readr", 
                   "readxl", 
                   "googlesheets4",
                   "jsonlite",
                   "dplyr",
                   "sqldf",
                   "RSQLite"))

## call library
library(dplyr)
library(readr)
read_csv("imdb.csv")

imdb <- read_csv("imdb.csv")
View(imdb)

## function review structure
glimpse(imdb)

## print review data
head(imdb, 6)

tail(imdb, 3)

## function view all name column
names(imdb)

## select column by name column
select(imdb, MOVIE_NAME, YEAR)

## or select column by column index
select(imdb, 2, 3)

## use = for change new column name
select(imdb, movie_list = MOVIE_NAME, release_year = YEAR)

## pipe operator %>% for connect more step in 1 dataframe syntax
## example %>% step 1 >>> select and change name column
## %>% step 2 review only 10 first row
imdb %>%
  select(movie_list = MOVIE_NAME, release_year = YEAR) %>%
  head(10)

## filter data
filter(imdb, SCORE >= 9.0)

## use tolower function change big type to small type column name
tolower( names(imdb) )
## then return to new value before run
names(imdb) <- tolower( names(imdb) )
## preview change
head(imdb)

## use %>% for 2 step
imdb %>%
  select(movie_name, year, score) %>%
  filter(score >= 9 & year > 2000) ## use & for AND condition

## use | for OR condition 01
imdb %>%
  select(genre, year, score) %>%
  filter(genre == "Action" | year == 2000 | score == 8.7)

## use | for OR condition 01
imdb %>%
  select(movie_name, year, score) %>%
  filter(score == 8.3 | score == 9 | score == 8.7)

## use %in% operator and c(...) for shorter syntax
## only for value on same column and & condition
imdb %>%
  select(movie_name, year, score) %>%
  filter( score %in% c(8.3, 9, 8.7) )

## use & for review all data in column we choose
imdb$genre         
## we found some movie have Drama and other one in there
## if we filter genre with "Drama"
## result will apply movie that only have 1 genre is Drama
imdb %>%
  select(genre, year, score) %>%
  filter(genre == "Drama")

## use grepl(..., ...$...) function for match character
## and return in TRUE or FALSE
grepl("Drama", imdb$genre)
## review genre for compare
imdb$genre

## then use this function step for filter any genre have Drama in there
## result will apply any movie have genre = Drama and other one too
imdb %>%
  select(genre, year, score) %>%
  filter( grepl("Drama", imdb$genre) ) %>%
  head(5) ## can use head() as LIMIT function in SQL
## always remember character in R is case sensitive***

## create new column by mutate(...) function
## example create new column by data in score column
## then use if_else for segment data into new value
imdb %>%
  mutate(score_segment = if_else(score >= 9, "High Score", "Low Score"))

## use , for create to many column
imdb %>%
  select(movie_name, score, length) %>%
    mutate( score_segment = if_else(score >= 9, "High Score", "Low Score"),
           length_segment = if_else(length >= 120, "Long Duration", "Short Duration") )

## or can aggregate into value
## example + 0.1 into all data in score column
## then create to new column
imdb %>%
  select(movie_name, score, length) %>%
  mutate(new_score = score + 0.1) %>%
  head(5)

## or aggregate 0.1 into old data in score column directly
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score = score + 0.1) %>%
  head(5)

## sort data by arrange(...) function
## example sort by length column
imdb %>%
  select(movie_name, length) %>%
  arrange(length) %>%
  head(10)

## or use desc
imdb %>%
  select(movie_name, length) %>%
  arrange( desc(length) ) %>%
  head(10)

## and can sort to many column
imdb %>%
  select(movie_name, rating, length) %>%
  arrange(rating, desc(length) ) %>%
  head(10)

## summarise and group_by for find basic statistic value
## example find mean, sum, sd, min, max, count from length column
summarise_length <- imdb %>%
                      summarise( mean(length),
                                 sum(length),
                                 sd(length),
                                 min(length),
                                 max(length),
                                 n()         ) ## use n() for count all row

View(summarise_length)

## then use group_by
summarise_length <- imdb %>%
  group_by( rating) %>%
  summarise( mean(length),
             sum(length),
             sd(length),
             min(length),
             max(length),
             n()         )

View(summarise_length)

## if dont want NULL rating
## use filter != ""
summarise_length <- imdb %>%
  filter( rating != "") %>%
  group_by( rating) %>%
  summarise( mean(length),
             sum(length),
             sd(length),
             min(length),
             max(length),
             n()         )

View(summarise_length)

## Join Table or data
## create new dataframe
favorite_movie <- data.frame(
                    id = c(1, 5, 10, 20, 50),
                    favorite_status = "Like"
                                            )

## review new dataframe
View(favorite_movie)

## then use inner_join for join 2 dataframe
## by "no" column in imdb dataframe for match with
## "id" column in favorite_moive dataframe
favorite_movie %>%
  inner_join(imdb, by = c("id" = "no"))

## then return to new value
my_favorite_movie_df <- favorite_movie %>%
  inner_join(imdb, by = c("id" = "no"))

## Preview
View(my_favorite_movie_df)
View(imdb)

## export file by write.csv(...)
library(readr)
write_csv(my_favorite_movie_df, "my_favorite_movie.csv")

