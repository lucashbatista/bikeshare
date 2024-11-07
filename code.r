# merging all data 
# View data 

df1 <- read.csv("202004-divvy-tripdata.csv")
#df2 <- read.csv("202005-divvy-tripdata.csv")
alldf <- df1

#GOING FORWARD USE THE ALLDF AS THE DF TO ANALYSE DATA IN R.

alldf <- df1

mergedfs <- merge.data.frame(df1, df2, by="ride_id", all=TRUE)
mergedfs
head(mergedfs
     
)
#dfstart <- alldf %>%
dff <- filter(alldf, member_casual == 'casual') 

dff 
#compare the started_at, start_station_id, ended_at, count rides by station_id, end_station_id
head(dfstart)

#count_ended_at <- count(alldf, start_station_id) %>%
                             # group_by(start_station_id)

# START STATIONS > Count start_station_id sort by n
count_start_station_id <- count(alldf, start_station_id, sort=TRUE)
     

#create graph to show the top 10
count_start_station_id_head <- head(count_start_station_id, 10)
#create graph to show bottom 10
count_start_station_id_tail <- tail(count_start_station_id, 100) 
print(count_start_station_id_tail)

# Map all the stations where we had less than 2 rides in the city of Chicago.

# END STATIONS 
# Count start_station_id sort by n
count_end_station_id <- count(alldf, end_station_id, sort=TRUE)


#create graph to show the top 10
count_end_station_id_head <- head(count_end_station_id, 10)
#create graph to show bottom 10
count_end_station_id_tail <- tail(count_end_station_id, 100) 
print(count_end_station_id_tail)

# Map all the stations where we had less than 2 rides in the city of Chicago.

  

                              
#rename column 'count' in the count_ended_at
names(count_ended_at)[2] <- "count"
#group_by 'count' 
group_by(count_ended_at, count)


#count_ended_at = alldf %>% 
  #summarise(count = count(ended_at) 



# load the package 
install.packages('lubridate')
library('lubridate') # completed 

# datetime variable 
# gather date from the following columns in R > "started_at" - "ended_at"

# extract hour 
hour(alldf('started_at')) 


#DROP ALL THE TIME COLUMNS - Df <- DF %>% Select(-column you want gone)
alldf["started_month"] <- format(as.Date(alldf$started_at), "%m")## For Month
alldf["started_day"] <- format(as.Date(alldf$started_at), "%d") ## For Day
alldf["started_year"] <- format(as.Date(alldf$started_at), "%Y") ## For Year
alldf["started_hour"] <- format(as.Date(alldf$started_at), "%H") ## For hour
alldf["started_minute"] <- format(as.Date(alldf$started_at), "%M") ## For minute
alldf["started_seconds"] <- format(as.Date(alldf$started_at), "%S") ## For seconds


# ended_at > extract time data(month, day, year, hour, minute, seconds) from the ended_at column.
alldf["ended_month"] <- format(as.Date(alldf$ended_at), "%m")## For Month
alldf["ended_day"] <- format(as.Date(alldf$ended_at), "%d") ## For Day
alldf["ended_year"] <- format(as.Date(alldf$ended_at), "%Y") ## For Year
alldf["ended_hour"] <- format(as.Date(alldf$ended_at), "%H") ## For hour
alldf["ended_minute"] <- format(as.Date(alldf$ended_at), "%M") ## For minute
alldf["ended_seconds"] <- format(as.Date(alldf$ended_at), "%S") ## For seconds

#*********** CONTINUE FROM HERE. ************


#GROUPING BY HOURS.
newalldf <- group_by(alldf$ended_hour)


#create a new column counting the number of rides per hour.
alldf["hour_count_started"] <- count(alldf$started_hour) #change class of object to int.

#Transforming the column above to 'numeric' class

class(alldf$started_minute) = "int"
class(alldf$started_seconds) = "Numeric"
class(alldf$started_hour) = "Numeric"
#check the available hour in the started_hour column.
# the column 'started_hour' has all values as 0.
#delete all 'started_hour'
#Drop the column 'started_hour' from alldf dataframe.
alldf$started_hour <- NULL

#2020-04-26 17:45:14 > split the date from the time. 
#extract information from a string in R
alldf["started_seconds"] <- alldf$started_at[2:19]

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



ggplot(data = alldf) + geom_point(mapping = aes(x= started_hour, y= ), color='black' )

ggplot(data=penguins1) + geom_point(mapping=aes(x=bill_length_mm, y = body_mass_g), color="blue")

# extract hour, minute and seconds

alldf['travel_time'] <- (format(as.POSIXct(ended_at), format = "%H:%M:%S"))-(format(as.POSIXct(alldf$started_at), format = "%H:%M:%S")) 

#transform date to datetime. hour, minute, and second to date_time > 
# substract end_time from start_time.
#transform time format to “POSIXlt” 
# https://rdrr.io/r/base/as.POSIXlt.html


