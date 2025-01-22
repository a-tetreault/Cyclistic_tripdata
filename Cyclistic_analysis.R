library(tidyverse)
library(lubridate)
library(readxl)
library(scales)
mvc <- read_excel("member_v_casual.xlsx")

## Membership Totals
memberships <- aggregate(mvc$total_rides, list(membership=mvc$member_casual), FUN=sum)
ggplot(memberships, aes(x="", y=x, fill = membership)) +
  geom_col(color = "black") +
  coord_polar(theta = "y") +
  geom_label(aes(label = str_to_title(membership)),
             position = position_stack(vjust=0.5),
             show.legend=FALSE) +
  scale_fill_discrete(labels = paste(str_to_title(memberships$membership), ":\n", label_comma()(memberships$x))) + 
  guides(fill=guide_legend(title = "Membership Status")) +
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        panel.grid = element_blank(),
        plot.background = element_blank(),
        panel.background = element_blank())

## Graph of Total_rides by Month
monthyear <- my(mvc$moyr) # Set moyr to date datatype for x scale
total_rides <- ggplot(data = mvc, aes(x = monthyear, y = total_rides, fill = member_casual))
total_rides + geom_col(position = "dodge") + 
  labs(x="Month", y="Total Rides", title="Ride Count per Month") +
  scale_y_continuous(
    breaks = seq(0, max(mvc$total_rides, na.rm = TRUE), by = 100000), 
    labels = scales::comma) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%m-%Y") +
  theme(axis.text.x = element_text(angle=45, vjust=1, hjust=1))

## Graph of avg_ride_length
# Convert avg_ride_length from HH:MM:SS format to a duration object
mvc$avg_ride_length_duration <- as.numeric(hms(mvc$avg_ride_length))

# Custom function to format labels as HH:MM:SS
format_duration <- function(x) {
  sprintf("%02d:%02d:%02d", x %/% 3600, (x %% 3600) %/% 60, x %% 60)
}
ggplot(data = mvc, aes(x = monthyear, y = avg_ride_length_duration, fill = member_casual)) +
  geom_col(position = "identity") +
  labs(x = "Month", y = "Average Ride Length", title = "Average Ride Length by Month") +
  theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) +
  scale_y_continuous(
    breaks = seq(43200, 54000, by = 15 * 60),  # Set breaks at 15-minute intervals between 12:00:00 and 15:00:00
    labels = function(x) { 
      format_duration(x)  # Format y-axis labels as HH:MM:SS
    },
    expand = expansion(mult = c(0.05, 0.1))) +  # Add some padding for the top of the axis
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%m-%Y") +
  coord_cartesian(ylim = c(43200, 54000))  # Force the y-axis range to fit from 12:00:00 to 15:00:00

## Graph maxavg_daily_rides by moyr w/ day_of_week label on column
# convert Day_of_week to day abbreviations for labels
mvc$Day_abbr <- factor(mvc$Day_of_week, levels = 1:7, labels = c("Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"))
madr <- ggplot(data = mvc, aes(x + monthyear, y = MaxAvg_Daily_Rides, fill = member_casual))
madr + geom_col() + 
  labs(x = "Month", y = "Max Daily Rides", 
       title="Max Average Daily Rides", 
       subtitle = "By Day of Week") +
  geom_text(aes(label = Day_abbr), position=position_stack(vjust=0.5)) +
  scale_x_date(
    date_breaks = "1 month",
    date_labels = "%m-%Y") +
  theme(axis.text.x = element_text(angle=45, vjust=1, hjust=1))

