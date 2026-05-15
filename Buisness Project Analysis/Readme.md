###Car Price Prediction
Project Overview
This project predicts the resale price of used cars based on features like brand, year of manufacture, kilometers driven, fuel type, and transmission type. The goal is to help buyers and sellers determine a fair market price for used vehicles.
Tools and Technologies Used

Python
Jupyter Notebook
Pandas
NumPy
Matplotlib and Seaborn
Scikit-learn
Linear Regression

Dataset
The dataset contains details of used cars including their selling price, present showroom price, kilometers driven, fuel type, seller type, transmission, and number of previous owners.
What I Did

Cleaned and explored the dataset to understand patterns
Handled missing values and removed outliers
Converted categorical columns like fuel type and transmission into numerical form
Built a Linear Regression model to predict car prices
Evaluated the model using R² score and Mean Absolute Error

Problems I Faced and How I Solved Them
1. Categorical columns were causing errors
The model could not process text columns like fuel type and transmission directly. I solved this by encoding them into numbers using Label Encoding.
2. Outliers in kilometers driven
Some cars had extremely high kilometer values that were skewing the results. I identified and removed these outliers using the IQR method.
3. Missing values in the dataset
A few rows had missing data which would break the model. I handled this by filling missing values with the median of each column.
4. Model was overfitting
The model was performing well on training data but poorly on test data. I fixed this by properly splitting the data 80/20 before evaluating performance.
Business Insights

Newer cars hold significantly higher resale value. Age is the biggest factor in price drop.
Diesel cars resell at higher prices compared to petrol cars in most cases.
Cars with lower kilometers driven are priced considerably higher.
Automatic transmission adds to the resale value, especially in urban markets.
Individual sellers tend to price lower than dealers, offering better deals for buyers.

What Can Be Improved

Try more powerful models like Random Forest or XGBoost to improve accuracy
Add more features such as car color and accident history
Build a simple web app where users can enter car details and get a predicted price
Use cross-validation for more reliable model evaluation
