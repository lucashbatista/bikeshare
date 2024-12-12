---
title: "chicago_rideshare"
output:
  pdf_document:
    toc: true
  html_document:
    toc: true
    number_sections: true
date: "2024-11-04"
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

```{r Load Packages}
library('lubridate') # 
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr) 
library(mapdata)
library(maps)
library(tidyr)
library(ggplot2)
```

## Case study: How does a bike-share navigate speedy success?

**About the company**

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

Cyclistic’s finance analysts have concluded that annual members are much more profitable than casual riders. Although the pricing flexibility helps Cyclistic attract more customers, Moreno believes that maximizing the number of annual members will be key to future growth. Rather than creating a marketing campaign that targets all-new customers, Moreno believes there is a solid opportunity to convert casual riders into members.

She notes that casual riders are already aware of the Cyclistic program and have chosen Cyclistic for their mobility needs. Moreno has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. In order to do that, however, the team needs to better understand how annual members and casual riders differ, why casual riders would buy a membership, and how digital media could affect their marketing tactics.

Moreno and her team are interested in analyzing the Cyclistic historical bike trip data to identify trends.

## Installing required packages

```{r lubridate}
install.packages('lubridate')

install.packages("magrittr") # package installations are only needed the first time you use it
install.packages("dplyr")    # alternative installation of the %>%

```

### Prepare

Reading files

```{r Reading datasets}
df <- read.csv("202004-divvy-tripdata.csv")
alldf <- df
head(alldf)
```

```{r column names}
colnames(alldf)
```

***here start merging all datasets available for this project***

##### Transform columns to the correct data type

#### Create new columns from started_at. (Month, day, year, hour, minute, and seconds)

```{r extracting date and time from column started and ended}
alldf["started_hour"] <- substr(alldf$started_at,12, 13) # Hour 
alldf["started_minute"] <- substr(alldf$started_at,15, 16) # minute
alldf["started_seconds"] <- substr(alldf$started_at,18, 19) # seconds

alldf["ended_hour"] <- substr(alldf$ended_at,12, 13) # Hour 
alldf["ended_minute"] <- substr(alldf$ended_at,15, 16) # minute
alldf["ended_seconds"] <- substr(alldf$ended_at,18, 19) # seconds

alldf["ended_month"] <- format(as.Date(alldf$ended_at), "%m")## For Month
alldf["ended_day"] <- format(as.Date(alldf$ended_at), "%d") ## For Day
alldf["ended_year"] <- format(as.Date(alldf$ended_at), "%Y") ## For Year

alldf["started_month"] <- format(as.Date(alldf$started_at), "%m")## For Month
alldf["started_day"] <- format(as.Date(alldf$started_at), "%d") ## For Day
alldf["started_year"] <- format(as.Date(alldf$started_at), "%Y") ## For Year
```

```{r Convert class of the column that have numbers}
alldf$started_hour <- as.integer(alldf$started_hour)
alldf$ended_hour <- as.integer(alldf$ended_hour)
alldf$started_minute <- as.integer(alldf$started_minute)
alldf$ended_minute <- as.integer(alldf$ended_minute)
alldf$started_seconds <- as.integer(alldf$started_seconds)
alldf$ended_seconds <- as.integer(alldf$ended_seconds)
alldf$started_year <- as.integer(alldf$started_year)
alldf$ended_year <- as.integer(alldf$ended_year)





```

Extract month, day, year, hour, minute, and seconds using slicing method in R. Then the data format should be changed to the right format.

```{r summary}
summary(alldf)
```

#### Extract weekdays from column ended_at and started_at

```{r extracting weekday for analysis}
alldf['started_weekday'] <- weekdays(as.Date(alldf$started_at))
alldf['ended_weekday'] <- weekdays(as.Date(alldf$ended_at))
```

#### Convert started_at and ended_at to class date

##### Format

as.POSIXct(df\$Date, "%m/%d/%Y %H:%M:%S")

```{r Convert class datetime to date}
#as.strptime(alldf$started_at, "%m/%d/%Y %H:%M:%S")  
#as.strptime(alldf$ended_at, "%m/%d/%Y %H:%M:%S")  
```

#### Extract month from datetime columns

```{r extracting month from started_at and ended_at}
 months(as.Date(alldf$started_at))
```

##### Transform data format

```{r transforming data format}
class(alldf$started_year) = "Numeric"
class(alldf$started_day) = "Numeric"
class(alldf$started_month) = "Numeric"
class(alldf$started_month) = "Numeric"

class(alldf$ended_minute) = "Numeric"
class(alldf$ended_seconds) = "Numeric"
class(alldf$ended_hour) = "Numeric"
class(alldf$ended_year) = "Numeric"
class(alldf$ended_day) = "Numeric"
class(alldf$ended_month) = "Numeric"
class(alldf$ended_month) = "Numeric"
class(alldf$started_at) = "datetime"
class(alldf$ended_at) = "datetime"
```

