# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

# Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York', 'California', 'Florida'),
                         labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fittinh Multiple Linear Regression to the Training set
regressor = lm(formula = Profit ~ ., data = training_set)

# Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)

# Building the optimal model using Backward Elimination
SL = 0.05
Pv = 100
x = dataset[, c(1, 2, 3, 4, 5)]
regressor = lm(formula = Profit ~ ., data = x)
while (Pv > SL) {
  numVars = length(x)
  regressor = lm(formula = Profit ~ ., data = x)
  maxPv = max(coef(summary(regressor))[c(2: numVars), "Pr(>|t|)"])
  maxPvIndex = which(coef(summary(regressor))[c(2:numVars), "Pr(>|t|)"] == maxPv)
  x = x[, -maxPvIndex]
  Pv = maxPv
}

summary(regressor)
