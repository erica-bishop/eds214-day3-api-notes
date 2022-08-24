library(httr)
library(purrr)

#####Interacting with github api the R_aw way:#####

#query github REST api
r <- GET("https://api.github.com/users/erica-bishop/repos")

r$url
r$status_code
#200 means request went through

my_repos_list <- content(r)

my_repos_list[[1]]$full_name
#returns name of repo in list position 1

my_repos <- map_chr(my_repos_list, "full_name")
#map is purrr function to iterate through elements of list
#this returns all the full names of repos
my_repos


#can also pull content from repos:
my_repos_list[[9]]$description
#returns null because don't have descriptions for my repos


###### Interacting with apis the Bette_r way #######

# check r opensci to see if there is already an r package to interact with the api / data source you want
# not every data source will have an api though because it takes a lot of resources
# if no API is available, you can use webscraping to collect data - webscraping can be very easy or very hard - using R scraping package `rvest`
