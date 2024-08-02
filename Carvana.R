# Loading Libraries
library(tidyverse)
library(lfe) 
library(readxl)
library(ggplot2)
options(scipen=999) 

# Load the libraries
library(caTools) # For sample.split
library(caret)   # For confusionMatrix and potentially for createDataPartition
library(pROC)    # For ROC curve and AUC, if needed

# Setting the Path and Reading the Data
file_path <- "/Users/ishanlokhande/Downloads/DontGetKicked/training.csv"
data <- read_csv(file_path)

# Summary Statistics
glimpse(data)
summary(data)

# Exploratory Data Analysis

# Number of unique vehicles
unique_vehicles <- n_distinct(data$RefId)
cat("Number of unique vehicles:", unique_vehicles, "\n")

# Most popular car brands
popular_brands <- data %>%
  count(Make) %>%
  arrange(desc(n)) %>%
  head(10)
print(popular_brands)

# Visualizing top car brands
ggplot(popular_brands, aes(x = reorder(Make, n), y = n)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Brand") +
  ylab("Count") +
  ggtitle("Top 10 Car Brands")

# Most common vehicle categories
common_categories <- data %>%
  count(Size) %>%
  arrange(desc(n))
print(common_categories)

# Visualizing vehicle categories
ggplot(common_categories, aes(x = reorder(Size, n), y = n)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Category") +
  ylab("Count") +
  ggtitle("Common Vehicle Categories")

# Average age of the vehicles
average_vehicle_age <- mean(data$VehicleAge, na.rm = TRUE)
cat("Average age of vehicles:", average_vehicle_age, "years\n")

# Average mileage (odometer)
average_mileage <- mean(data$VehOdo, na.rm = TRUE)
cat("Average mileage on vehicles:", average_mileage, "\n")

# Vehicle origin
vehicle_origin <- data %>%
  count(Nationality) %>%
  arrange(desc(n))
print(vehicle_origin)

# Visualizing vehicle origin
ggplot(vehicle_origin, aes(x = reorder(Nationality, n), y = n)) +
  geom_bar(stat="identity") +
  coord_flip() +
  xlab("Origin") +
  ylab("Count") +
  ggtitle("Vehicle Origin")

# Correlation Analysis
calculate_correlation <- function(x, y) {
  result <- cor.test(x, y, use = "complete.obs")
  return(c(correlation = result$estimate, p_value = result$p.value))
}

correlation_results <- tibble(
  attribute = c("VehicleAge", "VehOdo", "VehBCost", "WarrantyCost", "VehYear"),
  results = map(attribute, ~calculate_correlation(data[[.x]], data$IsBadBuy))
)

print(correlation_results)

# Regression Model
model_data <- lm(IsBadBuy ~ VehicleAge + VehYear + WarrantyCost + VehOdo + VehBCost, data = data)
summary(model_data)

# Visualizing Regression Results
plot(model_data)

# Recommendations and Final Insights
# Based on the analysis and regression model, provide insights and recommendations.

# Predictive model
# Splitting the data into training and testing sets
set.seed(123) # For reproducibility
data_split <- sample.split(data$IsBadBuy, SplitRatio = 0.7)
training_set <- subset(data, data_split == TRUE)
testing_set <- subset(data, data_split == FALSE)

# Building a logistic regression model
logistic_model <- glm(IsBadBuy ~ VehicleAge + VehYear + WarrantyCost + VehOdo + VehBCost, 
                      data = training_set, family = binomial())

# Summary of the model
summary(logistic_model)

# Predicting and evaluating the model
model_predictions <- predict(logistic_model, testing_set, type = "response")
predicted_labels <- ifelse(model_predictions > 0.5, 1, 0)

# Convert predicted_labels and testing_set$IsBadBuy to factors with the same levels
predicted_labels <- factor(predicted_labels, levels = c(0, 1))
testing_set$IsBadBuy <- factor(testing_set$IsBadBuy, levels = c(0, 1))

# Now use the confusionMatrix function from the caret package
confusion_mtx <- confusionMatrix(predicted_labels, testing_set$IsBadBuy)
print(confusion_mtx)
