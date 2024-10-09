# WNBA Salary and Performance Analysis (2024 Season) 

## Overview

This project analyzes the salaries of WNBA players in the 2024 season, specifically focusing on players who played 1,000 or more minutes. 
The analysis utilizes three scatter plots to examine the relationship between salary and key performance metrics: Points Per Possession (PPP), Win Shares (WS), 
and Player Efficiency Rating (PER). The goal is to identify undervalued and overvalued players based on their performance relative to their salary.

- Points Per Possession (PPP): Evaluates offensive efficiency
- Player Efficiency Rating (PER): Summarizes overall player performance
- Win Shares (WS): Estimates the contributions of players to their teams in terms of wins

## Data

I utilized and merged two datasets -- player statistics and salaries from the WNBA 2024 Season. 

## Methods

My analysis employs linear regression techniques to evaluate the relationships between player salaries and performance metrics. The following R libraries were utilized:
- `ggplot2`: for data visualization
- `dplyr`: for data manipulation
- `magick`: for image processing and saving high-quality plots
- `scales`: for formatting axis labels

I also filtered the data to include only players who have played at least 1000 minutes in the 2024 season.

## Key Findings 

1. A'ja Wilson is a top performer
- Consistenly ranks at the top of all analyzed charts, showcasing high salary, PER, PPP, and WS
- Her substantial salary aligns with her outstanding performance metrics -- showing that her team is investing wisely in her

2. Undervalued player: Aliyah Boston
- Boston's current salary is notably low compared to her PPP, WS, and PER
- She is contributing effectively on the court, yet receiving relatively lower compenation. This makes her a good example of an undervalued player in the WNBA

3. Overvalyed player: Kalia Copper
- Kalia Copper's salary for the 2024 season was $241,984, yet her PER and WS are notably low
- Her performance metrics do not reflect her salary, suggesting that she is an overvalued player 


## Conclusion
The analysis of WNBA player salaries in relation to performance metrics such as PPP, WS, and PER reveals significant insights into player valuation. Overall, the scatter plots indicate that there are distinct groups of players: those who are properly compensated, those who are undervalued, and those who are overvalued. 
Undervalued players exhibit strong performance metrics relative to their salary, suggesting that they are providing exceptional value to their teams. 
In contrast, overvalued players often have high salaries without corresponding levels of performance, indicating that teams may not be maximizing their investments. 
By identifying these trends, teams can make more informed decisions regarding player acquisition and retention, ensuring proper allocation of financial resources. This analysis also emphasizes the importance of assessing player value beyond just salary figures, considering a more broad view of performance and impact on the game.
As the WNBA continues to grow, recognizing the financial dynamics of player performance will be crucial for teams aiming to build competitive rosters while maintaining financial sustainability. 

