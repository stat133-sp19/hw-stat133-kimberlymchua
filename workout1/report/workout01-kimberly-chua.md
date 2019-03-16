workout01-kimberly-chua.Rmd
================

5) Report
---------

Imagine that you are hired by an Oakland-based sports media company to write an article about the shooting statistics of the five GSW players: Iguodala, Green, Durant, Thompson, and Curry. They want the article to contain at least: • three tables about Effective Shooting Percentage (see section 5.1 below). • the PNG image of the facetted shot charts (the one obtained in section 4.2) Rmd file settings • Your Rmd file must be located in the report/ subdirectory. • Recall that you need to specify the output field in the yaml header as github\_document (NOT an html\_document). See image below. • To insert an image (in a given file), you can use include\_graphics(). For example, suppose you have a file named 'image1.png' in the working directory of your Rmd file; here’s how you could import that image in your report:

5.1) Effective Shooting Percentage
----------------------------------

Use the data in shots-data.csv to create three tables to summarize Effective Shooting percentages by player (import the data in your Rmd file using a relative path).

``` r
library(readr)
library(dplyr)
```

    ## Warning: package 'dplyr' was built under R version 3.5.2

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
nba <- read_csv("../data/shots-data.csv")
```

    ## Warning: Missing column names filled in: 'X1' [1]

    ## Parsed with column specification:
    ## cols(
    ##   X1 = col_integer(),
    ##   team_name = col_character(),
    ##   game_date = col_character(),
    ##   season = col_integer(),
    ##   period = col_integer(),
    ##   minutes_remaining = col_integer(),
    ##   seconds_remaining = col_integer(),
    ##   shot_made_flag = col_character(),
    ##   action_type = col_character(),
    ##   shot_type = col_character(),
    ##   shot_distance = col_integer(),
    ##   opponent = col_character(),
    ##   x = col_integer(),
    ##   y = col_integer(),
    ##   player = col_character(),
    ##   minutes = col_integer()
    ## )

``` r
curry_stats <- filter(nba, player == "Stephen Curry")
green_stats <- filter(nba, player == "Draymond Green")
iguodala_stats <- filter(nba, player == "Andre Iguodala")
thompson_stats <- filter(nba, player == "Klay Thompson")
durant_stats <- filter(nba, player == "Kevin Durant")
```

All three tables should have the format of the following depicted diagram: 2PT Effective Shooting % by Player: 2 PT Field Goal effective shooting percentage by player, arranged in descending order by percentage.

``` r
#curry
two_pts_curry <- filter(curry_stats, shot_type == '2PT Field Goal')
total_2pts_curry <- sum(two_pts_curry$shot_type == '2PT Field Goal') 
made_2pts_curry <- sum(two_pts_curry$shot_made_flag == 'shot_yes')
perc_made_2pts_curry <- made_2pts_curry/total_2pts_curry

#green
two_pts_green <- filter(green_stats, shot_type == '2PT Field Goal')
total_2pts_green <- sum(two_pts_green$shot_type == '2PT Field Goal') 
made_2pts_green <- sum(two_pts_green$shot_made_flag == 'shot_yes')
perc_made_2pts_green <- made_2pts_green/total_2pts_green

#iguodala
two_pts_iguodala <- filter(iguodala_stats, shot_type == '2PT Field Goal')
total_2pts_iguodala <- sum(two_pts_iguodala$shot_type == '2PT Field Goal') 
made_2pts_iguodala <- sum(two_pts_iguodala$shot_made_flag == 'shot_yes')
perc_made_2pts_iguodala <- made_2pts_iguodala/total_2pts_iguodala

#durant
two_pts_durant <- filter(durant_stats, shot_type == '2PT Field Goal')
total_2pts_durant <- sum(two_pts_durant$shot_type == '2PT Field Goal') 
made_2pts_durant <- sum(two_pts_durant$shot_made_flag == 'shot_yes')
perc_made_2pts_durant <- made_2pts_durant/total_2pts_durant

