### Logistic Regression

## Create 2 vector for happiness & divorce column
happiness <- c(10, 8, 9, 7, 8, 5, 9, 6 , 8, 7, 1, 1, 3, 1, 4, 5, 6, 3, 2, 0)

divorce <- c( rep(0, 10), rep(1, 10) )

## create dataframe from 2 column
df <- data.frame( happiness, divorce )

## make Full model Logistic Regression
full_model <- glm( divorce ~ happiness, data = df, family = "binomial" )

## find P-value
summary(full_model)

## create probability_divorce and insert in dataframe
df$probability_divorce <- predict( full_model, type = "response" )

## recheck new column again
df


### create predicted_divorce column and insert in dataframe
df$predicted_divorce <- ifelse( df$probability_divorce >= 0.5, 1, 0 ) ## by ifelse probability >= 50% then return TRUE or FALSE
df


### make Confusion Matrix table
conf_M <- table( df$predicted_divorce, df$divorce, dnn = c("Predicted", "Actual") )

conf_M

### find 4 Result (Accuracy, Precision, Recall, F1-Score) by subset[ row, column ]

## Accuracy
Accuracy <- ( conf_M[2, 2] + conf_M[1, 1] ) / sum( conf_M )

## Precision
Precision <- conf_M[2, 2] / ( conf_M[2, 2] + conf_M[2, 1] )

## Recall
Recall <- conf_M[2, 2] / ( conf_M[2, 2] + conf_M[1, 2])

## F1-Score
F1_Score <- 2 * ( (Precision * Recall) / (Precision + Recall) )


### use cat() print all result
cat( "Accucary:", Accuracy,
     "\nPrecission:", Precision,
     "\nRecall:", Recall,
     "\nF1-Score:", F1_Score)
