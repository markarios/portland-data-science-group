df <- all %>%
  mutate(elite = ifelse(UserId %in% unique(elite$UserId), TRUE, FALSE)) %>%
  mutate(freq = ifelse(UserId %in% unique(freq$UserId), TRUE, FALSE)) %>%
  mutate(unknown = ifelse(elite == FALSE && freq == FALSE, TRUE, FALSE)) %>%
  mutate(userGroup = ifelse(elite, "elite", ifelse( freq, "freq", "unknown"))) %>%
  mutate(userGroup = as.factor(userGroup)) %>%
  mutate(elite = NULL) %>%
  mutate(freq = NULL) %>%
  mutate(unknown = NULL)

# freq user file has 528,872 reviews but I only found 469,579 in the all data set.

unique(df$UserId) %>% length()

# all has 193,504 unique users


df %>%
  group_by(userGroup, title) %>%
  summarize(meanRating = mean(Rating)) %>%
  arrange(desc(meanRating)) %>%
  top_n(20) %>%
  ggplot(aes(x=reorder(title, meanRating),y=meanRating, fill=userGroup)) + 
  geom_bar(stat="identity") +
  coord_flip() +
  facet_grid(. ~ userGroup) +
  ggtitle("Top 20 Games by Average Rating")

  
df %>%
  filter(userGroup == "elite") %>%
  group_by(userGroup, title) %>%
  summarize(minRating = min(Rating)) %>%
  arrange(desc(minRating)) %>%
  top_n(5) %>%
  ggplot(aes(x=reorder(title, minRating),y=minRating, fill=userGroup)) + 
  geom_bar(stat="identity") +
  coord_flip() +
  facet_grid(. ~ userGroup) +
  ggtitle("5 Games by Minimum Rating, Elite")


df %>%
  filter(userGroup == "freq") %>%
  group_by(userGroup, title) %>%
  summarize(minRating = min(Rating)) %>%
  arrange(desc(minRating)) %>%
  top_n(5) %>%
  ggplot(aes(x=reorder(title, minRating),y=minRating, fill=userGroup)) + 
  geom_bar(stat="identity") +
  coord_flip() +
  facet_grid(. ~ userGroup) +
  ggtitle("5 Games by Minimum Rating, Freq")

save(df, file="df.Rda")










