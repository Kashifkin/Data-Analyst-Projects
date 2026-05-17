## 📌 Project Overview
This project performs a full Exploratory Data Analysis (EDA) on the ICC Cricket World Cup 2023 — the 50-over men's tournament held in India. The analysis covers batting, bowling, fielding, team standings, run rates, and batting partnerships across all group-stage matches.
The goal is to extract actionable insights from raw cricket statistics that could inform team selection decisions, fan understanding, and performance benchmarking — the kind of analysis a sports analytics team or broadcaster would commission before a knockout stage.

## 🗂️ Datasets Used
FileDescriptionRowsBatting_Stats.csvIndividual batting performance (runs, SR, centuries, etc.)100Bowling_Stats.csvBowling figures (wickets, economy, maiden overs, etc.)84ICC_World_Cup_2023.csvPoints table — wins, losses, NRR10 (+ 1 null)Best_Team.csvHighest team totals with venue and oppositionMultipleMax_Catches.csvTop fielders ranked by catches and catches per innings100Partnership.csvTop batting partnerships — runs, wicket, team100

## ❓ Business Problems Addressed
These are real questions that arise in cricket broadcasting, fantasy sports, and team management:
🏏 Batting

Who are the most consistent run-scorers? → Top 5 run-getters identified
Which batters convert starts into big scores? → Century leaders isolated
Who dominates with boundaries? → Top 4s and 6s hitters ranked
Who plays the fastest innings? → Strike Rate leaderboard produced
Is there a correlation between balls faced and runs scored? → Correlation heatmap applied

## 🎯 Bowling

Who took the most wickets? → Tournament's top 5 wicket-takers ranked
Which bowlers are most expensive? → Economy rate analysis performed
Who applies most pressure through dot balls? → Maiden overs leaderboard built
Which bowlers get big hauls? → 4-wicket and 5-wicket takers identified
Is economy related to wickets or average? → Bowling correlation heatmap built

## 🏆 Team Performance

Who dominated the group stage? → Win/loss breakdown per team
Which teams scored fastest? → Cumulative run rate by team ranked
Who is in the best form going into knockouts? → NRR (Net Run Rate) leader analysis
Full points table breakdown → Qualified vs eliminated team separation

## 🤝 Fielding & Partnerships

Who are the best fielders? → Total catches and Ct/Inn (efficiency metric) ranked
Which batting pairs built the biggest stands? → Top 5 partnerships extracted
Which teams produced the most partnerships? → Team-level partnership count charted


## 🔍 Key Insights Found
CategoryInsight🏏 BattingVirat Kohli led the tournament with 765 runs and 6 fifties — unmatched consistency🏏 BattingQuinton de Kock hit the most centuries (4) — the most destructive top-order batter🏏 BattingRohit Sharma hit the most sixes (31) — reflecting India's aggressive powerplay strategy🎯 BowlingMohammed Shami finished as leading wicket-taker with 24 wickets in just 7 matches — elite economy🎯 BowlingJasprit Bumrah led maiden overs (9) — indicating extreme pressure bowling🎯 BowlingPart-timers like Shadab Khan had high averages/strike rates, pointing to bowler overuse under pressure🏆 TeamsIndia went unbeaten (9/9) in the group stage with an NRR of 2.57 — dominant across all metrics🏆 TeamsSouth Africa posted the tournament's highest innings (428/5 vs Sri Lanka)🤝 FieldingDJ Mitchell (NZ) led with 11 catches and the best Ct/Inn ratio (1.10) among regular fielders🤝 PartnershipsRavindra & Conway (NZ) built the tournament's biggest partnership — 273 runs unbroken

## 🧹 Data Cleaning Steps

Identified and dropped the single null row in ICC_World_Cup_2023.csv using dropna()
Stripped * characters (unbeaten notations) from partnership["Runs"] before converting to numeric
Renamed ambiguous column names for readability:

"100" → "Centuries", "50" → "Fifties", "0" → "Ducks"
"4s" → "Fours", "6s" → "Sixes"
"4'w" → "Four_fers", "5'w" → "Fivers"


Used select_dtypes(include=['int64', 'float64']) to isolate numeric columns for correlation analysis
Verified zero nulls across all other datasets before analysis


## 📊 Visualizations Produced
#ChartChart Type1Top 5 Run ScorersBar2Top 5 Century ScorersBar3Top 3 Fifty ScorersHorizontal Bar4Top 5 Six HittersBar5Top 3 Four HittersBar6Batting Stats Correlation HeatmapHeatmap7Number of Players by Country (Batting)Count Plot8Top 5 Players by Strike RateHorizontal Bar9Number of Players by Country (Bowling)Count Plot10Top 5 Wicket TakersBar11Bowling Stats Correlation HeatmapHeatmap12Most Runs Conceded by BowlersBar13Most 4-Wicket HaulsHorizontal Bar14Most 5-Wicket HaulsHorizontal Bar15Highest Economy RatesBar16Highest Bowling AveragesBar17Highest Strike Rate by BowlerBar18Most Maiden OversScatter19Highest Run Rate by TeamHorizontal Bar20Most Wins — Points TableBar21Most Losses — Points TableBar22Highest NRR (Top 3)Bar23Most Points GainedBar24Players per Country (Fielding)Count Plot25Most Catches TakenBar26Max Catch in a Single InningsBar27Highest Ct/Inn RatioHorizontal Bar28Team Partnership CountCount Plot29Top 5 Highest PartnershipsHorizontal Bar

## 🛠️ Tech Stack
Python 3.10+
├── pandas          — data loading, cleaning, groupby aggregations
├── numpy           — numeric operations
├── matplotlib      — base plotting layer
└── seaborn         — statistical visualizations (barplot, heatmap, countplot, scatterplot)

## 🚀 How to Run
bash# 1. Clone the repository
git clone https://github.com/Kashifkin/Data-Analyst-Projects.git
cd Data-Analyst-Projects/ICC-World-Cup-2023-EDA

## 2. Install dependencies
pip install pandas numpy matplotlib seaborn

## 3. Place all CSV files in the project directory:
#    Batting_Stats.csv, Bowling_Stats.csv, ICC World Cup 2023.csv,
#    Best_Team.csv, Max_Catches.csv, Partnership.csv

## 4. Run the notebook
jupyter notebook ICC_World_Cup_2023_EDA.ipynb

## 📁 Project Structure
ICC-World-Cup-2023-EDA/
│
├── ICC_World_Cup_2023_EDA.ipynb   ← Main analysis notebook
├── Batting_Stats.csv
├── Bowling_Stats.csv
├── ICC World Cup 2023.csv
├── Best_Team.csv
├── Max_Catches.csv
├── Partnership.csv
└── README.md

## 💡 What I Would Add Next

Interactive dashboard using Plotly or Power BI for stakeholder presentation
Player performance index — composite score combining batting, bowling, and fielding
Head-to-head team comparison module
Knockout stage outcome prediction using logistic regression on group-stage form
