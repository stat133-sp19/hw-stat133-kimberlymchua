##################################################
## title: make-shots-charts-script.R
## description: this is where the charts will be stored 
## input(s): data from the nba
## output(s): the output is to create the data visualization from the inputs
## Date: 3/13/2019
## Author: kimberly chua
##################################################

library(ggplot2)

# court image (to be used as background of plot)
court_file <- "/images/nba-court.jpg"
# create raste object
court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1, "npc"),
  height = unit(1, "npc"))

# shot chart with court background
klay_shot_chart <- ggplot(data = klay) +
  annotation_custom(court_image, -250, 250, -50, 420) +
  geom_point(aes(x = x, y = y, color = shot_made_flag)) +
  ylim(-50, 420) +
  ggtitle('Shot Chart: Klay Thompson (2016 season)') +
  theme_minimal()
```
##4.1) Shot charts of each player
##Write code in the R script make-shot-charts-script.R to create shot charts (with court
##backgrounds) for each player, and save the plots in PDF format, with dimensions width =
##6.5 and height = 5 inches, inside the folder images/:
• andre-iguodala-shot-chart.pdf
• draymond-green-shot-chart.pdf
• kevin-durant-shot-chart.pdf
• klay-thompson-shot-chart.pdf
• stephen-curry-shot-chart.pdf
######
##4.2) Facetted Shot Chart
##Create one graph, using facetting, to show all the shot charts in one image. A hypothetical
##facetted graphic is shown below.
##image dimensions width = 8 and height = 7 inches.
##Likewise, save this image in PNG format as gsw-shot-charts.png, inside the folder images/.
##Specify image dimensions width = 8 and height = 7 inches.
##Feel free to choose different visual attributes for the geometric object points.
#####