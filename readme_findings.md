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