#### [PENDING] Extract month of the year

```{r Column names}
colnames(alldf
         )
```

### Counting and Plotting

```{r start_hour > all users}
alldf %>% count(started_hour, sort = FALSE) # COUNTING ALL USERS/RIDERS 
alldf %>% count(ended_hour, sort = FALSE) # COUNTING ALL USERS/RIDERS 
```

```{r Rides per month}
alldf %>% count(started_month, sort = TRUE) # START
alldf %>% count(ended_month, sort = TRUE) # END
```

```{r Hours that the rides started and ended combinedd}
alldf %>% count(started_hour,ended_hour, sort = FALSE)
```

```{r Column names}
colnames(alldf
         )
```

For this graph I want to use a line graph where start and end stations will cross from left to right and right to left, and create two separate graphs.

```{r Start and end stations counted combined}
#df_startend_station_name <- alldf %>% count(start_station_name, end_station_name, sort = TRUE)

#df_startend_station_name
#df_startend_station_name %>% head(10) %>%  
 #  ggplot(aes(start_station_name,fill=n)) +
#  geom_bar(position=position_dodge()) + 
  
```

```{r Count of the location where the ride started}
df_start <- alldf %>% count(start_station_name,  sort = TRUE, name = "count")
df_start 
df_start %>% head(10) %>%  
   ggplot(aes(x= reorder(start_station_name, -count),y= count,fill=count, sort.val = "desc")) + 
  ylim(0,1000) + geom_bar(stat = "identity") + 
  labs(
    title = "Annual Members and Casual",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )
#axis.text.x = element_text(angle=45)),

 
# 10 Stations with more rides as start points.", FOR MEMBERS
df_start <- alldf %>% count(start_station_name, member_casual, sort = TRUE, name = "count") %>% 
  filter(member_casual == "member")
df_start %>% head(10) %>%  
   ggplot(aes(x= reorder(start_station_name, -count),y= count,fill=count, sort.val = "desc")) + 
  ylim(0,1000) + geom_bar(stat = "identity") + 
  labs(
    title = "Annual Members.",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )
#axis.text.x = element_text(angle=45)),

# 10 Stations with more rides as start points.", FOR CASUAL
df_start <- alldf %>% count(start_station_name, member_casual, sort = TRUE, name = "count") %>% 
  filter(member_casual == "casual")
df_start %>% head(10) %>%  
   ggplot(aes(x= reorder(start_station_name, -count),y= count,fill=count, sort.val = "desc")) + 
  ylim(0,1000) + geom_bar(stat = "identity") + 
  labs(
    title = "Casual Riders",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )
#axis.text.x = element_text(angle=45)),
  
```

