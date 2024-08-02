<h1>Risk Analysis with Predictive Modeling for Vehicle Auctions </h1>

<h2>Description</h2>

This project involves a comprehensive analysis of vehicle auction data to assess the viability of car purchases. The primary objective was to predict whether a car is a “bad buy” by examining various factors such as vehicle age, mileage, acquisition cost, make, and origin. We utilized statistical analysis, correlation analysis, and regression modeling techniques to achieve our objectives.

<h2>Project Overview</h2>

In this project, we utilized data from Carvana’s Kaggle competition, “Don’t Get Kicked,” to predict the likelihood of a car being a “bad buy.” The key steps undertaken include:

	•	Data Processing: Loading and preprocessing the dataset, followed by exploratory analysis to understand its characteristics.
	•	Visualizations: Creating visual insights into car makes, sizes, and origins using ggplot2.
	•	Model Deployment: Predicting car buy quality with logistic regression and evaluating the model’s accuracy.

<h2>Project Walkthrough</h2>

	1.	Data Cleaning and Exploration: We began by loading and cleaning the dataset to ensure data integrity and quality. We explored the dataset’s characteristics using summary statistics and visualizations, including identifying the most popular car makes, common car sizes, and car origins.
	2.	Correlation Analysis: We conducted Pearson’s correlation analysis to identify the factors most correlated with the target variable (IsBadBuy). This analysis highlighted significant predictors, including vehicle age, mileage, acquisition cost, and year of manufacture.
	3.	Regression Modeling: We developed a predictive model using logistic regression to determine whether a car is a “bad buy.” The model used key features, such as Vehicle Age, Vehicle Year, Warranty Cost, Odometer Reading, and Acquisition Cost, to make predictions.
	4.	Model Evaluation: The predictive model’s performance was evaluated using metrics such as accuracy, precision, recall, and the confusion matrix. The model achieved an accuracy rate of 87%, demonstrating its effectiveness in predicting “bad buys.”

<h2>Recommendations and Insights</h2>

Based on our analysis and the predictive model, we provided Carvana with valuable recommendations to enhance their vehicle acquisition strategy:

	•	Focus on acquiring cars with lower odometer readings to ensure better condition and reduce wear and tear.
	•	Target cars with an average age of around 4-4.5 years to balance cost and age.
	•	Consider acquiring newer cars, as they tend to be in better condition and have a higher likelihood of being a “good buy.”
	•	Avoid purchasing cars from makes like Mercury and Mini, as they have shown a higher likelihood of being a “bad buy.”
	•	Pay attention to the age range indicated by dark blue patches in the analysis, as these cars are more likely to be “bad buys.”
	•	Prioritize acquiring vehicles from top-performing makes, as they tend to be more reliable regardless of their age.

<h2>Libraries Used</h2>

	•	tidyverse: For data manipulation and visualization.
	•	lfe: For statistical analysis and regression modeling.
	•	readxl: For reading Excel data files.
	•	ggplot2: For creating informative data visualizations.
	•	caTools: For splitting the dataset into training and testing sets.
	•	caret: For model evaluation and confusion matrix calculations.
	•	pROC: For generating ROC curves and AUC calculations (if needed).

<h2>Conclusion</h2>

This project provided Carvana with data-driven insights and a predictive model to make informed decisions when acquiring vehicles from various sources. By implementing these recommendations, Carvana can reduce the risk of purchasing “bad buys” and optimize its operations in the second-hand car market.

Feel free to provide details for your new project, and I’ll be happy to assist you in creating a similar code template and project description.

Data Source

The data was sourced from Kaggle.
