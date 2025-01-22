# Google Data Analytics Capstone:
## Cyclicstic Trip Data Case Study

### Introduction

Cyclistic, a bike-share program in Chicago, aims to increase its number of annual memberships, as these customers are significantly more profitable than casual riders. The program offers a fleet of over 5,800 bikes, including traditional models and accessible options, catering to a diverse range of riders. While casual riders currently make up a substantial portion of the customer base, the company's leadership believes that converting these users into long-term members will drive sustainable growth.

Understanding the differences in usage patterns between casual riders and annual members is essential for shaping an effective marketing strategy. By analyzing historical trip data, key insights can be gained into how each group interacts with the service, what factors influence their decision to ride, and what could encourage casual riders to transition to annual memberships.

The analysis will focus on identifying trends and behaviors in trip data, providing data-driven recommendations for marketing initiatives. These insights will help shape strategies to increase annual memberships, ultimately contributing to the company's long-term profitability and growth.

#### Sources:

[divvy-tripdata-202311 to 202411](https://divvy-tripdata.s3.amazonaws.com/index.html)

### Ask

Analyze and compare the usage patterns of annual members and casual riders on Cyclistic bikes to identify key differences in their behavior.

This includes examining data on frequency, duration, and timing of bike usage for both groups to inform strategies for marketing and pricing to encourage membership.

### Prepare & Process

##### LibreOffice Calc Process:

--For each month's .csv file, created a column called ride_length to calculate the length of each ride by subtracting the column started_at from column ended_at (formula: =DX-CX) and formatted output of this column as HH:MM:SS.

--Then createdd a column for day_of_week to calculate the day of the week each ride started (formula: =WEEKDAY(C2, 1).)

##### [SQL Process](https://github.com/a-tetreault/Cyclistic_tripdata/blob/main/cyclistic_create_tables.sql):

--Before importing the tripdata .csv files into DBeaver, tables were created for each month and the Full Year.

--All months are then inserted into our new Full_Year table using UNION ALL.

--Full_Year is then altered and updated to include a year and month/year column.

### Analyze

##### [SQL Analysis](https://github.com/a-tetreault/Cyclistic_tripdata/blob/main/create_output_table.sql):

--First, a Member V. Casual table is created with columns for month/year, membership category, and our aggregate functions: total rides, average ride duration, maximum average count daily rides and the respective day of the week this occurs on. 

--Using windowing functions, we can achieve all of our aggregates in one query which we can then push into the table with UPDATE TABLE. Each aggregate we want is nested into its own function and then called during SET in UPDATE. This was especially helpful with calculating Maximum Average DAily Rides, as it required three separate functions before getting what we wanted.

### Share

##### [R Markdown With Visualizations and Summaries](https://github.com/a-tetreault/Cyclistic_tripdata/blob/4e98e69988cbc2736566f236fd258259197eb6ca/Cyclistic_analysis.html)

### Act

##### Implement a Tiered Pricing Model:

Given the seasonal variations in casual ridership, introducing a tiered pass system would allow Cyclistic to offer a variety of options, from annual memberships (paid monthly or annually) for frequent riders, to daily/weekly or ride count passes (e.g., 2-ride, 5-ride, 10-ride) for more casual users. This model both accomodates the diverse needs of current riders but also looks towards possible expansion into new markets. A flexible pricing structure can easily be adapted to various regions, accommodating both casual users and frequent riders, and ensuring consistent revenue streams as the customer base grows.

##### Leverage Seasonal Demand with Targeted Promotions:

To capitalize on the May ridership peak, consider launching a Spring/Summer promotion in March/April. This could include discounted rates or bonus incentives to encourage casual riders to transition to memberships while capturing the momentum of early-season demand. A timely, well-targeted offer would optimize acquisition and build a strong customer base ahead of peak season.

##### Drive Weekend Engagement with Exclusive Member Deals:

Usage data reveals that casual riders peak on Sundays, while members are most active on Thursdays. To drive sustained ridership, introduce a Member-Only Weekend Promotion (Thursday through Sunday). This would incentivize members to ride more consistently during high-traffic days, boosting both engagement and member retention while maintaining steady fleet utilization throughout the week.

##### Encourage Off-Peak Usage to Optimize Fleet Efficiency:

Rewarding off-peak rides (weekdays) with incentives such as discounted rates or bonus rides would balance demand and maximize fleet efficiency. Additionally, this could be framed within a loyalty program, fostering long-term member commitment while smoothing usage patterns and reducing strain on peak-time capacity.

### Summary

Aligning Cyclistic's pricing and promotional strategies with observed ridership patterns will drive both short-term engagement and long-term growth. A tiered membership system offering flexible pass options, will not only cater to diverse rider needs but also position the company for future scalability as it expands into new markets. Seasonal promotions, weekend incentives for members, and off-peak rewards will foster customer loyalty and smooth demand distribution. These initiatives, combined with a clear focus on membership growth, can help achieve the 70% membership target by next year, while also providing a robust foundation for expansion into new regions and sustained profitability.