![](https://6fc84ccfcad24a579f01139725784f03.app.posit.cloud/chunk_output/2BE0D6BEe9635750/3E22EDF2/cjapfrni4uzmh/000014.png)

These stations have high volume of clients that used the bike service everyday. Now the next step is comparing the volume at those stations seeing the members and non-members. I want to see in a map where they are located in Chicago.

```{r Count of the location where the ride ended}
end_df <- alldf %>% count(end_station_name, sort = TRUE, name ="count") 
  
  

end_df %>% head(10) %>% 
   ggplot(aes(x= reorder(end_station_name, -count),y= count,fill=count, sort.val = "desc")) + 
  ylim(0,1000) + geom_bar(stat = "identity") + 
  labs(
    title = "10 Stations with more rides as end points 
    for members and casual riders.",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold')
 
    ) 

#FOR CASUAL MEMBERS 

end_df <- alldf %>% count(end_station_name,member_casual, sort = TRUE, name ="count") %>% 
  filter(member_casual == "casual")

end_df %>% head(10) %>% 
   ggplot(aes(x= reorder(end_station_name, -count),y= count,fill=count, sort.val = "desc")) + 
  ylim(0,1000) + geom_bar(stat = "identity") + 
  labs(
    title = "Volume of Rides for Casual Members",
    subtitle="Chicago IL -  Bikeshare",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold')
 
    ) 

#.    MEMBERS
end_df <- alldf %>% count(end_station_name,member_casual, sort = TRUE, name ="count") %>% 
  filter(member_casual == "member")

end_df %>% head(10) %>% 
   ggplot(aes(x= reorder(end_station_name, -count),y= count,fill=count, sort.val = "desc")) + 
  ylim(0,1000) + geom_bar(stat = "identity") + 
  labs(
    title = "Volume of Rides for Members",
    subtitle="Chicago IL -  Bikeshare",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold')
 
    ) 

```

Bar chart showing start and end stations for casual and members riders in the city of Chicago.

```{r start and end stations volume}

volume_s_e_df <- alldf %>% count(start_station_name, end_station_name,  sort = TRUE, name = "count")
volume_s_e_df 
volume_s_e_df %>% head(10) %>%  
   ggplot(aes(x= reorder(start_station_name, -count),y= count,fill=count, sort.val = "desc")) + geom_bar(stat = "identity") + 
  ylim(0,1000) + 
  labs(
    title = "Casual & Member Riders",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )
#axis.text.x = element_text(angle=45)),

 
# 10 Stations with more rides as start points.", FOR MEMBERS
volume_s_e_df <- alldf %>% count(start_station_name, end_station_name, member_casual, sort = TRUE, name = "count") %>% 
  filter(member_casual == "member")
volume_s_e_df %>% head(10) %>%  
   ggplot(aes(x= reorder(start_station_name, -count),y= count,fill=count, sort.val = "desc")) + geom_bar(stat = "identity") + 
  ylim(0,1000) + 
  labs(
    title = "Member Riders",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )
#axis.text.x = element_text(angle=45)),

# 10 Stations with more rides as start points.", FOR CASUAL
volume_s_e_df <- alldf %>% count(start_station_name, end_station_name, member_casual, sort = TRUE, name = "count") %>% 
  filter(member_casual == "casual")
volume_s_e_df %>% head(10) %>%  
   ggplot(aes(x= reorder(start_station_name, -count),y= count,fill=count, sort.val = "desc")) + 
  ylim(0,1000) + geom_bar(stat = "identity") + 
  labs(
    title = "Casual Riders",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )


```

Verifying the ride volume for riders per hour of the day.

Change the class of started_at to INT

```{r Volume per hour}

hour_df <- alldf %>% count(started_hour,  sort = TRUE, name = "count")
hour_df 
hour_df %>%  
   ggplot(aes(x=started_hour ,y=count,fill=count, sort.val = "desc")) +  geom_bar(stat = "identity") + 
  ylim(0,10000) + xlim(0,24) + 
  labs(
    title = "Casual & Member Riders",
    subtitle = "Chicago IL",
    x="Hour of the day",
    y="Number of rides",
    size=12,
    ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )
#axis.text.x = element_text(angle=45)),

 
# 10 Stations with more rides as start points.", FOR MEMBERS
hour_df <- alldf %>% count(started_hour, member_casual, sort = TRUE, name = "count") %>% 
  filter(member_casual == "member")
hour_df
hour_df %>% head(1000) %>%  
   ggplot(aes(x= started_hour,y= count,fill=count, sort.val = "desc")) +  geom_bar(stat = "identity") + 
  ylim(0,10000) +
  labs(
    title = "Member Riders",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=12, face='bold'),
    )
#axis.text.x = element_text(angle=45)),

# 10 Stations with more rides as start points.", FOR CASUAL
hour_df <- alldf %>% count(started_hour, member_casual, sort = TRUE, name = "count") %>% 
  filter(member_casual == "casual")
hour_df %>% head(400) %>%  
   ggplot(aes(x= started_hour,y= count,fill=count, sort.val = "desc")) + 
  ylim(0,10000) + geom_bar(stat = "identity") + 
  labs(
    title = "Casual Riders",
    subtitle = "Chicago IL",
    x="Name of the stations",
    y="Number of rides",
    size=12,
    
    
    
  ) + 
  
  theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    )


```



Finding out more about the behavior of the riders.

```{r Rides per user}

alldf %>% count(rideable_type)



```
```{r Changing column format}
#combine hour minute and seconds.

alldf["started_timestamp"] <-  paste(alldf$started_hour,alldf$started_minute,alldf$started_seconds, sep = ":")
alldf["ended_timestamp"] <-  paste(alldf$ended_hour,alldf$ended_minute,alldf$ended_seconds, sep = ":")
#date column 
alldf['started_date'] <- paste(alldf$started_year,alldf$started_month,alldf$started_day, sep = "-")
alldf['ended_date'] <- paste(alldf$ended_year,alldf$ended_month,alldf$ended_day, sep = "-")

alldf["started_date_time"] <- paste(alldf$started_date,alldf$started_timestamp, sep = " ")
alldf["ended_date_time"] <- paste(alldf$ended_date,alldf$ended_timestamp, sep = " ")

#https://stackoverflow.com/questions/63677684/extract-date-and-time-from-datetime-field-in-r

```

```{r Change the timestamp to time format}
alldf["s_date_time"] <- as.POSIXct(alldf$started_date_time, format= "%Y-%m-%d %H:%M:%S")
alldf["e_date_time"] <- as.POSIXct(alldf$ended_date_time, format= "%Y-%m-%d %H:%M:%S")
str(alldf)
```

Difference between two time stamps

```{r Time difference}

alldf['ride_time'] <- round(difftime(alldf$e_date_time,alldf$s_date_time, units = "mins"), digits=2)


```


Filter rides by annual members and casual riders.
I would exclude the people that ride for more than one hour.

```{Ride time}
alldf %>% filter(member_casual=casual)
```


Create map to show the stations



