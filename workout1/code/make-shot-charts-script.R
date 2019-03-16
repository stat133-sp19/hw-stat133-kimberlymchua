##################################################
## title: make-shots-charts-script.R
## description: this is where the charts will be stored 
## input(s): data from the nba
## output(s): the output is to create the data visualization from the inputs
## Date: 3/13/2019
## Author: kimberly chua
##################################################
library(dplyr)
library(ggplot2)
library(grid)
library(jpeg)

#no court background plots
curry_scatterplot <- ggplot(data=curry) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
green_scatterplot <- ggplot(data=green) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
iguodala_scatterplot <- ggplot(data=iguodala) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
durant_scatterplot <- ggplot(data=durant) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
thompson_scatterplot <- ggplot(data=thompson) + 
  geom_point(aes(x=x, y=y, color = shot_made_flag))
# court image (to be used as background of plot)
court_file <- "images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG((court_file)),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# shot chart with court background
stephen_curry_shot_chart <- ggplot(data = curry) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color= shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Stephen Curry (2016 season)') +
  theme_minimal()
kevin_durant_shot_chart <- ggplot(data = durant) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color= shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Kevin Durant (2016 season)') +
  theme_minimal()
klay_thompson_shot_chart <- ggplot(data = thompson) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color= shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
andre_iguodala_shot_chart <- ggplot(data = iguodala) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color= shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Andre Iguodala (2016 season)') +
  theme_minimal()
draymond_green_shot_chart <- ggplot(data = green) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color= shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Draymond Green (2016 season)') +
  theme_minimal()

#Write code in the R script make-shot-charts-script.R to create shot charts (with court backgrounds) for each player
pdf('stephen-curry-shot-chart.pdf', width=6.5, height=5)
print(stephen_curry_shot_chart)
dev.off()
pdf('andre-iguodala-shot-chart.pdf', width=6.5, height=5)
print(andre_iguodala_shot_chart)
dev.off()
pdf('draymond-green-shot-chart.pdf.pdf', width=6.5, height=5)
print(draymond_green_shot_chart)
dev.off()
pdf('kevin-durant-shot-chart.pdf', width=6.5, height=5)
print(kevin_durant_shot_chart)
dev.off()
pdf('klay-thompson-shot-chart.pdf', width=6.5, height=5)
print(klay_thompson_shot_chart)
dev.off()

##4.2) Facetted Shot Chart
#Create one graph, using facetting, to show all the shot charts in one image. 
image dimensions width = 8 and height = 7 inches.
Likewise, save this image in PNG format as gsw-shot-charts.png, inside the folder images/.
Specify image dimensions width = 8 and height = 7 inches.
Feel free to choose different visual attributes for the geometric object points.

gsw_shot_chart <- ggplot(data = stacked)+
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Charts: GSW (2016 season)') +
  theme_minimal() + facet_wrap(~player)

pdf('gsw-shots-charts.pdf', width=8, height=7)
print(gsw_shot_chart)
dev.off()

png('gsw-shots-charts.png')
print(gsw_shot_chart)
dev.off()
