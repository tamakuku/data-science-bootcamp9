install.packages("rmarkdown")
install.packages("ggplot2")
install.packages("patchwork")
install.packages("tidyverse")

library(rmarkdown)
library(ggplot2)
library(patchwork)
library(tidyverse)

## How to use markdown in R

## install.packages("rmarkdown") and call library(rmarkdown)
install.packages("rmarkdown")
library(rmarkdown)

## then open new file >>> choose rmarkdown
## will open new rmarkdown window.


### ******** ggplot2 ********
## install.packages("tidyverse") and call library(tidyverse)
## for use ggplot2
install.packages("tidyverse")

library(tidyverse)



##### How to choose Viz style *****
### 1. number of variables
### 2. data type (Qualitative & Quantitative)
## use ggplot2 cheat sheet for guideline.


#### Come to learning create 2 type of factor.
### factor have 'nominal' vs 'ordinal'.

## nominal factor example
# age( male, female)
# country( BKK, USA)

## ordinal factor example
# temperature ( High > Medium > low > very low )


#### How to create ordinal factor into new value.
## create temperature factor
temp <- c( "high", "medium", "low", "low", "high" )

class(temp) ## check class still is character.

## use factor( c( var01, var02, ... ), levels = c( var sort condition ), ordered = TRUE )
temp_ordinal <- factor( c( "high", "medium", "low", "low", "high" ),
                        levels = c ( "low", "medium", "high" ),
                        ordered = TRUE )

class(temp_ordinal) ## check class again.

### for example in preview dataframe which column is ordinal factor >>> will have <ord> below column name
head(diamonds)
## will see 'cut' or 'color' and 'clarity' column is <ord>.

## and we can count ordinal column.
diamonds %>%
  count(cut)



#### one variable in continuous (or number) can use how many chart?

### 1. histogram plot (one variable, continuous)
ggplot( diamonds, aes( price ) ) +
        geom_histogram( bins = 10)



### DRY concept : Do not Repeat Yourself

## if we must use same syntax to many times, not type long syntax everytime
## we should return base layer syntax into value for quick using.

## example we want plot 'cut' column to many chart type.

## create basic layer
ggplot( diamonds, aes( price ) )

## then return into value
basic_layer <- ggplot( diamonds, aes( price ) )

## and use plot any chart.
basic_layer + geom_histogram()

basic_layer + geom_density()

## and can return chart into value for quick using.

chart_hist <- basic_layer + geom_histogram()


### 2. density plot (one variable, continuous)
chart_densi <- basic_layer + geom_density()

chart_hist
chart_densi


### 3. Box plot (one variable, continuous)
ggplot( diamonds, aes( price ) ) +
        geom_boxplot()


#### one variable in discrete (or factor) can use how many chart?

### 1. Bar plot
ggplot( diamonds, aes( cut ) ) +
        geom_bar()


#### two variables in continuous x continuous (or number x number)

### 1. Scatter plot
ggplot( diamonds, aes( carat, price ) ) +
        geom_point()

## Mapping concept ***
## Mapping color by 'cut' column in to chart in aes()
ggplot( diamonds, aes( carat, price, col = cut) ) +
  geom_point()

## Setting concept **
## change size and gradient and color in geom_xxx()
ggplot( diamonds, aes( carat, price ) ) +
  geom_point( size = 3, alpha = 0.2, col = "red")

## change BG color by + theme_minimal
ggplot( diamonds, aes( carat, price ) ) +
  geom_point( size = 3, alpha = 0.2, col = "red") +
  theme_minimal()

### use sample_n() for fast render result
## return new value from sample_n()
sample_diamonds <- sample_n( diamonds, 5000 )
## then use sample value create chart
ggplot( sample_diamonds, aes( carat, price, col = cut) ) +
  geom_point()

### or can use %>% pipeline syntax direct in code
ggplot( diamonds %>% sample_n(5000), aes( carat, price, col = cut) ) +
  geom_point()

### but every time run code, result will random all time
## use set.seed(42) for lock random.
set.seed(42)
sample_diamonds <- sample_n( diamonds, 5000 )

ggplot( sample_diamonds, aes( carat, price, col = cut) ) +
  geom_point()

## or use with %>% pipeline syntax same
set.seed(42)
ggplot( diamonds %>% sample_n(5000), aes( carat, price, col = cut) ) +
  geom_point()


### input title name in all position
## use + labs()
set.seed(42)
ggplot( diamonds %>% sample_n(5000), aes( x = carat, y = price, col = cut) ) +
  geom_point() +
  labs( title = "Scatter Plot",
        x = "carat",
        y = "price",
        caption = "Source from diamonds dataframe.")


