# Regression Template

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Feature Scaling
# training_set = scale(training_set)
# test_set = scale(test_set)

# Fitting Polynomial Regression to the dataset
createRegressor = function() {
  # Create your regressor here
}
regressor = createRegressor()

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))

# Vizualizing the Regression Model results
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)), colour = 'blue') +
  ggtitle('Truth or Bluff (Regression model)') +
  xlab('Level') +
  ylab('Salary')

# Vizualizing the Regression Model results (with smooth curve)for higher resolution and smoother curve)
x_grid = seq(min(dataset$Level), max(dataset$Level), step = 0.1)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary), colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))), colour = 'blue') +
  ggtitle('Truth or Bluff (Regression model)') +
  xlab('Level') +
  ylab('Salary')