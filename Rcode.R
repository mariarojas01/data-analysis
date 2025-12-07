# Load data
data(mtcars)

# Quick overview
str(mtcars)
summary(mtcars)

# Correlation matrix for numerical variables
cor(mtcars[, c("mpg", "wt", "hp", "cyl")])

# Simple scatterplot matrix
pairs(mtcars[, c("mpg", "wt", "hp", "cyl")])

# Fit the model
model <- lm(mpg ~ wt + hp + cyl, data = mtcars)

# Basic summary output
summary(model)

# Basic diagnostic plots (4-panel layout)
par(mfrow = c(2, 2))
plot(model)
par(mfrow = c(1, 1))

# install.packages("car")  # run once if not installed
library(car)

vif(model)

