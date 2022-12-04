#robotstxt - to get permission, connectivity, etc.....
#rvest - to take the HTML scrapper point
library(robotstxt)
library(rvest)
#scrapping websites
url <- "https://www.amazon.in/s?k=google+pixel&crid=1WZVLC937FM2&sprefix=google%2Caps%2C278&ref=nb_sb_ss_ts-doa-p_2_6"
#allowability
path = paths_allowed(url)
#HTML elements from website
web <- read_html(url)
#segregating names
name <- web %>% html_nodes(".a-size-medium.a-text-normal") %>%html_text()
View(name)
#segregating price
price <- web %>% html_nodes(".a-spacing-top-micro .a-price-whole") %>%html_text()
View(price)
#segregating ratings
ratings <- web %>% html_nodes(".a-spacing-top-small .aok-align-bottom") %>%html_text()
View(ratings)
#segregating no. of ratings
numb <- web %>% html_nodes(".a-spacing-top-small .s-link-style .s-underline-text") %>%html_text()
View(numb)
#creating dataframe
amazon <- data.frame(name, price, ratings, numb)
View(amazon)
#saving data
write.csv(amazon,"pixel.csv")
