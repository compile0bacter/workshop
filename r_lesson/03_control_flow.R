for (my_var in 1:10) {
  print(my_var)
}

paste("Iams", 5)

for (i in 1:3){
  for (j in letters[1:3])
    print(paste(i,j))
  }

c <- c()
for (i in 1:5) {
  c <-c(c, i^2)
  print(c)
}

#x continent has a life expectancy between _ and _ 
for (cont in unique(gapminder$continent)){
  min_life <- min(gapminder[gapminder$continnet == cont, 'lifeExp'])
  max_life <- max(gapminder[gapminder$continent == cont, 'lifeExp'])
  mean_life <- mean(gapminder[gapminder$continent == cont, 'lifeExp'])
  print(paste(cont, "has a life expectancy between", min_life, "and", max_life, "and" mean_life))
}

x = -5
if(x>0){
  print("x is positive")
}

if(x>0){
  print("x is positive")
} else{
  print("x is negative")
}

x = 0
if(x>0){
  print("x is positive")
} else if (x<0) {
  print("x is negative")
} else {
  print("other")
}

if(x>3){
  print("positive")
  if (x == 3){
    print("three!")
    else if (x<0){
      print("negative")
    }
  }
  
  for (i in c(-1,3,0,-7)){
    if (i>0){
      print("positive number")
    } else if (i<0){
      print("negative number")
    } else {
      print("zero")
    }
  }
  

  mean_life_exp_gapminder <- mean(gapminder$lifeExp)
  for (cont in unique(gapminder$continent)) {
    if (mean(gapminder[gapminder$continent == cont, "lifeExp"]) > mean_life_exp_gapminder){
      print(paste(cont, "has a mean life expectancy higher than the overall mean life expectancy"))
    } 
  }
  
  summary(gapminder$gdpPercap)
  
  gdp_1at = 1201.1
  gdp_3qt = 9325.5
  for (countries in unique(gapminder$country == country & gapminder$year == 2007, 'gdpPercap')) {
    if (median(countries) > median(gapminder$))
  }
  
summary(gapminder$gdpPercap)[1]


