
# Introduction

game_recommendations ~ user_id + group_up + clusters_games - games_user_has_played

# deploy_shiney_app.R 
It does what it says.

# getdata.R
Get the data, do some cleaning and organizing

# explore.R
Explore the data. Note this data has some issues. 

  1. All file: 5.1M Reviews
  2. 193,504 unique users
  3. Freq user file has 528,872 reviews but I only found 469,579 in the all data set.
  
# Draft Todos

  1. cluster users (freq, elite, unknown)
  2. each cluster get top nth %
  3. get user_id games with ratings
  4. subtract out games the user has aleady played
  5. make recommendation.
  
