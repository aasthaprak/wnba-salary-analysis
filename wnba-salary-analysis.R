# loading all necessary packages 

library(pacman)
pacman::p_load(wehoop, dplyr, glue, tictoc, progressr)

# loading in csv data files 
salaries_df <- read.csv("/Users/aasthaprakash/Downloads/wnba_salaries.csv")
stats_df <- read.csv("/Users/aasthaprakash/Desktop/wnba_2024_stats.csv")

# cleaning up data 

colnames(salaries_df)[colnames(salaries_df) == "Player.............................................."] <- "Player"
colnames(salaries_df)[colnames(salaries_df) == "X2024.Salary"] <- "Salary"

salaries_df$Player <- trimws(salaries_df$Player)
colnames(salaries_df)

## function to format Player name into first initial and last name
format_player_name <- function(full_name) {
  name_parts <- unlist(strsplit(full_name, " "))
  if (length(name_parts) >= 2) {
    initial <- substr(name_parts[1], 1, 1) 
    last_name <- name_parts[length(name_parts)] 
    return(paste(initial, last_name, sep = ". "))
  } else {
    return(full_name) 
  }
}

salaries_df$Player <- sapply(salaries_df$Player, format_player_name)
stats_df$Player <- sapply(stats_df$Player, format_player_name)

# merge the data frames by 'Player'
merged_df <- merge(salaries_selected, stats_selected, by = "Player", all = TRUE)

# convert Salary to numeric (removing dollar signs and commas)
merged_df$Salary <- as.numeric(gsub("[$,]", "", merged_df$Salary))

salaries_summary <- salaries_selected %>%
  group_by(Player) %>%
  summarise(
    Salary = max(Salary, na.rm = TRUE),  # Use max instead of sum
  )

# merge the summarized salaries with the stats Data Frame
merged_df <- left_join(stats_selected, salaries_summary, by = "Player")

# apply name formatting
salaries_df$Player <- sapply(salaries_df$Player, format_player_name)
stats_df$Player <- sapply(stats_df$Player, format_player_name)

# select relevant columns from each data frame
salaries_selected <- salaries_df[, c("Player", "Salary", "PPP")]
stats_selected <- stats_df[, c("Player", "PER", "WS", "MP")]

# summarize salaries by player, including PPP
salaries_summary <- salaries_selected %>%
  group_by(Player) %>%
  summarise(
    Salary = max(Salary, na.rm = TRUE), 
    PPP = max(PPP, na.rm = TRUE) 
  )

# merge the summarized salaries with the stats DataFrame
merged_df <- left_join(stats_selected, salaries_summary, by = "Player")

merged_df$Salary <- as.numeric(gsub("[$,]", "", merged_df$Salary))

# creating visualizations! 

library(ggplot2)
library(scales)
library(dplyr)

# setting a minutes cutoff to only display those who have played > 1000 minutes 
minutes_cutoff <- 1000 

# filter players based on MP (Minutes Played)
filtered_merged_df <- merged_df %>% filter(MP > minutes_cutoff)

# create a custom theme for aesthetics
custom_theme <- theme_minimal() + 
  theme(
    text = element_text(family = "Arial", size = 14),
    plot.title = element_text(face = "bold", hjust = 0.5, size = 16),
    plot.subtitle = element_text(size = 12, hjust = 0.5), 
    axis.title = element_text(face = "bold"),
    axis.text = element_text(size = 12),
    panel.grid.major = element_line(color = "gray85", size = 0.5), 
    panel.grid.minor = element_line(color = "gray90", size = 0.25),
    legend.position = "none"
  )

# Enhanced scatter plot for Salary vs PPP
salary_vs_ppp <- ggplot(filtered_merged_df, aes(x = Salary, y = PPP)) +
  geom_point(color = "#8B0000", size = 1.5, alpha = 0.7) +  
  geom_smooth(method = "lm", se = FALSE, color = "#0072B2", linetype = "dashed", linewidth = 1.2) +  
  labs(title = "Relationship Between Salary and Points Per Possession (PPP)",
       subtitle = "Analyzing WNBA players in the 2024 season with 1000 or more minutes played",
       x = "Salary (in USD)", y = "Points Per Possession (PPP)") +
  scale_x_continuous(labels = label_comma()) +  # Format x-axis labels
  geom_text(aes(label = Player), vjust = -0.8, size = 3, check_overlap = TRUE) + 
  custom_theme 

salary_vs_ppp

# Salary vs PER 
# Enhanced scatter plot for Salary vs PER
salary_vs_per <- ggplot(filtered_merged_df, aes(x = Salary, y = PER)) +
  geom_point(color = "#009E73", size = 1.5, alpha = 0.7) + 
  geom_smooth(method = "lm", se = FALSE, color = "#0072B2", linetype = "dashed", linewidth = 1.2) + 
  labs(title = "Relationship Between Salary and Player Efficiency Rating (PER)",
       subtitle = "Analyzing WNBA players in the 2024 season with 1000 or more minutes played",
       x = "Salary (in USD)", y = "Player Efficiency Rating (PER)") +
  scale_x_continuous(labels = label_comma()) + 
  geom_text(aes(label = Player), vjust = -0.8, size = 3, check_overlap = TRUE) + 
  custom_theme  

salary_vs_per

# Salary vs WS 
# Enhanced scatter plot for Salary vs WS
salary_vs_ws <- ggplot(filtered_merged_df, aes(x = Salary, y = WS)) +
  geom_point(color = "#F0E442", size = 1.5, alpha = 0.7) +  
  geom_smooth(method = "lm", se = FALSE, color = "#0072B2", linetype = "dashed", linewidth = 1.2) +  
  labs(title = "Relationship Between Salary and Win Shares (WS)",
       subtitle = "Analyzing WNBA players in the 2024 season with 1000 or more minutes played",
       x = "Salary (in USD)", y = "Win Shares (WS)") +
  scale_x_continuous(labels = label_comma()) +  # Format x-axis labels
  geom_text(aes(label = Player), vjust = -0.8, size = 3, check_overlap = TRUE) + 
  custom_theme  

salary_vs_ws
