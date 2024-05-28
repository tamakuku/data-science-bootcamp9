
install.packages("ggplot2")
install.packages("patchwork")
install.packages("tidyverse")

library(ggplot2)
library(patchwork) # for print multiple chart in once preview
library(tidyverse)
library(readr)


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