### or can load theme custom by install.packages("ggthemes") and call library(ggthemes)
install.packages("ggthemes")
library(ggthemes)

## try use other custom theme
ggplot( diamonds %>% sample_n(5000), aes( x = carat, y = price, col = cut) ) +
  geom_point() +
  labs( title = "Scatter Plot",
        x = "carat",
        y = "price",
        caption = "Source from diamonds dataframe.")+
  theme_economist()


#### qplot() short cut code ***
qplot( x = carat, data = diamonds, geom = "density")

qplot( x = carat, data = diamonds, geom = "histogram")

qplot( x = cut, data = diamonds, geom = "bar")

qplot( x = carat, y = price, data = diamonds, geom = "point")


#### plot chart with to many layers
### + geom_smooth() see trend line
ggplot( diamonds %>% sample_n(1000), aes( x = carat, y = price) ) +
  geom_point() +
  geom_smooth() ## default is curve line or method = "loess"

## is want straight line
## input parameter method = "lm" in geom_smooth()
ggplot( diamonds %>% sample_n(1000), aes( x = carat, y = price) ) +
  geom_point() +
  geom_smooth( method = "lm" , col = "red")

## can use %>% pipeline for filter() for cut outlier off.
ggplot(  diamonds %>%
          sample_n(1000) %>%
          filter( carat <= 2.8 ),
            aes( x = carat, y = price) ) +
            geom_point() +
            geom_smooth()
## can change color trend line input "col = "color"
ggplot( diamonds %>%
          sample_n(1000) %>%
          filter( carat <= 2.8 ), aes( x = carat, y = price) ) +
            geom_point() +
            geom_smooth( col = "red" )


### use geom_rug() for see distribution of data.
ggplot(  diamonds %>%
           sample_n(1000) %>%
           filter( carat <= 2.8 ),
         aes( x = carat, y = price) ) +
  geom_point() +
  geom_smooth() +
  geom_rug()
## can change color too
ggplot(  diamonds %>%
           sample_n(1000) %>%
           filter( carat <= 2.8 ),
         aes( x = carat, y = price) ) +
  geom_point() +
  geom_smooth() +
  geom_rug( col = "purple")



#### Mapping color by column in aes()
### use Bar plot for example
## use columnn cut for mapping color with themself
ggplot( diamonds, aes(cut, fill = cut) ) +
        geom_bar()

## or use other column for mapping color
ggplot( diamonds, aes(cut, fill = clarity) ) +
  geom_bar() ## position will show stack bar is default

## can change other position input "position = "..." in geom_bar()
ggplot( diamonds, aes(cut, fill = clarity) ) +
  geom_bar( position = "dodge" )


#### change color manual setting with + scale_xxx()
ggplot( diamonds, aes(cut, fill = cut) ) +
  geom_bar() +
  scale_fill_manual( values = c("purple", "lightblue", "lightgreen", "darkgreen", "yellow") )
### can search palette color in Google with "ggplot2 color palette.
## use



#### change color scale to heat map by Scatter plot
## use + scale_color_gradient( low = "color 1", high = "color 2" )
ggplot( diamonds %>%
          sample_frac(0.1), aes(carat, price, color = price) ) +
            geom_point() +
            scale_color_gradient( low = "gold", high = "purple")



#### use Facet for plot sub chart by column with 2 way
### 1. use facet_warp() with x axis
## and use 'cut' column for sub chart
ggplot( diamonds %>%
          sample_frac(0.2), aes( carat, price ) ) +
  geom_point( alpha = 0.2 ) +
  geom_smooth() +
  theme_minimal() +
  facet_wrap( ~ cut, ncol = 2 )

### 2. facet_grid()
ggplot( diamonds %>%
          sample_frac(0.2), aes( carat, price ) ) +
  geom_point( alpha = 0.2 ) +
  geom_smooth() +
  theme_minimal() +
  facet_grid( ~ cut )



#### plot chart with multiple dataframe
### example use 2 dataframe that filter data 2 conditions
m1 <- mtcars %>% filter ( mpg > 30 )
m2 <- mtcars %>% filter ( mpg <= 20 )

### and try plot 2 scatter chart with this 2 dataframe
ggplot() +
  theme_minimal() +
  geom_point( data = m1, aes(wt, mpg), color = "blue") +
  geom_point( data = m2, aes(wt, mpg), color = "red", size = 3)

#### use geom_bin2d() instead geom_point when have to many big data
ggplot( diamonds, aes(carat, price) ) +
  geom_bin2d()


