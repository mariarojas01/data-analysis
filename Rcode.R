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

# install.packages("broom")  # run once
library(broom)

# Coefficient-level information
coef_table <- tidy(model, conf.int = TRUE)
coef_table

# Model-level summary (R^2, etc.)
model_fit <- glance(model)
model_fit

# Predictions for the observed data
mtcars$pred_mpg <- predict(model)

# Create a small new data set for scenario-based predictions
new_cars <- data.frame(
  wt  = c(2.5, 3.0, 3.5),  # in 1000 lb
  hp  = c(100, 150, 200),
  cyl = c(4, 6, 8)
)

predictions <- predict(model, newdata = new_cars, interval = "confidence")
cbind(new_cars, predictions)

# install.packages("ggplot2")  # run once
library(ggplot2)

ggplot(mtcars, aes(x = pred_mpg, y = mpg)) +
  geom_point() +
  geom_abline(intercept = 0, slope = 1, linetype = "dashed") +
  labs(
    x = "Predicted MPG",
    y = "Observed MPG",
    title = "Observed vs Predicted Fuel Efficiency"
  )



