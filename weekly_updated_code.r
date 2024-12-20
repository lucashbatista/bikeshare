
```{r Load Packages}
library(lubridate) # 
library(magrittr) # needs to be run every time you start R and want to use %>%
library(dplyr) 
library(mapdata)
library(maps)
library(tidyr)
library(ggplot2)
library(hms)

```

```{r Load and read datasets}
df <- read.csv("202004-divvy-tripdata.csv")
print(head(df,2))
```
Transform all columns that contain number to INT class.
Strip hour, minute, and seconds columns started_at and ended_at.

Changing the old dataframe name from alldf to df.
```{r Extract date and time from column started and ended}

df["started_hour"] <- substr(df$started_at,12, 13) # Hour 
df["started_minute"] <- substr(df$started_at,15, 16) # minute
df["started_seconds"] <- substr(df$started_at,18, 19) # seconds

df["ended_hour"] <- substr(df$ended_at,12, 13) # Hour 
df["ended_minute"] <- substr(df$ended_at,15, 16) # minute
df["ended_seconds"] <- substr(df$ended_at,18, 19) # seconds

df["ended_month"] <- format(as.Date(df$ended_at), "%m")## For Month
df["ended_day"] <- format(as.Date(df$ended_at), "%d") ## For Day
df["ended_year"] <- format(as.Date(df$ended_at), "%Y") ## For Year

df["started_month"] <- format(as.Date(df$started_at), "%m")## For Month
df["started_day"] <- format(as.Date(df$started_at), "%d") ## For Day
df["started_year"] <- format(as.Date(df$started_at), "%Y") ## For Year

#getting month > months(as.Date(alldf$started_at))

```


- copying df to do the next steps(then I do need to run the entire code again if there are mistakes.)

```{r Copy df to df1}
df1 <- df
```

Now we can transform datatype.

```{r Transform strings to INT}
df1$started_hour <- as.integer(df1$started_hour)
df1$ended_hour <- as.integer(df1$ended_hour)
df1$started_minute <- as.integer(df1$started_minute)
df1$ended_minute <- as.integer(df1$ended_minute)
df1$started_seconds <- as.integer(df1$started_seconds)
df1$ended_seconds <- as.integer(df1$ended_seconds)
df1$started_year <- as.integer(df1$started_year)
df1$ended_year <- as.integer(df1$ended_year)
df1$ended_month <- as.integer(df1$ended_month)
df1$ended_day <- as.integer(df1$ended_day)
df1$ended_month <- as.integer(df1$ended_month)
df1$started_month <- as.integer(df1$started_month)
df1$started_day <- as.integer(df1$started_day)
#alldf1$ended_month <- as.integer(alldf1$ended_month)
#alldf1$ended_month <- as.integer(alldf1$ended_month)

```

Try to transform datetime to a time column. So we can use the diff function to see the trip time.
They are chr, and we need to change them to datetime

```{r Change started_at and ended_at datetype}
#df1['started_at_time'] <- strptime(df1$started_at, "%Y-%m-%d %H:%M:%S")
#df1['ended_at_time'] <- strptime(df1$ended_at, "%Y-%m-%d %H:%M:%S")

#the ones above did not work.


df1$NEWC1 <- strptime(df1$ended_at, "%Y-%m-%d %H:%M:%S")  
df1$NEWC2 <- strptime(df1$started_at, "%Y-%m-%d %H:%M:%S") 
```

Drop columns "started_at_time",    "ended_at_time", "started_at", "ended_at".
Keep the df1.

```{r Drop columns: "started_at_time",    "ended_at_time" > Used Select}
df1 <- select(df1, -c(started_at_time, ended_at_time)) #  completed
```


changed names using using setnames function inside of the data.table library.
```{r Rename columns}
setnames(df1, "oldName", "newName")
```

Create a column of the trip time. Trip time will be in minutes.

```{r Trip time: diff}
df1$ride_time <- round(difftime(df1$ended_at_time,df1$started_at_time, units = "mins"), digits=2)

```

Add weekdays to df1 dataframe.

```{r Add weekdays to}
df1$started_weekday <- weekdays(as.Date(df1$started_at))
df1$ended_weekday <- weekdays(as.Date(df1$ended_at))
```

df1 has the correct data format that I was looking for.


The table df1 now has ride_time. 
Use the filter to exclude the rides that lasted more than 2 hours because those people are tourists and they don't want to get annual member subscription.

Start counting and create graphs for this case study.


```{r Couting rides per hour}
df1 %>% count(started_hour, sort = FALSE,name="count") # COUNTING ALL USERS/RIDERS 
df1 %>% count(ended_hour, sort = FALSE, name="count") # COUNTING ALL USERS/RIDERS 
```

```{r Couting rides per day}
df1 %>% count(started_weekday, sort = FALSE,name="count") # COUNTING ALL USERS/RIDERS 
df1 %>% count(ended_weekday, sort = FALSE, name="count") # COUNTING ALL USERS/RIDERS 
```

```{r Couting rides per station}
df1 %>% count(start_station_name, sort = TRUE,name="count") # COUNTING ALL USERS/RIDERS 
df1 %>% count(end_station_name, sort = TRUE, name="count") # COUNTING ALL USERS/RIDERS 
```

```{r Counting rides per Chicago neighboorhood}

```

For the challenge above. Do a research to learn how to zone the ride by zipcode in the city of Chicago.


```{r Graph started and ended stations}

df1 %>% select(start_station_name,end_station_name) %>% 
  count(start_station_name,end_station_name, sort=TRUE, name="count") %>% 
  head(10) %>%  
  ggplot() + aes(x= reorder(start_station_name, -count),y=count,fill=count, sort.val = "desc") + 
  geom_bar(stat =  "identity") +
  labs(
    title = "Ten Busiest start point Stations",
    subtitle = "The rides start and end at the same station",
    x = "Station",
    y = "Count",
    size=12,
  
  ) +
    theme(
    axis.text.x = element_text(face = "bold", color = "black", 
                           size = 10, angle = 45, hjust=1,vjust = 0.9),
    axis.title = element_text(hjust=1, vjust=1.5, face = "bold", size=9),
    title =element_text(size=14, face='bold'),
    plot.subtitle = element_text(size=8,face = "italic"),
    )
  
```