#thompson
two_pts_thompson <- filter(thompson_stats, shot_type == '2PT Field Goal')
total_2pts_thompson <- sum(two_pts_thompson$shot_type == '2PT Field Goal') 
made_2pts_thompson <- sum(two_pts_thompson$shot_made_flag == 'shot_yes')
perc_made_2pts_thompson <- made_2pts_thompson/total_2pts_thompson

#table
names <- c('Stephen Curry', 'Draymond Green', 'Andre Iguodala', 'Kevin Durant', 'Klay Thompson')
total_two_pointers <- c(total_2pts_curry, total_2pts_green, total_2pts_iguodala, total_2pts_durant, total_2pts_thompson)
made_two_pointers <- c(made_2pts_curry, made_2pts_green, made_2pts_iguodala, made_2pts_durant, made_2pts_thompson)
percent_made_two_pointers <- c(perc_made_2pts_curry, perc_made_2pts_green, perc_made_2pts_iguodala, perc_made_2pts_durant, perc_made_2pts_thompson)

TwoPT_Effective_Shooting <- arrange(data.frame(names,total = total_two_pointers, made = made_two_pointers, perc_made = percent_made_two_pointers), desc(perc_made))
TwoPT_Effective_Shooting
```

    ##            names total made perc_made
    ## 1 Andre Iguodala   210  134 0.6380952
    ## 2   Kevin Durant   643  390 0.6065319
    ## 3  Stephen Curry   563  304 0.5399645
    ## 4  Klay Thompson   640  329 0.5140625
    ## 5 Draymond Green   346  171 0.4942197

3PT Effective Shooting % by Player: 3 PT Field Goal effective shooting percentage by player, arranged in descending order by percentage.

``` r
#curry
three_pts_curry <- filter(curry_stats, shot_type == '3PT Field Goal')
total_3pts_curry <- sum(three_pts_curry$shot_type == '3PT Field Goal') 
made_3pts_curry <- sum(three_pts_curry$shot_made_flag == 'shot_yes')
perc_made_3pts_curry <- made_3pts_curry/total_3pts_curry

#green
three_pts_green <- filter(green_stats, shot_type == '3PT Field Goal')
total_3pts_green <- sum(three_pts_green$shot_type == '3PT Field Goal') 
made_3pts_green <- sum(three_pts_green$shot_made_flag == 'shot_yes')
perc_made_3pts_green <- made_3pts_green/total_3pts_green

#iguodala
three_pts_iguodala <- filter(iguodala_stats, shot_type == '3PT Field Goal')
total_3pts_iguodala <- sum(three_pts_iguodala$shot_type == '3PT Field Goal') 
made_3pts_iguodala <- sum(three_pts_iguodala$shot_made_flag == 'shot_yes')
perc_made_3pts_iguodala <- made_3pts_iguodala/total_3pts_iguodala

#durant
three_pts_durant <- filter(durant_stats, shot_type == '3PT Field Goal')
total_3pts_durant <- sum(three_pts_durant$shot_type == '3PT Field Goal') 
made_3pts_durant <- sum(three_pts_durant$shot_made_flag == 'shot_yes')
perc_made_3pts_durant <- made_3pts_durant/total_3pts_durant

#thompson
three_pts_thompson <- filter(thompson_stats, shot_type == '3PT Field Goal')
total_3pts_thompson <- sum(three_pts_thompson$shot_type == '3PT Field Goal') 
made_3pts_thompson <- sum(three_pts_thompson$shot_made_flag == 'shot_yes')
perc_made_3pts_thompson <- made_3pts_thompson/total_3pts_thompson


#table
names <- c('Stephen Curry', 'Draymond Green', 'Andre Iguodala', 'Kevin Durant', 'Klay Thompson')
total_three_pointers <- c(total_3pts_curry, total_3pts_green, total_3pts_iguodala, total_3pts_durant, total_3pts_thompson)
made_three_pointers <- c(made_3pts_curry, made_3pts_green, made_3pts_iguodala, made_3pts_durant, made_3pts_thompson)
percent_made_three_pointers <- c(perc_made_3pts_curry, perc_made_3pts_green, perc_made_3pts_iguodala, perc_made_3pts_durant, perc_made_3pts_thompson)

