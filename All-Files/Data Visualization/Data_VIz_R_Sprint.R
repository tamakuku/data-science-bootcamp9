## Data Viz (Data Visualization)

### basic plots (base R not install tidyverse)

### 1. Histogram with one Quantitative Variable ****
hist(mtcars$hp)

mean(mtcars$hp)
median(mtcars$hp)
data(mtcars)



### 2. Bar plot use with one Qualitative Variable ***
## check preview structure data first
## will see am column data type is numeric 0, 1
str(mtcars)

## change data in am column from 0, 1 to Auto, Manual with factor( ) function.
mtcars$am <- factor( mtcars$am,
                     levels = c(0,1),
                     label = c("Auto", "Manual") )

mtcars$am
## then use table( ) for slice new result
table(mtcars$am)

## and use barplot( ) make Bar chart.
barplot( table( mtcars$am ) )



### 3. Box plot with one variable ***
boxplot(mtcars$hp)

## use fivenum( ) summary box plot
## num1 = min, num2 = Q1, num3 = median, num4 = Q2, num5 = outlier
fivenum(mtcars$hp)

## recheck fivenum( ) with other function
min(mtcars$hp) ## for find min
quantile(mtcars$hp, probs = c(.25, .5, .75) ) ## for find Q1, Q2
max(mtcars$hp) ## find outlier

## Whisker calculation for find number of high and down arm in Box plot
Q3 <- quantile(mtcars$hp, probs = .75)
Q1 <- quantile(mtcars$hp, probs = .25)
IQR_hp <- Q3 - Q1

IQR_hp

## find high arm by (Q3 + 1.5) * IQR
Q3 + 1.5*IQR_hp

## find down arm by (Q1 - 1.5) * IQR
Q1 - 1.5*IQR_hp

## other function to find result like a fivenum( )
boxplot.stats(mtcars$hp, coef = 1.5)

## filter out outlier
install.packages("dplyr")
library(dplyr)

mtcars_non_outlier <- mtcars %>%
  filter ( hp < 335 )

## then box plot without Outlier
boxplot( mtcars_non_outlier$hp )


## 3.1 Box plot with 2 Variables
## Qualitative x Quantitative
boxplot(mpg ~ am, data = mtcars)

## use data( ) function when dataframe have some error for recall original dataframe come into working directory
data(mtcars)

## change am column to factor before run box plot again
mtcars$am <- factor( mtcars$am,
                     levels = c(0,1),
                     label = c("Auto", "Manual") )

boxplot(mpg ~ am, data = mtcars)

## change color in boxplot by col function
boxplot(mpg ~ am, data = mtcars,
        col = c("gold", "salmon") )

## save chart viz by please zoom for adjust dimension image first
## then click right >>> save image
## or click export >>> save image


## 4. Scatter plot
## use with 2 Variables in Quantitative
plot(mtcars$hp, mtcars$mpg)

## change icon in scatter plot by pch and number (search number icon in google with "pch plot icon")
plot(mtcars$hp, mtcars$mpg, pch = 16)

## then use col change color too
plot(mtcars$hp, mtcars$mpg, pch = 16, col = "red")

## find correlation use cor()
cor( mtcars$hp, mtcars$mpg )

## find linear regression use lm()
lm( mpg ~ hp, data = mtcars )

## input name chart by main + xlab + ylab
plot(mtcars$hp, mtcars$mpg,
     pch = 16,
     col = "red",
     main = "Relationship hp & mpg",
     xlab = "horse power",
     ylab = "miles per gallon")

## ***************************



### ggplot2
## search google "ggplots2 cheat sheet" for find many geom type for using.

## conditions step for choose geom type
## step 1 we have how many Variables for plot chart? >>> one or two or  three Variables.
## step 2 we have what type of Variables? >>> Quantitative or Qualitative.

## install.packages("tidyverse")
install.packages("tidyverse")
library(tidyverse)

## 1. use ggplot() for scatter plot ****
ggplot( data = mtcars, mapping = aes( x = hp, y = mpg ) ) +
        geom_point()

## data, mapping is default no need input for shorter code.
ggplot( mtcars, aes(hp, mpg) ) +
        geom_point()

## input smooth curve line
ggplot( mtcars, aes( hp, mpg ) ) +
        geom_point() +
        geom_smooth()

## input rug plot
ggplot( mtcars, aes( hp, mpg ) ) +
        geom_point() +
        geom_smooth() +
        geom_rug()

## change size point by size =
ggplot( mtcars, aes(hp, mpg) ) +
  geom_point( size = 3 )

## change color in point by col =
ggplot( mtcars, aes(hp, mpg) ) +
  geom_point( size = 3, col = "red")

