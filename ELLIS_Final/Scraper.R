library(rvest)
# library(xml2)
library(tidyverse)
library(ggplot2)

  
# Example Page
# Unobscure enough that I can be more sure it fits the standard used by the majority of the website.
url <- "http://www.imfdb.org/wiki/Avengers:_Endgame"
exampleHTML <- read_html(url)
# <a>href is handgun type


# XML::htmlParse("<!DOCTYPE html>")
# xml_find_all("//a[contains(@class, 'href')]") %>%

# Find webpage based on movie title
# Use -- for list of movie titles


# I have absolutely no idea why this doesn't work.
# If the xpath was nonsense then I'd be getting a pointer error
# If the URL didn't go anywhere than I'd be getting a 404 
# Instead I'm getting empty character arrays. 
# My best guess is that the website has changed names of some of it's xml tags or something like that since the guide was made.

# get url from input and read html
input <- "https://www.billboard.com/charts/hot-100"
chart_page <- xml2::read_html(input)
  
  # scrape data
  rank <- chart_page %>% 
    rvest::html_nodes('body') %>% 
    xml2::xml_find_all("//span[contains(@class, 'chart-element__rank__number')]") %>% 
    rvest::html_text()
  
  artist <- chart_page %>% 
    rvest::html_nodes('body') %>% 
    xml2::xml_find_all("//span[contains(@class, 'chart-element__information__artist')]") %>% 
    rvest::html_text()
  
  title <- chart_page %>% 
    rvest::html_nodes('body') %>% 
    xml2::xml_find_all("//span[contains(@class, 'chart-element__information__song')]") %>% 
    rvest::html_text()
  
  # create dataframe, remove nas and return result
  chart_df <- data.frame(rank, artist, title)
  chart_df <- chart_df %>% 
    dplyr::filter(!is.na(rank), rank %in% positions)
  
chart_df









