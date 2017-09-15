library("ggplot2")
library("ggmap")
library("dplyr")


# taken from https://github.com/dkahle/ggmap

# only violent crimes
violent_crimes <- filter(crime, 
  offense != "auto theft", offense != "theft", offense != "burglary"
)

# rank violent crimes
violent_crimes$offense <- factor(
  violent_crimes$offense,
  levels = c("robbery", "aggravated assault", "rape", "murder")
)

# restrict to downtown
violent_crimes <- filter(violent_crimes,
  -95.39681 <= lon & lon <= -95.34188,
   29.73631 <= lat & lat <=  29.78400
)

qmplot(lon, lat, data = violent_crimes, maptype = "toner-lite", color = I("red"))
