install.packages("dplyr")
library(dplyr)
glimpse(gapminder)
# remove a factor or take a factor take a column 
head(select(gapminder, -year))
# find a vlaue not equal to 
head(filter(gapminder, continent != "Asia"))
# find a value greater than
head(filter(gapminder, year > 1997))
# to take only a subset of factors
two_countries = c("Albania", "Dominican Republic")
filter(gapminder, country %in% two_countries)

#piping using %>% this works as | command shift m will write %>% 
gapminder
#Takes the data frame pipes it to the select function to chose only the LifeExp column pipes it to the min function to compute the min 
gapminder %>% select(lifeExp) %>% min()

X1 = 1:5
X2 - 2:6
# first allows you to subtract the vectors and square them
# next lets you sum all the values left over
# next lets you take the sqrt
(X1-X2)^2 %>% sum() %>% sqrt()

#load frame, select all but two columns, select only rows with asia and 2007 either , or & works
gapminder %>% 
  select(-pop, -gdpPercap) %>% 
  filter(continent == "Asia", year == 2007)
# same as above but allows for or using the | character
gapminder %>% 
  select(-pop, -gdpPercap) %>% 
  filter(continent == "Asia"| year == "Oceana")

# mutate
#allows you to add a new column to the 
#create a column showing deviation from the mean 
mean_life_exp_gapminder = mean(gapminder$lifeExp)
gapminder = gapminder %>% mutate(new_column_name_here = lifeExp - mean_life_exp_gapminder)
gapminder %>% select(-new_column_name_here)

# challenge 
#African values for lifeExp, country, yer
gapminder %>% 
  filter(continent == "Africa") %>% 
  select(lifeExp, country, year) %>% 
  glimpse()

#group by 
# Allows you to subset data based on all levels of one factor. Ex take all data and lump them into continent gropus. 
gapminder %>% 
  group_by(continent)
# you can perform function son these groups
gapminder %>% 
  group_by(continent) %>% 
  summarize(MeanLife = mean(lifeExp))
# you can also do this for multiple factors at the same time
#gives you lifeexpectancy per continent per year doulbe sub sets
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = mean(lifeExp))
# you can ervese the order as well 
gapminder %>% 
  group_by(year, continent) %>% 
  summarize(MeanLife = mean(lifeExp))
#look for se n here is part of dplyr and set at obsevation number 
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = (mean(lifeExp)),
             SeLife = sd(lifeExp)/sqrt(n())) %>% 
ggplot(mapping = aes(x = year, 
                     y = MeanLife, 
                     color = continent)) +
  geom_line()
#Add error bars
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = (mean(lifeExp)),
            SeLife = sd(lifeExp)/sqrt(n())) %>% 
  ggplot(mapping = aes(x = year, 
                       y = MeanLife, 
                       color = continent)) +
  geom_line() +
  geom_errorbar(mapping = aes(ymin = MeanLife - SeLife,
                              ymax = MeanLife + SeLife))

#Add error bars change error bar size
gapminder %>% 
  group_by(continent, year) %>% 
  summarize(MeanLife = (mean(lifeExp)),
            SeLife = sd(lifeExp)/sqrt(n())) %>% 
  ggplot(mapping = aes(x = year, 
                       y = MeanLife, 
                       color = continent)) +
  geom_line() +
  geom_errorbar(mapping = aes(ymin = MeanLife - SeLife,
                              ymax = MeanLife + SeLife,
                              width = 0.3))
# the n() command is a fill in for how many observations there are 
gapminder %>% 
  select(country, continent) %>% 
  #make sure you aren't taking multiple counts per year
  #unique lets you take ONE of each entry if entries are identical ie there were many entries with the header Americas
  unique() %>% 
  group_by(continent) %>% 
  summarize(count = n())
  
# the n() command is a fill in for how many observations there are 
#
gapminder %>% 
  select(country, continent) %>% 
  #make sure you aren't taking multiple counts per year
  #unique lets you take ONE of each entry if entries are identical ie there were many entries with the header Americas
  unique() %>% 
  group_by(continent) %>% 
  summarize (n = n()) %>% 
  mutate(count = sum(n),
    proportion = n() / sum(n))

#challenge 2

gapminder %>% 
  group_by(country) %>% 
  summarize(MinExp = min(lifeExp),
            MaxExp = max(lifeExp)) %>% 
  
#challenge 3 Calculate the average life expectancy per country. Which has the longest average life expectancy and which has the shortest average life expectancy?
#this one did not work 
  gapminder %>% 
  group_by(country) %>% 
  summarize(Avg_Exp = mean(lifeExp)) %>% 
  group_by(Avg_Exp) %>% 
  summarize(min = min(Avg_Exp), max = max(Avg_Exp))
  
# you cannot use & because that will ask for the value to fulfill both the min and max you need to use or | so it is either of the two 
#this one works 
gapminder %>% 
  group_by(country) %>%
  summarise(MeanLife = mean(lifeExp)) %>%
  filter(MeanLife == min(MeanLife) | MeanLife == max(MeanLife))

#find average life expectancy 
overall_mean = mean(gapminder$lifeExp)
gapminder %>% 
#organzie the data based on the country
  group_by(country) %>% 
#append a column for the mean life expectancy by country
#problem is that I am losing the GDP values 
    summarize(Mean_life = mean(lifeExp), GDP = gdpPercap) %>% 
  glimpse() %>% 
#filter out all countries with values above the mean
  filter(Mean_life < overall_mean) %>% 
  glimpse() %>% 
#ggplot 
  ggplot(mapping = aes(x = Mean_life, y = gdpPercap))

# solution 
#only variables you summarise are the only ones that stay in the frame

#find average life expectancy 
overall_mean = mean(gapminder$lifeExp)
gapminder %>% 
  #organzie the data based on the country
  group_by(country) %>% 
  #append a column for the mean life expectancy by country
  #problem is that I am losing the GDP values 
  summarize(Mean_life = mean(lifeExp), Mean_GDP = mean(gdpPercap), con = unique(continent)) %>% 
  glimpse() %>% 
  #filter out all countries with values above the mean
  filter(Mean_life < overall_mean) %>% 
  glimpse() %>% 
  #ggplot 
  ggplot(mapping = aes(x = Mean_life, y = Mean_GDP, color = con)) + geom_point()

#geom = how you want to see the output 

gapminder %>% 
  select(country, gdpPercap, lifeExp, continent) %>% 
  group_by(continent, country) %>% 
  summarise(MeanLife = mean(lifeExp),
            MeanGDP = mean(gdpPercap)) %>% 
  filter(MeanLife < mean_lifeExp_gapminder) %>% 
  ggplot(mapping = aes(x = MeanGDP, y = MeanLife, color = continent)) + 
  geom_point()

# rladies 2 hour workshop on r
# 2-4pm

# tuesday library r open space 9am to 11am 
# also one a month workshop on tidyverse 