ThreePT_Effective_Shooting <- arrange(data.frame(names,total = total_three_pointers, made = made_three_pointers, perc_made = percent_made_three_pointers), desc(perc_made))
ThreePT_Effective_Shooting
```

    ##            names total made perc_made
    ## 1  Klay Thompson   580  246 0.4241379
    ## 2  Stephen Curry   687  280 0.4075691
    ## 3   Kevin Durant   272  105 0.3860294
    ## 4 Andre Iguodala   161   58 0.3602484
    ## 5 Draymond Green   232   74 0.3189655

Effective Shooting % by Player: Overall (i.e. including 2PT and 3PT Field Goals) effective shooting percentage by player, arranged in descending order by percentage.

``` r
#curry

total_pts_curry <- sum(total_3pts_curry, total_2pts_curry) 
total_made_curry <- sum(curry_stats$shot_made_flag == 'shot_yes')
perc_made_total_curry <- total_made_curry/total_pts_curry

#green
total_pts_green <- sum(total_3pts_green, total_2pts_green) 
total_made_green <- sum(green_stats$shot_made_flag == 'shot_yes')
perc_made_total_green <- total_made_green/total_pts_green

#iguodala
total_pts_iguodala <- sum(total_3pts_iguodala, total_2pts_iguodala) 
total_made_iguodala<- sum(iguodala_stats$shot_made_flag == 'shot_yes')
perc_made_total_iguodala <- total_made_iguodala/total_pts_iguodala

#durant
total_pts_durant <- sum(total_3pts_durant, total_2pts_durant) 
total_made_durant <- sum(durant_stats$shot_made_flag == 'shot_yes')
perc_made_total_durant <- total_made_durant/total_pts_durant

#thompson
total_pts_thompson <- sum(total_3pts_thompson, total_2pts_thompson) 
total_made_thompson <- sum(thompson_stats$shot_made_flag == 'shot_yes')
perc_made_total_thompson <- total_made_thompson/total_pts_thompson

#table
names <- c('Stephen Curry', 'Draymond Green', 'Andre Iguodala', 'Kevin Durant', 'Klay Thompson')
total_points <- c(total_pts_curry, total_pts_green, total_pts_iguodala, total_pts_durant, total_pts_thompson)
made_total_points <- c(total_made_curry, total_made_green, total_made_iguodala, total_made_durant, total_made_thompson)
percent_made_total <- c(perc_made_total_curry, perc_made_total_green, perc_made_total_iguodala, perc_made_total_durant, perc_made_total_thompson)

