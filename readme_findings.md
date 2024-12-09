ASK

 1. How do annual members and casual riders use Cyclistic bikes diferently?

The annual members start their rides the most very differently from the casual members. Stations are different and the volume is higher for the annual members. In the graph below show the difference between annual members and casual riders in the city of Chicago.

```
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

<img width="563" alt="annualmembers_start_volume" src="https://github.com/user-attachments/assets/1ba7f60e-50a4-4200-8285-e0a8e0840105">

<img width="563" alt="casual_start_volume" src="https://github.com/user-attachments/assets/fdaf097d-708a-4c0b-840e-01ff11d677bc">


Clark St & Elm St is the station with highest volume either for annual members and casual riders. It has about 600 uses per [TIME], while casual riders have about 250 per [TIME]. {time will change when I add more data to this analysis.}

The time that annual members use the service the most is between 12pm-6pm.
During the time analysed at 4pm they had about 6k annual members using the service across the city of Chicago.
Even though the volume of rides for casual members is a lot less, they had the highest number of people using the service at 3pm during the time analysed in this case.



2. Why would casual riders buy Cyclistic annual memberships?

Riders would take more advantage of the annual membership when minute riders ride more than 15min in a month.
Because some of those people are using the bikeshare service to go to work and spending more than 15 minutes on the bike.
Advertise to the riders that start at the stations from 7-9am and from 4-7pm.

[FIND OUT THE TIME OF THE TRIP FOR CASUAL MEMBERS.]



A single ride is $3 and an Explorer Day Pass is $15 (prices are subject to change). Please refer to Divvy's website for more information.
$16.58 membership
$1 + $0.18m 


The benefits of buying the bikeshare Chicago service would be beneficial for the following scenarios.



If a rider rides 18 days a year for less than 45 minutes per day.

If a rider rides 36 days a year for less than 23 minutes per day.

If a rider rides 54 days a year for less than 12 minutes per day.

If a rider rides 72 days a year for less than 6 minutes per day.

When someone is using the bikeservice equal or less from the scenario above, buying the annual membership would be not worthy for the rider.



Look for Casual riders that use the service frequently. People that spend around $16 per month.


3. How can Cyclistic use digital media to influence casual riders to become members?

Create campaigns for casual riders that had used the Cyclist service and spent more than $15/month to become an annual member.
Cyclists that used the Chicago service just a few times are not Chicago residents, so those people are not a good target for Chicago bikeride.


