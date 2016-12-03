Stat 133 Fall 2016 Final Project 
========================================================
author: Xuran Zhang, Xuanpei Ouyang, Yujia Luo, Yulong Yin  
date: 12/02/2016  
autosize: True  
  

Content
========================================================

- Introduction
- Data
- Methodology
- Results
- Conclusion


Introduction
========================================================

This project focuses on the dataset of basketball players from National Basketball 
Association (NBA) League in the 2015-2016 season. We wil analyse the relationship between these players’ performance and their salaries.  

![Fun Image](forFun.png)
![NBA Label](NBALabel.png) 

Data
========================================================
We used the NBA data sets from Basketball Reference, Sports Reference LLC,for 30 teams in NBA in season 2015-2016.

![State Team](stateTeam.png)
![team Image](teamImage.png)

Methodology
========================================================
- Data Cleaning
- EDA
- Team Statistics
- Player Performance
- Player Value
- Shiny apps 

Data Cleaning
========================================================
- merge(): roster, totals, and salary tables for each team
- cbind(): Stack all the tables
- duplicated(): check duplicate players
- Remove duplicated players  


EDA
========================================================

For EDA we have 2 types of data, quantitative data and qualitative data.  
We use bar chart to analyze qualitative data.
![Bar Chart for Variable Position](Bar_Chart_for_Variable_Position.png)  


EDA
========================================================

We use box plot and histogram to analyze quantitative data  
![Boxplot for Variable Assists Per Game](Boxplot_for_Variable_Assists_Per_Game.png)  
***
![Histogram for Variable Assists Per Game](Histogram_for_Variable_Assists_Per_Game.png)

Player Performance
========================================================
We use "efficiency"(EFF) to evaluate a professional basketball player's value.

![EFF](EFF.png) 
 
 Wi: weights	                               
 sigma i: standard deviation                
 EFF: efficiency	 
 PTS: total points	 
 REB: total rebounds  
*** 
![EFF*](EFF_.png) 

 AST: assists 
 STL: steals		
 BLK: blocks		
 TO: turnovers		
 GP: games played  
 Missed FT: missed free throws		
 Missed FG: missed field goals

Shiny apps 
========================================================
- "team-salaris"
  ![team totalpayroll](team totalpayroll.png) 
  
Shiny apps 
========================================================
- "stat-salaries"
![eff-salaries](eff-salaries.png)

 
Results
========================================================

- Player skill analysis  
![relation between salary and statistics](Bar_chart_for_correlation_between_salary_and_player_statistics.png)
 

Results
========================================================

- Player underpaid or overpaid
![Efficency Index and Salary Linear Regression Line](Efficency_Index_and_Salary_Linear_Regression_Line.png)


Results
========================================================

Player position analysis
![Bar chart for Average Salary for Different Position](Bar_chart_for_Average_Salary_for_Different_Position.png)  
*** 
![Bar chart for Average Efficency for Different Position](Bar_chart_for_Average_Efficency_for_Different_Position.png)


Results
========================================================

- Player position analysis
![Bar chart for Average Value for Different Position](Bar_chart_for_Average_Value_for_Different_Position.png)


Conclusion
========================================================
- EFF projects the highest possitive correlation with salary
- Number of missed field goals has the strongest negative impact on salary 
- Low efficiency players are more likely to be underpaid 
- High efficiency players are more likely to be overpaid
- Point guards and Shooting guards are underpaid on average
- Power forward and Center players are overpaid on average  



Take home message
========================================================
- Except for efficiency, what else will affect the underpaid and overpaid?
- For example: age, height, .etc