difftime(ended_time, started_time, units = 'minutes')
as.POSIXct(strptime(alldf$started_time,%H:%M:%S")) #to change time format.
as.POSIXlt(alldf$started_time, tz = "", format,
           tryFormats = c("%Y-%m-%d %H:%M:%OS",
                          "%Y/%m/%d %H:%M:%OS",
                          "%Y-%m-%d %H:%M",
                          "%Y/%m/%d %H:%M",
                          "%Y-%m-%d",
                          "%Y/%m/%d"),
           optional = FALSE, ...)


#started 
alldf['started_time'] <- paste(alldf$started_hour,":",alldf$started_minute,":",alldf$started_seconds)
class(alldf$started_time) = "datetime"
#ended
alldf['enede_time'] <- paste(alldf$ended_hour,":",alldf$ended_minute,":",alldf$ended_seconds)
class(alldf$enede_time) = "datetime"

#renaming column
names(alldf)[29] <-'ended_time' # the position of the column can be found using 
#colnames(alldf) 


  
  
  
  
alldf["started_hour"] <- substr(alldf$started_at,12, 13) # Hour 
alldf["started_minute"] <- substr(alldf$started_at,15, 16) # minute
alldf["started_seconds"] <- substr(alldf$started_at,18, 19) # seconds

alldf["ended_hour"] <- substr(alldf$ended_at,12, 13) # Hour 
alldf["ended_minute"] <- substr(alldf$ended_at,15, 16) # minute
alldf["ended_seconds"] <- substr(alldf$ended_at,18, 19) # seconds


# extract the day of the week.


alldf['started_weekday'] <- weekdays(as.Date(alldf$started_at))
alldf['ended_weekday'] <- weekdays(as.Date(alldf$ended_at))


#---END OF DATA TRANSFORMATION---



#---START OF ANALYSIS---


# by hour of the day 
ggplot(data = alldf) + geom_bar(aes(x=started_hour, fill=as.factor(started_hour))) #started 
ggsave("started_hour.png")
ggplot(data = alldf) + geom_bar(aes(x=ended_hour, fill=as.factor(ended_hour))) #ended
# by weekday
ggplot(data = alldf) + geom_bar(aes(x=started_weekday, fill=as.factor(started_weekday))) #started
ggplot(data = alldf) + geom_bar(aes(x=ended_weekday, fill=as.factor(ended_weekday))) # ended
# how long did the ride take for members and non members 

#extract just time from started_at and enede_at. Then calculate the difference.

# count number of rides of the members and non members.GGPLOT

ggplot(data=alldf) + geom_bar(aes(x = member_casual, fill=as.factor(member_casual)))

# weekdays with member_casual.
ggplot(data=alldf) + geom_bar(aes(x = started_weekday, fill=as.factor(member_casual)), position="dodge")

#the busiest stations

#start_station_id count
count(select(alldf, c('start_station_id'))) %>% arrange(desc(freq))

#end_station_id count
count(select(alldf, c('end_station_id'))) %>% arrange(desc(freq))


#number total of rides per weekday.
count_df_started_member <- count(alldf,vars = c("started_weekday","member_casual")) 
#number total of rides per hour of the day

count(alldf,vars = c("started_hour","member_casual")) 
count(select(alldf, c('started_hour'))) 

#number total of rides per hour and each day of the week
started_hour_weekday <- select(ENTER THE WEEKDAY AND HOUR) %>% 
COUNT BY DAY 

count(alldf, 'started_weekday', 'casual_member')
alldf %>% group_by('stated_weekday', 'casual_member') %>% summarise(count=n()) 


#PLOT MEMBER AND CASUAL PER HOUR.
#work with subset in the. keep in mind that the count must be there too.




ggplot(data=alldf) + geom_point(eas=mapping(x=))

#COUNT BY HOUR 

alldf1 <- count(alldf,vars = c("started_hour","member_casual")) 
alldf2  <- count(alldf,vars = c("started_weekday","member_casual")) 

#CREATING A SUBSET 


#HOURLY RIDE FOR RIDERS THAT ARE MEMBERS 
ggplot(subset(alldf1,member_casual %in% c("member")))  + 
geom_point(aes(x=started_hour, y=freq), color='blue')

#HOURLY RIDE FOR USERS THAT ARE NOT MEMBER(CASUAL RIDERS)
ggplot(subset(alldf1,member_casual %in% c("casual")))  + 
geom_point(aes(x=started_hour, y=freq), color='blue') 

#WEEK RIDE FOR MEMBER RIDERS
ggplot(subset(alldf2,member_casual %in% c("member")))  + v
geom_point(aes(x=started_weekday, y=freq), color='blue') 

##WEEK RIDE FOR CASUAL RIDERS

ggplot(subset(alldf2,member_casual %in% c("casual")))  + 
geom_point(aes(x=started_weekday, y=freq),  color="Blue") 



# start a campaign for the people that are not a member that use it more 
#than average.


#sort data by hour > minutes > seconds of the started_at column.


#TAKE THE DIFFERENCE OF TIME AND START ANSWERING THE QUESTIONS.
          
