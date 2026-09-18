## 📌 Project Overview
This project performs an Exploratory Data Analysis (EDA) on a dataset of 7,668 movies spanning four decades (1980–2020). The analysis investigates what financial and critical patterns exist in the film industry — examining the relationship between production budgets, box office gross revenue, audience scores, votes, and runtime.
The questions driving this analysis are the kind a studio executive, film investor, or streaming platform would ask before greenlighting a production: Does a higher budget guarantee higher returns? Which genres dominate? How do audience votes correlate with commercial success?

##  🗂️ Dataset
PropertyValueFilemovies.csvRows7,668Columns15Time Span1980 – 2020
Columns
ColumnTypeDescriptionnameobjectMovie titleratingobjectMPAA rating (R, PG, PG-13, etc.)genreobjectPrimary genreyearintRelease yearreleasedobjectFull release date and countryscorefloatIMDb audience score (0–10)votesintNumber of votes on IMDbdirectorobjectDirector namewriterobjectScreenplay writerstarobjectLead actor/actresscountryobjectProduction countrybudgetintProduction budget (USD)grossintBox office gross revenue (USD)companyobjectProduction/distribution companyruntimeintFilm duration in minutes

## ❓ Business Problems Addressed
💰 Financial

Does budget predict gross revenue? → Scatter plot + regression line reveals the relationship
Which movies generated the highest returns? → Dataset sorted by gross to find all-time earners
What is the average production budget in the industry? → Descriptive stats: mean budget = ~$30.9M
What is the spread of box office returns? → Std deviation shows extreme variance ($163M std on $78M mean — high risk industry)

##  📊 Correlation & Prediction

What numeric features correlate most with gross revenue? → Numeric correlation heatmap built
Do categorical features (genre, rating, director, star) influence financial outcomes? → Full correlation heatmap built after encoding all categorical columns to numeric codes
Is runtime related to votes or score? → Captured in the all-column correlation matrix

##  🎯 Data Quality

How reliable is the raw data for analysis? → Null audit performed; 2,171 budget nulls and 189 gross nulls identified — the two most financially critical columns had the most missing data


##  🧹 Data Cleaning — Problems & Solutions
This was the most technically demanding part of the project. Here's what was found and fixed:
Problem 1: Pervasive Missing Values
budget     → 2,171 nulls  (28% of dataset — most severe)
gross      → 189 nulls
rating     → 77 nulls
votes      → 3 nulls
score      → 3 nulls
...
Solution: Filled missing values with the most reasonable defaults:

rating → "R" (most common rating in dataset)
budget / gross → median-equivalent values from first rows
score, votes, runtime → representative values from existing records
country → "United States" (dominant in dataset)


⚠️ Note: Filling 2,171 budget nulls with a fixed value introduces bias. A production-grade approach would use median imputation per genre or drop rows for financial analysis. This is flagged as a known limitation.

Problem 2: Wrong Data Types After Imputation
After filling nulls, columns like budget, gross, votes, and runtime remained as object (string) type because mixed-type fill values were used.
Solution: Explicit casting applied:
pythondf["votes"]   = df["votes"].astype(int)
df["budget"]  = df["budget"].astype(int)
df["runtime"] = df["runtime"].astype(int)
df["gross"]   = df["gross"].astype(int)
Problem 3: Duplicate Records
Solution: df.drop_duplicates(inplace=True) — ensures each film is counted once.
Problem 4: Categorical Columns Blocking Correlation Analysis
genre, director, star, company, etc. are strings — they can't go into a correlation matrix.
Solution: All object columns encoded using .astype('category').cat.codes to produce a full 15×15 correlation heatmap including categorical features.

## 🔍 Key Insights Found
#Insight1Avatar ($2.85B gross) is the highest-grossing film in the dataset, followed by Avengers: Endgame and Titanic — all PG-13 action/drama2Budget and gross are positively correlated — the regression plot confirms a clear upward trend, but with massive spread, showing budget alone doesn't guarantee success3Votes correlate more strongly with gross than score does — popularity (engagement) is a better predictor of box office than critical rating4The average runtime is ~107 minutes with a max of 366 — significant outliers exist5Budget range: $3K to $356M — the film industry has extreme financial stratification between indie and blockbuster productions6Gross std deviation ($163M) dwarfs the mean ($78M) — confirms the "winner-takes-all" economics of Hollywood7The lowest-grossing films (< $1,000 gross) had budgets in the millions — indicating distribution failure risk even with real investment

## 📊 Visualizations Produced
#ChartPurpose1Budget vs Gross — Scatter PlotRaw relationship between investment and return2Budget vs Gross — Seaborn regplotRegression line overlaid to show trend direction3Numeric Correlation HeatmapCorrelations across year, votes, budget, gross, runtime4Full Correlation Heatmap (All Columns)Categorical + numeric features encoded and compared

## 🛠️ Tech Stack
Python 3.10+
├── pandas          — data loading, null handling, type casting, deduplication
├── numpy           — null percentage calculation loop
├── matplotlib      — scatter plots, figure sizing, ggplot style
└── seaborn         — regplot (regression scatter), heatmap (correlation matrices)

## 🚀 How to Run
bash# 1. Clone the repository
git clone https://github.com/Kashifkin/Data-Analyst-Projects.git
cd Data-Analyst-Projects/Movie-EDA

## 2. Install dependencies
pip install pandas numpy matplotlib seaborn

## 3. Place movies.csv in the project directory

## 4. Run the notebook
jupyter notebook Movie_EDA.ipynb

## 📁 Project Structure
Movie-EDA/
│
├── Movie_EDA.ipynb       ← Main analysis notebook
├── movies.csv            ← Source dataset (7,668 movies)
└── README.md

## ⚠️ Known Limitations

Budget null imputation with a fixed value skews financial analysis — median-per-genre imputation would be more accurate
score column was kept as object type throughout — should be cast to float64 for proper numeric analysis
Categorical encoding via .cat.codes assigns arbitrary integers — a proper analysis would use correlation ratio (Cramér's V) for categorical associations
No ROI (Return on Investment) column was derived — a gross / budget ratio would be the most actionable financial metric


## 💡 What I Would Add Next

ROI column → df["ROI"] = df["gross"] / df["budget"] to find the most efficient films, not just the biggest
Genre-level breakdown → Which genres have the best average ROI?
Decade trend analysis → Has budget-to-gross ratio changed over 40 years?
Director/Star impact → Do specific directors or stars statistically outperform others?
Interactive Plotly dashboard for stakeholder presentation
