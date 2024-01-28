library(tidyverse) ## for use %>% pipeline


### Correlation
cor( mtcars$mpg, mtcars$hp )

## scartter plot
plot( mtcars$mpg, mtcars$hp )
## change point style
plot( mtcars$mpg, mtcars$hp, pch = 16 )

## use Correlation + Matrix for multiple Column
cor( mtcars[ , c( "mpg", "wt", "hp" ) ] )

## use Correlation + %>% pipeline for Column

mtcars %>%
  select ( mpg, wt, hp) %>%
  cor()

## Find Sig. test
cor.test( mtcars$mpg, mtcars$hp )



#### Linear Regression with 2 type

### 1. Simple Linear Regression
lm( mpg ~ hp, data = mtcars )
## return into value
lm_model <- lm( mpg ~ hp, data = mtcars )

## Find Sig. Test
summary( lm_model )

## make Prediction with below condition
## mpg = b0 + b1*hp
## if hp = 200
lm_model$coefficients[[1]] + ( lm_model$coefficients[[2]] * 200 )

## if have 5 cars
## create new dataframe for 5 cars
new_cars <- data.frame( hp = c(250, 320, 400, 410, 450) )

## make prediction again
predict( lm_model, new_cars )

## input this prediction result into new_cars dataframe with new column
## return into value and use $ create new column
new_cars$mpg_predict <- predict( lm_model, new_cars )

## will see one result in mpg_predict column is -0.6xxx 
## it not make sense because in real life mile per gallon can not -0.xxx
## but it happen because we input hp more than raw data we have.

## check column hp will see Max hp = 335
summary( mtcars$hp )
## but we inout new hp in model with 400+


### use RMSE (Root Mean Squared Error) for minimise error result
## with Multiple Linear Regression
## mpg = f(hp, wt, am)
## mpg = intercept + bo*hp + b1*wt + b2*am

lm( mpg ~ hp + wt + am, data = mtcars )
## return into value
lm_multiple_model <- lm( mpg ~ hp + wt + am, data = mtcars )


## make prediction with condition below
## mpg = b0 + b1*hp + b2*wt + b3*am
## if hp = 200, wt = 3.5, am = 1
coef( lm_multiple_model )

coef_lm_multi_model <- coef( lm_multiple_model )

coef_lm_multi_model[[1]] + coef_lm_multi_model[[2]]*200 + coef_lm_multi_model[[3]]*3.5 +
coef_lm_multi_model[[4]]*1  


#### Build Full Model *****
lm( mpg ~ . , data = mtcars )
### return into value
lm_full_model <- lm( mpg ~ . , data = mtcars )

## if not use am column
lm( mpg ~ . - am, data = mtcars )
lm_full_model_none_am <- lm( mpg ~ . - am, data = mtcars )

## make preditction
predict( lm_full_model )

## insert this predict result into new column in mtcars dataframe
mtcars$mpg_predict_new <- predict( lm_full_model )

mtcars

#### How to make RMSE with 3 step ****
## Step 1. find error first (= actual - prediction)
mtcars$mpg - mtcars$mpg_predict_new
## return into value
error_mpg <- mtcars$mpg - mtcars$mpg_predict_new

## Step 2. make error Square Root 2
error_mpg ** 2
## return into value
squared_error_mpg <- error_mpg ** 2

## Step 3. make RMSE (Root Mean Squared Error)
sqrt( mean( squared_error_mpg ) )
## return into value
RMSE_mpg <- sqrt( mean( squared_error_mpg ) )


###$$$ from all above is just a Train model step ... is not a Test model.

### we will split full data for Train 80% and Test 20%

### How to split data.
## find summary sample size
nrow( mtcars ) ## we have 32 sample size.
## return into value
sample_size <- nrow( mtcars )

## split data with 80% and lock random sample
set.seed(42)
sample( 1:sample_size, size = sample_size * 0.8 )
## return into value
id <- sample( 1:sample_size, size = sample_size * 0.8 )

## make Train value
train_data <- mtcars[id, ]

## make Test value
test_data <- mtcars[-id, ]

### Make Train Model
train_model <- lm( mpg ~ hp + wt, data = train_data )

## make prediction
predict_train <- predict( train_model )

## make error
error_train <- train_data$mpg - predict_train

## make error squared root 2
squared_error_train <- error_train ** 2

## make RMSE
rmse_train <- sqrt( mean( squared_error_train ) )


### How to make Test Model

## make prediction
predict( train_model, newdata = test_data )
## return into value
predict_test <- predict( train_model, newdata = test_data )

## find error
error_test <- test_data$mpg - predict_test

## make error squared root 2
squaered_error_test <- error_test ** 2

## make RMSE
rmse_test <- sqrt( mean( squaered_error_test ) )


### print compare Train & Test model
## use cat() function (like paste() )
cat( "RMSE Train:", rmse_train )
cat( "RMSE Test:", rmse_test )

## or short syntax
cat( "RMSE Train:", rmse_train,
     "\n RMSE Test:", rmse_test )

## then will find Train model can predict better than Test model.
## because RMSE train = 2.40
## but RMSE test = 2.82
## because if RMSE value nearly 0.00 = less error = good prediction


#### Logistic Regression ***
### use for data set have just 0, 1 value
## use am column for example

## convert am to factor first
mtcars$am <- factor( mtcars$am,
                     levels = c( 0,1 ),
                     labels = c( "Auto", "Manaul" ) )

## split data 70%
set.seed(42)
sample_size <- nrow(mtcars)

id <- split( 1:sample_size, size = sample_size * 0.7 )

## make train & test data
train_data <- mtcars[ id, ]
train_data <- mtcars[ -id, ]

### make Train model
glm( am ~ mpg, data = train_data, family = "binomial" )

logic_train <- glm( am ~ mpg, data = train_data, family = "binomial" )

## make prediction
predict_train <- predict( logic_train, type = "response" )

## insert prediction into new column and use if_else transfer value
## if > 0.5 = "Manual"
## if < 0.5 = "Auto"
train_data$predict_train <- if_else( predict_train >= 0.5, "Manual", "Auto" )

## find Train model result
result_train <- mean( train_data$am == train_data$predict_train )

### make Test model
## make prediction
predict_test <- predict( logic_model, newdata = test_data, type = "response" )

## insert prediction into new and transfer result with if_else
## if > 0.5 = "Manual"
## if < 0.5 = "Auto"
test_data$predict_test <- if_else( predict_test >= 0.5, "Manual", "Auto" )

## find Test model result
result_test <- mean( test_data$am == test_data$predict_test )

## print compare Train vs Test
cat( "Logic Train:", result_train,
     "\n Logic Test:", result_test )
