install.packages("digest")
library(ggplot2)
#dataframe
#variables
#visualization

gapminder <- read.csv("gapminder_clean.csv", stringsAsFactors = TRUE)
ggplot(data = gapminder, 
       mapping = aes(x = gdpPercap, 
                     y = lifeExp, 
                     by=country, color = continent)) + 
  geom_point() + 
  scale_x_log10() + 
 geom_smooth()

ggplot(data = gapminder, mapping =aes(x = gdpPercap,
                                          fill = continent)) + 
  geom_density() + 
  scale_x_log10() +
  facet_wrap(~ continent)

