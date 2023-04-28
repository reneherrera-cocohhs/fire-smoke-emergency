library(here) # project oriented workflow
library(tidyverse) # data tidy
library(Rnssp) # R NSSP CDC BioSense API access
library(janitor) # data tables 

myProfile <- Credentials$new(
  username = askme("Enter your username: "),
  password = askme()
)

## JSON URL from ESSENCE API
url <- "https://essence.syndromicsurveillance.org/nssp_essence/api/timeSeries?endDate=30Jun2022&startMonth=January&graphOnly=true&geography=33622&percentParam=noPercent&datasource=va_hosp&startDate=1Jun2022&graphOptions=single&medicalGroupingSystem=essencesyndromes&userId=4887&aqtTarget=TimeSeries&ccddCategory=air%20quality-related%20respiratory%20illness%20v1&ccddCategory=cdc%20asthma%20ccdd%20v1&ccddCategory=fire%20and%20smoke%20inhalation%20v1&geographySystem=hospital&detector=nodetectordetector&removeZeroSeries=True&stratVal=ccddCategory&timeResolution=daily"

## Get Data from ESSENCE
api_data <- get_api_data(url) # or api_data <- myProfile$get_api_data(url)

## Inspect data object structure
# names(api_data)

## Get a glimpse of the pulled dataset
# glimpse(api_data$timeSeriesData) 
# glimpse(api_data$dataDetails)

# tidy 
essence_data <- api_data$timeSeriesData

