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

1. Salary vs. Points Per Possession (PPP)
- Undervalued Players:
      Players like R. Howard and A. Boston show high PPP but have relatively low salaries. This indicates they are contributing significantly to their teams’ scoring efficiency compared to their compensation.

- Overvalued Players:
      Players such as D. Taurasi and A. Wilson have high salaries but do not have an exceptional PPP. 

2. Salary vs. WS (Win Shares)
- Undervalued Players:
    D. Carrington and A. Smith demonstrate considerable contributions in terms of WS relative to their salaries. 
- Overvalued Players:
    Players like K. Mitchell and J. Jones have lower WS compared to their salary, suggesting they may not be performing up to the expectations set by their compensation.
  
3. Salary vs. Player Efficiency Rating (PER)
- Undervalued Players:
    R. Jackson and T. Harris are examples of players with high PER but lower salaries. 
- Overvalued Players:
  A. Ogunbowale and B. Stewart are among the higher earners

## Conclusion
The analysis of WNBA player salaries in relation to performance metrics such as PPP, WS, and PER reveals significant insights into player valuation.
Overall, the scatter plots indicate that there are distinct groups of players: those who outperform their salaries and those whose financial compensation does not align with their contributions. 
Undervalued players exhibit strong performance metrics relative to their salary, suggesting they are providing exceptional value to their teams. These players could serve as potential assets for teams looking to enhance performance while optimizing their salary cap.
In contrast, overvalued players often have high salaries without corresponding levels of performance, indicating that teams may not be maximizing their investments in these individuals. This discrepancy can lead to inefficiencies in team composition and overall performance.
By identifying these trends, teams can make more informed decisions regarding player acquisition and retention, ensuring that financial resources are allocated effectively. This analysis also emphasizes the importance of assessing player value beyond just salary figures, considering a more broad view of performance and impact on the game.
As the WNBA continues to grow, recognizing the financial dynamics of player performance will be crucial for teams aiming to build competitive rosters while maintaining financial sustainability. 