Total_Effective_Shooting <- arrange(data.frame(names,total = total_points, made = made_total_points, perc_made = percent_made_total), desc(perc_made))
Total_Effective_Shooting
```

    ##            names total made perc_made
    ## 1   Kevin Durant   915  495 0.5409836
    ## 2 Andre Iguodala   371  192 0.5175202
    ## 3  Klay Thompson  1220  575 0.4713115
    ## 4  Stephen Curry  1250  584 0.4672000
    ## 5 Draymond Green   578  245 0.4238754

The Golden State Power Five of 2016
===================================

The Golden State Warriors have repeatedly brought in their game faces throughout their 2016 season. The team has had a great season, with winning the Western Conference. However, they fell short to the Cleveland Cavaliers. Given that they have had an amazing season, what could’ve been their downfall?

Let’s look into the power five of the Golden State Warriors: Stephen Curry, Kevin Durant, Draymond Green, Andre Iguodala, and Klay Thompson.

In the image, we could see that these 5 players have had a tremendous amount of time on the court. However, it seems that the players haven’t been good at making that many shots when they are near the three-point line. By looking visually at Draymond Green’s stats, he has many red dots, which demonstrate that he wasn’t able to make those shots near that line. However, other players such as Stephen Curry seem to be more strong at the three point shots in addition to Klay Thompson. They have had amazing effective shooting statistics for two pointers and three-point shots, respectively.

According to krossover.com, the higher the shooting percentage for a given type of point, the more “successful” a team truly is. By having over 50%, it is considered good. By analyzing the data, the power five of the GSW is extremely talented at their two point shots, however, they fall short with their three point shots. Perhaps, this could’ve been the weak link in their performance during the NBA finals.

``` r
TwoPT_Effective_Shooting
```

    ##            names total made perc_made
    ## 1 Andre Iguodala   210  134 0.6380952
    ## 2   Kevin Durant   643  390 0.6065319
    ## 3  Stephen Curry   563  304 0.5399645
    ## 4  Klay Thompson   640  329 0.5140625
    ## 5 Draymond Green   346  171 0.4942197

For instance, Andre Iguodala is leading the two pointers with an approximately 63.8% effective shooting rate, with Kevin Durant falling slightly short with a 60.6% effective shooting rate, and then Stephen Curry (53.9%), Klay Thompson (51.4%) and lastly Draymond Green with a mere 49.4%.

``` r
ThreePT_Effective_Shooting
```

    ##            names total made perc_made
    ## 1  Klay Thompson   580  246 0.4241379
    ## 2  Stephen Curry   687  280 0.4075691
    ## 3   Kevin Durant   272  105 0.3860294
    ## 4 Andre Iguodala   161   58 0.3602484
    ## 5 Draymond Green   232   74 0.3189655

In the three points range, Iguodala isn’t the leader. Instead, Klay Thompson leads the four other men with a 42.4% effective shooting rate for those three pointers, followed by Stephen Curry with a 40.7% effective shooting rate and then Kevin Durant with a 36.8%, Andre Iguodala (36.0%) and lastly Draymond Green with a 31.8%.

However, as a team together, these five men have a decent total effective shooting rates for all types of shots they make. Kevin Durant is leading the total effective shooting rate by having a 54.0%, followed by Andre Iguodala, who has a 51.7%, and then Klay Thompson with a 47.1%, Stephen Curry with a 46.7% and lastly Draymond Green with a 42.4%.

``` r
Total_Effective_Shooting
```

    ##            names total made perc_made
    ## 1   Kevin Durant   915  495 0.5409836
    ## 2 Andre Iguodala   371  192 0.5175202
    ## 3  Klay Thompson  1220  575 0.4713115
    ## 4  Stephen Curry  1250  584 0.4672000
    ## 5 Draymond Green   578  245 0.4238754

Based off the data of how many points were attempted and made, Stephen Curry has attempted the most amount of shots, by having a total of 1250 shots attempted, which include the made shots. Next is Klay Thompson who attempted 1220 shots, a mere 30 shots under that of Stephen Curry. After that, it is Kevin Durant who has attempted a total of 915 shots and then Draymond Green who attempted 578 shots and lastly Andre Iguodala who has attempted 371 shots.

It seems that although Andre Iguodala and Draymond Green have the lowest amount of points attempted, they seem to be careful in how they attempt their shots, whereas their more “mainstream” teammates, Stephen Curry and Klay Thompson, attempt a lot of shots but do not nearly make that many shots. Let’s find out more.

Although Stephen Curry has attempted 1250 shots, he has made a total of 584 shots. Likewise, Klay Thompson has attempted a total of 1220 shots and has made 575 shots. And Kevin Durant has attempted 915 shots and has made 495 of those attempted. Draymond Green has attempted a total of 578 shots and made 245 of those shots. Andre Iguodala has attempted a total of 371 shots and made 192 of those. It seems that although the statistics are somewhat surprising in terms of the quantity of shots attempted, the team still has a consistent total effective shots per person with an average of 48.2% effective shooting percentages for the five of the men.

Overall, it doesn’t seem like the weak link in losing the championships in 2016 was found in these five players. Perhaps due to luck, the Cleveland Cavaliers were able to sweep away the championship title from our Golden State Warriors.
