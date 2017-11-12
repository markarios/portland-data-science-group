require(dplyr)
require(ggplot2)
setwd("~/portland-data-science-group/")

titles <- read.csv(url("http://dive-into.info/2107/boardgame-titles.csv"))
colnames(titles) <- c("GameId", "title")

elite <- read.csv(url("http://dive-into.info/2107/boardgame-elite-users.csv"))
colnames(elite) <- c("UserId","GameId","Rating")

elite <- elite %>% 
  left_join(titles, by = "GameId")


elite %>%
  group_by(GameId) %>%
  summarize(AvgRating = mean(Rating)) %>%
  arrange(desc(AvgRating))

elite %>%
  group_by(GameId) %>%
  summarize(AvgRating = mean(Rating)) %>%
  arrange(desc(AvgRating)) %>% 
  summary()



freq <- read.csv(url("http://dive-into.info/2107/boardgame-frequent-users.csv"))
colnames(freq) <- c("UserId","GameId","Rating")

freq <- freq %>%
  left_join(titles, by = "GameId")

freq %>%
  group_by(GameId) %>%
  summarize(AvgRating = mean(Rating)) %>%
  arrange(desc(AvgRating)) %>% 
  summary()


all <- read.csv(url("http://dive-into.info/2107/boardgame-users.csv"))

colnames(all) <- c("UserId", "GameId", "Rating")

all <- all %>%
  left_join(titles, by = "GameId")

save(elite, file="elite.Rda")
save(freq, file="freq.Rda")
save(all, file="all.Rda")
save(titles, file="titles.Rda")