#### use library(patchwork)
### for print to many chart in preview result
install.packages("patchwork")
library(patchwork)
## plot 4 quick chart and return into values
p1 <- qplot( x = carat, data = diamonds, geom = "density")

p2 <- qplot( x = carat, data = diamonds, geom = "histogram")

p3 <- qplot( x = carat, y = price, data = diamonds, geom = "point")

p4 <- qplot( x = carat, y = price, data = diamonds, geom = "smooth")

## then use + or / for set position chart preview
p1 + p2 + p3 + p4
## or
(p1 + p2 + p3) / p4


######### Home Work 01 *************
### 1. plot 5 chart with mpg dataframe
### 2. write document in markdown
### 3. explain what insight we got from each chart.
library(readr)
write_csv(mpg, "mpg.csv")


## chart 1. Bar plot >>> to find the popular model produced by Ford's cars.
ggplot( mpg %>%
          filter( manufacturer == "ford" ),
            aes( x = model, fill = model ) ) +
            geom_bar() +
            theme_minimal() +
            labs( title = "Bar chart: Ford's model cars produced",
                  x = "Model's Cars",
                  y = "Count of cars",
                  caption = "Source from mpg dataframe based on R")
## insight : The Mustang is the most popular model car produced by Ford's manufacturer.


## chart 2. Histogram plot >>> to Segment 'displ'(or engine displacement, in liters) of cars was produced.
ggplot( mpg, aes( x = displ ) ) +
          geom_histogram( bins = 10, fill = "red", col = "grey") +
          theme_minimal() +
          labs( title = "Histogram chart: Segment displ of cars produced",
                x = "Engine displacement, in liters",
                y = "Count of cars",
                caption = "Source from mpg dataframe based on R" )
## insight: If a car's have 'displ'(or engine displacement) more than 6 liters, it is less was produced.


## chart 3. Scatter plot >>> to find a relationship between 'displ'(or engine displacement, in liters) and 'cty'(or city distance, in miles per gallon).
## and Mapping color with 'displ'
ggplot( mpg, aes( x = displ, y = cty, color = displ) ) +
          geom_point() +
          geom_smooth( method = "lm", alpha = 0.2 ) +
          scale_color_gradient( low = "purple", high = "gold") +
          theme_minimal() +
          labs( title = "Scatter chart: Relationship displ & cty",
                x = "engine of cars, in liters",
                y = "miles per gallon, city driving",
                caption = "Source from mpg dataframe based in R" )
## insight: If a car's 'displ'(or engine displacement) has more liters, it can drive less distance in the city.


## chart 4. Scatter plot by 2 data.frame >>> to compare Ford and Audi by auto gear, which one can drive long distances on highways?
ford_auto <- mpg %>%
              select( manufacturer, trans, hwy ) %>%
              filter( manufacturer == "ford" & grepl( "auto", mpg$trans ) )
audi_auto <- mpg %>% 
              select( manufacturer, trans, hwy ) %>%
              filter( manufacturer == "audi" & grepl( "auto", mpg$trans ) )

ggplot() +
  geom_point( data = ford_auto, aes( x = hwy , y = manufacturer ), color = "blue" ) +
  geom_point( data = audi_auto, aes( x = hwy , y = manufacturer ), color = "red" ) +
  theme_minimal() +
  labs( title = "Scatter chart Auto Gear's cars Ford vs Audi",
        x = "Highway distance, miles per gallon",
        y = "Count of auto gear's cars",
        caption = "Source from mpg dataframe based in R")
## insight: When comparing two manufacturer's cars with auto gear, Audi can drive on the highway for more distance than Ford.


## chart 5. Scatter plot with Mapping + Facet >>> to find the relationship between 'cyl' (or number of cylinders) and 'cty' (or city distance, in miles per gallon), in each class of cars.
ggplot( mpg  %>%
          filter( manufacturer == "ford"),
        aes( x = cty, y = cyl, color = class) ) +
  geom_point() +
  geom_smooth( method = "lm") +
  geom_rug() +
  facet_grid( ~class ) +
  theme_minimal() +
  labs( title = "Multi Scatter chart: Relationship cyl & cty in each class",
        x = "City distance, miles per gallon",
        y = "Number of cylinders",
        caption = "Source from mpg dataframe based in R")
## insight: The subcompact class of Ford has six cylinders; it's the best Eco's car.


######## Home Work 02 **************
## 1. use data freefire vs pubg in google sheet.
## 2. plot chart for find answers from all questions.
## 3. guide make pivot table for result >>> then insert chart.
## 3.1 or use query() instead pivot table for result instead.
## 4. and explain insight too.

