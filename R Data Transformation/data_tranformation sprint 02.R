## use tibble vs dataframe
## install packagae tidyvers
install.packages("tidyverse")
library(tidyverse)

## test dataframe mtacrs for different sign
df <- mtcars
head(df, 5)

tibble_df <- tibble(mtcars)
tibble_df
## tibble view print preview default 10 row
## and look cleary more than dataframe

## check class still is dataframe same
class(df)
class(tibble_df)

## use sample_n(..., ...) random value from data
## test with mtcars dataframe
sample_n(df, size = 5)

## and can lock result not random
## by set.seed(...) function
## and must input any number in ( )
set.seed(10)
sample_n(df, size = 5)

set.seed(3)
sample_n(tibble_df, size = 3)

## or random by % of data
## use sample_frac(..., ..., ...)
## example random 20% of data
sample_frac(mtcars, size = 0.2)

## if want result can duplicate
## input replace parameter
sample_frac(mtcars, size = 0.2, replace = TRUE)

## slice(..., ...) data by row
slice(mtcars, 10)

## or syntax with %>% pipe
mtcars %>%
  slice(10)

## use slice + sample()
mtcars %>%
  slice( sample( nrow( mtcars), 5) )

## nrow is mean count all row in dataframe
nrow( mtcars)

## and we can to many index for slice by position row
mtcars %>%
  slice(1:5)

mtcars %>%
  slice(7:9)

mtcars %>%
  slice( c(1,3,10) )