## change gradient point by alpha =
ggplot( mtcars, aes(hp, mpg) ) +
  geom_point( size = 3, col = "red", alpha = 0.2)




## 2. use ggplot for Histogram ****
ggplot( mtcars, aes( hp ) ) +
        geom_histogram() ## default will plot 30 bins (or 30 bars)

## must use bins = for adjust bars.
ggplot( mtcars, aes(hp) ) +
  geom_histogram( bins = 10)

## change bars color by fill =
ggplot( mtcars, aes(hp) ) +
  geom_histogram( bins = 10, fill = "red")

## change gradient bars by alpha =
ggplot( mtcars, aes(hp) ) +
  geom_histogram( bins = 10, fill = "red", alpha = 0.5 )



## 3. use ggplot for Box plot *****
ggplot( mtcars, aes( hp) ) +
  geom_boxplot()


### can return basic layer into values then + geom for shorter code
plot <- ggplot(mtcars, aes(hp))

plot + geom_boxplot()

plot + geom_histogram()



## 4. make Bar plot with 1 Variables ******
## use "diamonds" dataframe
## use count() count cut column
diamonds %>%
  count(cut)

ggplot( diamonds, aes( cut ) ) +
  geom_bar()

## count color column
diamonds %>%
  count(color)

## then make mapping with color column into bars by >>> fill = name column
ggplot( diamonds, aes( cut, fill = color ) ) +
  geom_bar()


## mapping have to many position style ****

## 1. position = stacks 
ggplot( diamonds, aes( cut, fill = color ) ) +
  geom_bar( position = "stack")
## it default position no need type syntax
ggplot( diamonds, aes( cut, fill = color ) ) +
  geom_bar()

## 2. position = "dodge"
ggplot( diamonds, aes( cut, fill = color ) ) +
  geom_bar( position = "dodge")

## 3. position = "fill" for compare contribution by percentage
ggplot( diamonds, aes( cut, fill = color ) ) +
  geom_bar( position = "fill")



## 4. make Scatter plot *****
## find relationship between "carat" and "price"
ggplot( diamonds, aes(carat, price) ) +
  geom_point()

## if have to many data will use long time for render chart
## will use sample Variables for short time
## by sample_n() function
sample_diamonds <- sample_n( diamonds, 5000)

## then make scatter plot with sample Variables again will render faster
ggplot( sample_diamonds, aes(carat, price) ) +
  geom_point()
## but result will random every time when we run this code again.

## if want random result can lock
## must use set.seed(42) function before use sample_n()
set.seed(42)
sample_lock_diamonds <- sample_n(diamonds, 5000)

ggplot( sample_lock_diamonds, aes(carat, price) ) +
  geom_point()



### use Facet for slice chart to many chart by each data in column
## with facet_wrap( )
## example slice with color column
ggplot( sample_lock_diamonds, aes(carat, price) ) +
  geom_point() +
  facet_wrap( ~color )

## can change column preview chart by ncol =
ggplot( sample_lock_diamonds, aes(carat, price) ) +
  geom_point() +
  facet_wrap( ~color, ncol = 4 )

## then input other geom_ element for nice Viz as usually.
ggplot( sample_lock_diamonds, aes(carat, price) ) +
  geom_point() +
  facet_wrap( ~color, ncol = 2 ) +
  geom_smooth( method = "lm", col = "red") +
  geom_rug()


## change background grey color with theme_minimal
ggplot( sample_lock_diamonds, aes(carat, price) ) +
  geom_point() +
  facet_wrap( ~color, ncol = 2 ) +
  geom_smooth( method = "lm", col = "red") +
  geom_rug() +
  theme_minimal()

## use labs( ) for input name labels in charts
ggplot( sample_lock_diamonds, aes(carat, price) ) +
  geom_point() +
  facet_wrap( ~color, ncol = 2 ) +
  geom_smooth( method = "lm", col = "red") +
  geom_rug() +
  theme_minimal() +
  labs( title = "Relationship between carat & price",
        x = "carat",
        y = "price",
        caption = "Source: Diamonds from ggplots package")


### try use Mapping + Facet + Scatter plot in full option.
## mapping by color with "cut" column
## facet_warp( ) by "color" column and ncol = 2
ggplot( sample_lock_diamonds, aes(carat, price, col = cut) ) +
  geom_point() +
  facet_wrap( ~color, ncol = 2 ) +
  theme_minimal()

## then change size and gradient point and input name each position
ggplot( sample_lock_diamonds, aes(carat, price, col = cut) ) +
  geom_point( size = 3, alpha = 0.2) +
  facet_wrap( ~color, ncol = 2 ) +
  theme_minimal() +
  labs( title = "Relationship between carat & price",
        x = "carat",
        y = "price",
        caption = "source: diamonds dataframe based in R")






